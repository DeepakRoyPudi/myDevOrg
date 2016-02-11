Trigger Trainingtrigger3 on Account(before insert,before update,before Delete,
                                     after insert,after update,after delete,after Undelete) {
        if(trigger.isInsert && trigger.isbefore){
            system.debug('**BeforeInsert**'+trigger.new);
        }
        if(trigger.isInsert && trigger.isAfter){
            system.debug('**AfterInsert**'+trigger.new);
             system.debug('**AfterInsert**'+trigger.newmap);            
        }
        if(trigger.isUpdate && trigger.isBefore){
           system.debug('**BeforeInsert**'+trigger.new);
           system.debug('**BeforeInsert**'+trigger.newmap);  
           system.debug('**BeforeInsert**'+trigger.old);  
           system.debug('**BeforeInsert**'+trigger.oldmap);           
        }
        if(trigger.isUpdate && trigger.isAfter){
             system.debug('**BeforeInsert**'+trigger.new);
             system.debug('**BeforeInsert**'+trigger.newMap);
             system.debug('**BeforeInsert**'+trigger.old);
             system.debug('**BeforeInsert**'+trigger.oldMap);
        }
        if(trigger.isDelete && trigger.isBefore){
             system.debug('**BeforeInsert**'+trigger.old);
              system.debug('**BeforeInsert**'+trigger.oldMap);
        }



}