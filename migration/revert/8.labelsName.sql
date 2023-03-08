-- Revert fitwork:8.labelsName from pg

BEGIN;

TRUNCATE label CASCADE;

COMMIT;
