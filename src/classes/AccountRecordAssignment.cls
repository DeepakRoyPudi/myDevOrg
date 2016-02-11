/*         Name                Version         Authour
    AccountRecordAssignment       1.0          Deepak Pudi
    
    Description: This Apex class is Used to fetch the Data from Account and 
    display it on table along with one action column.
    Action Column Contains two sets of links Edit/Delete and Save/Cancel which toggle on click
*/
public class AccountRecordAssignment{
//List for wrapper Class
public list<ActionWrapper> Wraperlist{get;set;}
//Variable used to store row number particular record from page
public integer OperatingRow{get;set;}
//Constant For defining Query Size
public static final Integer QUERY_LIMIT = 100;
//Constructor
public AccountRecordAssignment(){
         getRecords();
    }
   //This Number is used to get all the records from account and store it in wrapper list
    public void getRecords(){
        Wraperlist = new  list<ActionWrapper>();
        Integer RowNo=0; 
        for(Account a:[Select Name,Phone,SLAExpirationDate__c,Industry,UpsellOpportunity__c from Account limit :QUERY_LIMIT]){
            ActionWrapper aw = new ActionWrapper(a,RowNo);
               if(aw!=NULL){
                Wraperlist.add(aw);
                RowNo=RowNo+1;
              }
        }
    }
   //This method is used to give edit mode for records on page 
   Public Void toEdit(){
       system.debug('OperatingRow***'+OperatingRow);
       Wraperlist[OperatingRow].isEdit=true;
   }
   //This method is used to save the records to object
   Public Void toSave(){
        system.debug('OperatingRowsave***'+OperatingRow);
        //upsert Wraperlist[OperatingRow-1];
         Wraperlist[OperatingRow].isEdit=false;
        try{
            update Wraperlist[OperatingRow].Acc;
        }catch (DmlException e) {
            System.debug('Error Occured '+e.getMessage());
         }
   }
  //This method is used cancel the edited records on page 
   public void toCancel(){
        system.debug('OperatingRow***'+OperatingRow);
       Wraperlist[OperatingRow].isEdit=false;
   }
  //This method is used to Delete the records 
   public Pagereference toDelete(){
    system.debug('OperatingRowdelete***'+OperatingRow+'***ACC::'+Wraperlist[OperatingRow-1].Acc);
    delete (new Account(id=Wraperlist[OperatingRow].Acc.id));
    getRecords();
    return null;
   }
     //Wrapper class is used to build action column on page along with account records  
        public class ActionWrapper{
        public boolean isEdit{get;set;}
        public Account Acc{get;set;}
        public Integer RowNumber{get;set;}
       //Wrapper class constructor
        public ActionWrapper(Account a,Integer RN){
            this.Acc=a;
            isEdit=false;
            this.RowNumber=RN;
        }
      
    }
}