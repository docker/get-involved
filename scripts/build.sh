#!/bin/bash

#########################################################################
# THIS FILE IS USED BY THE NETLIFY SERVER TO RUN AND PUBLISH DOC BUILDS #
#########################################################################

# By default, builds all docs releases from the knative/docs repo.
# Will also extract PR details from webhooks and then build and publish
# content based on the Fork and Branch of the corresponding PR.

# Create a Netlify build webhook and then add it to your GitHub repo fork
# for continuous builds and PR previews.
# (https://www.netlify.com/docs/webhooks/)

# Requirement: Your fork must include all releases and maintain the same
# branch names and structure as the knative/docs repo. Otherwise, set up
# your build using the flag: BUILDALLRELEASES="FALSE"

# See all options below for configuring this file to work both your own
# knative/website and knative/docs forks and your own personal Netlify
# account (to set up your own doc preview builds).

# Quit on error
set -e

# Retrieve the default docs version
source scripts/docs-version-settings.sh
# Use default repo and branch from docs-version-settings.sh
BRANCH="$DEFAULTBRANCH"
FORK="$DEFAULTREPO"
REPO="$DEFAULTORG"

# Set build default values
BUILDENVIRONMENT="production"
BUILDALLRELEASES="true"
BUILDSINGLEBRANCH="false"
LOCALBUILD="false"
PRBUILD="false"
WEBHOOK="false"

# Manually specify your fork and branch for all builds.
#
# OPTIONAL: Manually configure your knative/website fork to build from your
#           knative/docs fork by default.
#           (For example, if you have a personal Netlify account and want
#            to easily click the "Deploy" button from the Netlify UI.)
#
#           Example:
#           On the Netlify > Settings > Build & Deploy > Continuous Deployment
#           of your personal account, you can manually set the build command
#           and add include the '-f' and '-b' flags:
#
#           Build command: [./scripts/build.sh -f repofork -b branchname]
#
while getopts f:b:a: arg; do
  echo '------ BUILDING DOCS FROM: ------'
  case $arg in
    f)
      echo 'FORK:' "${OPTARG}"
      # The GitHub repo name of the knative/docs fork to builb.
      # Example: myrepo/forkname
      FORK="${OPTARG}"
      # Extract the repo name
      REPO=$(echo "$FORK" | sed -e 's/\.*\/.*//')
      ;;
    b)
      echo 'BRANCH:' "${OPTARG}"
      # Set specified branch
      BRANCH="${OPTARG}"
      ;;
    a)
      echo 'BUILDING ALL RELEASES'
      # True by default. If set to "false" , the build does not clone nor build
      # the docs releases from other branches.
      # REQUIRED: If you specify a fork ($FORK), all of the same branches
      # (with the same branch names) that are built in knative.dev must
      # also exist and be available in that $FORK (ie, 'release-0.X').
      # See /config/production/params.toml for the list of the branches
      # their names that are currently built in knative.dev.
      BUILDALLRELEASES="${OPTARG}"
      ;;
  esac
done

# If a webhook triggered the build, get repo fork and branch name
if [ "$INCOMING_HOOK_BODY" ] || [ "$INCOMING_HOOK_TITLE" ] || [ "$INCOMING_HOOK_URL" ]
then
  WEBHOOK="true"
  echo '------ BUILD REQUEST FROM KNATIVE/DOCS WEBHOOK ------'

  echo 'Webhook Title:' "$INCOMING_HOOK_TITLE"

  # If webhook is from a "PULL REQUEST" event
  if echo "$INCOMING_HOOK_BODY" | grep -q -m 1 '\"pull_request\"'
  then
  # Build only the content in the PR using the "staging" environment settings (config/staging)
    PRBUILD="true"
    BUILDSINGLEBRANCH="true"
    BUILDALLRELEASES="false"
    # Get PR number
    PULL_REQUEST=$(echo "$INCOMING_HOOK_BODY" | grep -o -m 1 '\"number\"\:.*\,\"pull_request\"' | sed -e 's/\"number\"\://;s/\,\"pull_request\"//' || true)
    # Retrieve the fork and branch from PR webhook
    FORK_BRANCH=$(echo "$INCOMING_HOOK_BODY" | grep -o -m 1 '\"label\"\:\".*\"\,\"ref\"' | sed -e 's/\"label\"\:\"knative\:.*//;s/\"label\"\:\"//;s/\"\,\"ref\".*//' || true)
    # Extract just the repo name
    REPO=$(echo "$FORK_BRANCH" | sed -e 's/\:.*//')
    # Retrieve the repo fork name from PR webhook
    FORK=$(echo "$INCOMING_HOOK_BODY" | grep -o -m 1 '\"full_name\"\:\".*\"\,\"private\"' | sed -e 's/\"full_name\"\:\"knative\/.*//;s/\"full_name\"\:\"//;s/\"\,\"private\".*//' || true)
    # If PR was merged, just run default build and deploy production site (www.knative.dev)
    MERGEDPR=$(echo "$INCOMING_HOOK_BODY" | grep -o '\"merged\"\:true\,' || : )
    if [ "$MERGEDPR" = "true" ]
    then
      # For merged PR, do not get branch name (use default: "latest knative release branch")
      echo '------ PR' "$PULL_REQUEST" 'MERGED ------'
      echo 'Running production build - publishing new changes'
    else
      # If PR was not merged, extract the branch name (to use for preview build)
      BRANCH=$(echo "$FORK_BRANCH" | sed -e 's/.*\://')
      # Use "Staging" environment settings (config/staging)
      BUILDENVIRONMENT="staging"
    fi
  else
    # Webhook from "PUSH event"
    # If the event was from someone's fork, then get their branchname
    if [ "$REPO" != "knative" ]
    then
      BRANCH=$(echo "$INCOMING_HOOK_BODY" | grep -o -m 1 ':"refs\/heads\/.*\"\,\"before\"' | sed -e 's/.*:\"refs\/heads\///;s/\"\,\"before\".*//' || true)
      # Use "Staging" environment settings (config/staging)
      BUILDENVIRONMENT="staging"
    fi
  fi
else
  echo 'Full production build triggered - Building docs content from HEAD'
fi

echo '------ BUILD DETAILS ------'
echo 'Build type:' "$CONTEXT"
echo 'Build environment:' "$BUILDENVIRONMENT"
if [ "$PRBUILD" = "true" ]
then
# Builds only the content from the PR
echo 'Building docs from PR#' "$PULL_REQUEST"
else
# The Netlify $PULL_REQUEST variable doesnt like the use of our multiple repos: Always returns false if we dont override it(see above)
echo 'Pull Request:' "$PULL_REQUEST"
fi
# Only display these values when building other user's forks
if [ "$REPO" != "knative" ]
then
echo 'Building From:' "$FORK"
echo 'Using Branch:' "$BRANCH"
fi
echo 'Commit HEAD:' "$HEAD"
echo 'Commit SHA:' "$COMMIT_REF"
# Other Netlify flags that aren't currently useful
#echo 'Repo:' "$REPOSITORY_URL"
#echo 'GitHub ID:' "$REVIEW_ID"

echo '------ WHEN BUILD SUCCESSFULLY COMPLETES ------'
# Only show published site if build triggered by PR merge
if [ "$MERGEDPR" = "true" ]
then
echo 'Published content can be viewed at:' "$URL"
else
# Gets overritten and shows only latest build
#echo 'Shared staging URL:' "$DEPLOY_PRIME_URL"
echo 'Staged content (unique to only this build) can be viewed at:' "$DEPLOY_URL"
fi

# Process the source files
source scripts/processsourcefiles.sh

# If from a WEBHOOK, show payload
if [ "$WEBHOOK" = "true" ]
then
  echo '------ WEBHOOK DETAILS ------'
  echo 'Webhook URL:' "$INCOMING_HOOK_URL"
  echo 'Webhook Body:' "$INCOMING_HOOK_BODY"
fi

# BUILD MARKDOWN
# Start HUGO build
cd themes/docsy && git submodule update -f --init && cd ../.. && hugo --environment "$BUILDENVIRONMENT"

echo '------ BUILD SUCCESSFUL ------'
echo 'VIEW STAGED CONTENT:' "$DEPLOY_URL"
echo '------------------------------'
