public with sharing class AggregateClass {
    public void closedoppsthisyear(){
        Map<Date,Decimal> intMap = new Map<Date,Decimal>();
        for(AggregateResult op : [SELECT sum(Amount)cnt,CloseDate
                                                    FROM Opportunity 
                                                    WHERE CloseDate = THIS_FISCAL_YEAR
                                                    group by CloseDate
                                                    ])
        {
            System.debug('amount is----'+op.get('cnt'));
            intMap.put((Date)op.get('CloseDate'),(Decimal)op.get('cnt'));
        }
            System.debug(intMap);}
/*2. Find total number of distinct Lead records on basis of 'Lead Source' having greater than 10 leads. Print this information.*/
    public void Leadcount(){
        for(AggregateResult op : [SELECT count(id)cnt,leadsource
                                                    FROM Opportunity 
                                                   
                                                    group by leadsource
                                                    ]){
        system.debug('*OP*'+OP);                                            
        }
    }
}