/*         Name                        Version         Authour
    AccountRecordAssignmentTest          1.0          Deepak Pudi
    
    Description: Test Class For AccountRecordAssignment
*/
@isTest
Public class AccountRecordAssignmentTest{
   //Main Test method that calls all the methods of the Class
    Public  static testmethod  void accountRecords(){
        list<Account> a=AccountRecordAssignmentTest.CreateAccount();
            insert a; 
        AccountRecordAssignment AccountRecordAssignment = new AccountRecordAssignment();
          //integer OperatingRow = 4;
          AccountRecordAssignment.OperatingRow=2;
            AccountRecordAssignment.toEdit();
            AccountRecordAssignment.toSave();
            AccountRecordAssignment.toCancel();
            AccountRecordAssignment.toDelete();  
    }
    //Creating Test Data for Account
    Public static list<account> CreateAccount(){
      //Initialising Date to be used in Dummy Data
      date mydate = date.newInstance(2015, 08, 19);
      system.debug('mydate***'+mydate.format());
       list<account> Alist=new list<Account>();
            Account acc = new Account();
                acc.Name='Deepak';
                acc.Phone='12345678';
                acc.SLAExpirationDate__c=mydate;
                acc.UpsellOpportunity__c='Maybe';
                Alist.add(acc);  
            Account acc1 = new Account();
                acc1.Name='Deepak Test';
                acc1.Phone='14445678';
                acc1.SLAExpirationDate__c=System.today();
                acc1.UpsellOpportunity__c='Maybe';
                Alist.add(acc1);
            Account acc2 = new Account();
                acc2.Name='Deepak Te';
                acc2.Phone='14445578';
                acc2.SLAExpirationDate__c=System.today();
                acc2.UpsellOpportunity__c='Maybe';
                Alist.add(acc2); 
                return Alist;
    }
}