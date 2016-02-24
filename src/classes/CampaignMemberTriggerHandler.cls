public with sharing class CampaignMemberTriggerHandler {
	public void CMUpdate(list<CampaignMember> CMlist){
		for(campaignmember cm : CMlist){
			if(cm.RSVP__c==false){
				campaignmember leadCampaignMember = [select leadid from campaignmember where id =: cm.id limit 1];
				system.debug('*leadid*'+leadCampaignMember);
				lead leadRSVP = [select RSVP__c from lead where id=:leadCampaignMember.leadid limit 1];
				leadCampaignMember.RSVP__c=!leadRSVP.RSVP__c;
				update leadCampaignMember;
				/*testing git*/
			}
		}
	}
    
} 