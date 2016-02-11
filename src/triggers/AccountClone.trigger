trigger AccountClone on Account (after insert) {
    list<Account> listToClone = new list<Account>();// = trigger.new.deepclone();

    if(checkRecursive.runOnce()){
    for (Account a :trigger.new ){
    Account clonedAcc = a.clone(false, false, false, false);
    listToClone.add(clonedAcc);
    }
   
        insert listToClone;
 
  
    }
}