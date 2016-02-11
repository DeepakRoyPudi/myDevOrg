public class EvenOdd{
    public string FindNumType(integer i){
        if(math.mod(i,2)==0){
            system.debug(i + 'is an Even Number');
            return 'even';
        }else
            system.debug(i+ 'is Odd number');
            return 'odd';
    }
}