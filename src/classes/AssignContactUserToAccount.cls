Public class AssignContactUserToAccount{

    list<Account> accList= new list<Account>();    
    set<id> conAccId = new set<id>();
    Public void afterInsertUserAssignment(list<Contact> newCons){
        for(Contact con : newCons){
          conAccId.add(con.AccountId);
        }
        system.debug('<<<<<<<<< conAccId '+conAccId);
        String str;
        for(Account acc:[Select Id,Salesmanager__c,
                                (select Id,AccountId,SalesManager__r.Name from Contacts)
                         from Account
                         where Id =: conAccId]){
                                 system.debug('<<<<<<<<< in acc for ');
            for(Contact c : acc.Contacts){
                    system.debug('<<<<<<<<< in contact for '+c);
               str = c.SalesManager__r.Name;
                       system.debug('<<<<<<<<< str '+str);
            }
            acc.Salesmanager__c = str;
                    system.debug('<<<<<<<<< after for ' +acc.Salesmanager__c);
            accList.add(acc);
                    system.debug('<<<<<<<<<accList list '+accList);
        }
        update accList;
        
    }
}