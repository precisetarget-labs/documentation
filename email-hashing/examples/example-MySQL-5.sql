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
  SHA2(LOWER(LTRIM(RTRIM(email))), '256')
  FROM email_test;
