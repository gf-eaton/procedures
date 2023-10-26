All the steps are included in one HOW TO file (for now)

- Level of difficulty : `Low`
- Time to complete : `3 hours`
- in linux files should be `UTF-8` or ascii with `LF`

# Index
- [Installation of CodeSys, SMP Manager ...](#step-0-installation)
- [Start using installation of SMP Manager, SMP Config, CoDeSys](#step-1-validate-installation)
- [How to Update Firmware on DA-3000 (optional)](#how-to-update-firmware)
- [HOW to CoDeSys `build`, `connect` and `debug` DA-3000](#how-to-codesys)
- [How to configure a DA3000](#how-to-configure-a-da3000)

# Known facts
- In CoDeSys 3.5.19 the Sync macro (toolbar arrows) do not sync properly;
  + Workaround is to use 3.5.18.40 The only supported version as of 2023-10-11.

# Step 0 installation

Do not alter files in folder `\\casrospfp01\Public\USERS\Guy Francoeur` as they are used by everyone

You should find all the necessary in the folder above. Process each step sequentially.

- a) Install SMP manager
  + **use file**: `SMP Gateway Software and Tools 8.3D 2023_08_03 b64000.exe`
  + **use file**:  see reference **`1.0C3`**
- b) Install CoDeSys `3.5.18.40 64bit` __NOTHING ELSE IS SUPPORTED__
  + **use file**: `\\casrospfp01\Public\USERS\Dominique.Brochu\Codesys` `CODESYS 64 3.5.18.40.exe` 1.482GB 
- c) Use Codesys Installer (Run as Administrator)
  + Click --> Install Files > Select(`SMP.package`)
- d) In task/traybar (Windows Clock)
  + RightClick --> CmContainers (CodeMeter) > WebAdmin > Configuration > Set manual proxy : `proxy.etn.com:8080`

Reference :
- SMP Gateway Tool 8.3D 2023-10-21 b70600
  - `\\casrospfp01\Daily Builds\SMP\SoftAndTools\Current\Packages\Deliveries\CD_COOPER\008.003.706.000\Export\CD_COOPER\SMP Software and Tools\SMP Tools`
- SMP config for DA series
  - **1.0C3** `\\casrospfp01\Official Builds\DA\1.0R\Packages\Deliveries\CD_COOPER\001.000.028.000\Export\CD_COOPER\SMPDA3000\CD_COOPER\Firmware and Tools\SMP Tools`
  + **1.0B18** `\\casrospfp01\Official Builds\DA\1.0R\Packages\Deliveries\CD_COOPER\001.000.026.000\Export\CD_COOPER\SMPDA3000\CD_COOPER\Firmware and Tools\SMP Tools`
- SMP library for CoDeSys
  + `\\casrospfp01\Daily Builds\SMP\SoftAndTools\Current\Components\Tools\CODESYS\`
 
# Step 1 validate installation

**At this point you should have :** `smpmanager, codesys, smp lib for codesys` installed.

**BE PATIENT IT COULD TAKE TIME**

- a) add a device in smp manager
  + enter --> name, ip and use .par file

- b) right click on new device
   + pick --> Get Configuration file
   + pick --> smp Config (CTRL+1)

- c) once in smpConfig
  + navigate --> system > SoftPLC  > plc . rightclick --> edit/refresh Codesys project

- **fin** --> Once in CoDeSys you should be good to go.

---


# How to update firmware
## of DA-3000 (optional)

- [ ] We use `ssh` for the following tasks.
- [ ] **FIRMWARE** Location :
  - `\\casrospfp01\Official Builds\DA\1.0R\Components\Firmware\Images\SMPDA3050\001.000.028.000\Export\smp` `B19`
  - `\\casrospfp01\Official Builds\DA\1.0R\Components\Firmware\Images\SMPDA3050\001.000.026.000\Export\smp` `B18`

1. 
```
#check version installed
cat /etc/os-release #or sys-info
```

2. 
```
cd /var/smp/new
```

```
# copy boot firmware file in folder using MobaXterm (drag and drop)
```

```
reboot now
```

3.
```
cd /var/smp/new
# copy **dev** firmware file in folder
reboot now
```

4.
```
cd /var/smp/conf
```
- copy par configuration file
- `reboot now`

5. license file
```
ls -lahs /var/smp/system/conf/
cat /var/smp/system/conf/license.dat
```
- drop a license file if none in the folder.
---

# HOW to CoDeSys 
## `build`, `connect` and `debug` with DA-3000

- [ ] make sure you have CoDeSys Gataway running as a service.
- [ ] make sure you have __right__ FIRMWARE in target device.


### In CoDeSys 
- Use Build menu
  + Generate Code (F11)
- Use Online Menu
  + Click Login (Alt-F8)
    + Gateway is `green` you good to go;
    + Type ip of target device, then hit `enter`;
  + Click Login (Alt-F8) again
- Click Run
 
# How to configure a DA3000
## using smp config `IMPORTANT`

This procedure is used to get value/live points.  This is required to see value change.  Important when the device is not physically connected.

- [ ] Requires smp config version (or above) `SMP Gateway Software and Tools 8.3D 2023_08_03 b64000.exe`
- [ ] smp config knowledge

### In smp-Config

1.  Make sure the proper HW type is selected to match the physical device.
2.  Important to make all warnings go away.
3.  Once Clean up is done, Edit/Refresh Codesys.

### In CoDeSys

1.  Use Macro (in toolbar) Sync smp/da to CoDeSys `This will do magic to avoid issues`
2.  Build to find invalid source code
3.  Use Macro (in toolbar) Sync CoDeSys to smp/da `This will sync back to .par`

- If you do not have the arrows in toolbar use : `Tools > Script > Execute script File > C:\programData\codesys\Script Commands\*.py`
---
