/*AccountName as key and AccountId as Value*/
Public class Mapstructure1{
  Map<string,Id> AccountMap = new Map<string,Id>();
    public Mapstructure1(){
        for(Account Acc:[select Id,Name from Account LIMIT 50000]){
            AccountMap.put(Acc.Name,Acc.Id);
        }
        system.debug('**AccountMap**'+AccountMap);
       
    }
}