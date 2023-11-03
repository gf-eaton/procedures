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
     - we need to ask EAS the PUB/SUB .par file (done fix EAS)
 - [x] WORKAROUND use codesys version 3.5.18 (instead of 3.5.19)

## Week : 2023-10-16 @ 2023-10-20
 - [x] Montreal office closed, moved to Brossard no access to DA-3000
 - [x] Update and test Warrendale DA-3000 devices (3)
   - [x] .211 produce mapping inconsistency SMP to PLC
   - [x] .214 unit firmware updated model DA-3050
   - [x] .215 unit firmware update model `DA-3052` / but we used `DA-3053 in config`
     - [x] model seems not to match the HW
   - [x] Some difficulties with smp manager (get configuration file) not everyone has the issues
     - [ ] J was ok G not working for a complete week
     - [x] WORKAROUND get config file via ssh (.215)
     - [ ] POSSIBLE WORKAROUND NEW version of smp manager is available b27700 (or use daily build)
        
### Known Issues
 - [ ] Network stability and speed (workable but benchmark shows degradation of 10.130.129.* compared to 166.99.230.* ) (Warrendale).
 - [ ] Device .211 : unusable due to mapping issue (values badly passed). Need to be worked/refurshised.
 - [ ] Device .214 : unable to connect the device on the codesys side. Resulting in not able to debug source code.

## `--->` Week 2023-10-23 @ 2023-10-27 `WE ARE HERE`
 - [x] Brossard office racks not ready, none of the required was purchased for the rack/cabinet
 - [x] Using 172.130.129.215 most stable
 - [x] Flexible prototype running
   - [ ] Goal is to used and validate simple, efficient method without lossing on functionalities
 - [x] Tested
   - [x] INT
   - [x] REAL
   - [x] MODBUS Client
   - [x] BIT
   - [ ] UNIT (unsupported)
 - [ ] Imported/Used (Analog Input/Binary Input) from PXMC parfile
   - [x] BMS (12) (~~1~~)
   - [x] CT (4) (~~1~~)
   - [x] GEN 1 (6) (18)
   - [ ] GEN 2 (6) (18)
   - [x] PCS (10) (8)
   - [x] RIO (~~1~~) (8)
   - [x] RN PV1 (5) (2)
   - [ ] RN PV2-4 (15) (6)
   - [x] SRC (9) (~~1~~)
   - [x] TEST point from .225 (9) (0)
   - [x] CONF point (15) (0)
   - [x] Total MODBUS points : 81 - duplicates addr + 15 + 9 ==  `±105 points`
 - [x] AF need to be understood (deeper dive) (initiated)
 - [x] Benchmarks
   - [x] initialize ? (~0ms)
   - [ ] Transition ? (~ ms)
   - [ ] State Check ? (~ ms)
   - [ ] Points SMP --> PLC ?
   - [ ] Points PLC --> SMP ?

### Known Issues
 - [ ] UINT not supported for SMP to PLC
 - [ ] FLOAT precision limitation 23 bit used
 - [ ] NTP Syncronization not working


---

## Week 2023-10-30 @ 2023-11-03
 - [x] Brossard office still in moving mode
   -  Unavailability or limited access to network and equipments
   -  No communication about status

### Known Issues 
 - [ ] 1.0C3
   - smp-io-app process heavy on cpu (too many thread/children == 229) after 36 hours uptime --> 13hours of cpu time
   - smp-rpc-core process heavy on cpu (too many thread/children == 46) after 36 hours uptime --> 5h27 of cpu time
   - Disk IO > 35% to 85% constant
   - CPU 4x 8% to 25% constant


## Week 2023-11-06 @ 2023-11-10
 - [ ] Brossard office should be done first day in the office all together


# Summary of known issues/limitations/

- [x] sync macro/function only work with codesys version 3.5.18.
- [ ] UINT32 (two registers uint16_t) not supported when passing (usinged INT) from SMP to PLC (DWORD).
  - Limit of uint32_t is `2^32-1` == `4,294,967,295`
  - Limit of int32_t is `-2^31` == `-2,147,483,648` to `2^31-1` == `2,147,483,647`
- [ ] FLOAT precision limitation `23 bits` used lost of precision avoid this type.
  - LIMIT without any lost of precision is `2^23-1` == `8 388 607`.
- [ ] NTP Client time syncronization not working.
- [ ] Device .211 : is unusable due to mapping issue (values badly passed).
- [ ] Device .214 : we are unable to connect the device on the codesys side. Resulting in not able to debug source code.
- [ ] Device .215 : unavailable/connectivity issue during 10 days. Was version 1.0B18 now 1.0C3 (possible origin of issue : internal config/spec/model of device).

---
