#-*- encoding: gb2312 -*-
import poplib
import email
from email.parser import Parser
from email.header import decode_header
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
index = len(mails)
resp,lines,octets = conn.retr(index)
msg_content = '\r\n'.join(lines)
msg = Parser().parsestr(msg_content)

# get and decode subject
subject = msg.get("subject")
h = email.Header.Header(subject)
dh = email.Header.decode_header(h)
subject = dh[0][0]
print "subject:", subject
conn.quit()
