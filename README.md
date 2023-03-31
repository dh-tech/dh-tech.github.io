# DHTech website

**NOTE: migration from Hugo to Jekyll is in-progress**

This is the website for DHTech.

The site is implemented with [Hugo](https://gohugo.io/) and uses the [Hugo Clarity theme](https://github.com/chipzoller/hugo-clarity).

## Setup instructions

### Hugo setup

To set the site up locally for development or content editing,
first follow the [instructions to install Hugo](https://gohugo.io/installation/).
You can check that Hugo is installed with:

```sh
hugo version
```

This should result in output something like this:

> hugo v0.110.0+extended darwin/amd64 BuildDate=unknown

The Clarity theme is currently installed as a [Hugo module](https://gohugo.io/hugo-modules/use-modules/) instead of a git submodule. Installing modules requires the Go language to be installed; we may instead want to use `hugo mod vendor` to write and check-in all modules into a local `_vendor` directory so that installing Go locally is not required for contributing to the site.



