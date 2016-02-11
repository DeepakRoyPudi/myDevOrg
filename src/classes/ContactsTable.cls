public with sharing class ContactsTable {
    public list<contact> conlist{get;set;}
    public ContactsTable(){
         conlist  = new list<contact>();
         conlist=[select id,name,phone,email from contact];
    }
        
}