public with sharing class Day9Set3 {
    /*Method which will accept Integer parameter and print Fibonacci series upto that
number*/
    public void Fibonacci(integer i){
        Integer a=0;
        Integer b=1;
        list<integer> fiblist = new list<integer>();
        fiblist.add(a);
        fiblist.add(b);
        integer result=0;
        while(result<i){
            
            result=a+b;
            if(result<=i){
                 fiblist.add(result);
            }
            a=b;
            b=result;
        }
        system.debug('fiblist: '+fiblist);
    }
    /*Method which will accept String as Parameter and performs following operations :
    String */
    public void stringOperations(string s){
        string b=s.replace('@','a');
        system.debug('String: '+b);
        string c=s.substring(10);
         system.debug('String: '+c);
          list<string> d= new list<string>();
          d=s.split(' ');
         system.debug('String: '+d);
         string e=s.remove(' ');
        system.debug('String: '+e);
    }
    
}