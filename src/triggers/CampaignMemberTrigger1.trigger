trigger CampaignMemberTrigger1 on CampaignMember (after insert, after update) {
	CampaignMemberTriggerHandler CMHandler = new CampaignMemberTriggerHandler();
	list<CampaignMember> CMlist = new list<CampaignMember>();
	CMHandler.CMUpdate(CMlist);
} 