require 'digest'

email_test = [
    'John.Doe@example.com',
    'Pelé@example.com',
    'δοκιμή@παράδειγμα.δοκιμή',
    '甲斐@黒川.日本',
    'чебурашка@ящик-с-апельсинами.рф',
    ' johndoe@example.com ',
    'janedoe@example.com'];

def hash_email(email)
    email.downcase!
    email.strip!
    email.encode!('UTF-8')
    return Digest::SHA256.hexdigest email
end

for email in email_test
    puts hash_email(email)
end
