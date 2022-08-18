# How to install NodeJS via Node Version Manager (nvm)

- Prerequisit : WSL2 with debian 11
- Duration : 8 minutes (most of it for downloading)

### nvm install

```
wget -qO- --no-check-certificate https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

close terminal window and reopen so the `PATH` get refreshed.

```
nvm --version
```

### Only if

`nvm ls-remote` return `N/A`

Ok at this point you need to fix the `~/.nvm/nvm.sh` because certificates may not be helping

```
nano ~/.nvm/nvm.sh
```
search using `CTRL-W` for `nvm_download` look for `curl` add `-k` then save and close file

#### sample
```bash
nvm_download() {
  local CURL_COMPRESSED_FLAG
  if nvm_has "curl"; then
    if nvm_curl_use_compression; then
      CURL_COMPRESSED_FLAG="--compressed"
    fi
    curl -k --fail ${CURL_COMPRESSED_FLAG:-} -q "$@"
```

#### ready to continue

```
nvm ls-remote
nvm install node
```

```
node --version
npm --version
```

---
by gf 2022 MIT
