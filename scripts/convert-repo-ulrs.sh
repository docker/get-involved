#######################################################################################
# THIS FILE IS USED BY THE 'processsourcefiles.sh' SCRIPT TO CONVERT URLS TO RELATIVE #
#######################################################################################

echo '------ CONVERT FULLY QUALIFIED REPO URLS TO RELATIVE ------'
# Convert fully-qualified URLs that are used in the Knative GitHub repos source files
# to link from repo to repo, into relative URLs for publishing to the knative.dev site.
#
# To ensure that content is usable when viewed within the Knative GitHub repos,
# links that span across repos use fully-qualified URLs. However, for the
# content published on knative.dev, we need to convert those fully-qualified URLs
# to Hugo relative URLs* to avoid the knative.dev site default behavior of opening
# fully-qualified URLs in new browser window tabs.
# * Hugo's "relative" URLs are root-of-domain based (relative to the knative.dev root):
#   https://gohugo.io/content-management/urls/#relative-urls
#
# To convert URLS to root-based relative URLS, remove the following:
# - Remove repo domains:
#   - "https://github.com/knative/community/"
#   - "https://github.com/knative/docs/"
# - Remove GitHub "tree|blob" paths (ie "/tree/master/" or "/blob/master/")
#   Note: Assume all links point to the `master` branch.
# - Exclude issues or pulls URLs:
#   - https://github.com/knative/(docs|community)/OWNERS*
#   - https://github.com/knative/(docs|community)/branches
#   - https://github.com/knative/(docs|community)/issues
#   - https://github.com/knative/(docs|community)/labels
#   - https://github.com/knative/(docs|community)/pulls
# - Skip:
#   - GitHub file (.git* files)
#   - Hugo related files
#   - All non-docs content directories

echo 'Converting all fully-qualified Knative URLs to relative URLs...'

# Convert fully qualified URLs that point to knative/docs GitHub repo:
find . -type f -path '*/content/*' -name '*.md' \
    ! -name '*serving-api.md' ! -name '*eventing-contrib-api.md' ! -name '*eventing-api.md' \
    ! -name '*build-api.md' ! -name '*.git*' ! -path '*/.github/*' ! -path '*/hack/*' \
    ! -path '*/node_modules/*' ! -path '*/test/*' ! -path '*/themes/*' ! -path '*/vendor/*' \
    -exec sed -i '/](https:\/\/github\.com\/knative\/docs/ { /OWNERS*/ !{ /docs\/branches/ !{ /docs\/issues/ !{ /docs\/pulls/ !{ /docs\/labels/ !{ s#(https\:\/\/github\.com\/knative\/docs#(#g; s#\/tree\/master##g; s#\/blob\/master##g }}}}}}' {} +

# Convert fully qualified URLs that point to knative/community GitHub repo:
find . -type f -path '*/content/*' -name '*.md' \
    ! -name '*serving-api.md' ! -name '*eventing-contrib-api.md' ! -name '*eventing-api.md' \
    ! -name '*build-api.md' ! -name '*.git*' ! -path '*/.github/*' ! -path '*/hack/*' \
    ! -path '*/node_modules/*' ! -path '*/test/*' ! -path '*/themes/*' ! -path '*/vendor/*' \
    -exec sed -i '/](https:\/\/github\.com\/knative\/community/ { /OWNERS*/ !{ /docs\/branches/ !{ /community\/issues/ !{ /community\/pulls/ !{ /community\/labels/ !{ s#(https\:\/\/github\.com\/knative\/community#(/community/contributing/#g; s#\/tree\/master##g; s#\/blob\/master##g }}}}}}' {} +
