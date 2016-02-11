trigger CampaignmemberTrigger on CampaignMember (before insert) {
    CampaignmemberHandler CampM_H = new CampaignmemberHandler();
    list<CampaignMember> CampaignMemberlst = new list<CampaignMember>();
        CampM_H.updateField(CampaignMemberlst);
     }