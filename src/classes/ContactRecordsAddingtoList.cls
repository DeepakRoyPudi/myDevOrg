public with sharing class ContactRecordsAddingtoList {
    public list<contact> contactList = new list<contact>();
    public list<Account> accountlist = new list<Account>();
    public list<opportunity> Opplist = new list<opportunity>();
    public void getContacts(){
        contactList = [select name from contact];
        system.debug('**contactList**'+contactList);
    }
    public void contactsAssosiatedWithAccount(){
        //contactList.clear();
         //system.debug('**contactList**'+contactList);
         
         accountlist=[select name,(select name from contacts)from Account];
         system.debug('**accountlist**'+accountlist);
         for(Account acc:accountlist){
            for(contact c:acc.contacts){
                system.debug('**c**'+c);
            }
         }
    }
    
    public void AccountCountLeadOpportunities(){
        accountlist.clear();
        contactList.clear();
        Opplist.clear();
        Account a = new account();
        a.name='assignment1';
        insert a;
        Contact c = new contact(lastname='assin2');
        insert c;
        opportunity o = new opportunity();
        o.Name='AssinOpp';
        o.CloseDate=system.today()+10;
        o.StageName='Prospecting';
        insert o;
        
    }
  public void parentChildrelationship(){
    list<account> aclist = new list<account>();
    aclist=[select name,(select name from contacts)from account];
    system.debug('**aclist**'+aclist);
    for(account a:aclist){
        for(contact c:a.contacts){
            system.debug('c'+c);
        }
    }
  }
  public void ActiveUser(){
    /*list<user> userlist = new list<user>();
    userlist=[select name from user where IsActive=true];
    map<id,user> userMap = new map<id,user>();
    for(User uObj : userlist) {
        if(userMap.containskey(uObj.id))
        userMap.put(uObj.id,uObj);
    }
    system.debug('*userlist*'+userlist);*/
    map<id,user> userMap = new map<id,user>([select name from user where IsActive=true]);
    system.debug('userMap'+userMap);
  } 
  
  public void Maptasks(){
    list<account> accountlist = new list<account>();
    map<string,id> accountmap = new map<string,id>();
    accountlist=[select id,name,Industry from account];
     system.debug('*accountlist*'+accountlist);
    for(account acc:accountlist){
        if(!accountmap.containskey(acc.id))
        accountmap.put(acc.name,acc.id);
        system.debug('*accountmap*'+accountmap);
    }
  }

}