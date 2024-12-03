# G Plug-In in LabVIEW

- [G Plug-In in LabVIEW](#g-plug-in-in-labview)
  - [Overview](#overview)
  - [Software Requirements](#software-requirements)
  - [Installation](#installation)
  - [Developing a G Plug-In in LabVIEW](#developing-a-g-plug-in-in-labview)
  - [Examples](#examples)
  - [Using the G Plug-In in InstrumentStudio](#using-the-g-plug-in-in-instrumentstudio)
  - [Building and Deploying G Plug-In](#building-and-deploying-g-plug-in)
  - [Note](#note)

---

## Overview

The G Plug-In in LabVIEW allows users to host custom LabVIEW applications directly into the InstrumentStudio environment. This enables users to enhance the functionality of InstrumentStudio by adding custom measurements, controls, and displays tailored to their specific needs. G Plug-In support allows users to interact with LabVIEW applications from InstrumentStudio soft front panel.

---

## Software Requirements

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

Install the [G Plug-in SDK](), followed by the [G Plug-in SDK Generator]().

---

## Developing a G Plug-In in LabVIEW

The G Plug-In SDK generator tool enables users create a G Plug-In template, which serves as a starting point for developing any LabVIEW application as G Plug-In. The steps to create a G Plug-In using the G Plug-In SDK generator tool are as follows:

1. Create and save a new LabVIEW project.
2. From the project window, go to `Tools` → `Plug-In SDKs` → `G Plug-in` → `Create G Plug-in...`
3. In the dialog, enter the `G Plug-in Name` and `G Plug-in Group`, then click `Create G Plug-in`.  
    ![New plug-in dialog](images/Startup.png)
4. This will create a new LabVIEW library and a .gplugindata file.  
    ![Plug-in library files](images/LibraryImage.png)
5. Open the `Main.vi` and add the logic / implement the application.

---

## Examples

The `Examples` directory contains the Game of Life G plug-in example. See the [README.md](../Examples/Game%20of%20Life/README.md) file for more information.

---

## Using the G Plug-In in InstrumentStudio

1. Open the LabVIEW project.
2. The generated plug-in comes with a Packed Project Library (PPL) build specification. Build the PPL.
3. Copy the build output files and place them under `C:\Program Files\National Instruments\InstrumentStudio\Addons\<Plug-in Name>` directory
4. Open InstrumentStudio and click `Manual Layout`. The G Plug-In will be listed under the Add-Ons category.
5. Choose the desired plug-in and create a large panel.  
      ![Manual dialog](images/AddManual.png)

---

## Building and Deploying G Plug-In

1. Create an NI Package or Installer build specification in LabVIEW. Refer to [creating build specification](https://www.ni.com/docs/en-US/bundle/labview/page/building-and-distributing-applications.html) for more information.
2. Add the PPL as the source file.
3. Set the destination directory to `C:\Program Files\National Instruments\InstrumentStudio\Addons\<Plug-in Name>`
4. Build the NI Package or Installer.

---

## Note

- For information about G Plug-In SDK generator tool, please refer to [G Plug-In SDK Generator Guide](docs/G%20Plug-In%20SDK%20Generator%20Guide.md).
- For information about G Plug-In SDK reference, please refer to [G Plug-In SDK Reference](docs/G%20Plug-In%20SDK%20Reference.md).
