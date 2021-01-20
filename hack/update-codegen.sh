#!/usr/bin/env bash

# Copyright 2018 The Knative Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset
set -o pipefail

# We put this in a function just in case it's usable elsewhere
function make_redirects() {
    # We don't have a top-level `go.mod` because that may interfere with Hugo,
    # so we need to cd to the tool directory in a subshell.
    ( cd tools/redir-gen; go build . )
    # Clear out old redirects; the tool will regenerate the files but doesn't
    # specifically remove older files.
    rm -f ./static/golang/*
    # Redir-gen works based on the current working directory, and should put
    # tools in the right place.
    ./tools/redir-gen/redir-gen
    # Clean up the tool so that git doesn't try to check it in.
    rm ./tools/redir-gen/redir-gen
}

make_redirects
