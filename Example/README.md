# G Plug-In Example

This is a G plug-in example that demonstrates the usage of InstrumentStudio SDK APIs. It allows the user to read/write the Edit Time and Run Time Configurations, get the InstrumentStudio project path, and update the running status of the InstrumentStudio softpanel.

It will run indefinitely as long as the SoftPanel or InstrumentStudio window that contains the plugin is open.

## Features

- Demonstrates how to handle InstrumentStudio events.
- Allows user to enter any string as Edit Time Configuration and Run Time Configuration to write and read them.
- Records InstrumentStudio events with timestamps in a table.
- Retains softpanel control data after panel close.

## Required Driver Software

None

## Required Hardware

None

## User Guide

### Run the example plugin

To run the example plugin, follow these steps.

1. Open the LabVIEW project (Example Plugin.lvproj) file for the example.
2. Build the packed project library under the build specification.
3. Once the build is over, copy the folder containing the builds and place it under the addons folder of InstrumentStudio at `C:\Program Files\National Instruments\InstrumentStudio\Addons`.
4. Now, open InstrumentStudio, create a new InstrumentStudio project, and save it.
5. Within the project, create a manual layout by following `Add-Ons -> NI Example Plugins -> Example G Plug-in` in Edit Layout.
6. Once the softpanel is open, the example plugin will start running.

### Stop the example plugin

Close the softpanel containing the example plugin or the whole InstrumentStudio window to stop the plugin.

## Developer Guide

### Make changes to the example plugin

Logic for the example plugin is contained in Main.vi.

### How to add new UI elements

Add controls and indicators to the front panel of Main.vi. Capture events associated with the controls in the Event Handling Loop and pass the data to Message Handling Loop through Enqueue Message.vi for further operations.
