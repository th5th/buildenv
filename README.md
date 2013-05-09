buildenv
========

Buildenv is a Bash script and associated templates to easily set up new projects from a consistent set of files each time. Currently, only C and C++ projects are provided, though it is trivial to add new types. Absolutely no guarantees are made that any of this is a good idea or even vaguely works!

### Usage

To create a new C project, use:

`$ buildenv new C [TARGETDIR]`

As you can see from the source code, this copies a tarball from the templates/C directory into the TARGETDIR, unpacks it, runs the mkbuildenv.sh script then deletes the tarball and mkbuildenv.sh. The C environment given creates a new git repo and commits an initial commit with the first bits in.

If TARGETDIR is omitted, the current working directory is used.

To create a type of project tarball in the first place use:

`$ buildenv package TYPE [TARGETDIR]`

This packs all the files in TARGETDIR up into a tarball which is stored under templates/TYPE, for later access by new. If TARGETDIR is omitted, the TEMPLATEPATH/TYPE folder is repackaged, essentially updating the tarball to reflect any code changes made to the template files.

I'm not sure how I feel about the update command so that's "undocumented" for now...

### Todo

1. Add auto-packaging: if buildenv.tar.gz doesn't exist in the type directory, automatically try `buildenv package TYPE`.
1. Adjust mkbuildenv.sh scripts to not add all files to git, just the defined ones in the type directory. Possibly spec this in .buildenv?
1. Provide an installation Makefile for buildenv itself. Think about where the templates directory should be - /etc/buildenv/ and ~/.buildenv/
