trigger ContactCountCheckTrigger on Contact (After Insert,After Update,After Delete) {
    ContactCountCheckTriggerHandler ContactCount = new ContactCountCheckTriggerHandler();
    AssignContactUserToAccount a = new AssignContactUserToAccount();
    if(trigger.isAfter){
        if(trigger.isInsert){
            ContactCount.insertContact(Trigger.new);
            a.afterInsertUserAssignment(Trigger.new);
        }
        if(trigger.isUpdate){
            //ContactCount.updateContact(Trigger.new,Trigger.old);
            ContactCount.contactafterupdate(Trigger.old);
            a.afterInsertUserAssignment(Trigger.new);
        }
        if(trigger.isDelete){
            ContactCount.deleteContact(Trigger.old); 
        }
    }

}