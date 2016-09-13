CREATE EXTENSION pgcrypto;
CREATE TABLE email_test (email VARCHAR(512));
INSERT INTO email_test VALUES
    ('John.Doe@example.com'),
    ('Pelé@example.com'),
    ('δοκιμή@παράδειγμα.δοκιμή'),
    ('甲斐@黒川.日本'),
    ('чебурашка@ящик-с-апельсинами.рф'),
    (' johndoe@example.com '),
    ('janedoe@example.com');

SELECT
  email,
  ENCODE(DIGEST(LOWER(LTRIM(RTRIM(email))), 'sha256'), 'hex')
  FROM email_test;
