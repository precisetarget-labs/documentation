# Email Hashing #

PreciseTarget de-identifies personal data through one way cryptographic hashes on personally identifying information (PII) like email addresses. This methodology protects our users from accidental data release, and allows our partners to share data with us in an effective manner. The same hashing methodology must be used for _every_ single hash.

This document specifies the requirements for hashing data.

**Before Hashing:**

1. Data must be encoded in UTF-8
2. All whitespace characters must be stripped from either end of the data
3. Case-insensitive data (e.g. email) must be lowercase
4. All string boundary and escape characters must be removed (e.g. quotes)

**Hashing:**

1. Hash each data point individually
2. Use SHA-256 hashing (from the [SHA-2 family](https://en.wikipedia.org/wiki/SHA-2))
3. Output a 64 character ASCII encoded hexadecimal digest

If these guidelines are followed, all implementations should produce the same output for every input. Truth values, provided below, should be used to verify your implementation.

### A note on Encoding ###
Email addresses are encoded according to RFC 5322 which is not internationalized. However, the IETF has issued a new technical standard entitled Email Address Internationalization (EAI) RFC 6530 which calls for UTF-8 encoded emails, described at Wikipedia here: [Email Address Internationalization](http://en.wikipedia.org/wiki/Email_address#Internationalization).

Although it may not be necessary to encode emails in UTF-8 currently, it is important to ensure consistent encoding. Because many web requests are in Unicode, the safest option for any encoding service is to rely on unicode encoding schemes, hence our decision.

## Code Examples ##

Here are some examples in various dialects of SQL and programming languages that fulfill the requirements above.


### [MS SQL Server 2014](./examples/example-MS-SQL-Server-2014.sql) ###

```sql
SELECT
  email,
  LOWER(CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', LOWER(LTRIM(RTRIM(CONVERT(VARCHAR, email))))), 2)) AS email_hash
  FROM email_test;
```

### [MySQL 5](./examples/example-MySQL-5.sql) ###

```sql
SELECT
  email,
  SHA2(LOWER(LTRIM(RTRIM(email))), '256')
  FROM email_test;
```

### [Oracle 12](./examples/example-Oracle-12.sql) ###

```sql
SELECT
  email,
  SYS.DBMS_CRYPTO.HASH(UTL_I18N.STRING_TO_RAW(LOWER(LTRIM(RTRIM(email))), 'AL32UTF8'), 4 /* DBMS_CRYPTO.HASH_SH256 */) AS email_hash
  from email_test;
```

### [PostgresSQL 9](./examples/example-PostgresSQL-9.sql) ###

```sql
SELECT
  email,
  ENCODE(DIGEST(LOWER(LTRIM(RTRIM(email))), 'sha256'), 'hex')
  FROM email_test;
```

### [Python](./examples/example-Python.py) ###

```python
import hashlib

def hash_email(email):
    email = email.strip()
    email = email.encode('utf8')
    email = email.lower()
    return hashlib.sha256(email).hexdigest()
```

### [Ruby](./examples/example-Ruby.rb) ###

```ruby
require 'digest'

def hash_email(email):
    email.downcase!
    email.strip!
    email.encode('UTF-8')!
    return Digest::SHA256.hexdigest email
end
```

## Truth Values ##
Use the following sample emails and hashes to ensure that any hashing implementation that is used to de-identify data matches the results of the following truth values. Note that this data is available as [CSV](./examples/sample_verify.csv) and [JSON](./examples/sample_verify.json).

    John.Doe@example.com
    836f82db99121b3481011f16b49dfa5fbc714a0d1b1b9f784a1ebbbf5b39577f

    Pelé@example.com
    9c9aa18cb79ad7077472a79300a5f8dafc3a297ec96773963c7b9f582571d22f

    δοκιμή@παράδειγμα.δοκιμή
    5c89166b48d3b2c5b2b3d6c55de565484f41d28760206e27499af2ddc705dbd0

    甲斐@黒川.日本
    24ea73d824b535bf097469729302479627070a513fd3aaa17b5d5a3199233288

    чебурашка@ящик-с-апельсинами.рф
    c1873090843dd25dec8d9fa5536330f112ae0202e7a91b700f0fab7c0654a960

     johndoe@example.com
    55e79200c1635b37ad31a378c39feb12f120f116625093a19bc32fff15041149

    janedoe@example.com
    c4d25e9c90ff23e9145397bc6fbd5385ca5fbe78211222ccbecd0b369ebb19a6


Please note the intentional leading space in the sixth example above.
