Public class ParentChildQuery{
    public ParentChildQuery(){
        list<Contact> con = [select Id,FirstName,LastName,Email, Account.Name,Account.Industry from contact];
        System.debug('***con*'+con);
    }
}