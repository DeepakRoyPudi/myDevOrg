public class UpdateAccountFields{
    
    public static Set<ID> setAccountIDs;
    public static Set<ID> setoldAccountIDs;
    public static void onAction(List<Account> newAccounts,Map<Id,Account> oldAccounts){
        setAccountIDs = new Set<ID>();
        setoldAccountIDs = new Set<ID>();
        for(Account newRecord : newAccounts){
            
            if(oldAccounts == NULL && newAccounts <> NULL){
                if(newRecord.Preference_Code__c <> NULL)
                    UpdateAccountFields.NullCheckvalidations(newRecord);
            }
            
            if(oldAccounts <> NULL && newAccounts <> NULL) {
                Account oldRecord = oldAccounts.get(newRecord.ID);
              
                if(newRecord.Preference_Code__c  <> NULL && oldRecord.Preference_Code__c  <> NULL
                   && newRecord.Preference_Code__c <> oldRecord.Preference_Code__c){
                   UpdateAccountFields.DeselectOld(newRecord);
                   UpdateAccountFields.NullCheckvalidations(newRecord);
                }
                   
                if(newRecord.Preference_Code__c  <> NULL 
                    && oldRecord.Preference_Code__c  == NULL)
                   UpdateAccountFields.NullCheckvalidations(newRecord);
                   
                if(newRecord.Preference_Code__c  == NULL 
                   && oldRecord.Preference_Code__c  <> NULL)
                    UpdateAccountFields.DeselectOld(newRecord);
            } 
        }
        
        List<Contact> lstUpdateOldCntact = new List<Contact>();
        for(Contact newContact : [SELECT Deceased__c from Contact WHERE AccountId IN: setoldAccountIDs]){
            newContact.Deceased__c = FALSE;
            lstUpdateOldCntact.add(newContact);
        }
        if(!lstUpdateOldCntact.isEmpty())
            upsert lstUpdateOldCntact;
        
        List<Contact> lstUpdateCntact = new List<Contact>();
        for(Contact newContact : [SELECT Deceased__c from Contact WHERE AccountId IN: setAccountIDs]){
            newContact.Deceased__c = TRUE;
            lstUpdateCntact.add(newContact);
        }
        if(!lstUpdateCntact.isEmpty())
            upsert lstUpdateCntact;
    }
    
    public static void NullCheckvalidations(Account newRecord){
        
        if(newRecord.Preference_Code__c.contains(',')){
            String[] sPreferenceCodes = newRecord.Preference_Code__c.split(',');
            
            for(String sCode : sPreferenceCodes)
                UpdateAccountFields.callValidations(sCode.trim().replace(' ',''),newRecord);
        }
        else
            UpdateAccountFields.callValidations(newRecord.Preference_Code__c.replace(' ','') ,newRecord);    
    }
    
    public static void DeselectOld(Account newRecord){
        setoldAccountIDs.add(newRecord.ID);
        newRecord.Do_No_Mail__c = FALSE;
        newRecord.Do_not_solicit__c = FALSE;
        newRecord.Do_not_call__c = FALSE;
        newRecord.Email_Only__c = FALSE;
        newRecord.No_Renewals__c = FALSE;
        newRecord.No_Appeals__c = FALSE;
        newRecord.Do_Not_Email__c = FALSE;
        newRecord.X1X_Renewal__c = FALSE;
        newRecord.No_Premium_Benefits__c = FALSE;
        newRecord.Do_not_rent_exchange__c = FALSE;
        newRecord.Treat_as_Anonymous__c = FALSE;    
    }
    
    public static void callValidations(String sCode,Account newRecord){
        if(sCode.equalsIgnoreCase('NM'))
            newRecord.Do_No_Mail__c = TRUE;
        if(sCode.equalsIgnoreCase('NC'))
            newRecord.Do_not_solicit__c = TRUE;
        if(sCode.equalsIgnoreCase('NP'))
            newRecord.Do_not_call__c = TRUE;
        if(sCode.equalsIgnoreCase('EE'))
            newRecord.Email_Only__c = TRUE;
        if(sCode.equalsIgnoreCase('NW'))
            newRecord.No_Renewals__c = TRUE;
        if(sCode.equalsIgnoreCase('SA'))
            newRecord.No_Appeals__c = TRUE;
        if(sCode.equalsIgnoreCase('EM'))
            newRecord.Do_Not_Email__c = TRUE;
        if(sCode.equalsIgnoreCase('1X'))
            newRecord.X1X_Renewal__c = TRUE;
        if(sCode.equalsIgnoreCase('PM'))
            newRecord.No_Premium_Benefits__c = TRUE;
        if(sCode.equalsIgnoreCase('X'))
            newRecord.Do_not_rent_exchange__c = TRUE;
        if(sCode.equalsIgnoreCase('AN'))
            newRecord.Treat_as_Anonymous__c = TRUE;
        if(sCode.equalsIgnoreCase('DE'))
            setAccountIDs.add(newRecord.ID);
    }
}