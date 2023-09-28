All the steps are included in one HOW TO file (for now)

- Level of difficulty : `Low`
- Time to complete : `3 hours`

# Step 0 installation

Do not alter files in folder `\\casrospfp01\Public\USERS\Guy Francoeur` as they are used by everyone

You should find all the necessary in the folder.

- a) Install SMP manager **file:** `SMP DA-3000 Firmware and Tools 1.0B18.exe`
- b) Install CoDeSys 3.5.19.20 64bit **file:** `CODESYS 64 3.5.19.20.exe`
- c) Use Codesys Installer
  + Click --> Change > Import Configuration > Select(3PSP19config.installation-config)
  + Click --> Install Files > Select(`SMP.package`)
- d) Use Cmd (administrator)
  + `netsh advfirewall firewall add rule name="CodeMeter (Codesys)" dir=in action=allow program=" C:\Program Files (x86)\CodeMeter\Runtime\bin\CodeMeter.exe" enable=yes`
- e) In task/traybar (Windows Clock)
  + RightClick CmContainers (CodeMeter) > WebAdmin > Configuration > Set manual proxy : `proxy.etn.com:8080`

Reference :
- SMP config (tool)
  + `\\casrospfp01\Official Builds\DA\1.0R\Packages\Deliveries\CD_COOPER\001.000.026.000\Export\CD_COOPER\SMPDA3000\CD_COOPER\Firmware and Tools\SMP Tools`
- SMP library for CoDeSys
  + `\\casrospfp01\Daily Builds\SMP\SoftAndTools\Current\Components\Tools\CODESYS\`
 
# Step 1 validate installation

**At this point you should have :** `smpmanager, codesys, smp lib for codesys` installed.

**BE PATIENT IT COULD TAKE TIME**

- a) add a device in smp manager
  + enter --> name, ip and .par file

- b) right click on new device
   + pick --> smp Config (CTRL+1)

- c) once in smpConfig
  + navigate --> system > SoftPLC  > plc . rightclick edit/refresh Codesys project

- **fin** --> Once in CoDeSys you should be good to go.
