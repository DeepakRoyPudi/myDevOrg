Public class AccountRelatedRecords{
    //List for Wrapper class
    public list<AccountWrapper> Wrapperlist{get;set;}
    //To fetch Picklist value
    public Account acc_type {get;set;}
    //Constructor
    public AccountRelatedRecords(){
    acc_type = new account();
    }
    //Method to get all accouonts
    public void getAcc(){        
         Wrapperlist = new list<AccountWrapper>();
         for(Account accnt:[Select  Name,type,(Select lastname,Phone from Contacts),(Select Name,CloseDate from Opportunities ) from Account Order By Name ASC]){
            Wrapperlist.add(new AccountWrapper(accnt));
         }
           system.debug('**Wrapperlist**'+Wrapperlist);
              
     }
     //Method to chnage type on button click
     public PageReference changeType(){
         list<Account> SelectedAccounts = new list<Account>();
         system.debug('**Wrapperlist**'+Wrapperlist);
         for(AccountWrapper WrapAccounts : Wrapperlist){
             system.debug('**WrapAccounts **'+WrapAccounts );
              if(WrapAccounts.Selected == true){
                    system.debug('**WrapAccounts.Selected**'+WrapAccounts.Selected);
                    WrapAccounts.acc.type=acc_type.type;
                    SelectedAccounts.add(WrapAccounts.acc);
              }
                              
          }
          if(SelectedAccounts.size()>0){
              system.debug('**SelectedAccounts.size()**'+SelectedAccounts.size());
              update SelectedAccounts;
              PageReference pageRef = new PageReference(ApexPages.currentPage().getUrl());
              pageRef.setRedirect(true);
              return pageRef;
            }else{
                 system.debug('**SelectedAccounts.size()**'+SelectedAccounts.size());
                 ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please Select Type and desired Accounts');
                 ApexPages.addMessage(myMsg);
                 return null;
             }
   
      }
     //Wrapper Class
     public class AccountWrapper{
        public Account acc{get;Set;}
        public Boolean Selected{get;set;}
        public AccountWrapper(Account account){
            acc = account;
            Selected = false;
        }
    }
}