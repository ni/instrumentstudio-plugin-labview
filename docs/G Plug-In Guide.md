# G Plug-In SDK for LabVIEW

- [G Plug-In SDK for LabVIEW](#g-plug-in-sdk-for-labview)
  - [Overview](#overview)
  - [Software Requirements](#software-requirements)
  - [Installation](#installation)
  - [Developing a LabVIEW Plug-In](#developing-a-labview-plug-in)
  - [Using the LabVIEW Plug-In in InstrumentStudio](#using-the-labview-plug-in-in-instrumentstudio)
  - [Recommended PPL build settings](#recommended-ppl-build-settings)
  - [Building and Deploying Release Plug-in](#building-and-deploying-release-plug-in)
  - [G Plug-In Components](#g-plug-in-components)
    - [Plug-in Format for new measurement](#plug-in-format-for-new-measurement)
    - [G Plug-In Data File](#g-plug-in-data-file)
    - [Saving the Soft Panel Data](#saving-the-soft-panel-data)
    - [Updating the run status](#updating-the-run-status)
  - [Troubleshooting](#troubleshooting)

## Overview

The G Plug-In SDK for LabVIEW allows users to host custom LabVIEW applications directly into the InstrumentStudio environment. This enables users to enhance the functionality of InstrumentStudio by adding custom measurements, controls, and displays tailored to their specific needs. G Plug-In support allows users to interact with LabVIEW applications from InstrumentStudio soft panel.

Related Information:

- [InstrumentStudio](https://www.ni.com/docs/en-US/bundle/instrumentstudio/page/user-manual-welcome.html)

## Software Requirements

NI Packages Dependency | Version Required
--- | ---
LabVIEW | 2021 SP1or later (64-bit)
InstrumentStudio | 2023 Q4 or later
JKI VI Package Manager | 2021 SP1 or later

VIPM Packages Dependency | Version Required  
--- | ---
JDP Science Common Utilities | 1.4.1.18
JSONtext | 1.8.2.122

## Installation

1. Install the supported version of [LabVIEW](https://www.ni.com/en/support/downloads/software-products/download.labview.html#443865), [InstrumentStudio](https://www.ni.com/en/support/downloads/software-products/download.instrumentstudio.html#544066) and [VI Package Manager](https://www.ni.com/en/support/downloads/tools-network/download.jki-vi-package-manager.html#443251).

2. Install the G Plug-In SDK, followed by the G Plug-In SDK Generator.

## Developing a LabVIEW Plug-In

1. Create and save a new LabVIEW project.

2. From the project window, go to Tools -> Plug-In SDKs -> G Plug-in -> Create G Plug-in.

3. In the dialog, enter the following details, G Plug-in Name and G Plug-in Group, then click Create G Plug-in.

    ![Create G Plug-In](<Images/G Plug-In Guide/Create G Plug-In.png>)

4. The above details will be used while adding the plug-in in InstrumentStudio.

5. This will create a new plug-in library and .gplugindata file.

    ![G Plug-In Project](<Images/G Plug-In Guide/G Plug-In Project.png>)

6. Check [G plug-in Components](#g-plug-in-components) for more details on the components.

7. Edit the Main.vi and implement the measurement logic in the block diagram.

## Using the LabVIEW Plug-In in InstrumentStudio

1. Open the G Plug-In project.

2. The generated plug-in comes with a Packed Project Library(PPL) build specification. Build the PPL.

3. Copy all the build output files and place the files in the `C:\Program Files\National Instruments\InstrumentStudio\Addons\<PluginName>`

4. Open InstrumentStudio and click Manual Layout.

5. Choose the desired plug-in under Add-Ons and create a large panel.

    ![InstrumentStudio Edit Layout](<Images/G Plug-In Guide/InstrumentStudio Edit Layout.png>)

6. The layout will be populated with the measurement UI

    ![InstrumentStudio G Plug-In Soft Panel](<Images/G Plug-In Guide/InstrumentStudio G Plug-In Soft Panel.png>)

## Recommended PPL build settings

When setting up a packed library build specification, pay particular attention to the following settings:

- Allow future versions of LabVIEW to load this packed library – This option should always be enabled. InstrumentStudio only supports loading of plugins using a single version of the LabVIEW Runtime Engine. If this option is not checked, the plugin will fail to load if InstrumentStudio uses a different version of the runtime engine than the version the plugin was built against. If multiple versions of the LabVIEW Runtime Engine are installed on the machine, InstrumentStudio will use the newest version.

  ![PPL Setting - Allow Future Versions](<Images/G Plug-In Guide/PPL Setting - Allow Future Versions.png>)

- Exclude dependent packed libraries – This option should typically be disabled. If this option is enabled, then any packed libraries used by the plugin will not be copied into the build output and will need to be distributed through some other mechanism.

- Exclude dependent shared libraries – This setting will be plugin dependent. If the plugin calls into any shared library other than `NationalInstruments.VIHost.Interop.dll`, then this option is typically disabled unless those libraries are system libraries that will be distributed through some other mechanism such as the installation of a driver.  

  ![PPL Setting - Uncheck Excludes](<Images/G Plug-In Guide/PPL Setting - Uncheck Excludes.png>)

- Apply prefix to all contained items – Apply prefix to the library name during the build if the shared library is private to the plugin and not in a system path, to avoid conflicts when installed by multiple plugins.

  - Adding a unique prefix to the library prevents name collisions when loaded into memory and ensures the plugin uses the exact version it was built against rather than another version installed by a different plugin.

  ![PPL Setting - Apply Prefix](<Images/G Plug-In Guide/PPL Setting - Apply Prefix.png>)

## Building and Deploying Release Plug-in

1. Create a NI Package or Installer build specification in LabVIEW. Refer this [link](https://www.ni.com/docs/en-US/bundle/labview/page/building-and-distributing-applications.html) for creating build specification.

2. Add the PPL as the source file

3. Set the destination directory to `C:\Program Files\National Instruments\InstrumentStudio\Addons\<Plug-inName>`

4. Build the NI Package or Installer

## G Plug-In Components

### Plug-in Format for new measurement

1. The Plug-in consists of LabVIEW library and VIs, controls and a .gplugindata file

    ![G Plug-In Project](<Images/G Plug-In Guide/G Plug-In Project.png>)

2. The main VI consists of few controls.  

    ![Main VI](<Images/G Plug-In Guide/Main VI.png>)

3. Other than the controls mentioned above, there is an additional "Session Id" control, which is a U64 control, hidden in the front panel. It is necessary for communication with InstrumentStudio. The control is hidden since it is not meaningful for the users. If the control is not present, InstrumentStudio will fail to load the plug-in.

4. Block diagram is implemented in the producer-consumer architecture. In the image below, the above while loop is responsible for handling events from the InstrumentStudio. The loop below is based on the Queue based state machine, in which the measurement logic can be added.

    ![Block Diagram](<Images/G Plug-In Guide/Block Diagram.png>)

5. To be notified of events from InstrumentStudio, the plug-in must specifically register for each event using the Register For Events vi and create the appropriate cases within an event structure. Refer to the [G Plug-In SDK Reference](<G Plug-In SDK Reference.md>) for more details.

    ![Event Handling](<Images/G Plug-In Guide/Event Handling.png>)

6. Along with the InstrumentStudio events, a stop event is registered to synchronize the two loops.

### G Plug-In Data File

In order to register a plug-in, put a .gplugindata into the Addons directory under the InstrumentStudio installation directory. The .gplugindata file is an XML file that tells InstrumentStudio the properties of the plug-in and how to find the code that implements it.

The .gplugindata file is an XML file. The easiest way to understand it is to look at an example.

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

- The `GPluginMetadata` element is the root element containing all of the data to be registered with InstrumentStudio. You must specify the namespace for the schema as shown in the example above.

- The `Plugins` element contains the list of plugins

- Each `PluginData` element registers a single plug-in and lists its properties. Attributes of the plug-in are expressed as attributes of the `PluginData` element. The attributes recognized are:

  - UniqueName (required) - Use a globally unique identifier (GUID) or similar, including the company name, to ensure the plugin's unique identification across all registered plugins.

  - DisplayName (required) - a name that will be displayed to the user for the plug-in in all places in InstrumentStudio.

  - SupportedPanelSizes (required) - set this to "Large", "Small", or "LargeAndSmall" to indicate which size layouts this plug-in supports.

      ![Panel Size](<Images/G Plug-In Guide/Panel Size.png>)

  - GroupName - The name of a group which will appear in the Edit Layout dialog. All plugins with this group name will be shown together in the dialog.

  - PanelType - A string to categorize this plug-in. It can be used to filter plugins (show only plugins of this type) in the Edit Layout dialog.

  - VIPath (required) - Specify the top-level VI (Main.vi) path for the plugin. If relative, it's relative to the gplugindata file's location or the folder above culture-specific folders if applicable.

  - ProjectPath (required if ApplicationContext is set to "Project") - Specify the LabVIEW project path for loading the top-level VI when ApplicationContext is "Project". If relative, it's relative to the gplugindata file's location or the folder above culture-specific folders.

  - DebuggingEnabled (defaults to false) - Set this to true to make the application context of the plug-in visible to LabVIEW as a debuggable context.

  - ReentrantExecutionEnabled (defaults to true) - Set this to false to improve debugging in LabVIEW 2020 and earlier, addressing reentrant VI issues that may be fixed in future versions.

    - The first issue is that there is no way to get at the reentrant VI from the debug session after it starts running. This generally means you have to save a breakpoint in the source VI before the clone is created and starts running.

    - However, the saved breakpoint in the clone also isn't being honored and the clone never breaks.

    - Similarly, if you set a breakpoint in a non-reentrant VI called by the clone and then try to step out/up into the reentrant VI, it just steps over and effectively does a resume running command.

  - ApplicationContext (required) - This is an enum value that can be either "Project", "Global", or "Unique"

    - Project - This allows you to share state between multiple plug-ins, or multiple instances of a plug-in implemented within the same lvproj. If you use this option, you also need to specify the ProjectPath attribute.

    - Global - This allows you to share state between plugins globally, but there is a greater risk of conflict with plugins from other developers.

    - Unique - A unique context will be created for each instance of the plug-in. This avoids the risk of the state of your VI conflicting with other plugins or instance of your plug-in, but it also makes sharing data between plugins and plug-in instances more difficult.

### Saving the Soft Panel Data

G Plug-In can save and reload the UI controls data. The data can be saved in the InstrumentStudio object. The following steps should be followed to save and retrieve the data,

1. Whenever a soft panel/project is saved in InstrumentStudio, InstrumentStudio triggers a project saved event, enqueue the state that will save the UI control data in the object of the InstrumentStudio.

2. The object can only save the data in string type, all the UI controls that must be saved should be flattened to string and saved in the ‘Edit Time Configuration’ property.

    ![Save Data in Edit Time Configuration](<Images/G Plug-In Guide/Save Data in Edit Time Configuration.png>)

3. Loading the data back (unflattening from string) to the UI should be handled in the Initialize State.

    ![Load saved data from Edit Time Configuration](<Images/G Plug-In Guide/Load saved data from Edit Time Configuration.png>)

### Updating the run status

Set the following property to True to update the running status in the InstrumentStudio.

  ![Update Running State](<Images/G Plug-In Guide/Update Running State.png>)

  ![InstrumentStudio Soft Panel State](<Images/G Plug-In Guide/InstrumentStudio Soft Panel State.png>)

## Troubleshooting

If the plug-in doesn't appear in the Edit Layout dialog, ensure the .gplugindata file is under the Addons directory of InstrumentStudio. If there is an error reading this file, InstrumentStudio will display a message box with details about the error.
