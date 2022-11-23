# DevOps Pipelines Agent

Duration : 12 minutes

- Steps Windows:
  + Download Agent
  + Install
  + Config/Setup (may be different if you do not have the certificates properly install)
  + Run
  + Test

### For Windows

- [ ] Powershell
- [ ] Lastest > 2.36 git Bash with schannel


- Steps Windows:
  + Download Agent --> https://vstsagentpackage.azureedge.net/agent/2.213.2/vsts-agent-win-x64-2.213.2.zip
  + Install (in PowerShell) --> `mkdir agent ; cd agent; Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory("$HOME\Downloads\vsts-agent-win-x64-2.213.2.zip", "$PWD")`
  + Config/Setup `./config.cmd --gituseschannel`
  + Run --> `./run.cmd`
  + Test --> `curl -v https://tfs.com/tfs`

### for Linux or WSL

- [ ] Tested with WSL Debian 11 and Raspbian
- [ ] Require --> certificates
- [ ] Require --> curl


- Steps Linux:
  + Download Agent --> `cd ; wget https://vstsagentpackage.azureedge.net/agent/2.213.2/vsts-agent-linux-x64-2.213.2.tar.gz`
  + Install --> `mkdir myagent && cd myagent ; tar zxvf ~/vsts-agent-linux-x64-2.213.2.tar.gz`
  + Config/Setup --> `./config.sh`
  + Run -->  `./run.sh`
  + Test --> `curl -v https://tfs.com/tfs`
