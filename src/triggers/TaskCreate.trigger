trigger TaskCreate on Account (after Insert) {
List<task> tsk = new list<task>();
    for(account acc:trigger.new){
        task t=new task(Ownerid = acc.OwnerId,Status='Not Started',Priority='normal',Subject='Meeting With' +acc.name,
                            WhatiD=ACC.ID);
        tsk.add(t);
    }
        insert tsk;
        system.debug('****'+tsk);
}