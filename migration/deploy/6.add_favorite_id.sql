-- Deploy fitwork:6.add_favorite_id to pg

BEGIN;

ALTER TABLE favorite
ADD COLUMN id SERIAL PRIMARY KEY;

COMMIT;
