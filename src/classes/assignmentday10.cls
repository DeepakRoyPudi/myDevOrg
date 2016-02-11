public with sharing class assignmentday10 {
        public void mpicklist(){
            list<account> acclist = new list<account>();
            acclist=[select name from account where Enrolment__c includes('2010') OR Enrolment__c includes ('2013;2014','2011')]; 
            system.debug('acclist'+acclist);
        }

}