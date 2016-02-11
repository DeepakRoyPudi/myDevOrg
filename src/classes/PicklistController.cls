public class PicklistController{
    public string SelectedObject{get;set;}
    public string SelectedState{get;set;}
    public Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
    public PicklistController(){
        SelectedObject = 'Account';
    }
    
    public list<selectoption> getObjectName(){
       list<selectoption> Objectnames = new list<selectoption> ();
       list<string> entities = new list<string>(schemaMap.keyset());
       for(string f : entities ){
           Objectnames .add(new selectoption('f','f'));
       }
       return Objectnames ;
    }
}