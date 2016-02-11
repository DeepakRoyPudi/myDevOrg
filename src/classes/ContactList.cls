public class ContactList  {
   public list<contact> conlist = new List<contact>();
    public ContactList() {
        list<contact> c = [Select id,name,Phone from contact];
        for(contact con : c) {
           conlist.add(con); 
           
        }
       system.debug('**Conlist**'+conlist);
   }
 
}