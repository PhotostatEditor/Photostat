# Contributing to Photostat

:tada: Hey there, thanks a lot for contributing to Photostat. It really means a lot for us 😊 :tada:

Being an open source project, the best thing about Photostat is the community - you! There are many ways to contribute, from submitting bug reports and feature requests to writing code or desing discussions.

All members of our community are expected to follow our [Code of Conduct](.github/CODE_OF_CONDUCT.md). Please make sure you are welcoming and friendly in all of our spaces.

The following is a set of guidelines for contributing to Photostat.
Following these guidelines makes it really easy to both get started with contributing and also reviewing and implementing contributions.

These are mostly guidelines, not rules. Use your best judgment, and feel free to propose changes to this document in a pull request.

## Table of contents

* [Getting started](#getting-started)
* [Reporting bugs and issues](#reporting-bugs-and-issues)
* [Feature requests](#feature-requests)
* [Your first contribution](#your-first-contribution)
* [Pull requests](#pull-requests)
* [Code review process](#code-review-process)

## Getting started

* Photostat is written in [Vala language](https://wiki.gnome.org/Projects/Vala) and uses the [Gimp Toolkit (GTK)](https://www.gtk.org)

* To start learning how to program in Vala, check out the [official tutorial](https://wiki.gnome.org/Projects/Vala/Tutorial)

* To follow up on general questions about development in GTK, head over to [Gnome Wiki](https://wiki.gnome.org/Newcomers/)

* Photostat's main source repository is at [Github](https://github.com/PhotostatEditor/Photostat).

* Installing

    You can install Photostat by compiling it from the source

    1. Install required dependencies:

        * `libgtk-3-dev`
        * `libgranite-dev`
        * `libhandy-1-dev >= 0.90.0`
        * `meson`
        * `valac`
        * if you are on elementary OS 5 you will need [elementary-stylesheet](https://github.com/elementary/stylesheet)

        > For non elementary distros you will need to install [elementary-icons](https://github.com/elementary/icons) and [elementary-stylesheet](https://github.com/elementary/stylesheet)

    2. Building:
        ```
        meson build --prefix=/usr
        cd build
        ninja && sudo ninja install
        ```

## Reporting bugs and issues

### Security vulnerability

**If you find a security vulnerability, do NOT open an issue. Email _singharajdeep97@gmail.com_ instead.**

In order to determine whether you are dealing with a security issue, ask yourself these two questions:

* Can I access something that's not mine, or something I shouldn't have access to?
* Can I disable something for other people?
If the answer to either of those two questions are "yes", then you're probably dealing with a security issue. Note that even if you answer "no" to both questions, you may still be dealing with a security issue, so if you're unsure, just email us at _castellani.ale@gmail.com_.

### Bugs/Issues

If you think you have found a bug in Photostat, first make sure that you are testing against the latest version of Photostat (latest commit on `master` branch) - your issue may already have been fixed. If not, search our [issues list](https://github.com/PhotostatEditor/Photostat/issues) on GitHub in case a similar issue has already been opened.

If the issue has not been reported before, simply create [a new issue](https://github.com/PhotostatEditor/Photostat/issues/new) via the [**Issues** section](https://github.com/PhotostatEditor/Photostat/issues)

It is very helpful if you can prepare a reproduction of the bug. In other words, provide all the steps as well as a GIF demonstrating the bug. It makes it easier to find the problem and to fix it.

Please adhere to the issue template and make sure you have provided as much information as possible. This helps the maintainers in resolving these issues considerably.

> **Please be careful** of publishing sensitive information you don't want other people to see, or images whose copyright does not allow redistribution; the bug tracker is a public resource and attachments are visible to everyone.

## Feature requests

If you find yourself wishing for a feature that doesn't exist in Photostat, you are probably not alone. There are bound to be others out there with similar needs. Many of the features that Photostat has today have been added because our users saw the need.

To request a feature, open an issue on our [issues list](https://github.com/PhotostatEditor/Photostat/issues).

> Photostat is maintained by a small team of individuals, who aim to provide good support as much as possible.

## Your first contribution

Unsure where to begin contributing to Photostat? You can start by looking through the help-wanted issues:
 * [Help wanted issues](https://github.com/PhotostatEditor/Photostat/issues?q=is%3Aissue+is%3Aopen+label%3A%22help+wanted%22) - issues which the team has marked for some help.

> Working on your first Pull Request? You can learn how from this [link](https://www.firsttimersonly.com/).

At this point, you're ready to make your changes! Don't hesitate to ask for help.

## Pull requests

If you want to start working on a new feature, please consider opening issue before submitting a PR as we might have already started work on that particular feature or your implementation of that feature might not meet the design vision and goal of the app.

For something that is bigger than a one or two line fix:

1. Create your own fork of the code
1. Create a branch
1. Commit your changes in the new branch
1. If you like the change and think the project could use it:
    * Be sure you have followed the code style for the project.
    * Open a pull request with a good description (including issue number)

## Code review process

The core team looks at Pull Requests on a regular basis and they are dealt with on case by case basis and roadmap in mind.
