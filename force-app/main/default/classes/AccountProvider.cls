public with sharing class AccountProvider {
    public AccountProvider() {

    }

    @AuraEnabled  // called method from lwc 
    public static String createAccountRecord(Account objAcc){  // takes input as account objaccount
        try {
            insert objAcc;
            return 'Record created successfully....!!!!';
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static Account searchAccount(Account objAcc){
        try {
            if(objAcc !=null) { // checker
            return  [select id, Name, Type, Rating, SLA__c from Account where Name=: objAcc.Name]  ; // returns the value of account object                
            }
            else{
                return null;
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }


    @AuraEnabled
    public static string updateAccount(Account objAcc){
        try {
            if(objAcc !=null) { // checker
            database.update(objAcc,false);
            return 'Record updated successfully.....!!!!';
            }
            else{
                return 'Something went wrong....!!!!';
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static string deleteRecord(Account  objAcc){
        try {
            if(objAcc !=null) { // checker
                delete objAcc;
                return 'Record Deleted Successfully....!!!!';
            }
            else{
                return 'Something went wrong....!!!!';
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static string undeleteAccount(Account objAcc){
        try {
            Account objAccUndelete = [select Id, Name, Rating from Account where Name=:objAcc.Name and isdeleted=true LIMIT 1 All ROWS];
            system.debug('@account object='+objAccUndelete);
            undelete objAccUndelete;
            return 'Record has been undeleted Successfully....!!!!';
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Account> getAllAccountsTypes(String accType){  // another method for taking input as account object accType
        try {
            if(string.isNotBlank(accType)){  // checker

                return([select Id, Name, Type, SLA__c from Account where Type=:accType]); // returns the value of account object
            }
            else{
                return null;
            }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

}
