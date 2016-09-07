import poplib
import email
import smtplib
import imaplib

'''
#for imap
url = ''
conn = imaplib.IMAP4_SSL(url,993)
print conn
users,pasd = ('', 'pass')

try:
   conn.login(user,pasd)
   conn.close()

except Exception, e:
    print 'login error: %s' % e
    conn.close()
'''

#for pop3
users = ''
pasd = raw_input('Password:')
pop3_server = 'pop3.163.com'

conn = poplib.POP3(pop3_server)
print(conn.getwelcome())
conn.user(users)
conn.pass_(pasd)
print('Messages: %s. Size: %s' % conn.stat())
resp,mails,octets = conn.list()
messages = conn.retr(1)
print messages

conn.quit()
