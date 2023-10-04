# Sample how to use different functions

- [x] CoDeSys knowledge required

as per different usage of automation function func_A instead of func_B this may become available !


Let say we use a BI_point(s) one for each function  and a switch case - like/similar ... this will make a generic codesys program flexible to all cases.. we use a function if the bit is on.  This simulates the function pointer...  if pointers wish to be used like in C (I know pointer exist in codesys)

 
```codesys
//here is my understanding of of usage of different automation function
//this makes it fully configurable and flexible
//example

FUNCTION F_myFunction_CASE_A1 : INT
VAR
  val : INT;
END_VAR
F_myFunction_CASE_A1 := val * 12; // do something
END_FUNCTION

FUNCTION F_myFunction_CASE_A2 : INT
VAR
  val : INT;
END_VAR
F_myFunction_CASE_A2 := val * 24; // do something
END_FUNCTION
```

```
// I will avoid a bit of code, sorry it may become difficult.

// This will make usage of different function block at runtime.

...
FPTR_CASE_A : POINTER OF PVOID;
FPTR_CASE_B : POINTER OF PVOID;
myVal : INT;
...

IF BI_FUNC_CASE_A1 = TRUE
THEN FPTR_CASE_A := ADR(F_myFunction_CASE_A1);
ELSIF  BI_FUNC_CASE_A2 = TRUE
THEN FPTR_CASE_A := ADR(F_myFunction_CASE_A2);
END_IF;

...

myVal := FPTR_CASE_A^;

...
```
