# G Plug-In Example

This example G plug-in illustrates how to integrate custom LabVIEW applications seamlessly into InstrumentStudio. It enables users to read and modify the configuration during edit time and run time, retrieve the InstrumentStudio project file path, and update the status of the InstrumentStudio soft front panel.

It will run indefinitely as long as the soft front panel remains open in InstrumentStudio.

## Features

- Familiarizes users with registering and handling InstrumentStudio events.
- Includes a LabVIEW project that contains the G plug-in example.
- Includes a .gplugindata file that tells InstrumentStudio the properties of the G plug-in example and how to find the code that implements it.
- Allows user to write any string as Edit Time Configuration and Run Time Configuration, and read them.
- Shows how to retain soft front panel controls data even after the panel closes.
- Records InstrumentStudio events with timestamps in a table.

## User Guide

### Run the example plug-in

To run the example plug-in, follow these steps.

1. Open the LabVIEW project (Example Plugin.lvproj) file for the example.
2. Build the packed project library under the build specification.
3. Once the build is over, copy the folder containing the builds and place it under the Addons folder of InstrumentStudio at `C:\Program Files\National Instruments\InstrumentStudio\Addons`.
4. Now, open InstrumentStudio, create a new InstrumentStudio project, and save it.
5. Within the project, create a manual layout by following `Add-Ons -> NI Example Plugins -> Example G Plug-in` in Edit Layout.
6. Once the soft front panel is open, the example plug-in will start running.

### Stop the example plug-in

Close the soft front panel containing the example plug-in or the whole InstrumentStudio window to stop the plug-in.

## Developer Guide

### Make changes to the example plug-in

Logic for the G plug-in example is found in Main.vi.

### How to add new UI elements

Add controls and indicators to the front panel of Main.vi. Capture events associated with the controls in the Event Handling Loop and pass the data to Message Handling Loop through Enqueue Message.vi for further operations.
