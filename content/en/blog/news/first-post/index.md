---
date: 2018-10-06
title: "Easy documentation with Docsy"
linkTitle: "Announcing Docker Community Page"
description: "Docker Community Page is designed to get you involved with Docker Community"
author: Docker Community  ([@rionam](https://twitter.com/dockercommunity))
resources:
- src: "**.{png,jpg}"
  title: "Image #:counter"
  params:
    byline: "Photo: Riona MacNamara / CC-BY-CA"
---

**Welcome to New Docker Community Site**

Inviting you to the new Docker Community Site

## Including images

Here's an image (`featured-sunset-get.png`) that includes a byline and a caption.

{{< imgproc sunset Fill "600x300" >}}
Fetch and scale an image in the upcoming Hugo 0.43.
{{< /imgproc >}}

The front matter of this post specifies properties to be assigned to all image resources:

```
resources:
- src: "**.{png,jpg}"
  title: "Image #:counter"
  params:
    byline: "Photo: Riona MacNamara / CC-BY-CA"
```

To include the image in a page, specify its details like this:

```
{{< imgproc sunset Fill "600x300" >}}
Fetch and scale an image in the upcoming Hugo 0.43.
{{< /imgproc >}}
```

The image will be rendered at the size and byline specified in the front matter.


