public class arraysize{
    public integer arrysize(integer i){
        integer[] myarray = new integer[i];
        integer s=myarray.size();
        system.debug('integer passes is :i'+'actual size is'+ s);
        return s;
    }
}