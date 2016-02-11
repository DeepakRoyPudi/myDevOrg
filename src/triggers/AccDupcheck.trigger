trigger AccDupcheck on Account (before insert,before update) {
    Accounthandler1 accdupcheck = new Accounthandler1();
    if(trigger.isBefore){
        if(trigger.isInsert){
            accdupcheck.dupAccountCheck(trigger.new);
        }// if(trigger.isUpdate){
           //  accdupcheck.dupAccountCheck(trigger.new);
        //}
        
    }
    

}