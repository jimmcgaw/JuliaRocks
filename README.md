# Programming a Julia Project

## Summary

I am interested in learning <a href="https://julialang.org/" target="_blank">the Julia programming language</a> for machine learning, with a focus on doing image processing and deep learning for computer vision.

I am a seasoned programmer, having worked with many languages, frameworks, and tools for the last 20 years. As a newcomer to any language, I ask some of the same question that are covered in every "Intro to X Language" books and online tutorials. Questions like:

* What are the numeric data types? How are signed / unsigned integers handled? How are float values handled? What special data type should you use if you need more precision for decimal computations than the <a href="https://en.wikipedia.org/wiki/IEEE_754" target="_blank">IEEE 754</a> spec covers?
* What character set does the default string type(s) use? How is it compatible with UTF-8? Are strings immutable?
* What data structures are present by default? What do you use for a hash table? How is memory allocated when initializing and manipulating the contents of arrays?

And so on.

However, most of the questions that I ask upfront having nothing to do with this kind of "Hello World" programming questions, and more to do with everything ancillary to the code. These question include:

* How do I create a new project? What should the default directory structure be?
* How do I manage external package dependencies for a project?
* How do I write tests for my code? How do I run these tests?
* How do I take a simple program and compile it as a binary for different platforms and architectures?
* How can I quickly iterate on code in files when I'm learning the language syntax?
* How do I Dockerize an application that I want to deploy to other machines?
* What are the authoritative sources that cover how to use the language?
* What kind of language support is there for my IDE of choice?
* What drivers / libraries exist for connecting the code to various databases?
* What should be included, by default, in a .gitignore file for a project?
* How is code documented, both for individual functions and modules, and for larger projects that span many files?

This project is intended to document my learnings with respect to getting ramped up on Julia. There is a lot of good information out there on the web, and in books. This repo is intended to pull together those threads and offer some concise explanations, along with working, actionable examples. It's my own quick 'n' dirty cheat sheet.

I use VS Code as my IDE. I'm on Mac OS X. I'm still using the ol' bash shell like a 'nix luddite. :P

## Links

I am indebted to the Julia community for its assistance in getting me up and running. Credit where it's due: these are links to resources I've found useful in getting started as a complete n00b.

* https://ufechner7.github.io/2022/08/16/julia-projects.html
* https://www.matecdev.com/posts/julia-create-project.html
* https://www.matecdev.com/posts/julia-testing.html
* https://www.freecodecamp.org/news/machine-learning-using-julia/

## Errata

Anything that I get correct in this walkthrough is due to help from the Julia community. Any mistakes I've made here are my own. If you'd like to correct me, feel free to drop a line: [jpmcgaw [at] gmail](mailto:jpmcgaw@gmail.com).

## How to Follow Along

I document the steps and commands that I used in order to create this repo, how to install dependencies, and so on. You can either:

* Start with a fresh new project of your own, following the steps, OR
* Clone this repo and take what you want from it.

I use the Markdown syntax that allows quick, one-click copy/paste of commands. That means their context isn't always clear. Is it the system shell? The julia REPL? Julia package mode? I've tried to make this clear from context, instead of prefacing the commands. So I use:

```
println("Hello Julia")
```

which is for the Julia REPL, instead of:

```
julia> println("Hello Julia")
```

## Installation

https://julialang.org/downloads/

In short, in your shell:

```
curl -fsSL https://install.julialang.org | sh
```

## Julia Command Modes

### Julia REPL

To get into a `Julia REPL`, just type:

```
julia
```

If you see the command prompt with the language name, you're in the REPL:

`julia>`

Here you can enter and execute Julia code.

To exit the `Julia REPL`, use `Ctrl-D`.

### Pkg REPL

To transition from the `Julia REPL` into the `Pkg REPL`, just enter a right (closing) square bracket: `julia> ]`

```
]
```

In the `Pkg REPL`, your command prompt will be:

`@v1.xx) pkg>`

To exit `Pkg REPL` and return to the `Julia REPL`, just hit the `Delete`/`Backspace` key at an empty command prompt.

### Shell Mode

To transition from the `Julia REPL` into `Shell mode`, just enter a semi-colon: `julia> ;`

```
;
```

`Shell mode` command prompt: `shell>`

This allows for entering typical shell commands, as if you weren't in the Julia prompt.

## Installing Packages

You can try these out, but if you're starting a project, and want to maintain a set of dependency packages for that project, I'd suggest you keep reading before you start installing a bunch of things.

There are a few ways to install packages. In these cases, we're installing the `Revise` package.

1. In the `Pkg REPL`:

```
add Revise
```

2. In the `Julia REPL`:

```
using Pkg
Pkg.add("Revise")
```

Or, if you don't want to do the import of the `Pkg` module, just try importing the module you want to install

```
using Revise
```

and follow the prompts that offer to install the missing package for you.

## Removing Packages

In the `Julia REPL`:

```
using Pkg
Pkg.rm("Revise")
```

## Installing Global Packages

You can install dependencies in your system globally, for use by all projects on your machine, by going into the `Julia REPL` without specifying a project:

```
julia
```

## Setting up a Julia Project

There is a command for generating an initial project structure, which is basically a directory for source code, which is initialized with a "Hello World" example, and a `Project.toml` file to house project metadata, and to track dependencies.

Go into the directory on your machine where you store code project directories. (For me, this is `~/source/`.)

In this directory, enter the the `Pkg REPL`, and then run this to generate the project:

```
generate YourProjectName
```

(Replace `YourProjectName` with your desired project name. By convention, in Julia module and package names using `CapitalCamelCase`. See <a href="https://docs.julialang.org/en/v1/manual/style-guide/#Use-naming-conventions-consistent-with-Julia-base/" target="_blank">the Julia Style Guide</a>) for more on naming conventions.)

Back in your shell, can `cd` into this new project directory and run `tree` to see the initial files. (Assumes you have the `tree` system package installed.)

You can enter the `Julia REPL` and `Pkg REPL` scoped to your new project by running the following from inside of your new project directory:

```
julia --project=.
```

This command is common enough that I usually put it into a Makefile, or create an alias, so I can run it quickly.

Now, if you install packages, they will be included as part of your project, and listed in the `Project.toml` file. This is useful when you want to deploy your code, and you want to install all of your project dependencies from a single source of truth.

## Install Project Dependencies

Inside of your project's `Julia REPL`, ie after running:

```
julia --project=.
```

You can install dependencies the same way as specified above, in the "Installing Packages" section. Try installing this into your project (just hit "y" when prompted):

```
using JSON3
```

After installation, you can open up `Project.toml` and see that this new package is listed in the `deps` section. This makes installation of any and all packages you add to your project easily reproducible. (See the "Dockerize It" section below to see why this is helpful.)


