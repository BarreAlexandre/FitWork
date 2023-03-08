-- Deploy fitwork:8.labelsName to pg

BEGIN;

TRUNCATE label CASCADE;

INSERT INTO
    "label"("name")
VALUES ('Dos'),('Jambes'),('Pieds'),('Bras'),('Mains'),('Yeux'),('Sommeil'),('Habitude Alimentaire'),('Cerveau'),('Abdominaux');

COMMIT;