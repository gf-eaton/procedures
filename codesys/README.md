All the steps are included in one HOW TO file (for now)

- Level of difficulty : `Low`
- Time to complete : `3 hours`
- in linux files should be `UTF-8` or ascii with `LF`

# Step 0 installation

Do not alter files in folder `\\casrospfp01\Public\USERS\Guy Francoeur` as they are used by everyone

You should find all the necessary in the folder.

- a) Install SMP manager **file:** `SMP DA-3000 Firmware and Tools 1.0B18.exe`
- b) Install CoDeSys 3.5.19.20 64bit **file:** `CODESYS 64 3.5.19.20.exe`
- c) Use Codesys Installer
  + Click --> Change > Import Configuration > Select(`3PSP19config.installation-config`)
  + Click --> Install Files > Select(`SMP.package`)
- d) Use Cmd (administrator)
  + `netsh advfirewall firewall add rule name="CodeMeter (Codesys)" dir=in action=allow program=" C:\Program Files (x86)\CodeMeter\Runtime\bin\CodeMeter.exe" enable=yes`
- e) In task/traybar (Windows Clock)
  + RightClick --> CmContainers (CodeMeter) > WebAdmin > Configuration > Set manual proxy : `proxy.etn.com:8080`

Reference :
- SMP config (tool)
  + `\\casrospfp01\Official Builds\DA\1.0R\Packages\Deliveries\CD_COOPER\001.000.026.000\Export\CD_COOPER\SMPDA3000\CD_COOPER\Firmware and Tools\SMP Tools`
- SMP library for CoDeSys
  + `\\casrospfp01\Daily Builds\SMP\SoftAndTools\Current\Components\Tools\CODESYS\`
 
# Step 1 validate installation `use CoDeSys`

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


# How to update firmware of DA-3000

- [ ] We use `ssh` for the following tasks.
- [ ] **FIRMWARE** Locat : `\\casrospfp01\Official Builds\DA\1.0R\Components\Firmware\Images\SMPDA3050\001.000.026.000\Export\smp`
- [ ] **hw.txt** : you need to put the smp manager in debug mode use `SMPToolsRegEdit.exe`

```
#check version installed
cat /etc/os-release #or sys-info
```

- Procedure to update the firmware
```
cd /var/smp/new 
# copy boot file in folder and reboot now
cd /var/smp/new
# copy set file in folder and reboot now
cd /var/smp/new
# copy dev file in folder and reboot now
cd /var/smp/conf
# NO NEED TO REBOOT
# copy le hw.xml
```

---

# HOW to connect DA-3000 from CoDeSys

- [ ] make sure you have CoDeSys Gataway running as a service.
- [ ] make sure you have **right** FIRMWARE.


### In CoDeSys 
- Use Build menu
  + Generate Code (F11)
- Use Online Menu
  + Click Login (Alt-F8)
