public with sharing class FibonacciSereis {
   list<integer> FSlist = new  list<integer>();
    public void fibNumber(integer n1,integer n2,integer count){
        integer n3;
      //  integer i;
       // integer count;
        for(Integer i=0;i<count;i++){
            n3=n1+n2;
            FSlist.add(n3);
            system.debug('**FSlist**'+n3);
            n1=n2;
            n2=n3;
        }
    }

}