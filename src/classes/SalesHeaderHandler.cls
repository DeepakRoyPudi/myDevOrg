public with sharing class SalesHeaderHandler 
{
    public void UnableToCrossShip(list<Sales_header__c> salesHeaderlst)
    {
      List<RecordType> lstCaseRecordType = [Select Id, Name, DeveloperName From RecordType 
                                            Where DeveloperName = 'Assignment'
                                            And SObjectType = 'Case' 
                                            limit 1];
         list<case> caselst = new list<case>();
         
         for(Sales_header__c salesHeaderObj : salesHeaderlst)
         if (salesHeaderobj.Status__c == 'Open' && salesHeaderObj.Pick_Status__c == 'Open' && salesHeaderObj.Total_Amount__c > 300)
         {
            if(salesHeaderObj.Bill_to_Street__c <> salesHeaderObj.Ship_to_Street__c ||
                 salesHeaderObj.Bill_to_City__c <> salesHeaderObj.Ship_to_City__c || 
                 salesHeaderObj.Bill_to_PostalCode__c <> salesHeaderObj.Ship_to_PostalCode__c || 
                 salesHeaderObj.Bill_to_State__c <> salesHeaderObj.Ship_to_State__c)
            {
              case caseObj= new case();
                caseObj.AccountId=salesHeaderObj.Account__c;
                caseObj.ContactId=salesHeaderObj.Contact__c;
                //caseObj.RecordTypeId=lstCaseRecordType[0].Id;
                caseObj.Origin='Phone';
                caseObj.Reason='Unable to Cross Ship';
                caseObj.Priority='Medium';
                caseObj.Status='New';
                caseObj.Type='Unable to Cross Ship';
                caseObj.Open_Sales_Order__c = salesHeaderObj.Id;
                caseObj.TransactionStatus__c = salesHeaderObj.TransactionStatus__c;
                caseObj.Sales_Order_Number__c = salesHeaderObj.Name;
                caseObj.OrderDate__c = salesHeaderObj.Transaction_Date__c;
                caselst.add(caseObj);
                system.debug('***********Trigger Fired**************');
             }
        }
        insert caselst;
    }

}