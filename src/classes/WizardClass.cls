public class WizardClass{
    public list<Account> accList{get;set;}
    public list<Contact> conList{get;set;}
    public list<Opportunity> opplist{get;set;}
    public Account accnt{get;set;}
    public contact cnt{get;set;}
    public Opportunity oppt{get;set;}
   public WizardClass(){
       getAccounts();
       getContacs();
       getOpportunities();
   }
    public void getAccounts(){
        accList=new list<Account>();
        for(Account acc:[select name,AccountSource,Phone,Industry,Rating from Account limit 5]){
    
           accList.add(acc); 
         
        }
        
          system.debug('**accList**'+accList.size());
        //update accList;
        //return accList;
        accnt=new Account();
    }
    public void getContacs(){
        cnt=new contact();
        conList= new list<Contact>();
        for(Contact con:[select lastname,email,Accountid,mailingcity from contact limit 5]){
        system.debug('**con**'+con);
            conList.add(con);
            system.debug('**conList**'+conList);
            }
           // update conList;
            //return conList;
    }
    public void getOpportunities(){
    oppt = new opportunity();
       opplist=new list<Opportunity>();
        for(Opportunity opp:[select Name,Type,CloseDate,Amount from Opportunity limit 5]){
        system.debug('**opp**'+opp);
            opplist.add(opp);
            system.debug('**opplist**'+opplist);
        }
        //update opplist;
        //return opplist;
    }
    public PageReference doCancel(){
        PageReference pageRef = ApexPages.currentPage();
        return null;
    }
    /* public PageReference doNext(){
        PageReference pageRef = new PageReference ('http://www.google.com');
        return null;
    }*/
    public PageReference doNext() {
    
       // System.debug('accountname:::'+accnt.name);
       // PageReference PageRef =new Pagereference('/apex/ContactsWizardPage?accountName=sudeep'); 
       PageReference PageRef = page.ContactsWizardPage;
       pageRef.getParameters().put('accountName',accnt.name);
       PageRef.setRedirect(false);
    return PageRef;
    }
    public PageReference doNextOpp() {
        PageReference PageRef = page.OpportunityWizardPage;
        PageRef.setRedirect(false);
        
    return PageRef;
    }
    Public void doSave(){
    }

}