/*AccountId as key Entire Account object as Value*/
Public class MapStructure2{
   
    public MapStructure2(){
        
    }
    
    Public void MapWithListOfAccounts(){
     Map<id,Account> Mp = new Map<id,Account>();
        for(Account acc : [select Id,Name,Phone,Active__c from Account]){
        Mp.put(acc.Id,acc);
        } 
         system.debug('**Mp**'+Mp);  
    }
   
}