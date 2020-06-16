[![Build Status](https://dev.azure.com/chefcorp-partnerengineering/Chef%20Base%20Plans/_apis/build/status/chef-base-plans.bzip2?branchName=master)](https://dev.azure.com/chefcorp-partnerengineering/Chef%20Base%20Plans/_build/latest?definitionId=69&branchName=master)

# bzip2

bzip2 is a free and open-source file compression program that uses the Burrows–Wheeler algorithm. It only compresses single files and is not a file archiver.  See [documentation](https://sourceware.org/bzip2/)

## Maintainers

* The Core Planners: <chef-core-planners@chef.io>

## Type of Package

Binary package

### Use as Dependency

Binary packages can be set as runtime or build time dependencies. See [Defining your dependencies](https://www.habitat.sh/docs/developing-packages/developing-packages/#sts=Define%20Your%20Dependencies) for more information.

To add core/bzip2 as a dependency, you can add one of the following to your plan file.

##### Buildtime Dependency

> pkg_build_deps=(core/bzip2)

##### Runtime dependency

> pkg_deps=(core/bzip2)

### Use as Tool

#### Installation

To install this plan, you should run the following commands to first install, and then link the binaries this plan creates.

``hab pkg install core/bzip2 --binlink``

will add the following binaries to the PATH:

* /bin/bzdiff
* /bin/bzip2
* /bin/bunzip2
* /bin/bzegrep
* /bin/bzless
* /bin/bzip2recover
* /bin/bzcat
* /bin/bzcmp
* /bin/bzgrep
* /bin/bzmore
* /bin/bzfgrep

#### Using an example binary

You can now use the binary as normal.  For example:

``/bin/bzip2 --help`` or ``bzip2 --help``

```bash
$ bzip2 --help
bzip2, a block-sorting file compressor.  Version 1.0.6, 6-Sept-2010.

   usage: bzip2 [flags and input files in any order]

   -h --help           print this message
   -d --decompress     force decompression
   -z --compress       force compression
   -k --keep           keep (don't delete) input files
   -f --force          overwrite existing output files
...
...
```
