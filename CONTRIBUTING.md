# Contributing to InstrumentStudio Plug-In for LabVIEW

Contributions to InstrumentStudio Plug-In for LabVIEW are welcome from all!

InstrumentStudio Plug-In for LabVIEW is managed via [git](https://git-scm.com),
with the canonical upstream repository hosted on
[GitHub](https://github.com/ni/instrumentstudio-plugin-labview).

InstrumentStudio Plug-In for LabVIEW follows a pull-request model for
development. If you wish to contribute, you will need to create a GitHub
account, fork this project, push a branch with your changes to your project, and
then submit a pull request.

Please remember to sign off your commits (e.g., by using `git commit -s` if you
are using the command line client). This amends your git commit message with a line
of the form `Signed-off-by: Name Lastname <name.lastmail@emailaddress.com>`. Please
include all authors of any given commit into the commit message with a
`Signed-off-by` line. This indicates that you have read and signed the Developer
Certificate of Origin (see below) and are able to legally submit your code to
this repository.

See [GitHub's official documentation](https://help.github.com/articles/using-pull-requests/) for more details.

## Getting Started

This repo contains source code and package build specifications for building the
source into VI packages.

The source code can be found under the `Source` directory. The package
definition files (.vipb) can be found under the `build specs` directory. The
example InstrumentStudio plug-in can be found under the `examples` directory.

## Prerequisites

- Install Git
- Install Software Dependencies mentioned in the `README.md`

## Clone or Update the Git Repository

To download the InstrumentStudio Plug-In for LabVIEW source, clone its Git
repository to your local PC.

```cmd
git clone https://github.com/ni/instrumentstudio-plugin-labview.git
```

If you already have the Git repository on your local PC, you can update it

```cmd
git checkout main

git pull
```

## Steps to Contribute

To contribute to this project, it is recommended that you follow these steps:

1. Make your change.
2. Send a GitHub Pull Request to the main repository's master branch. GitHub
   Pull Requests are the expected method of code collaboration on this project.

## Building the LabVIEW Packages

The source code is built into two LabVIEW packages

- `ni_instrumentstudio_plugin_sdk`
- `ni_instrumentstudio_plugin_sdk_generator`

To build the packages:

1. Open the desired VIPM specification file (.vipb) under the [`build
   specs`](https://github.com/ni/instrumentstudio-plugin-labview/tree/main/build%20specs)
   folder
2. Open the Specification file using VIPM 2021 or later
3. Click Build. A `.vip` file will be created in the `Build Output` folder under
   the repository's root directory

## `ni_instrumentstudio_plugin_sdk` Package

The `ni_instrumentstudio_plugin_sdk` package contains the
`InstrumentStudioPluginSDK` PPL, `NationalInstruments.VIHost.Interop` DLL and
two `.vim` files used to serialize and deserialize the data from the UI
controls. These files are needed to run a LabVIEW InstrumentStudio plug-in.

## `ni_instrumentstudio_plugin_sdk_generator` Package

The `ni_instrumentstudio_plugin_sdk_generator` package contains the libraries
needed to create new InstrumentStudio plug-ins.

### InstrumentStudio Plug-In Template

The `InstrumentStudio Plug-In Template` library contains the VIs and controls
that are required for an InstrumentStudio plug-in.

### InstrumentStudio Plug-In Editor

The `InstrumentStudio Plug-In Editor` library contains the scripting code
required to generate an InstrumentStudio plug-in. It starts with the
`InstrumentStudio Plug-In Template` as the base library and then customizes it
for a specific plug-in.

## Testing

Testing should be done manually before submitting the PR.

## Developer Certificate of Origin (DCO)

   Developer's Certificate of Origin 1.1

   By making a contribution to this project, I certify that:

   (a) The contribution was created in whole or in part by me and I
       have the right to submit it under the open source license
       indicated in the file; or

   (b) The contribution is based upon previous work that, to the best
       of my knowledge, is covered under an appropriate open source
       license and I have the right under that license to submit that
       work with modifications, whether created in whole or in part
       by me, under the same open source license (unless I am
       permitted to submit under a different license), as indicated
       in the file; or

   (c) The contribution was provided directly to me by some other
       person who certified (a), (b) or (c) and I have not modified
       it.

   (d) I understand and agree that this project and the contribution
       are public and that a record of the contribution (including all
       personal information I submit with it, including my sign-off) is
       maintained indefinitely and may be redistributed consistent with
       this project or the open source license(s) involved.

(taken from [developercertificate.org](https://developercertificate.org/))

See [LICENSE](https://github.com/ni/instrumentstudio-plugin-labview/blob/main/LICENSE)
for details about how InstrumentStudio Plug-In for LabVIEW is licensed.
