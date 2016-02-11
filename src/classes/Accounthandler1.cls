public class Accounthandler1{
    map<string,account> existingaccounts = new  map<string,account>();
    public void dupAccountCheck(list<Account> newacc){
        for(account acc : [select id,name,phone,fax from account]){
            existingaccounts.put(acc.phone+'-'+acc.fax,acc);
        }
            for(Account a : newacc){
                string str = a.phone+'-'+a.fax;
                if(existingaccounts.containskey(str)){
                a.addError('Account with this Phone or Fax already Exist');
                }
            }
        
        
       
    }
}