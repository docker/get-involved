
# Docker Get-Involved Site


This site uses [Google docsy](https://www.docsy.dev/) as a platform.
Docsy is a Hugo theme for technical documentation sets, providing simple navigation, site structure, and more.

## Running the website locally

Building and running the site locally requires a recent extended version of Hugo. You can find out more about how to install Hugo for your environment 

```
git clone --recurse-submodules --depth 1 https://github.com/docker/get-involved
cd get-involved
```


You need a [recent **extended** version](https://github.com/gohugoio/hugo/releases) (we recommend version 0.75.0 or later) of [Hugo](https://gohugo.io/) to do local builds and previews of sites (like this one) that use Docsy. If you install from the release page, make sure to get the `extended` Hugo version, which supports [SCSS](https://sass-lang.com/documentation/file.SCSS_FOR_SASS_USERS.html); you may need to scroll down the list of releases to see it. 

For comprehensive Hugo documentation, see [gohugo.io](https://gohugo.io/).

Once you've made your working copy of the site repo, from the repo root folder, run:

```
hugo server
```   
