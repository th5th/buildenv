buildenv
========

Buildenv is a Bash script and associated templates to easily set up new projects from a consistent set of files each time. Currently the following environments are included:

* C application
* C++ application
* C library (builds .so and .a libraries and a statically linked test application).

It is trivial to add new types. Absolutely no guarantees are made that any of this is a good idea or even vaguely works!

### Installation

To use buildenv, download the sauce and run `make install` (you will probably need to sudo that). This installs the buildenv script to /usr/local/bin/buildenv, and the provided templates to /usr/local/etc/buildenv.

### Usage

To create a new C project, use:

`$ buildenv new C [TARGET]`

As you can see from the source code, this copies a tarball from the TEMPLATEPATH/C directory into the TARGET directory, unpacks it, runs the mkbuildenv.sh script. The C environment given creates a new git repo and commits an initial commit with the first bits in.

If TARGET directory is omitted, the current working directory is used.

To create a type of project tarball in the first place use:

`$ buildenv package TYPE [SOURCE]`

This packs all the files in SOURCE directory up into a tarball which is stored under TEMPLATEPATH, for later access by new. If the SOURCE directory is omitted, the current working directory is used.

Finally, to list which projects have been packaged for your consumption just type:

`$ buildenv list`

### License

buildenv as a tool is licensed under the permissive Apache 2.0 license, as recommended by FSF for short works. The provided environment bundles come with template Apache licenses to allow quick set up, but they are so simple I have not claimed copyright. I'm sure I could even if I wanted to.

### Todo

1. Add an `unpackage` command to remove created packages without having to reinstall or do it manually or whatever.
