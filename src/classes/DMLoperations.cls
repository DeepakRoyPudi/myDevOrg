Public class DMLoperations{
    public DMLoperations(){
       Account acc = new Account();
       acc.name='test1230';
       insert acc;
       
       Contact Con= new Contact();
       con.lastname='con1';
       insert con;
       
       lead l = new lead();
       l.LastName= 'Pudi';
       insert l;
       system.debug('Account ID::::'+acc.id);
       system.debug('Contact ID::::'+con.id);
       system.debug('Lead ID::::'+l.id);
    }
}