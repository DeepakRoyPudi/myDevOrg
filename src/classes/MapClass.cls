public with sharing class MapClass {
    public list<user> Userlist = new list<user>();
    public map<id,user> usermap = new map<id,user>();
    public void activeUsers(){
        Userlist = [select id,name,isActive from user where isActive=true];
        system.debug('*Userlist*'+Userlist);
        for(User user : Userlist){
             usermap.put(user.id,user);
        }
       
        system.debug('*usermap*'+usermap);
    }
    
    public void Accoutnmap(){
        map<id,account> accmap = new map<id,account>([select id,name from account]);
        for(id i:accmap.keyset()){
            account a=accmap.get(i);
            System.debug('a'+a);
            
        }
    }
    
}