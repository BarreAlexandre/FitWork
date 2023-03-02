-- Revert fitwork:6.add_favorite_id from pg

BEGIN;

ALTER TABLE favorite
DROP COLUMN id;
COMMIT;
