# How to install BrightLayer for nodeJS
## Experimental

### Script

Complete install 1500+ packages
```
npm install @brightlayer-ui/cli
```

### Experimental install for PXMCEA
```
cd /opt/
mkdir project
cd project
npm config set legacy-peer-deps true
npm install @brightlayer-ui/react-components
npm install @brightlayer-ui/react-themes
# npx -p @brightlayer-ui/cli blui new react --template=blank
# npx -p @brightlayer-ui/cli blui new react --template=routing
npx -p @brightlayer-ui/cli blui new react --template=authentication
```

from a new terminal

```
cd /opt/project/pxmcea
npm start
```

Now you are ready to use your browser ... and test the app you just did !!!

to build (Production) use `npm run build` wait a few minutes then consume the UI/app from your browser.

### Extension

- [Egde](https://microsoftedge.microsoft.com/addons/detail/react-developer-tools/gpphkfbcpidddadnkolkpfckpihlkkil)
- 
### Reference

[react cli template](https://github.com/brightlayer-ui/react-cli-templates/tree/master)

---
MIT gf 2022
