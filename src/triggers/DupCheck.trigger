trigger DupCheck on Contact (Before Insert, Before Update) {
    list<string> EmailList = new list<string>();
    list<String> PhoneList = new list<String>();
     
   if((trigger.IsBefore && trigger.IsInsert) ||(trigger.IsBefore && trigger.IsUpdate)){
    for(contact con:trigger.new){
        if(con.Email!=NULL){
            EmailList.add(con.Email);
        }  
        if(con.Phone!=NULL){
            PhoneList.add(con.Phone);
        } 
     }
     
     for(contact c :[Select Phone,Email from Contact where Email IN : EmailList or Phone IN : PhoneList]){
         for(contact con:trigger.new){
             if(con.Email==c.email){
                 con.adderror('Record with this Email aready exist');
             }
         }
        
     }
   
  
    
   

}
 }