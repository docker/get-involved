#!/bin/bash

##############################################
# THE DEFAULT DOCS REPO AND VERSION SETTINGS #
##############################################

# Version number of the latest release
# RELEASE-ITEM: This gets updated every release
LATESTVERSION="20"

# Branch name of the latest release
DEFAULTBRANCH="release-0.$LATESTVERSION"

# Total number of past versions to publish
NUMOFVERSIONS="3"
OLDESTVERSION=$((LATESTVERSION-NUMOFVERSIONS))

# An optional value that you can locally override for local builds/testing
DEFAULTORG="knative"
DEFAULTREPO="$DEFAULTORG/docs"
