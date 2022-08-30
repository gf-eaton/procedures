CERATE TABLE points (
 ts timestamp
,cName varchar(50)
,nValue numeric(14,6)
);

INSERT INTO points (ts, cName, nValue) VALUES (TIMESTAMP'2001-03-18 23:58:00.00045', 'point-name', 10.123);

INSERT INTO points (ts, cName, nValue) VALUES (TIMESTAMP'2022-08-30 00:00:00.00099', 'point-name-test', 1234.0123);
COMMIT;
