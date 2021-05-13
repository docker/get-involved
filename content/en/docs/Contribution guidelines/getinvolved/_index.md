---
title: How to contribute to Get Involved Site
linkTitle: How to contribute to "Get Involved" Site
weight: 53
description: >-
      A Guide to contribute to this website
---



Community and participation are the backbone of Docker. Whether you're technical or not, we welcome contributions from anyone around the world. This page is intended for people who want to contribute content sections of this website and who don't use Git or GitHub often. This will help you get going with a GitHub repository, using either Git on CLI or the GitHub web user interface (UI).

## Using the command line

# Clone the repository

To start contributing you need to clone [this](https://github.com/docker/get-involved) repository.
Use the following command that will also clone the submodules used. 

```sh
git clone --recurse-submodules --depth 1 https://github.com/docker/get-involved
```

## Running the website locally

Building and running the site locally requires a recent extended version of Hugo.
You can find out more about how to install Hugo for your environment in our Getting started guide.

You need a [recent **extended** version](https://github.com/gohugoio/hugo/releases) of 
[Hugo](https://gohugo.io/) to do local builds and preview the website. 
We recommend using version `0.75.0` or later.
If you install from the release page, make sure to get the `extended` Hugo version.
The extended versions support [SCSS](https://sass-lang.com/documentation/file.SCSS_FOR_SASS_USERS.html); 
you may need to scroll down the list of releases to see it. 

For comprehensive Hugo documentation, see [gohugo.io](https://gohugo.io/).

Once you've made your working copy of the site repo, from the repo root folder, run:

```
hugo server
```   

## Troubleshooting

If you have not cloned this repository as suggested above, you may face the following error during the run:

```sh
➜ hugo server -D
Start building sites … 
Built in 1079 ms
Error: Error building site: "/home/get-involved/content/en/_index.html:7:1": failed to extract shortcode: template for shortcode "blocks/cover" not found
```

This is primarily because you have not yet cloned the submodules used in the repository.
In order to fix the issue run the following command and retry:

```sh
git submodule update --init --recursive
```

## Code reviews

All submissions, including submissions by project members, require review. We
use GitHub pull requests for this purpose. Consult
[GitHub Help](https://help.github.com/articles/about-pull-requests/) for more
information on using pull requests.

## Community Guidelines

This project follows
[Google's Open Source Community Guidelines](https://opensource.google.com/conduct/).

