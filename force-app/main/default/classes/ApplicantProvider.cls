public with sharing class ApplicantProvider {
    public ApplicantProvider() {

    }
        @AuraEnabled // called method from lwc 
        public static string createApplicantRecord(Applicant__c objApplicant){ // takes input as applicant objapplicant
            try {
                insert objApplicant;
                return 'Record created successfully....!!!!';
                
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }


        @AuraEnabled                                          // APID
        public static List<Address__c> searchAdressess(string applicantName){  // sendind APID-0001 in string variable
            try {
                ID appId = [select id from Applicant__c where Name=:applicantName].id; // applicant record id 15 digit

                return ([select Id, Name, Country__c, State__c, City__c from Address__c where Applicant__c=:appId]); // returning address from applicant record id
                
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }

    }

