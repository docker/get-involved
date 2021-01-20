#!/bin/bash

# Quit on error
set -e

##############################################
# THIS FILE IS USED TO RUN LOCAL SITE BUILDS #
##############################################

# USAGE:
# 1. Install Hugo: https://www.docsy.dev/docs/getting-started/#install-hugo
#
# 2. For Mac OSX: The script uses the `gnu` version of `sed`. To install `gnu-sed`, you use brew:
#    1. Run `brew install gnu-sed`
#    2. Add it to your `PATH`. For example, add the following line to your `~/.bash_profile`:
#      `PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"`
#
# 3. Install PostCSS. Needed to build the site locally.
#    https://www.docsy.dev/docs/getting-started/#install-postcss
#
# 4. Clone the knative/docs repo:
#    `git clone https://github.com/knative/docs.git`
#
# 5. Clone the knative/website repo, including the Docsy theme submodule:
#    `git clone --recurse-submodules https://github.com/knative/website.git`
#
#     Note: These repos must be cloned into the same folder and use the same
#     names ('docs', 'website', 'community')
#
# 6. Optional: Clone the knative/community repo.
#    `git clone https://github.com/knative/community.git`
#
# 7. From the root of the knative/website clone, run:
#    `scripts/localbuild.sh`
#
#     See all command options below (ie. build from your remote fork, etc).
#
# 8. If you change content in your knative/docs repo clone, you rebuild your local
#    site by stopping the localhost (CTRL C) and running `scripts/localbuild.sh` again.
#
# By default, the command locally runs a Hugo build of using your local knative/website and
# knative/docs clones (including any local changes).
#
# All files from you local knative/docs clone are copied into the 'content'
# folder of your knative/website repo clone, and then they are processed in the
# same way that they are process on the Netlify host server.
#
# You can also build and preview changes from other remote Forks and Branches.
# See details about optional settings and flags below.

# Retrieve the default docs version
source scripts/docs-version-settings.sh
# Use default repo and branch from docs-version-settings.sh
BRANCH="$DEFAULTBRANCH"
FORK="$DEFAULTREPO"
REPO="$DEFAULTORG"

# Set local build default values
BUILDENVIRONMENT="local"
BUILDALLRELEASES="false"
BUILDSINGLEBRANCH="false"
PRBUILD="false"
LOCALBUILD="true"

# Default Hugo build options
# disable Hugo server
SERVER=""
# disable live reload
LIVERELOAD=" --watch=false --disableLiveReload"

# OPTIONS:
#
# (1) Specify a remote repo fork, branch, or both, to build that content locally.
#     The specified repo and branch are cloned and built locally to allow you to
#     preview changes in remote forks and branches.
#
#     USAGE: Append the -f repofork and/or the -b branchname to the command.
#            Example:
#                    ./scripts/build.sh -f repofork -b branchname -s true
#
# (2) Run a complete local build of the knative.dev site. Clones all the content
#     from knative/docs repo, including all branches.
#
#     USAGE: Append the -a true to the command.
#            Example:
#                    ./scripts/build.sh -a true -s true
#
# Examples:
#
#  - Default: Build local clone to static HTML (output to 'public' folder):
#    ./scripts/localbuild.sh
#
#  - Locally build knative.dev:
#      ./scripts/localbuild.sh -a true
#
#  - Run Hugo server (localhost):
#
#    - Local clone build (-s true):
#      ./scripts/localbuild.sh -s true
#
#    - Local clone build with live reload (-s reload):
#      - Useful for website changes only (doesn't work on docs)
#      ./scripts/localbuild.sh -s reload
#
#  - Additional build options - build from remote Fork and Branch:
#
#    - Build content from specified fork and branch:
#      - Build any branch from your fork or from someones in a PR
#      ./scripts/localbuild.sh -f REPO/FORK -b BRANCHNAME
#
#    - Locally build a specific branch from knative/docs:
#      ./scripts/localbuild.sh -b BRANCHNAME
#
#    - Combine other -s or -a flags. Example:
#      ./scripts/localbuild.sh -f my-docs-contributor-fork -a true -s reload
#
while getopts "f:b:a:s:" arg; do
  case "${arg}" in
    f)
	  echo '--- BUILDING FROM ---'
      echo 'FORK:' "${OPTARG}"
      # Build remote content locally
      # Set the GitHub repo name of your knative/docs fork that you want built.
      # Example: myrepo/forkname
      FORK="${OPTARG}"
      # Retrieve content from remote repo
      BUILDSINGLEBRANCH="true"
      # Extract the repo name
      REPO=$(echo "$FORK" | sed -e 's/\.*\/.*//')
      ;;
    b)
      echo 'USING BRANCH:' "${OPTARG}"
      # Build remote content locally
      # Set the branch name that you want built.
      BRANCH="${OPTARG}"
      # Retrieve content from remote repo branch
      BUILDSINGLEBRANCH="true"
      ;;
    a)
      echo 'BUILDING ALL RELEASES FROM' "$FORK"
      # If 'true', all knative/docs branches are built to mimic a
      # "production" build.
      # REQUIRED: If you specify a fork ($FORK), all of the same branches
      # (with the same branch names) that are built in knative.dev must
      # also exist and be available in the that $FORK (ie, 'release-0.X').
      # See scripts/docs-version-settings.sh for the list of the built branches.
      BUILDALLRELEASES="${OPTARG}"
      BUILDENVIRONMENT="production"
      BUILDSINGLEBRANCH="false"
      ;;
    s)
      echo 'Running Hugo server'
      SERVER="server $LIVERELOAD"
      if [ "${OPTARG}" = "reload" ]; then
        echo 'with live reload'
        LIVERELOAD=" --disableFastRender --renderToDisk"
      fi
      ;;
  esac
done

# Create the require "content" folder
mkdir -p content

# Process the source files
source scripts/processsourcefiles.sh

# BUILD MARKDOWN
# Start HUGO build
hugo $SERVER --baseURL "" --environment "$BUILDENVIRONMENT" --gc

if [ -z "$SERVER" ]; then
  echo ''
  echo '**********     DONE!     **********'
  echo ''
  echo 'Static HTML files output to public/. Open public/index.html to view these files.'
fi
