-- Verify fitwork:6.add_favorite_id on pg

BEGIN;

SELECT * FROM program LIMIT 1;

ROLLBACK;
