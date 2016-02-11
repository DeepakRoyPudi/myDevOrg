public with sharing class CampaignmemberHandler {

    TriggerSetting__c tri_setObj =new TriggerSetting__c();

    public void updateField(list<CampaignMember> CampaignMemberList){
        if(tri_setObj.Disable_Trigger__c == false)
        {
            for(CampaignMember campaignMemberObj : CampaignMemberList){
                if(campaignMemberObj.RSVP__c== false) {
                    CampaignMember Lead_Campaign_Member = [select LeadId from CampaignMember where id = : campaignMemberObj.id limit 1];
                    Lead Leadobj = [select RSVP__c from Lead where id = :Lead_Campaign_Member.LeadId limit 1];
                    Lead_Campaign_Member.RSVP__c=!Leadobj.RSVP__c;
                    update Lead_Campaign_Member;
                }
            }
        }
    }
}