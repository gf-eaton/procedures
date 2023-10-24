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
 - [ ] WORKAROUND move to 3.5.18 should be next (from 3.5.19)

## Week : 2023-10-16 @ 20
 - [x] Montreal office closed, moved to Brossard no access to DA-3000
 - [x] Update and test Warrendale DA-3000 devices (3)
   - [x] .211 produce mapping inconsistency SMP to PLC
   - [x] .214 unit firmware updated model DA-3050
   - [x] .215 unit firmware update model `DA-3052` / but we used `DA-3053 in config`
     - [x] model seems not to match the HW
   - [x] Some difficulties with smp manager (get configuration file) not everyone has the issues
     - [ ] J was ok G not working for a complete week
     - [x] WORKAROUND get config file via ssh (.215)
     - [ ] POSSIBLE WORKAROUND NEW version of smp manager is available b27700
        
### Known Issues
 - [ ] Network stability and speed (Warrendale)
 - [ ] .211 useable due to mapping issue and some other. Need to be worked/refurshised.

## Week 2023-10-23 @ 27
 - [x] Brossard office racks not ready, none of the required was purchased for the rack/cabinet
 - [x] Using 172.130.129.215 most stable
 - [x] Flexible prototype running
   - [ ] Goal is to used and validate simple, efficient method without lossing on functionalities
 - [x] Tested
   - [x] INT
   - [x] REAL
   - [x] MODBUS Client
   - [ ] BIT
   - [ ] UNIT (unsupported)
 - [x] AF need to be understood (deeper dive)
 - [x] Benchmarks
   - [x] initialize ? (~0ms)
   - [ ] Transition ?
   - [ ] State Check ?
   - [ ] Points SMP --> PLC ?
   - [ ] Points PLC --> SMP ?

### Known Issues
 - [x] UINT not supported for SMP to PLC
 - [x] FLOAT precision limitation 23 bit used
 - [ ] NTP Syncronization not working

---
