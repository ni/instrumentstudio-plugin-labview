# InstrumentStudio Plug-In for LabVIEW

- [InstrumentStudio Plug-In for LabVIEW](#instrumentstudio-plug-in-for-labview)
  - [Introduction](#introduction)
  - [Software support](#software-support)
  - [Installation](#installation)
  - [Developing and deploying a LabVIEW InstrumentStudio plug-in](#developing-and-deploying-a-labview-instrumentstudio-plug-in)
  - [Examples](#examples)
  - [Using a LabVIEW InstrumentStudio plug-in in InstrumentStudio](#using-a-labview-instrumentstudio-plug-in-in-instrumentstudio)
  - [Building package to deploy a LabVIEW InstrumentStudio plug-in](#building-package-to-deploy-a-labview-instrumentstudio-plug-in)
  - [Note](#note)

---

## Introduction

The InstrumentStudio Plug-In SDK for LabVIEW allows users to host LabVIEW
applications directly within the InstrumentStudio environment. This integration
enables users to leverage the functionality of the InstrumentStudio soft front
panel to interact with LabVIEW applications tailored to their specific needs.

---

## Software support

NI Packages Dependency | Version Required
--- | ---
[LabVIEW (64-bit)](https://www.ni.com/en/support/downloads/software-products/download.labview.html#443865) | 2021 SP1 or later
[InstrumentStudio](https://www.ni.com/en/support/downloads/software-products/download.instrumentstudio.html#544066) | 2023 Q4 or later
[JKI VI Package Manager](https://www.ni.com/en/support/downloads/tools-network/download.jki-vi-package-manager.html#443251) | 2021 SP1 or later

VIPM Packages Dependency | Version Required
--- | ---
[JDP Science Common Utilities](https://www.vipm.io/package/jdp_science_lib_common_utilities/) | 1.4.1.18
[JSONtext](https://www.vipm.io/package/jdp_science_jsontext/) | 1.8.2.122

---

## Installation

- Download the `InstrumentStudio Plug-In SDK` and `InstrumentStudio Plug-In SDK
  Generator` packages from the latest release assets.

- Install the `InstrumentStudio Plug-In SDK`, followed by the `InstrumentStudio
  Plug-In SDK Generator`.

---

## Developing and deploying a LabVIEW InstrumentStudio plug-in

Refer to the [InstrumentStudio Plug-In SDK Generator
Guide](./docs/InstrumentStudio%20Plug-In%20SDK%20Generator%20Guide.md) to
develop and deploy an InstrumentStudio Plug-In using the InstrumentStudio Plug-In
generator tool.

---

## Examples

The `examples` directory contains the Game of Life InstrumentStudio plug-in
example. Refer to the [README.md](./examples/Game%20of%20Life/README.md) file
for more information.

---

## Using a LabVIEW InstrumentStudio plug-in in InstrumentStudio

1. Open InstrumentStudio and click `Manual Layout`.
2. The InstrumentStudio plug-in will be listed under the Add-Ons category within
   the group specified in the `.gplugindata` file.
3. Choose the desired plug-in and create a large panel.

    ![Edit Layout](./docs/images/InstrumentStudio%20Edit%20Layout.png)
4. The layout will be populated with the plug-in UI as shown below.

    ![Plug-In SFP](./docs/images/InstrumentStudio%20Plug-In%20Soft%20Panel.png)
5. Modify the inputs in the UI to interact with the application.

---

## Building package to deploy a LabVIEW InstrumentStudio plug-in

1. Create an NI Package or Installer build specification in LabVIEW. Refer to
   [creating build
   specification](https://www.ni.com/docs/en-US/bundle/labview/page/building-and-distributing-applications.html)
   for more information.
2. Add the `PPL` build output files for the plug-in as the source files.
3. Set the destination directory to `C:\Program Files\National
   Instruments\InstrumentStudio\Addons\<Plug-in Name>`
4. Build and install the NI Package or Installer.

---

## Note

- For information about InstrumentStudio Plug-In SDK Generator, please refer to
  the [InstrumentStudio Plug-In SDK Generator
  Guide](./docs/InstrumentStudio%20Plug-In%20SDK%20Generator%20Guide.md).
- For information about InstrumentStudio Plug-In SDK APIs, please refer to the
  [InstrumentStudio Plug-In SDK
  Reference](./docs/InstrumentStudio%20Plug-In%20SDK%20Reference.md).
