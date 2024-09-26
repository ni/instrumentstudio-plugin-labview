# G Plug-In SDK for LabVIEW

- [G Plug-In SDK for LabVIEW](#g-plug-in-sdk-for-labview)
  - [Introduction](#introduction)
  - [Software support](#software-support)
  - [Installation](#installation)
  - [Developing a LabVIEW G Plug-in application](#developing-a-labview-g-plug-in-application)
  - [Migrating existing LabVIEW application into G Plug-in](#migrating-existing-labview-application-into-g-plug-in)
  - [Using the G Plug-ins in InstrumentStudio](#using-the-g-plug-ins-in-instrumentstudio)
  - [Building and Deploying release Plug-in](#building-and-deploying-release-plug-in)

---

## Introduction

The G Plug-In SDK for LabVIEW enables developers to quickly create LabVIEW applications and host them in InstrumentStudio. G Plug-In support allows users to interact with LabVIEW applications from InstrumentStudio.

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

    - This will create a new LabVIEW library and a .gplugindata file.

        ![Plug-in library files](images/LibraryImage.png)

3. Refer to G Plug-in components section in the [G Plug-in guide](https://github.com/ni/g-plugin-labview/releases/download/v1.0.0.1/G_Plug-in_Guide.pdf) for more details on the components
4. Open the `Main.vi` and add the logic/implement the application.


## Migrating existing LabVIEW application into G Plug-in

Unlike a regular LabVIEW application, G Plug-in should be a continuously running application developed using a state machine and should be capable of handling the InstrumentStudio events. For more details on the InstrumentStudio events, refer to [G Plug-in SDK](https://github.com/ni/g-plugin-labview/releases/download/v1.0.0.1/G_Plug-in_SDK_Reference.pdf). Refer to `<LabVIEW>vi.lib\Plug-Ins\Measurement\G Plug-In Template\Main.vi` to gain high-level understanding of how to implement a G Plug-in.

1. From the project window, go to `Tools` → `Plug-In SDKs` → `G Plug-in` → `Migrate Measurement...`.
    - In the dialog, enter the `Project Path`, enter the folder `Select the Measurement VI` and click `Next`
  
      ![Migration dialog](images/MigrationInit.png)

    - Check the LabVIEW VIs which should be migrated and click `Next`

      ![Selection dialog](images/SelectMeasurement.png)

    - Rename the plug-in name and click `Start Migration`

      ![Renaming Plugins](images/RenamingPlugins.png)

    - The status of the migration will be shown. Click `Review plug-ins` to review and verify the migrated plug-ins.

      ![Status](images/Status.png)

    - Review the migrated plug-ins.

      ![Review Page](images/ReviewPage.png)

For the VIs that are flat, and are migrated into G Plug-in, make sure to add state machine and handle the UI events and InstrumentStudio events appropriately.
For the VIs that are implemented using a state machine, ensure to synchronize the new loop added by the G Plug-in migrator.


## Using the G Plug-ins in InstrumentStudio

1.	Open the LabVIEW project
2.	The generated plug-in comes with a Packed Project Library(PPL) build specification. Build the PPL
3.	Copy all the build output files and place them in the `C:\Program Files\National Instruments\InstrumentStudio\Addons\<Plug-in Name>`
4.	Open InstrumentStudio and click Manual Layout. All the G plug-ins are listed under Add-Ons category.
5.	Choose the desired plug-in and create a large panel.

      ![Manual dialog](images/AddManual.png)

---

## Building and Deploying release Plug-in

1.	Create a NI Package or Installer build specification in LabVIEW. Refer this [creating build specification](https://www.ni.com/docs/en-US/bundle/labview/page/building-and-distributing-applications.html) for more info.
2.	Add the PPL as the source file.
3.	Set the destination directory to `C:\Program Files\National Instruments\InstrumentStudio\Addons\<Plug-in Name>`
4.	Build the NI Package or Installer

---

For more information of G Plug-in components refer [G Plugin Guide](https://github.com/ni/g-plugin-labview/releases/download/v2.0.0.2/G_Plugin_Guide.pdf)