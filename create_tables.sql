BEGIN;

DROP TABLE
    IF EXISTS "publisher",
    "book",
    "reader",
    "author",
    "genre",
    "book_has_author",
    "book_has_genre",
    "book_has_reader";

-- ---------------------------------------------------------------------------------------

-- table "edition"

-- ---------------------------------------------------------------------------------------

CREATE TABLE
    IF NOT EXISTS "publisher"(
        "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
        "name" TEXT NOT NULL,
        "website" TEXT,
        "created_at" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
        "updated_at" timestamptz
    );

-- ---------------------------------------------------------------------------------------

-- table "book"

-- ---------------------------------------------------------------------------------------

CREATE TABLE
    IF NOT EXISTS "book"(
        "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
        "title" TEXT NOT NULL,
        "pages" INTEGER NOT NULL,
        "cover" TEXT,
        "publication" TEXT,
        "ISBN" TEXT,
        "publisher_id" INTEGER NOT NULL REFERENCES "publisher"("id"),
        "created_at" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
        "updated_at" timestamptz
    );

-- ---------------------------------------------------------------------------------------

-- table "reader"

-- ---------------------------------------------------------------------------------------

CREATE TABLE
    IF NOT EXISTS "reader"(
        "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
        "pseudo" TEXT NOT NULL,
        "password" TEXT NOT NULL,
        "created_at" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
        "updated_at" timestamptz
    );

-- ---------------------------------------------------------------------------------------

-- table "genre"

-- ---------------------------------------------------------------------------------------

CREATE TABLE
    IF NOT EXISTS "genre"(
        "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
        "name" TEXT NOT NULL,
        "subgenre" TEXT,
        "created_at" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
        "updated_at" timestamptz
    );

-- ---------------------------------------------------------------------------------------

-- table "author"

-- ---------------------------------------------------------------------------------------

CREATE TABLE
    IF NOT EXISTS "author"(
        "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
        "firstname" TEXT,
        "lastname" TEXT,
        "nationality" TEXT,
        "created_at" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
        "updated_at" timestamptz
    );

-- ---------------------------------------------------------------------------------------

-- table "book_has_author"

-- ---------------------------------------------------------------------------------------

CREATE TABLE
    IF NOT EXISTS "book_has_author"(
        "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
        "book_id" INTEGER REFERENCES "book"("id"),
        "author_id" INTEGER REFERENCES "author"("id"),
        "created_at" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
        "updated_at" timestamptz
    );

-- ---------------------------------------------------------------------------------------

-- table "book_has_genre"

-- ---------------------------------------------------------------------------------------

CREATE TABLE
    IF NOT EXISTS "book_has_genre"(
        "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
        "book_id" INTEGER REFERENCES "book"("id"),
        "genre_id" INTEGER REFERENCES "genre"("id"),
        "created_at" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
        "updated_at" timestamptz
    );

-- ---------------------------------------------------------------------------------------

-- table "book_has_reader"

-- ---------------------------------------------------------------------------------------

CREATE TABLE
    IF NOT EXISTS "book_has_reader"(
        "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
        "book_id" INTEGER REFERENCES "book"("id"),
        "reader_id" INTEGER REFERENCES "reader"("id"),
        "created_at" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
        "updated_at" timestamptz
    );

COMMIT;