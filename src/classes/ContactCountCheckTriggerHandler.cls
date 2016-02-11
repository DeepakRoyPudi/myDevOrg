public class ContactCountCheckTriggerHandler {
    list<Account> accList = new list<Account>();
    set<id> accId = new set<id>();
    Map<id,String> namesMap = new Map<id,String>(); 
    public void insertContact(list<Contact> newCon){
        system.debug('*Inside-insertContact*');
	    string Str;
	    Decimal sum=0;
        for(Contact con : newCon){
            system.debug('*Inside-FirstContactForLoop*');
            accId.add(con.AccountId);
         }
        for(Account acc : [Select Id,No_of_Contacts__c,Assosiated_Contacts__c,Total_Contacts_Revenue__c,
        (Select Id,AccountId, Name,Revenue__c from Contacts) from Account Where Id =: accId]){
          acc.No_of_Contacts__c = acc.contacts.size();
          system.debug('*Inside-Account-ForLoop*');
          for(Contact con : acc.contacts){
              system.debug('*Inside-nested-ForLoop*');
              if(!namesMap.containskey(con.Accountid)){
                     namesMap.put(con.Accountid,con.Name);
                      system.debug('*Inside-Ifloop-For Name*'+namesMap);
              }else{
                   system.debug('*Inside-Elseloop-For Name*'+namesMap);
                  str = namesMap.get(con.Accountid);
                  str = str +','+ con.Name;
                   system.debug('*Inside-Elseloop-ForSTR*'+str);
                  namesMap.put(con.Accountid,str);
                   system.debug('*Inside-Elseloop-ForSTR*'+namesMap);
                  str = '';
               }
               if(con.Revenue__c != null){
                    system.debug('*Inside-ifloop-Revenue*');
	          	    sum = sum + con.Revenue__c;
	          	     system.debug('*Inside-ifloop-Revenue*'+sum);
               }
          }
          acc.Total_Contacts_Revenue__c = sum;
          system.debug('*acc.Total_Contacts_Revenue__c*'+acc.Total_Contacts_Revenue__c);
          if(!namesMap.containskey(acc.id))
              acc.Assosiated_Contacts__c = '';
          else{
              acc.Assosiated_Contacts__c = namesMap.get(acc.Id);
               system.debug('*acc.Assosiated_Contacts__c*'+acc.Assosiated_Contacts__c);
          }
          accList.add(acc); 
        }
        if(accList.size() > 0)
         system.debug('*Inside-accList*'+accList);
         try{
            update accList;
         }catch(DmlException e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
         }
    }
    public void updateContact(list<Contact> newCon ,list<Contact> oldCon ){
        system.debug('*Inside-updateContact*');
        insertContact(newCon);
        insertContact(oldCon);
    }
    public void deleteContact(list<Contact> oldCon ){
        system.debug('*Inside-deleteContact*');
        insertContact(oldCon);
    }
    public void contactafterupdate(list<Contact> oldCon ){
        system.debug('*Inside-contactafterupdate*');
        insertContact(oldCon);
    }


}