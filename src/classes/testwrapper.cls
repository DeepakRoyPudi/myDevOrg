public with sharing class testwrapper{
   
    list<Account> Acc = new list<Account>();
    list<Contact> Con = new list<contact>();
    public list<Wrapper> LstWrap {get; set;}
   
    public list<Wrapper> getlstwrapInIt(){
    
    LstWrap = new list<Wrapper>();
    Acc = [select Name,Phone from Account];
   // Con = [select Mail__c,Languages__c from Contact];
        for(Integer i=0;i<Acc.size();i++){
        LstWrap.add(new wrapper(Acc[i].name,Acc[i].Phone,Con[i].Mail__c));
        }
     return LstWrap;
    }
    
    public class Wrapper{
        public string pname{get;set;}
        public string Wphone{get;set;}
        public boolean Wmail{get;set;}
        //public string WLang{get;set;}
        
        public wrapper(string Wname,string Wphone,boolean Wmail){
            this.pname=Wname;
            this.Wphone=Wphone;
            this.Wmail=Wmail;
            //this.WLang=WLang;
        }
    }

  
}