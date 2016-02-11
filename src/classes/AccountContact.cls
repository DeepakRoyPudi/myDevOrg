Public class AccountContact{
    list<contact> contactlist = new list<contact>();
    public AccountContact(){
        list<contact> con = [select id, name, phone from Contact where Account.name='Test'];
        for(contact c : con){
        contactlist.add(c);
    }
    }
}