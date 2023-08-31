#!/bin/bash
mkdir -p /mnt/sda/data
chown postgres:postgres /mnt/sda/data

su - postgres -c "psql -c \"ALTER USER postgres WITH PASSWORD 'SetPasswordNow!';\" "
su - postgres -c "createuser pxmcea"
su - postgres -c "psql -c \"ALTER USER pxmcea WITH PASSWORD 'SetPasswordNow!';\" "
su - postgres -c "createdb telemetry"
su - postgres -c "psql -c \"GRANT ALL PRIVILEGES ON DATABASE telemetry TO pxmcea;\" "
su - postgres -c "mkdir -p /mnt/sda/data/ts_archive_2023"
su - postgres -c "psql -c \"CREATE TABLESPACE ts_archive_2023 OWNER pxmcea LOCATION '/mnt/sda/data/ts_archive_2023';\" "
su - postgres -c "mkdir -p /var/lib/postgresql/13/data/ts_telemetry"
su - postgres -c "psql -c \"CREATE TABLESPACE ts_telemetry OWNER pxmcea LOCATION '/var/lib/postgresql/13/data/ts_telemetry';\" "
su - postgres -c "psql -d telemetry -U pxmcea -h localhost -c \"CREATE TABLE IF NOT EXISTS public.telemetry (rowid SERIAL NOT NULL, iot boolean DEFAULT false, ts timestamp without time zone, att bigint, val numeric(16,6), dwrite timestamp without time zone DEFAULT timezone('utc'::text, now())) WITH (autovacuum_enabled = TRUE) TABLESPACE ts_telemetry;\" "

echo "You are done."
