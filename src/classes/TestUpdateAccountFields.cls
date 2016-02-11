@isTest
public class TestUpdateAccountFields
    {
        public static  testmethod void ActionTest()
        {
            Account testAcc=new Account();
            testAcc.Name='TestAccont';
            testAcc.Preference_Code__c='DE,NM,NC,NP,EE,NW,SA,EM,1X,PM,X,AN';
            
            Test.startTest();
            Insert testAcc;
            
            Contact oCon = new Contact();
            oCon.LastName = 'TestContact';
            oCon.AccountID = testAcc.ID;
            insert oCon; 
            
            testAcc.Preference_Code__c='EM';
            update testAcc;
            
            //system.assertEquals(TRUE,testAcc.Do_Not_Email__c);
            
            testAcc.Preference_Code__c=NULL;
            update testAcc;
            
            testAcc.Preference_Code__c='NM';
            update testAcc;
            
            Account testAcc1=new Account();
            testAcc1.Name='TestAccont';
            Insert testAcc1;
            
            Contact oCon1 = new Contact();
            oCon1.LastName = 'TestContact';
            oCon1.AccountID = testAcc1.ID;
            insert oCon1; 
            
            testAcc1.Preference_Code__c='DE,NM,NC,NP,EE,NW,SA,EM,1X,PM,X,AN';
            update testAcc1;
            Test.stopTest();
        }    
    }