CREATE TABLE email_test (email VARCHAR(512));
INSERT email_test VALUES
    ('John.Doe@example.com'),
    ('Pelé@example.com'),
    ('δοκιμή@παράδειγμα.δοκιμή'),
    ('甲斐@黒川.日本'),
    ('чебурашка@ящик-с-апельсинами.рф'),
    (' johndoe@example.com '),
    ('janedoe@example.com');

SELECT
  email,
  LOWER(CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', LOWER(LTRIM(RTRIM(CONVERT(VARCHAR, email))))), 2)) AS email_hash
  FROM email_test;
