CREATE TABLE email_test (email VARCHAR(512));
INSERT ALL
    INTO email_test (email) VALUES ('John.Doe@example.com')
    INTO email_test (email) VALUES ('Pelé@example.com')
    INTO email_test (email) VALUES ('δοκιμή@παράδειγμα.δοκιμή')
    INTO email_test (email) VALUES ('甲斐@黒川.日本')
    INTO email_test (email) VALUES ('чебурашка@ящик-с-апельсинами.рф')
    INTO email_test (email) VALUES (' johndoe@example.com ')
    INTO email_test (email) VALUES ('janedoe@example.com')
    SELECT * FROM dual;

SELECT
  email,
  SYS.DBMS_CRYPTO.HASH(UTL_I18N.STRING_TO_RAW(LOWER(LTRIM(RTRIM(email))), 'AL32UTF8'), 4 /* DBMS_CRYPTO.HASH_SH256 */) AS email_hash
  from email_test;
