trigger TriggerUpdateContctFields on Contact(before insert,before update){
    
    if(Trigger.isBefore){
        if(Trigger.isInsert)
            UpdateContactFields.onAction(Trigger.New,NULL);
            
        if(Trigger.isUpdate)
            UpdateContactFields.onAction(Trigger.New,Trigger.OldMap);
    }
}