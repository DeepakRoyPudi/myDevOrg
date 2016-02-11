trigger TrainingTrigger on Account (before insert,before update) {
    if(trigger.isBefore && trigger.isInsert){
        system.debug('**Trigger.new**'+trigger.new);
    }
    if(trigger.isbefore && trigger.isUpdate){
        system.debug('** Trigger.Old**'+trigger.old);
        system.debug('**Trigger.newmap**'+trigger.newMap);
         system.debug('**Trigger.old**'+trigger.oldMap);
        
    }
    

}