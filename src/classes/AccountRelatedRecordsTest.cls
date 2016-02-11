@istest
public class AccountRelatedRecordsTest{
   
   public static testmethod void recstest(){
       //Creating Account/Contact/Opportunity required for our class
        Account acc = new Account();
        acc.name = 'test1';
        acc.type='prospect';
        insert acc;
        
        Contact Con = new Contact();
        con.accountId = acc.id;
        con.lastname = 'testcon1';
        con.phone='1234562711';
        insert con;
              
        Opportunity opp = new Opportunity();
        opp.Accountid= acc.id;
        opp.name='o1';
        opp.closedate=date.newInstance(1990, 11, 21);
      
      //Initialising the class
       AccountRelatedRecords acrecs = new AccountRelatedRecords();
       
        //Calling the methods  
        acrecs.getacc();
        system.debug('****acrecs.Wrapperlist****'+acrecs.Wrapperlist);
        acrecs.Wrapperlist[0].selected=true;
        PageReference pageRef = Page.AccountRelatedRecordsPage;
        Test.setCurrentPage(pageRef);
        acrecs.changeType();
        acrecs .acc_type.type='prospect';
        
        
        AccountRelatedRecords acrecs1 = new AccountRelatedRecords();
        acrecs1.getacc();
        system.debug('****acrecs1.Wrapperlist****'+acrecs1.Wrapperlist);
        PageReference pageRef_1 = Page.AccountRelatedRecordsPage;
        Test.setCurrentPage(pageRef_1);
        acrecs1.changeType();
        acrecs1.acc_type.type='prospect';
        
    } 
    
}