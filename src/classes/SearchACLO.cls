public with sharing class SearchACLO {
    public  list<account> acclist {get;set;}
    public  list<contact> conlist {get;set;}
    public  list<opportunity> opplist {get;set;}
    public string searchname{get;set;} 
    public SearchACLO(){
         acclist = [select id,name from account limit 3];
       conlist = [select id,lastname from contact limit 3];
       opplist = [select id,name from Opportunity limit 3];
    }
    
    public void searchAccount(){
        string s=searchname;
       acclist = [select id,name from account where name LIKE :(s+'%') limit 1];
       conlist = [select id,lastname from contact where name LIKE :(s+'%') limit 1];
       opplist = [select id,name from Opportunity where name LIKE :(s+'%') limit 1];
    }
    
    

}