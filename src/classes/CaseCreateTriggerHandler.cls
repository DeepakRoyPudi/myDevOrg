public class CaseCreateTriggerHandler{
   public void AccountInsert(list<account> accounts){
    list<contact> cntlist = new list<contact>();
        for(account acc:accounts){
            if(acc.Name!=null){
                Contact C = new Contact();
                c.lastname=acc.name;
                cntlist.add(c);
            }
        }
        insert cntlist;
        
    }    
}