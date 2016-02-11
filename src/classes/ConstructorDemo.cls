public with sharing class ConstructorDemo {
	integer a,b;
	public ConstructorDemo(){
		system.debug('*****Constructor witout Parameters*******');
	}
	public ConstructorDemo(integer x,integer y){
		this.a=x;
		this.b=y;
	}
	
	public integer addparameters(){
		return a+b;
	}

}