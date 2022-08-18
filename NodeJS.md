# How to install NodeJS via Node Version Manager (nvm)

### nvm install

```
wget -qO- --no-check-certificate https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

close terminal window and reopen so the path are updated

```
nvm --version
```

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

---
by gf 2022 MIT
