-- Revert fitwork:1.create_tables from pg

BEGIN;

DROP TABLE
    IF EXISTS article,
    category,
    label,
    role,
    "user",
    favorite,-- association table for user_like_article
    program,-- association table  for user_programs_article
    article_has_label;
    
COMMIT;
