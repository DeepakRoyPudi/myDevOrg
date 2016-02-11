public with sharing class CaselistController{
   public string CaseStatus{get;set;}
   public List<Case> lstCase {get; set;}
    Public list<Case> Cases;
   
   public CaselistController(){}
   
       public list<selectoption> getStatusValues(){
       list<selectoption> options = new list<selectoption>();
       options.add(new selectoption('---None---','---None---'));
        Schema.DescribeFieldResult fieldResult = Case.Status.getDescribe();  
         List<Schema.picklistEntry> ple = fieldResult.getPicklistValues();    
          for(Schema.picklistEntry f:ple)    
            {    
                options.add(new selectOption(f.getLabel(),f.getValue()));                    
            }    
            return Options;    
        }      
    
    public void fetchCaseRecords(){
    //list<case> CaseLst = new list<case>();
        lstCase = [select AccountId,CaseNumber,Origin, Status from case where Status =: CaseStatus];
    //CaseLst.add(Showcase);
    //return Showcase;
    }
}