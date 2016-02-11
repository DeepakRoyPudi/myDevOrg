public with sharing class smstype{
	public SMS_History__c SmsHistory{get;set;}
	public list<SMS_History__c> Smslist{get;set;}
	public string smstype{get;set;}
	public smstype(){
		SmsHistory= new SMS_History__c();
		Smslist = new list<SMS_History__c>();
	}
	
	public void SmsGo(){
		Smslist = [Select Id,Account__c,Created_Date__c,CRN__c,Mobile_Number__c,Remark__c,Sms_Text__c,SMS_Type__c,Status__c from SMS_History__c where SMS_Type__c=:SmsHistory.SMS_Type__c];
	}
}