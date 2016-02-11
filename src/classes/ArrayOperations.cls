public with sharing class ArrayOperations {
integer temp;
	public void ascending(list<integer> myarray){
		myarray.sort();
		system.debug(myarray+'myarray');
	}
	public void descending(list<integer> myarray){
		for(integer i=myarray.size()-1;i>0;i--){
			system.debug('--myarray--'+myarray[i]);
		}
	}
	
	public integer MaxNumber(list<integer> myarray){
		integer temp=0;
		for(integer i=0;i<myarray.size();i++){
			if(myarray[i]>temp)
			temp=myarray[i];
		}
		return temp;
	}
	public integer minNumber(list<integer> myarray){
		integer temp=100;
		for(integer i=0;i<myarray.size();i++){
			if(myarray[i]<temp)
			temp=myarray[i];
		}
		return temp;
	}
}