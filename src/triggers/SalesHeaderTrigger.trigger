trigger SalesHeaderTrigger on Sales_Header__c (after insert, after update) {
  SalesHeaderHandler salesHeaderHObj = new SalesHeaderHandler();
        salesHeaderHObj.UnableToCrossShip(Trigger.new);
        }