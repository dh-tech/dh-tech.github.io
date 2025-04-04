# DHTech website

This is the website for DHTech.

The site is implemented with [Hugo](https://gohugo.io/) and uses the [Hugo Clarity theme](https://github.com/chipzoller/hugo-clarity).

## Content management instructions

To have a page show up in the "featured posts" in the sidebar, simply
add `featured: true` to the page metadata.

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

To run the site locally for development:
```sh
hugo server
```

or run the following docker command:

```sh
docker-compose up 
```

when you are done, either stop the process or run the following:

```sh
docker-compose down
```

Docker will mount your current working directory inside the container, so changes you save to any files will be picked up by Hugo.

### Creating a new post

To create a new post on the command line, run:

```sh
hugo new -k post content/blog/YYYY-MM-DD-short-title.md 
```

To auto-fill in YYYY-MM-DD for the current date, you can use
```sh
hugo new -k post content/blog/`date +'%Y-%m-%d`-short-title.md 
```

The `short-title` or "slug" portion will be used for the URL, unless overridden
in page parameters. In general, slugs should be lowercase and use dashes (kebab case).

News and announcements should be created under `content/news` and blog posts should be created under `content/blog`.

Static files such as images, slides, PDFs should be added to the top-level `static/` folder;  post images are generally under `static/images/posts`. 

