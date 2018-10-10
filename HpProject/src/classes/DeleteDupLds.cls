Global class DeleteDupLds implements Database.Batchable<SObject> , Database.Stateful {
 
 global Database.QueryLocator start(Database.BatchableContext BC){
     return Database.getQueryLocator([select FirstName__c, LastName__c, Email__c, Company__c, Status__c from DupLd__c]); //taking all the email from Lead object
 }
   
   global void execute(Database.BatchableContext BC , List<DupLd__c> scope){
   
               //iterating every email in scope with s variable
            delete scope;
       
   }
   global void finish(Database.BatchableContext BC){
          
      }

}