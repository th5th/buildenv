buildenv
========

Buildenv is a Bash script and associated templates to easily set up new projects from a consistent set of files each time. Currently the following environments are included:

* C application
* C++ application
* C library (builds .so and .a libraries and a statically linked test application).
* C library with SWIG wrapper (as above, but with a wrapper which allows the library's use in Python).

It is trivial to add new types.

### Installation

To use buildenv, download the sauce and run `sudo make install`. This installs the buildenv script to /usr/local/bin/buildenv, and the provided project setups to /usr/local/etc/buildenv.

### Usage

To create a new project, use:

`$ buildenv new <type> [path | --] [mkbuildenv.sh options]`

As you can see from the source code, this copies a tarball from the PKGPATH directory to [path], unpacks it and runs the mkbuildenv.sh script. The C environment given creates a new git repo and commits an initial commit with the first bits in. If [path] is omitted, the current working directory is used. Arguments can be passed to the mkbuildenv.sh script by tacking them on to the end of the call. Note that if path is to be omitted, it must be replaced by "--", otherwise the first mkbuildenv.sh arg will be parsed as the target path!

To create a type tarball use:

`$ buildenv package <type> [path]`

This packs all the files in [path] directory up into a tarball which is stored under PKGPATH, for later access by new. If the [path] directory is omitted, the current working directory is used. If the [path] directory contains a file called `<type>.info`, that file will NOT be packaged, but will be directly copied and used as a description of the project type in the list command's output.

...which is executed as follows:

`$ buildenv list`

Finally, to remove a project type from buildenv's package directory, run:

`$ buildenv remove <type>`

### License

buildenv as a tool is licensed under the permissive Apache 2.0 license, as recommended by FSF for short works. The provided environment bundles come with template Apache licenses to allow quick set up, but they are so simple I have not claimed copyright. I'm not sure I could even if I wanted to.

### Todo

+ Add a `new-dev` package with empty `mkbuildenv.sh` and `<type>.info` files, and no git repo. Or something. To allow very quick package making without having to manually copy tarballs from wherever.
+ Add install and uninstall targets to packages. Potentially very useful!
