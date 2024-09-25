# G Plug-In SDK for LabVIEW

- [G Plug-In SDK for LabVIEW](#g-plug-in-sdk-for-labview)
  - [Introduction](#introduction)
  - [Software support](#software-support)
  - [Installation](#installation)
  - [Developing a LabVIEW G Plug-in application](#developing-a-labview-g-plug-in-application)
  - [Migrating existing labview application into G Plug-in](#migrating-existing-labview-application-into-g-plug-in)
  - [Using the labview application in InstrumentStudio](#using-the-labview-application-in-instrumentstudio)
  - [Building and Deploying release Plug-in](#building-and-deploying-release-plug-in)

---

## Introduction

The G Plug-In SDK for LabVIEW packages enable developers to quickly create LabVIEW applications and host them in InstrumentStudio. G Plug-In support allows users to interact with labview applications from InstrumentStudio.

---

## Software support

- InstrumentStudio 2024 Q3 or later
- LabVIEW 2021 SP1 or later
  - JKI VI Package Manager 2021 SP1 or later

---

## Installation

1. Install a supported version of
   [InstrumentStudio](https://www.ni.com/en/support/downloads/software-products/download.instrumentstudio.html#494650)
2. Install a supported version of
   [LabVIEW](https://www.ni.com/en/support/downloads/software-products/download.labview.html#487445)
3. Install the [G Plug-in SDK](https://github.com/ni/g-plugin-labview/releases/download/v2.0.0.2/ni_lib_g_plugin_sdk-2.0.0.2.vip), followed by the [G Plug-in SDK Generator](https://github.com/ni/g-plugin-labview/releases/download/v2.0.0.2/ni_lib_g_plug_in_sdk_generator-2.0.0.2.vip)

---

## Developing a LabVIEW G Plug-in application

1. Create and save a new LabVIEW project.

2. From the project window, go to `Tools` → `Plug-In SDKs` → `G Plug-in` → `Create G Plug-in...`.
    - In the dialog, enter the `G Plug-in Name` and `G Plug-in Group`, then click `Create G Plug-in`.

        ![New plug-in dialog](images/Startup.png)

    - This will create a new labview library and a packed project library for the library created.

        ![Plug-in library files](images/LibraryImage.png)

3. Check G plug-in components in the [G Plug-in guide](https://github.com/ni/g-plugin-labview/releases/download/v1.0.0.1/G_Plug-in_Guide.pdf) for more details on the components
4. Open the `Main.vi` and add the logic/implement the application.


## Migrating existing labview application into G Plug-in

Unlike the regular LabVIEW application, G Plug-in should be a continuosly running application that is developed using state machine and should be capable of handling the events from the InstrumentStudio. For more details on the events to be handled refer [G Plug-in SDK](https://github.com/ni/g-plugin-labview/releases/download/v1.0.0.1/G_Plug-in_SDK_Reference.pdf). Refer `<labiew>vi.lib\Plug-Ins\Measurement\G Plug-In Template` to get the high level understanding of how a g plug-in can be implemented. 

1. From the project window, go to `Tools` → `Plug-In SDKs` → `G Plug-in` → `Migrate Measurement...`.
    - In the dialog, enter the `Project Path`, enter the folder `Select the Measurement VI` and click `Next`
  
      ![Migration dialog](images/MigrationInit.png)

    - Check the labview VIs which should be migrated and click `Next`

      ![Selection dialog](images/SelectMeasurement.png)

    - Rename the plug-in name and click `Start Migration`

      ![RenamingPlugins](images/RenamingPlugins.png)

    - The status of the migration will be shown. Click `Review plug-ins` to review and verify the migrated applications

      ![Status](images/Status.png)

    - Review the migrated plug-ins

      ![Review Page](images/ReviewPage.png)

For the VIs that are flat, and are migrated into G plug-in, make sure to add state machine and handle the UI events and InsrumentStudio events appropraitely.
For the VIs that are implemented using the state machine, ensure to synchonize the new loop added using the migrator


## Using the labview application in InstrumentStudio

1.	Open the labview project
2.	The generated plug-in comes with a Packed Project Library(PPL) build specification. Build the PPL
3.	Copy all the build output files and place the files in the C:\Program Files\National Instruments\InstrumentStudio\Addons\<PluginName>
4.	Open InstrumentStudio and click Manual Layout.
5.	Choose the desired plug-in and create a large panel.

      ![Manual dialog](images/AddManual.png)

---

## Building and Deploying release Plug-in

1.	Create a NI Package or Installer build specification in LabVIEW. Refer this [creating build specification](https://www.ni.com/docs/en-US/bundle/labview/page/building-and-distributing-applications.html) for more info.
2.	Add the PPL as the source file.
3.	Set the destination directory to `C:\Program Files\National Instruments\InstrumentStudio\Addons\<Plug-inName>`
4.	Build the NI Package or Installer

---

For more information of G Plug-in components refer [G Plugin Guide](https://github.com/ni/g-plugin-labview/releases/download/v2.0.0.2/G_Plugin_Guide.pdf)