trigger UpdateAccountFields on Account(before insert,before update){
    
    if(Trigger.isBefore){
        if(Trigger.isInsert)
            UpdateAccountFields.onAction(Trigger.New,NULL);
            
        if(Trigger.isUpdate)
            UpdateAccountFields.onAction(Trigger.New,Trigger.OldMap);
    }
}