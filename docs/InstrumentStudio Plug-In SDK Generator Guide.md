# InstrumentStudio Plug-In SDK Generator for LabVIEW

- [InstrumentStudio Plug-In SDK Generator for LabVIEW](#instrumentstudio-plug-in-sdk-generator-for-labview)
  - [Introduction](#introduction)
  - [Workflow](#workflow)
  - [Developing a LabVIEW InstrumentStudio Plug-In](#developing-a-labview-instrumentstudio-plug-in)
  - [Deploying a LabVIEW InstrumentStudio plug-in](#deploying-a-labview-instrumentstudio-plug-in)
    - [Recommended PPL build settings](#recommended-ppl-build-settings)
  - [InstrumentStudio Plug-In Components](#instrumentstudio-plug-in-components)
    - [InstrumentStudio Plug-In Data File](#instrumentstudio-plug-in-data-file)
      - [.gplugindata format](#gplugindata-format)
  - [Saving the InstrumentStudio Plug-In Soft Panel Data](#saving-the-instrumentstudio-plug-in-soft-panel-data)
  - [Updating the status of InstrumentStudio Plug-In](#updating-the-status-of-instrumentstudio-plug-in)
  - [Troubleshooting](#troubleshooting)

---

## Introduction

The InstrumentStudio Plug-In SDK generator tool allows users to create new
plug-ins from a template by specifying a desired name and group. This tool
provides a convenient starting point for developing any LabVIEW application as
an InstrumentStudio plug-in.

---

## Workflow

![User Workflow](./images/InstrumentStudio%20Plug-In%20Guide/Workflow.png)

---

## Developing a LabVIEW InstrumentStudio Plug-In

1. Create and save a new LabVIEW project.
2. From the project window, go to `Tools` → `Plug-In SDKs` → `InstrumentStudio
   Plug-In` → `Create InstrumentStudio Plug-in...`.
   - In the dialog, enter the `InstrumentStudio Plug-in Name` and
       `InstrumentStudio Plug-in Group`, then click `Create InstrumentStudio
       Plug-in`.

      ![Create InstrumentStudio
      Plug-In](./images/InstrumentStudio%20Plug-In%20Guide/Create%20InstrumentStudio%20Plug-In.png)

   - This will create a new InstrumentStudio plug-in library and a `.gplugindata` file.

      ![InstrumentStudio Plug-In
      Library](./images/InstrumentStudio%20Plug-In%20Guide/InstrumentStudio%20Plug-In%20Library.png)

3. Add your logic/implementation to the `Main.vi`. By default, the VI takes the
   control inputs and stores the values in the InstrumentStudio object.

   ![Main VI Block
   diagram](./images/InstrumentStudio%20Plug-In%20Guide/Main%20VI%20Block%20diagram.png)

Note: Refer to [InstrumentStudio Plug-In
components](#instrumentstudio-plug-in-components) for more details on the
plug-in components.

---

## Deploying a LabVIEW InstrumentStudio plug-in

1. Open the LabVIEW project which contains the instrumentstudio plug-in.
2. The generated plug-in comes with a Packed Project
Library (PPL) build specification.
3. Build the PPL.
4. Copy the build output files and place them under `C:\Program Files\National
Instruments\InstrumentStudio\Addons\<Plug-in Name> directory`.

### Recommended PPL build settings

When setting up a packed library build specification, ensure the following settings are configured appropriately:

- **Allow future versions of LabVIEW to load this Packed Library**
  - This option should always be enabled.  InstrumentStudio only supports
    loading of plug-ins using a single version of the LabVIEW Runtime Engine.
    If this option is not checked, the plug-in will fail to load if
    InstrumentStudio uses a different version of the runtime engine than the
    version the plug-in was built against.  If multiple versions of the LabVIEW
    Runtime Engine are installed on the machine, InstrumentStudio will use the
    newest version.

    ![PPL Setting - Allow Future
    Versions](./images/InstrumentStudio%20Plug-In%20Guide/PPL%20Setting%20-%20Allow%20Future%20Versions.png)

- **Exclude dependent Packed libraries**
  - This option should typically be disabled.  If this option is enabled, then
    any packed libraries used by the plug-in will not be copied into the build
    output and will need to be distributed through some other mechanism.
- **Exclude dependent Shared libraries**
  - This setting will be plug-in dependent.  If the plug-in calls into any
    shared library other than `NationalInstruments.VIHost.Interop.dll`, then this
    option is typically disabled unless those libraries are system libraries
    that will be distributed through some other mechanism such as the
    installation of a driver.  

    ![PPL Setting - Uncheck
    Excludes](./images/InstrumentStudio%20Plug-In%20Guide/PPL%20Setting%20-%20Uncheck%20Excludes.png)

- **Apply a prefix to all contained items**
  - If including dependent shared libraries and the shared library is private to
    the plug-in and not part of a system path, you may also want to add a prefix
    to the library name as part of the build if it can be installed by multiple
    plug-ins to different locations on disk.  
  - Adding a unique prefix to the library prevents name collisions when loaded
    into memory and ensures the plug-in uses the exact version it was built
    against rather than another version installed by a different plug-in.
  
    ![PPL Setting - Apply
    Prefix](./images/InstrumentStudio%20Plug-In%20Guide/PPL%20Setting%20-%20Apply%20Prefix.png)

---

## InstrumentStudio Plug-In Components

The components of a LabVIEW InstrumentStudio plug-in are shown below.

![InstrumentStudio Plug-In
Components](./images/InstrumentStudio%20Plug-In%20Guide/InstrumentStudio%20Plug-In%20Components.png)

1. The InstrumentStudio plug-in consists of a LabVIEW library, VIs, controls and
   a `.gplugindata` file.  

    ![InstrumentStudio
    Plug-in](./images/InstrumentStudio%20Plug-In%20Guide/InstrumentStudio%20Plug-In%20Library.png)

2. The main VI contains three controls as shown.  

    ![Main VI](./images/InstrumentStudio%20Plug-In%20Guide/Main%20VI.png)

3. In addition to the previously mentioned controls, there is a hidden "Session
   Id" control on the front panel. This U64 type control is crucial for
   communication with InstrumentStudio. It remains hidden as it doesn't provide
   any meaningful value to the end user. Without the "Session Id" control,
   InstrumentStudio will fail to load the plug-in.

4. The block diagram is implemented using the producer-consumer architecture. In
   the image below,
    - The upper while loop is responsible for handling events from
      InstrumentStudio.
    - The lower loop uses a queue-based state machine, which provides a
      framework for adding custom logic.

    ![Block
    Diagram](./images/InstrumentStudio%20Plug-In%20Guide/Main%20VI%20Block%20diagram.png)

5. To receive event notifications from InstrumentStudio, the plug-in must
   explicitly register for each event using the `Register For Events.vi` and
   implement the corresponding cases within an event structure. Refer to the
   [InstrumentStudio Plug-In SDK
   Reference](InstrumentStudio%20Plug-In%20SDK%20Reference.md) for more details.

    ![Event
    Handling](./images/InstrumentStudio%20Plug-In%20Guide/Event%20Handling.png)

6. Along with these InstrumentStudio events, a Stop Event is registered to
   ensure synchronization between the two loops.

### InstrumentStudio Plug-In Data File

To register an InstrumentStudio plug-in, place the `.gplugindata` file in the
"Addons" directory under the InstrumentStudio installation directory. This XML
file defines the plug-in's properties and provides the necessary information for
InstrumentStudio to locate the corresponding implementation code.

#### .gplugindata format

The `.gplugindata` file is an XML file. An example is presented below, explaining
its structure.

```xml
<?xml version="1.0" encoding="UTF-8" standalone="no" ?>
<GPluginMetadata xmlns="http://www.ni.com/InstrumentStudio/GPluginMetadata" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <Plugins>
    <PluginData
      ApplicationContext="Unique"
      DebuggingEnabled="false"
      DisplayName="Example" 
      GroupName="My Group" 
      PanelType="Example" 
      ReentrantExecutionEnabled="false" 
      SupportedPanelSizes="Large" 
      UniqueName="Example" 
      VIPath="Example.lvlibp\Main.vi"/>
  </Plugins>
</GPluginMetadata>
```

- The `GPluginMetadata` element is the root element containing all of the data
  to be registered with InstrumentStudio. You must specify the namespace for the
  schema as shown in the example above.
- The `Plugins` element contains the list of plugins.
- Each `PluginData` element registers a single plug-in and lists its properties.
  Attributes of the plug-in are expressed as attributes of the `PluginData`
  element. The attributes recognized are:
  - **UniqueName** (required) - Use a globally unique identifier (GUID) or
    similar, including the company name, to ensure the plug-in's unique
    identification across all registered plug-ins.
  - **DisplayName** (required) - a name that will be displayed to the user for
    the plug-in in all places in InstrumentStudio.
  - **SupportedPanelSizes** (required) - set this to "Large", "Small", or
    "LargeAndSmall" to indicate which size layouts this plug-in supports.
  - **GroupName** - The name of a group which will appear in the Edit Layout
    dialog. All plug-ins with this group name will be populated together in the
    dialog as shown below.

    ![Group Name](./images/InstrumentStudio%20Plug-In%20Guide/Group%20Name.png)

  - **PanelType** - A string to categorize this plug-in. It can be used to
    filter plug-ins (show only plug-ins of this type) in the Edit Layout dialog.
  - **VIPath** (required) - Specify the top-level VI (Main.vi) path for the
    plug-in. If relative, it's relative to the gplugindata file's location or
    the folder above culture-specific folders if applicable.
  - **ProjectPath** (required if ApplicationContext is set to "Project") -
    Specify the LabVIEW project path for loading the top-level VI when
    ApplicationContext is "Project". If relative, it's relative to the
    gplugindata file's location or the folder above culture-specific folders.
  - **DebuggingEnabled** (defaults to false) - Set this to true to make the
    application context of the plug-in visible to LabVIEW as a debuggable
    context.
  - **ReentrantExecutionEnabled** (defaults to true) - Set this to false to
    improve debugging in LabVIEW 2020 and earlier, addressing reentrant VI
    issues that may be fixed in future versions.
    - The first issue is that there is no way to get at the reentrant VI from
      the debug session after it starts running. This generally means you have
      to save a breakpoint in the source VI before the clone is created and
      starts running.
    - However, the saved breakpoint in the clone also isn't being honored and
      the clone never breaks.
    - Similarly, if you set a breakpoint in a non-reentrant VI called by the
      clone and then try to step out/up into the reentrant VI, it just steps
      over and effectively does a resume running command.
  - **ApplicationContext** (required) - This is an enum value that can be either
    "Project", "Global", or "Unique"
    - Project - This allows you to share state between multiple plug-ins, or
      multiple instances of a plug-in implemented within the same lvproj. If you
      use this option, you also need to specify the ProjectPath attribute.
    - Global - This allows you to share state between plug-ins globally, but
      there is a greater risk of conflict with plug-ins from other developers.
    - Unique - A unique context will be created for each instance of the
      plug-in. This avoids the risk of the state of your VI conflicting with
      other plug-ins or instance of your plug-in, but it also makes sharing data
      between plug-ins and plug-in instances more difficult.

---

## Saving the InstrumentStudio Plug-In Soft Panel Data

To save and reload the UI controls data in an InstrumentStudio Plug-In, follow these
steps:

1. When a soft panel/project is saved in InstrumentStudio, it triggers the
   `Project Saved` event in the Main VI. Capture this event and enqueue the
   `WriteConfig-InstrStudio` state to save the UI control data in the
   InstrumentStudio Session object.
2. The Session object can only store data in string format. Therefore, flatten
   the data held by the UI controls into a string and save it using the `Write
   Edit Time Configuration.vi`.

    ![Save Data in Edit Time
    Configuration](./images/InstrumentStudio%20Plug-In%20Guide/Save%20Data%20in%20Edit%20Time%20Configuration.png)

3. Unflatten the string stored in the session object to retrieve the controls data.

    ![Load saved data from Edit Time
    Configuration](./images/InstrumentStudio%20Plug-In%20Guide/Load%20saved%20data%20from%20Edit%20Time%20Configuration.png)

---

## Updating the status of InstrumentStudio Plug-In

Set the `Is Running` property of the `Update Running State.vi` to True to update the
status of the InstrumentStudio plug-in to `running` in the Soft Front Panel.

  ![Update Running
  State](./images/InstrumentStudio%20Plug-In%20Guide/Update%20Running%20State.png)

  ![InstrumentStudio Soft Panel
  State](./images/InstrumentStudio%20Plug-In%20Guide/InstrumentStudio%20Soft%20Panel%20State.png)

---

## Troubleshooting

If the plug-in doesn't appear in the InstrumentStudio's Edit Layout dialog,
ensure the `.gplugindata` file is under the Addons directory of
InstrumentStudio. If there is an error reading this file, InstrumentStudio will
display a message box with details about the error.
