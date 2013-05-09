buildenv
========

Buildenv is a Bash script and associated templates to easily set up new projects from a consistent set of files each time. Currently, only the C project is implemented, though I will do the C++ one soonTM. Abolutely no guarantees are made that any of this is a good idea or even vaguely works!

### Usage

To summon a new C project, use:

`$ buildenv new C TARGETDIR`

As you can see from the source code, this copies a tarball from the templates/C directory into the TARGETDIR, unpacks it, runs the mkbuildenv.sh script then deletes the tarball and mkbuildenv.sh. The C environment given creates a new git repo and commits an initial commit with the first bits in.

To create a type of project tarball in the first place use:

`$ buildenv package TYPE TARGETDIR`

This packs all the files in TARGETDIR up into a tarball which is stored under templates/TYPE, for later access by new.

In either use case, if TARGETDIR is omitted, the current directory is used.

I'm not sure how I feel about the update command so that's "undocumented" for now...
