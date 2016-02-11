Public Class UserRecordMap{
   // Map<Id,User> UserMap = new Map<Id,User>();
    public UserRecordMap(){
      Map<Id,User> UserMap = new Map<ID, User>([select Id,isActive from User Where isActive=true]);
     /*  for(user u=usr){
           UserMap
       }
   
        system.debug('****'+UserMap);*/
    }
}