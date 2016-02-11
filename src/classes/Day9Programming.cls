public virtual  class Day9Programming {
    /*Show the demo of constructor*/
    public Day9Programming(){
        system.debug('Im in Constructor');
    }
   
   
    /*Method which will accept Integer as parameter and determine & print the number is
    even or odd*/
    
    
    public virtual string  findEvenOdd(integer i){
        if(math.mod(i,2)==0){
            system.debug(i+' is an Even Number');
            return 'Even';
        }else
            system.debug(i+' is an Odd Number');
            return 'Odd';
        }
/*Method which will accept integer parameter and build an print array of upto that integer
parameter.*/
    public integer buildArray(integer i){
        integer [] myarray = new integer[i];
        integer s =myarray.size();
        system.debug('array size: '+s);
        return s;
    }
/*Method which will accept array of integers as parameters write a code to*/
    /*Sort the array in ascending order*/
    public List<Integer> ascendingOrder(List<Integer> arrays){
        system.debug('array : '+arrays);
        arrays.sort();
         system.debug('Array after Ascending : '+arrays);
         return  arrays;
    }
     /*Sort the array in descending order*/
  public List<Integer> descendingOrder(List<Integer> arrays){
        system.debug('array : '+arrays);
        arrays.sort();
         //system.debug('Array after Ascending : '+arrays);
         //return  arrays;
         list<integer> tempArray = new list<integer>();
         for(integer i=arrays.size()-1;i>=0;i--){
            tempArray.add(arrays[i]);
         }
         system.debug('Array after descending Order : '+tempArray);
         system.debug('The Maximum Number In the list is '+tempArray[0]);
         system.debug('The Minimmum Number In the list is '+tempArray[tempArray.size()-1]);
         return  tempArray;
    }
    /*e. Print duplicates and its occurrences in the array*/
    public void printDuplicates(list<integer> ln){
        map<integer,integer> DupMap = new  map<integer,integer>();
        for(integer i:ln){
            if(!DupMap.containskey(i)){
                DupMap.put(i,1);
            }else{
                 DupMap.put(i,DupMap.get(i)+1);   
            }
        }
        system.debug('DupMAp'+DupMap);
        
    }
    /*Method to display the summation of numbers from zero to parameter number*/
    public void summation(integer i){
      /*  list<integer> ln = new   list<integer>();
        //list<integer> sn = new list<integer>();
        for(integer n=i;n>0;n--){
            ln.add(n);
        }
        system.debug('fsdfsfg'+ln);
        integer sum=0;
        for(integer a:ln){
            sum=sum+a;
        }
        system.debug('dsda'+sum);*/
        integer sum=0;
        for(integer n=i;n>0;n--){
            sum=sum+n;
        }
        system.debug('dsda'+sum);
    }
    /*Method which will calculate the simple interest (Accept necessary parameters)*/
    Public void simpleIntrest(decimal p,decimal n,decimal r){
        decimal Interest=0;
        Interest  = p * r/100 * (n/365);
        Interest = Interest.setScale(2);
        system.debug('Final Interest'+Interest);
        
    }
    /*2. Write a method which will accept following parameters & return the result :
Parameter: String : (Value here will be any of the following :
‘SUM’,’SUB’,’MUL’,’DIV’)*/
public decimal MthOperations(string a,decimal b,decimal c){
    decimal result=0;
        if(a.equalsIgnoreCase('sum')){
            result = b+c;
            system.debug('sum result'+result);
        }else if(a.equalsIgnoreCase('SUB')){
             result = b-c;
             system.debug('SUB result'+result);
        }else if(a.equalsIgnoreCase('MUL')){
             result = b*c;
             system.debug('MUL result'+result);
        }else if(a.equalsIgnoreCase('DIV')){
             try{
                 result = b/c;
                 system.debug('DIV result'+result);
             }catch(exception e){
                system.debug('Excetion :'+e);
             }
             
        }
        return result;
}
/*Query on Account object/ records and show/print each account record using :
        a. Traditional for loop
        b. Advanced for loop
        c. While loop*/
  public void Acc(){
    list<Account> acclist = new list<Account>();
    acclist=[select id,name,phone from account];
    for(integer i=0;i<acclist.size();i++){
    
    system.debug('Account: '+ acclist[i]);
    }
    for(account a:acclist){
        system.debug('acc: '+ a);
    }
    integer i=0;
    while(i<acclist.size()){
         system.debug('While Account: '+ acclist[i]);
         i++;
    }
    
  }
  /*Query on all Lead records & add ID of record to the set and print that set*/
  public void leadset(){
    list<lead> ld = new list<lead>();
    set<id> setid = new set<id>();
    ld=[select id,name from lead];
    for(lead l:ld){
         setid.add(l.id);
         
    }
    system.debug('lead list'+setid);
   
  }
  public void leadstatus(){
    list<lead> leadlist = new list<lead>();
     list<lead> finalleadlist = new list<lead>();
    leadlist = [select name,status from lead where Status =:'Open - Not Contacted'];
    system.debug('leadlist'+leadlist);
    for(lead l:leadlist){
         system.debug('leadlist'+l);
          l.status='Working - Contacted';
          finalleadlist.add(l);
    }
    update finalleadlist;
   system.debug('Updated leadlist'+finalleadlist);
   
    
  }

   
    
}