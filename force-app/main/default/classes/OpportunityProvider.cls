public with sharing class OpportunityProvider {
   
    public OpportunityProvider() {
    }

    @AuraEnabled
    public static void createOppRecord (Opportunity objOpp){
        try {
            insert objOpp;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}