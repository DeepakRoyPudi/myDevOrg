public with sharing class picklistentryController{
  public List<SelectOption> Types {get;set;}
    public picklistentryController(){
    
    }
  
    public List<SelectOption> getTypes(){
    
            Schema.sObjectType sobject_type = Merchandise__c.getSObjectType();
            Schema.DescribeSObjectResult sobject_describe = sobject_type.getDescribe();
            Map<String, Schema.SObjectField> field_map = sobject_describe.fields.getMap();
           List<Schema.PicklistEntry> pick_list_values = field_map.get('Fruittype__c').getDescribe().getPickListValues();
            List<selectOption> options = new List<selectOption>();
            
             for (Schema.PicklistEntry a : pick_list_values) {
                      options.add(new selectOption(a.getLabel(), a.getValue()));
              }
      return options;
    }
}