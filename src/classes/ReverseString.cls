public with sharing class ReverseString {
    public string RevSting(string source){
       string str1;
       string str2;
       str1=source;
       str2= str1.reverse();
       system.debug('reverse string----------------  '+str2);
       return str2; 
       
    } 
    public void splitWithSpace(string source){
        List<string> strArray=source.split(' ');
        for(String s:strArray){
            System.debug(s);
        } 
        string str6=source.remove(' ');
         System.debug(str6);
         string str7=str6.touppercase();
           System.debug(str7);
            string str8=str7.tolowercase();
           System.debug(str8);
           Assignment2Staticclass.samplestaticclass();
             System.debug( Assignment2Staticclass.samplestaticclass());
    }
    
    public void stringOccarences(string source){
        
    }
}