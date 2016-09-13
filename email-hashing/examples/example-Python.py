# -*- coding: utf-8 -*-
import hashlib

email_test = [
    u'John.Doe@example.com',
    u'Pelé@example.com',
    u'δοκιμή@παράδειγμα.δοκιμή',
    u'甲斐@黒川.日本',
    u'чебурашка@ящик-с-апельсинами.рф',
    u' johndoe@example.com ',
    u'janedoe@example.com'];

def hash_email(email):
    email = email.strip()
    email = email.encode('utf8')
    email = email.lower()
    return hashlib.sha256(email).hexdigest()

for email in email_test:
    print hash_email(email)
