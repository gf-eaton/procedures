Personnal notes on our avancé

In a week I can say we are pretty much advance on the CoDeSys : 

- The (percentage) means how close are we to the goal fixed. Plus, it also include, are we able to reproduce ?

## Week : 2023-10-01 to 2023-10-06

### Closed
 - [x] Setup : codesys, smp lib, etc ... (100%)
 - [x] .par files : points, modbus client, mapping, subscribe, multiple DA/HW (100%)
 - [x] DA-3000 : firmware update, deploy configuration (100%)
 - [x] Overall architecture : miro diagram of our thinking (completed)
 - [x] Phase 1) DEV/EXP Source code (in codesys) sync live points smp --> plc variable, function-block, method, function, extend, pointer of ..., build, run, debug (100%)
 - [x] Phase 2b) CONCEPT : dynamic config state/transition at runtime. Reload of config without build/rebuild

### Known Issues
 - [x] bug found in sync macro/function (in codesys for 3.5.19) this is under investigation for EAS

## Week : 2023-10-08 to 2023-10-13

### Close
 - [x] Phase 2a) DEV/EXP : state machine simulation : goal is to benchmark the PLC in a pseudo-real scenario with changing states (initiated)
 - [x] Phase 2b) DEV/EXP : dynamic config state/transition at runtime. Reload of config without build/rebuild (initiated)
### Open
 - [ ] Phase 3) codesys migration, need some clarifications (blocked)
 - [ ] Test : Integrated testing initiated (initiated)

### Known Issues
 - [ ] a bug exist in the sync mapping tool (plc to smp now)
     - we need to ask EAS the PUB/SUB .par file

---
