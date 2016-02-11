public class pickValCount{
    public map<string,integer> productcountMap{get;set;}
     public map<string,integer> PotentialcountMap{get;set;}
    public pickValCount(){
        productcountMap = new map<string,integer>();
        PotentialcountMap= new map<string,integer>();
        
        AggregateResult[] results = [SELECT Count(Id) Quantity, Nature_Of_Request__c 
                                       FROM Case
                                       Where Nature_Of_Request__c != null 
                                       GROUP BY Nature_Of_Request__c];
            System.debug('results @@'+results );                           
        for(AggregateResult ar:results){
        
        system.debug('inside loop*****');
        system.debug('*********************'+productcountMap);
           
        productcountMap.put((string)ar.get('Nature_Of_Request__c'), (integer)ar.get('Quantity'));
          
           system.debug('@@ar@@'+productcountMap);
        }
           
        AggregateResult[] Potentialresults = [SELECT Count(Id) Quantity, PotentialLiability__c
                                       FROM Case
                                       Where PotentialLiability__c!= null 
                                       GROUP BY PotentialLiability__c];
  System.debug('results @@'+ Potentialresults );                           
     for(AggregateResult arp: Potentialresults ){
        system.debug('inside loop*****');
        system.debug('*********************'+PotentialcountMap);
            PotentialcountMap.put((string)arp.get('PotentialLiability__c'), (integer)arp.get('Quantity'));
           system.debug('@@ar@@'+ PotentialcountMap);
        }
    }
    
    public list<case> findCount(){
     system.debug('findcount****'+[Select Status,Type,Nature_Of_Request__c from Case]);
     return [Select Status,Type,Nature_Of_Request__c from Case];
     }
     
    
    
    public Integer getRequestCount(){
    system.debug('get--Request--'+productcountMap.get('Request'));
        return productcountMap.get('Request');
    }
    public Integer getComplaintCount(){
    system.debug('get--Complaint--'+productcountMap.get('Complaint'));
        return productcountMap.get('Complaint');
    }
     public Integer getGrievanceCount(){
     system.debug('get--Grievance--'+productcountMap.get('Grievance'));
        return productcountMap.get('Grievance');
    }
    public Integer getRepeatCount(){
     system.debug('get--Grievance--'+productcountMap.get('Repeat'));
        return productcountMap.get('Repeat');
    }
    
     public Integer getPotentialYesCount(){
    system.debug('get--Yes--'+productcountMap.get('Yes'));
        return PotentialcountMap.get('Yes');
    }
    
    public Integer getPotentialNoCount(){
    system.debug('get--No--'+productcountMap.get('No'));
        return PotentialcountMap.get('No');
    }
}