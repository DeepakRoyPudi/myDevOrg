public class UpdateContactFields{
    
    public static Map<ID,String> mapgetPreference;
    
    public static void onAction(List<Contact> newContacts,Map<Id,Contact> oldContacts){
        mapgetPreference = new Map<ID,String>();
        
        for(Account newRecord : [SELECT ID,Preference_Code__c FROM Account])
            mapgetPreference.put(newRecord.ID,newRecord.Preference_Code__c);
            
        for(Contact newRecord : newContacts){
            if(oldContacts == NULL && newContacts <> NULL){
                if(newRecord.AccountID <> NULL){
                    if(mapgetPreference.get(newRecord.AccountID) <> NULL){
                       UpdateContactFields.CheckDeceased(newRecord);
                   }
                }                    
            }
            
            if(oldContacts  <> NULL && newContacts <> NULL) {
                Contact oldRecord = oldContacts.get(newRecord.ID);
              
                if(newRecord.AccountID <> NULL && oldRecord.AccountID <> NULL
                   && newRecord.AccountID <> oldRecord.AccountID ){
                   if(mapgetPreference.get(newRecord.AccountID) <> NULL){
                       newRecord.Deceased__c = FALSE;
                       UpdateContactFields.CheckDeceased(newRecord);
                   }
                }
                   
                if(newRecord.AccountID <> NULL 
                    && oldRecord.AccountID == NULL){
                   if(mapgetPreference.get(newRecord.AccountID) <> NULL)
                       UpdateContactFields.CheckDeceased(newRecord);
                }
                   
                if(newRecord.AccountID == NULL 
                   && oldRecord.AccountID <> NULL)
                    newRecord.Deceased__c = FALSE;
            } 
        }
    }
    
    public static void CheckDeceased(Contact newRecord){
        
        if(mapgetPreference.get(newRecord.AccountID).contains(',')){
            String[] sPreferenceCodes = mapgetPreference.get(newRecord.AccountID).split(',');
            
            for(String sCode : sPreferenceCodes)
                UpdateContactField(sCode.trim().replace(' ',''),newRecord);                        
        }
        else
            UpdateContactField(mapgetPreference.get(newRecord.AccountID).replace(' ',''),newRecord);
    }
    
    public static void UpdateContactField(String sCode,Contact newRecord){
        if(sCode.equalsIgnoreCase('DE'))
            newRecord.Deceased__c = TRUE;
    }
}