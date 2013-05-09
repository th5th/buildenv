buildenv
========

Buildenv is a Bash script and associated templates to easily set up new projects from a consistent set of files each time. Currently, only C and C++ projects are provided, though it is trivial to add new types. Absolutely no guarantees are made that any of this is a good idea or even vaguely works!

### Installation

To use buildenv, download the sauce and run `make install` (you will probably need to sudo that). This installs the buildenv script to /usr/local/bin/buildenv, and the provided templates to /usr/local/etc/buildenv.

### Usage

To create a new C project, use:

`$ buildenv new C [TARGET]`

As you can see from the source code, this copies a tarball from the TEMPLATEPATH/C directory into the TARGET directory, unpacks it, runs the mkbuildenv.sh script then deletes the tarball and mkbuildenv.sh. The C environment given creates a new git repo and commits an initial commit with the first bits in.

If TARGET directory is omitted, the current working directory is used.

To create a type of project tarball in the first place use:

`$ buildenv package TYPE [SOURCE]`

This packs all the files in SOURCE directory up into a tarball which is stored under TEMPLATEPATH/TYPE, for later access by new. If the SOURCE directory is omitted, the TEMPLATEPATH/TYPE folder is repackaged, essentially updating the tarball to reflect any code changes made to the template files.

### License

buildenv as a tool is licensed under the permissive Apache 2.0 license, as recommended by FSF for short works. I consider the templates installed by buildenv to be in the public domain, but they are so short I have not bothered to explicitly license them.

### Todo

1. Probably move mkbuildenv.sh out of the tarball and extract the tarball from where it sits. This avoids having to delete stuff each time.
1. Add a -e flag to pass arbitrary arguments to mkbuildenv.sh.
