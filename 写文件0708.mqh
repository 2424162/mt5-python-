#property copyright "Copyright 2019, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"


class 写文件
{
public:

  void 微信(string getstr,string friends="")
  {
     printf("friend："+friends);
     int file_handle;
     int ran = MathRand();
     string name = Symbol();
     string str_ran=IntegerToString(ran);
     string 文件名=name+str_ran;
     string data = "weixin^^"+friends+"^"+getstr;
     
     file_handle=FileOpen("邮箱微信\\"+文件名+"weixin.txt",FILE_TXT|FILE_SHARE_READ|FILE_SHARE_WRITE|FILE_WRITE);
     if(file_handle!=INVALID_HANDLE) 
     { 
      FileWrite(file_handle,data); 
      FileClose(file_handle); 
      printf("wenjian");
     } 
    } 
      void 邮箱(string getstr,string friends="")
  {

      int file_handle;
     int ran = MathRand();
     string name = Symbol();
     string str_ran=IntegerToString(ran);
     string 文件名=name+str_ran;
     string data = "youjian^^"+friends+"^"+getstr;
     file_handle=FileOpen("邮箱微信\\"+文件名+"youxiang.txt",FILE_TXT|FILE_SHARE_READ|FILE_SHARE_WRITE|FILE_WRITE);
     if(file_handle!=INVALID_HANDLE) 
     { 
      FileWrite(file_handle,data); 
      FileClose(file_handle); 
      printf("wenjian");
     }   
  }
};