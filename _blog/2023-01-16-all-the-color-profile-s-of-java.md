---
layout: post
title: All the color(profile)s of Java
tag: ADayInTheLifeOf
author: Robert Casties
date: 2023-01-16T16:04:14.270Z
img: https://webkit.org/blog-files/color-gamut/Webkit-logo-P3.png
img-credits: Wide color gamut sample image. Should show an outline of the Webkit
  browser logo in hues of red if you have a browser and display capable of
  displaying the DCI-P3 color space. (from
  https://webkit.org/blog-files/color-gamut/ )
excerpt: How the digilib image server learned to treat images with color
  profiles correctly and how I learned more about the weird quirks of Java's
  image libraries than ever before.
---
I have always been aware that the way that our [digilib](https://github.com/robcast/digilib) image server dealt with images with color profiles -- basically it did nothing -- was not perfect. But now I got a report from a project and some sample images that showed substantially washed-out colors in the image processed by digilib compared to the original image viewed in a desktop image viewer. I had to finally get digilib to do color right.

Very brief introduction to color profiles: A color profile is basically a table that relates the red, green, and blue (RGB) pixel values in the image data e.g. (241,0,0) to the mixtures of physical wavelengths that are real colors, e.g. a red of 610nm. The universal standard for color profiles in images is defined by the [ICC](https://www.color.org). The color profile also defines the maximum range of colors (the gamut) that can be displayed using this color space. The lowest common denominator is the sRGB color space from 1996 but many better devices today can display the bigger DCI-P3 color space. All images without an embedded color profile are usually assumed to be in the sRGB color space.

This means that two images that represent identical colors can have different pixel values when they have different color profiles so it is actually important not to ignore the color profile of an image.

I found the very nice test image you can see above at the [Apple Webkit blog](https://webkit.org/blog-files/color-gamut/). The image uses the DCI-P3 color space and it has a background color that is the brightest red that can be represented in sRGB (241,0,0 in DCI-P3) and a foreground logo in the brightest red that can be represented in DCI-P3 (255,0,0 in DCI-P3). If your browser and monitor are correctly set up for sRGB you should only see a uniform red square but if your browser and monitor can handle DCI-P3 you'll see the logo in brighter red.

Armed with the test image converted into different image formats I looked into what happened in our digilib image server that is written in Java and uses the [ImageIO API](https://docs.oracle.com/javase/8/docs/api/index.html?javax/imageio/ImageIO.html). The first thing I found is that the JPEG reader correctly reads and interprets the color profile in the image but it always converts the image into the sRGB color space so there is no way to work with images in bigger color spaces. The PNG reader reads but then ignores the color profile and claims that the image was in sRGB even if it was not, leading to wrong colors. Only the TIFF reader correctly reads and interprets color profiles. The JPEG writer correctly adds the color space (even if not sRGB) to the resulting image. The PNG writer ignores the color space of the image.

I learned over time that it is possible to extract the profile from the PNG reader manually and [fix the images](https://stackoverflow.com/questions/74862414) and that it is possible to also add the profile manually to the PNG writer. I also learned that it is not possible to [work with images with 16 bit per channel](https://stackoverflow.com/questions/74923247) but that it is possible to convert the images to 8 bit per channel and work with that (many thanks to [Harald K](https://stackoverflow.com/users/1428606)).

The visible end result of this epic struggle (which actually took longer than #adayinthelifeof) is that from [version 2.12 onwards digilib](https://github.com/robcast/digilib/releases) reads images with color profiles and correctly converts them into the sRGB color space (using config "default-quality=2" or parameter "mo=q2") or outputs images in the original non-sRGB color space ("default-quality=3" or "mo=q3").
