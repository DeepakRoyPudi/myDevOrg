@isTest
public class TestUpdateContactFields{

    public static testmethod void onInsertContact(){
        
        Account oAccount = new Account();
        oAccount.Name='TestAccont';
        oAccount.Preference_Code__c= 'DE,NM';
        insert oAccount;
        
        Account oAccount1 = new Account();
        oAccount1.Name='TestAccont';
        oAccount1.Preference_Code__c= 'DE';
        insert oAccount1;
        
        Contact oContact = new Contact();
        oContact.LastName = 'TestContact';
        oContact.AccountID = oAccount.ID;
        
        //Test.startTest();
        insert oContact;
        
        oContact.AccountID = oAccount1.ID;
        update oContact;
        
        oContact.AccountID = NULL;
        update oContact;
        
        oContact.AccountID = oAccount.ID;
        update oContact;
        
        //Test.stopTest();
    }
}