global with sharing class customlogincontroller{
    global string UserName{get;set;}
    global string Password{get;set;}
    global customlogincontroller(){}
    global pagereference forwardToCustomAuthPage(){
        return new pagereference ('/custom login');
    }
    
    global pagereference login(){
        return site.login(UserName,Password,null);
    }
    
}