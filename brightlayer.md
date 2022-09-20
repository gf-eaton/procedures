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
mkdir projets
cd projets
npm config set legacy-peer-deps true
npm install @brightlayer-ui/react-components
npm install @brightlayer-ui/react-themes
npx -p @brightlayer-ui/cli blui new react --template=blank
npx -p @brightlayer-ui/cli blui new react --template=routing
npx -p @brightlayer-ui/cli blui new react --template=authentication
```

---

