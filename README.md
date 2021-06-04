# documently

A comprehensive toolkit for building fast websites. documently converts a
directory of HTML templates, plaintext files, and assets into a directory of
HTML, CSS, and JS files.

## Beliefs and Goals

* **Be Comprehensive** → Everything needed to build a website is included out of
  the box, without needing to install or configure a set of third-party tools
* **Provide Reasonable Defaults** → Most things are set up by default to work in
  a helpful, unsurprising way; when needed, these defaults can be broken out of
  to enable specialized scenarios
* **Build Fast Websites** → Plain websites are already fast, but optional
  optimizations are provided to make them even faster
* **Enable Accessibility** → Accessibility—a crucial and uncompromisable quality
  of all websites—is enforced at every opportunity

For more details on documently's philosophy and origins, see the [about
page][about].

## Features

* HTML templates with embedded Ruby to dynamically generate markup
* Template helpers to make generating elements like links and dates easier
* Transformation of Markdown to HTML
* A Ruby API for interacting with content
* An incremental build system which only regenerates the parts of the website
  that have changed
* An optional [progressive enhancement plugin][navigate] for additional speed
  improvements like link preloading and in-memory page transitions
* A build pipeline for documents and assets that performs various optimizations
  like minification and versioning
* A predefined directory structure with sensible locations for all kinds of
  files

## Getting Started

* New to the framework, or looking for a high-level, guided walkthrough? Check
  out the [tutorial][tutorial]
* Already familiar with documently, or want more in-depth details about each
  topic? Take a look at the [docs][docs]
* Need the signature for a method or the public interface of a class? See the
  [API][api]

[about]: https://github.com/documently/documently
[navigate]: https://github.com/documently/documently
[tutorial]: https://github.com/documently/documently
[docs]: https://github.com/documently/documently
[api]: https://github.com/documently/documently
