#property copyright "Copyright 2019, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"


class Weiyou
{
public:



  void 微信(string getstring="",string friends="",string getfile="")
  {
     printf("friend："+friends);
     int file_handle;
     int ran = MathRand();
     string name = Symbol();
     string str_ran=IntegerToString(ran);
     string 文件名=name+str_ran;
     string data = "weixin^^"+friends+"^"+getstring+"^"+getfile+"^";
     
     file_handle=FileOpen("邮箱微信\\"+文件名+"weixin.txt",FILE_TXT|FILE_SHARE_READ|FILE_SHARE_WRITE|FILE_WRITE);
     if(file_handle!=INVALID_HANDLE) 
     { 
      FileWrite(file_handle,data); 
      FileClose(file_handle); 
      printf("wenjian");
     } 
    } 
      void 邮箱(string getstring="",string friends="",string getfile="")
  {

     int file_handle;
     int ran = MathRand();
     string name = Symbol();
     string str_ran=IntegerToString(ran);
     string 文件名=name+str_ran;
     bool s=ChartScreenShot(0,name+".png",800,350);
     string data = "youjian^^"+friends+"^"+getstring+"^"+getfile+"^";
     file_handle=FileOpen("邮箱微信\\"+文件名+"youxiang.txt",FILE_TXT|FILE_SHARE_READ|FILE_SHARE_WRITE|FILE_WRITE);
     if(file_handle!=INVALID_HANDLE) 
     { 
      FileWrite(file_handle,data); 
      FileClose(file_handle); 
      printf("wenjian");
     }   
  }
    string 截图()
    {

     int ran=MathRand();
     string name = Symbol();
     string str_ran=IntegerToString(ran);
     string 文件名=name+str_ran+".png";
     bool s=ChartScreenShot(0,文件名,800,350);
     return 文件名;


    }
};