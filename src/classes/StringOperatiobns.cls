public with sharing class StringOperatiobns {
    public string stringReplacement(string source){
        string str1;
        string str2;
        str1=source;
        str2=str1.replace('@','A');
        system.debug('str2***'+str2); 
        return str2;
    }
    public string substring(string source){
        string str3=source;
        string str4=str3.substring(0,4);
        system.debug('str4***'+str4); 
        return str4;
    }

}