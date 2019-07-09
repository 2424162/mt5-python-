import smtplib
from email.mime.text import MIMEText
from email.header import Header
from email.mime.multipart import MIMEMultipart
import itchat
import os


path1 ="C:\\Users\\Lenovo\AppData\Roaming\MetaQuotes\Terminal\D0E8209F77C8CF37AD8BF550E51FF075\MQL5\Files\邮箱微信\\"


path =".\Files\邮箱微信\\"
if not os.path.exists(path):
      os.makedirs(path)
def youxiang(rec,str,file):
    receivers = rec.split(',')
    message = MIMEMultipart()
    str = MIMEText(str, 'plain', 'utf-8')
    message['From'] = Header("sjkj", 'utf-8')
    message['To'] = Header(rec, 'utf-8')
    subject = '期货消息'
    message['Subject'] = Header(subject, 'utf-8')
    message.attach(str)
    if file:
        try:
            wenjian = MIMEText(open(file, 'rb').read(), 'base64', 'utf-8')
            wenjian["Content-Type"] = 'application/octet-stream'
            wenjian.add_header('Content-Disposition', 'attachment', filename=file)
            message.attach(wenjian)
        except:
            print('没有该文件')


    user = '2424162555@qq.com'
    password = "sankacdymwykdjba"
    smtpObj = smtplib.SMTP()
    smtpObj.connect('smtp.qq.com', 25)
    smtpObj.login(user,password)
    try:
        smtpObj.sendmail('2424162555@qq.com', receivers, message.as_string())
    except:
        print("邮箱输入错误或者是空")

def weixin(friends,str,file):


    itchat.send(str, toUserName='filehelper')
    if file:
        try:
            itchat.send_file(file, toUserName='filehelper')
        except:
            print('没有该文件')
    for f in friends.split(','):
        friend = itchat.search_friends(f)
        try:
            itchat.send(str,toUserName=friend[0]['UserName'])
        except:

            print('没有该好友%s,或者没有输入微信好友'%(f))

        if file :
            try:
                itchat.send_file(file,toUserName=friend[0]['UserName'])
            except:
                print('没有该文件')
def friend(friends):
        for f in friends.split(','):
            friend = itchat.search_friends(f)

            try:
                friend[0]
                return 1
            except:
                print('没有该好友%s'%(f))

itchat.auto_login(hotReload=True,exitCallback=False)
# while True:
#     recv_weixin = input("接受信息微信好友名称:")
#     print(recv_weixin)
#     if  recv_weixin=="无":
#         break
#     elif friend(recv_weixin)==1:
#         break

recv_weixin=''

recv_youxiang=""
    #= input('接受信息邮箱:')
while True:
    file = os.listdir(path)
    for filename in file:
        if filename:
            filename = path+filename
            f = open(filename,'rb')
            data = f.read().decode('utf-16')
            if data:
                mtdata = data.split('^')
                if mtdata[0]=="youjian":
                    youxiang(recv_youxiang + mtdata[2],mtdata[3],mtdata[4])

                elif mtdata[0]=='weixin':
                    if (mtdata[2]):
                        weixin(recv_weixin  + mtdata[2], mtdata[3], mtdata[4])
                    else:
                        weixin(recv_weixin, mtdata[3], mtdata[4])

            f.close()
            os.remove(filename)




