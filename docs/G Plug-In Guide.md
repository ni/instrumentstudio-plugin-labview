# G Plug-In SDK for LabVIEW

- [G Plug-In SDK for LabVIEW](#g-plug-in-sdk-for-labview)
  - [Overview](#overview)
  - [Software Requirements](#software-requirements)
  - [Installation](#installation)
  - [Developing a LabVIEW Plug-In](#developing-a-g-plug-in)
  - [Using the G Plug-In in InstrumentStudio](#using-the-g-plug-in-in-instrumentstudio)
  - [Recommended PPL build settings](#recommended-ppl-build-settings)
  - [Package a G Plug-in](#package-a-g-plug-in)
  - [G Plug-In Components](#g-plug-in-components)
    - [Plug-in format for newly created G Plug-In](#plug-in-format-for-newly-created-g-plug-in)
    - [G Plug-In Data File](#g-plug-in-data-file)
      - [G Plug-In Data Elements](#g-plug-in-data-elements)
    - [Saving the Soft Panel Data](#saving-the-soft-panel-data)
    - [Updating the run status](#updating-the-run-status)
  - [Troubleshooting](#troubleshooting)

## Overview

The G Plug-In SDK for LabVIEW allows users to integrate custom LabVIEW applications into InstrumentStudio. This integration enhances InstrumentStudio's functionality by enabling the addition of highly interactive measurements, controls, and displays that are tailored to their specific requirements. With G Plug-In support, users can interact with LabVIEW applications directly from the InstrumentStudio soft panel, providing a unified and efficient workflow.

Related Information:

- [InstrumentStudio](https://www.ni.com/docs/en-US/bundle/instrumentstudio/page/user-manual-welcome.html)

## Software Requirements

NI Packages Dependency | Version Required
--- | ---
[LabVIEW (64-bit)](https://www.ni.com/en/support/downloads/software-products/download.labview.html#443865), [InstrumentStudio](https://www.ni.com/en/support/downloads/software-products/download.instrumentstudio.html#544066) | 2021 SP1 or later
[InstrumentStudio](https://www.ni.com/en/support/downloads/software-products/download.instrumentstudio.html#544066) | 2023 Q4 or later
[JKI VI Package Manager](https://www.ni.com/en/support/downloads/tools-network/download.jki-vi-package-manager.html#443251) | 2021 SP1 or later

VIPM Packages Dependency | Version Required  
--- | ---
JDP Science Common Utilities | 1.4.1.18
JSONtext | 1.8.2.122

## Installation

1. Install the supported versions of software given in [Software Requirements](#software-requirements)
2. Install the G Plug-In SDK, followed by the G Plug-In SDK Generator.

## Developing a G Plug-In

1. Create and save a new LabVIEW project.
2. From the project window, go to `Tools` → `Plug-In SDKs` → `G Plug-in` → `Create G Plug-in`
3. In the dialog, enter the following details, G Plug-in Name and G Plug-in Group, then click Create G Plug-in.  
    ![Create G Plug-In](./images/G%20Plug-In%20Guide/Create%20G%20Plug-In.png)

4. The above details will be used while adding the plug-in in InstrumentStudio.
5. This will create a new plug-in library and .gplugindata file.  
    ![G Plug-In Project](./images/G%20Plug-In%20Guide/G%20Plug-In%20Project.png)

6. Check [G plug-in Components](#g-plug-in-components) for more details on the components.
7. Edit the Main.vi and implement the logic in the block diagram.

## Using the G Plug-In in InstrumentStudio

1. Open the G Plug-In project.
2. The generated plug-in comes with a Packed Project Library (PPL) build specification. Build the PPL.
3. Copy the Packed Project Library (.ppl) and the `.gplugindata` file, then place them in the following directory: `C:\Program Files\National Instruments\InstrumentStudio\Addons\<PluginName>`
4. Open InstrumentStudio and click Manual Layout.
5. Choose the desired plug-in under Add-Ons and create a large panel.  
    ![InstrumentStudio Edit Layout](./images/G%20Plug-In%20Guide/InstrumentStudio%20Edit%20Layout.png)

6. The plug-in UI will be displayed as an SFP in InstrumentStudio.  
    ![InstrumentStudio G Plug-In Soft Panel](./images/G%20Plug-In%20Guide/InstrumentStudio%20G%20Plug-In%20Soft%20Panel.png)

## Recommended PPL build settings

When setting up a packed library build specification, ensure the following settings are configured appropriately:

- Allow future versions of LabVIEW to load this Packed Library:
  - This option should always be enabled. InstrumentStudio supports plugin loading using only a single version of the LabVIEW Runtime Engine. If this option is not selected, the plugin will fail to load when InstrumentStudio utilizes a different runtime engine version than the one against which the plugin was built. If multiple versions of the LabVIEW Runtime Engine are installed on the system, InstrumentStudio will use the latest version.  
  ![PPL Setting - Allow Future Versions](./images/G%20Plug-In%20Guide/PPL%20Setting%20-%20Allow%20Future%20Versions.png)

- Exclude dependent Packed libraries:
  - This option should generally be disabled. When enabled, any packed libraries used by the plugin will not be included in the build output, requiring distribution through alternative mechanisms.
- Exclude dependent Shared libraries:
  - This setting depends on the plugin’s requirements. If the plugin interacts with shared libraries other than `NationalInstruments.VIHost.Interop.dll`, this option is typically disabled unless the shared libraries are system-provided and distributed separately, such as through driver installation.  
  ![PPL Setting - Uncheck Excludes](./images/G%20Plug-In%20Guide/PPL%20Setting%20-%20Uncheck%20Excludes.png)

- Apply a prefix to all contained items:
  - Enable this option to apply a prefix to the library name during the build process if the shared library is private to the plugin and not located in a system path. This helps avoid conflicts when the library is installed by multiple plugins.
  - Adding a unique prefix prevents name collisions when the library is loaded into memory. It also ensures the plugin uses the specific version it was built against, rather than another version installed by a different plugin.  
  ![PPL Setting - Apply Prefix](./images/G%20Plug-In%20Guide/PPL%20Setting%20-%20Apply%20Prefix.png)

## Package a G Plug-in

1. Create a NI Package or Installer build specification in LabVIEW. Refer this [link](https://www.ni.com/docs/en-US/bundle/labview/page/building-and-distributing-applications.html) for creating build specification.
2. Add the PPL as the source file
3. Set the destination directory to `C:\Program Files\National Instruments\InstrumentStudio\Addons\<Plug-inName>`
4. Build the NI Package or Installer

## G Plug-In Components

### Plug-in format for newly created G Plug-In

1. The Plug-in comprises a LabVIEW library, VIs, controls and a `.gplugindata` file.  
    ![G Plug-In Project](./images/G%20Plug-In%20Guide/G%20Plug-In%20Project.png)

2. The main VI contains a few controls.  
    ![Main VI](./images/G%20Plug-In%20Guide/Main%20VI.png)

3. In addition to the controls mentioned above, there is a hidden "Session Id" control on the front panel. This control, of type U64, is essential for communication with InstrumentStudio. It is hidden because it does not hold any meaningful value for the end user. If the "Session Id" control is absent, InstrumentStudio will fail to load the plugin.
4. The block diagram is implemented using the producer-consumer architecture. In the image below,
    - The upper while loop is responsible for handling events from InstrumentStudio.
    - The lower loop uses a queue-based state machine, which provides a framework for adding custom logic.  
    ![Block Diagram](./images/G%20Plug-In%20Guide/Block%20Diagram.png)

5. To receive event notifications from InstrumentStudio, the plugin must explicitly register for each event using the `Register For Events.vi` and implement the corresponding cases within an event structure. Refer to the [G Plug-In SDK Reference](<G Plug-In SDK Reference.md>) for more details.  
    ![Event Handling](./images/G%20Plug-In%20Guide/Event%20Handling.png)

6. Along with these InstrumentStudio events, a Stop Event is registered to ensure synchronization between the two loops.

### G Plug-In Data File

To register a plug-in, place the `.gplugindata` file in the "Addons" directory under the InstrumentStudio installation directory. This XML file defines the plugin’s properties and provides the necessary information for InstrumentStudio to locate the corresponding implementation code.

The .gplugindata file is an XML file. An example is presented below, explaining its structure.

```xml
<?xml version="1.0"?>
<GPluginMetadata xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.ni.com/InstrumentStudio/GPluginMetadata">
  <Plugins>
    <PluginData 
      UniqueName="MyPlugin"
      DisplayName="MyPlugin"
      PanelType="MyPlugin"
      GroupName="MyCategory"
      VIPath="MyPlugin.lvlibp\Main.vi"
      DebuggingEnabled="false"
      ReentrantExecutionEnabled="false"
      SupportedPanelSizes="LargeAndSmall"
      ApplicationContext="Unique" />
  </Plugins>
</GPluginMetadata>
```

#### G Plug-In Data Elements

- The `GPluginMetadata` element is the root element containing all of the data to be registered with InstrumentStudio. You must specify the namespace for the schema as shown in the example above.
- The `Plugins` element contains the list of plugins
- Each `PluginData` element registers a single plug-in and lists its properties. Attributes of the plug-in are expressed as attributes of the `PluginData` element. The attributes recognized are:
  - **UniqueName** (required) - Use a globally unique identifier (GUID) or similar, including the company name, to ensure the plugin's unique identification across all registered plugins.
  - **DisplayName** (required) - a name that will be displayed to the user for the plug-in in all places in InstrumentStudio.
  - **SupportedPanelSizes** (required) - set this to "Large", "Small", or "LargeAndSmall" to indicate which size layouts this plug-in supports.  
      ![Panel Size](./images/G%20Plug-In%20Guide/Panel%20Size.png)

  - **GroupName** - The name of a group which will appear in the Edit Layout dialog. All plugins with this group name will be shown together in the dialog.
  - **PanelType** - A string to categorize this plug-in. It can be used to filter plugins (show only plugins of this type) in the Edit Layout dialog.
  - **VIPath** (required) - Specify the top-level VI (Main.vi) path for the plugin. If relative, it's relative to the gplugindata file's location or the folder above culture-specific folders if applicable.
  - **ProjectPath** (required if ApplicationContext is set to "Project") - Specify the LabVIEW project path for loading the top-level VI when ApplicationContext is "Project". If relative, it's relative to the gplugindata file's location or the folder above culture-specific folders.
  - **DebuggingEnabled** (defaults to false) - Set this to true to make the application context of the plug-in visible to LabVIEW as a debuggable context.
  - **ReentrantExecutionEnabled** (defaults to true) - Set this to false to improve debugging in LabVIEW 2020 and earlier, addressing reentrant VI issues that may be fixed in future versions.
    - The first issue is that there is no way to get at the reentrant VI from the debug session after it starts running. This generally means you have to save a breakpoint in the source VI before the clone is created and starts running.
    - However, the saved breakpoint in the clone also isn't being honored and the clone never breaks.
    - Similarly, if you set a breakpoint in a non-reentrant VI called by the clone and then try to step out/up into the reentrant VI, it just steps over and effectively does a resume running command.
  - **ApplicationContext** (required) - This is an enum value that can be either "Project", "Global", or "Unique"
    - Project - This allows you to share state between multiple plug-ins, or multiple instances of a plug-in implemented within the same lvproj. If you use this option, you also need to specify the ProjectPath attribute.
    - Global - This allows you to share state between plugins globally, but there is a greater risk of conflict with plugins from other developers.
    - Unique - A unique context will be created for each instance of the plug-in. This avoids the risk of the state of your VI conflicting with other plugins or instance of your plug-in, but it also makes sharing data between plugins and plug-in instances more difficult.

### Saving the Soft Panel Data

G Plug-In can save and reload the UI controls data. The data can be saved in the InstrumentStudio object. The following steps should be followed to save and retrieve the data,

1. Whenever a soft panel/project is saved in InstrumentStudio, InstrumentStudio triggers a project saved event, enqueue the state that will save the UI control data in the object of the InstrumentStudio.
2. The object can only save the data in string type, all the UI controls that must be saved should be flattened to string and saved in the ‘Edit Time Configuration’ property.  
    ![Save Data in Edit Time Configuration](./images/G%20Plug-In%20Guide/Save%20Data%20in%20Edit%20Time%20Configuration.png)

3. Loading the data back (unflattening from string) to the UI should be handled in the Initialize State.  
    ![Load saved data from Edit Time Configuration](./images/G%20Plug-In%20Guide/Load%20saved%20data%20from%20Edit%20Time%20Configuration.png)

### Updating the run status

Set the following property to True to update the running status in the InstrumentStudio.  
  ![Update Running State](./images/G%20Plug-In%20Guide/Update%20Running%20State.png)  
  ![InstrumentStudio Soft Panel State](./images/G%20Plug-In%20Guide/InstrumentStudio%20Soft%20Panel%20State.png)

## Troubleshooting

If the plug-in doesn't appear in the Edit Layout dialog, ensure the .gplugindata file is under the Addons directory of InstrumentStudio. If there is an error reading this file, InstrumentStudio will display a message box with details about the error.
