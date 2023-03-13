# PG3D Fake Libil2cpp.so Counter For GameGuardian
### Basic Concept:
This tool is used when hex patching PG3D on PC Emulators such as Nox, MEmu, Bluestacks etc.. where there are 2 Libil2cpp.so, so this script has a function to ignore the fake Libil2cpp.so and edit the real Libil2cpp.so. (NOTE THAT EDITS MAY VARY AND FUNCTION(s) MAY FAIL DUE TO SPACE PADDING OR SCRIPTING ISSUE)
### Usage Example:
```lua
hex = "F5 53 BE A9 F3 7B 01 A9 35 8C 02 90 A8 1E 78 39 F3 03 01 2A F4 03 00 AA C8 00 00 37 60 64 02 90 00 84 46 F9 63 4A E2 97 28 00 80 52 A8 1E 38 39 94 36 40 F9 E0 03 13 2A E1 03 1F AA 5D F7 93 94"
edithex = "00 00 80 D2 C0 03 5F D6"
len, formathex = getHexInfo(hex)
counterFakeLib(len, formathex, edithex)
```
