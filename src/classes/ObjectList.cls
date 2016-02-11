public with sharing class ObjectList{
    public string Objectname{get;set;}
    public string Fieldname{get;set;}
    public  list<selectoption> ObjLst = new list<selectoption>();
    Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
   
   public ObjectList(){
      Objectname= 'account';
   }
   
   public list<selectoption> getObjectnames(){
       list<string> entities = new list<string>(gd.keyset());
        entities.sort();
        for(string name : entities ){
            ObjLst.add(new selectoption(name , name));
        }
            return ObjLst;
    }
    
    public List<SelectOption> getObjectFields() 
     {
            Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
            Schema.SObjectType ObjectSchema = schemaMap.get(Objectname);
            Map<String, Schema.SObjectField> fieldMap = ObjectSchema.getDescribe().fields.getMap();
            List<SelectOption> fieldNames = new List<SelectOption>();
            for (String fieldName: fieldMap.keySet()) 
            {  
                fieldNames.add(new SelectOption(fieldName,fieldName));
              
            }
            return fieldNames;
      }       
    
}