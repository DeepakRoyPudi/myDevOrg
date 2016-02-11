public with sharing class AccountconOppSearch {
   public list<Account> acclist{get;set;}
   public string searchstrng{get;set;}
    public AccountconOppSearch(){
         acclist=new list<Account>();
    }
    public void serachAccs(){
        //acclist=new list<Account>();
        acclist = [select name,(select name,phone from contacts),(select Amount,CloseDate from Opportunities) from account where name like '%searchstrng%'];
        for(Account a:acclist){
             system.debug('a----'+a);
            for(contact c:a.contacts){
                system.debug('c----'+c);
                for(opportunity o:a.Opportunities){
                    system.debug('o----'+o);
                }
            }
        }
    }
    
}