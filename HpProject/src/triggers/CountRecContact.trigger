trigger CountRecContact on Contact (after insert, after update, after delete, after undelete) {
 
    List<Contact> con = Trigger.isDelete ? Trigger.old : Trigger.new;
                                                              //system.debug('@@'+con);
    Set<Id> acctIds = new Set<Id>();
    for (Contact c : con) {
        if (c.AccountId != null) {
            acctIds.add(c.AccountId);
         system.debug('@@'+acctIds);    
        }
    }
    List<Account> acctsToRollup = new List<Account>();
    for (AggregateResult ar : [SELECT AccountId AcctId, Count(id) ContactCount 
                               FROM Contact 
                               WHERE AccountId in: acctIds 
                               GROUP BY AccountId]){
                                   Account a = new Account();
                                   a.Id = (Id) ar.get('AcctId');
                                   a.CountCont__c = (Integer) ar.get('ContactCount');
                                   acctsToRollup.add(a);
                               }
       update acctsToRollup;

    List<Account> acctsToRollup2 = new List<Account>();
    for (AggregateResult ar2 : [SELECT AccountId AcctId2, Count(id) SalesCount 
                               FROM Contact 
                               WHERE AccountId in: acctIds AND RecordTypeId='0127F000001CKJ4'
                               GROUP BY AccountId]){
                                   Account a2 = new Account();
                                   a2.Id = (Id) ar2.get('AcctId2');
                                   a2.Sales_count__c = (Integer) ar2.get('SalesCount');
                                   acctsToRollup2.add(a2);
                               }
       update acctsToRollup2;
    
    List<Account> acctsToRollup3 = new List<Account>();
    for (AggregateResult ar3 : [SELECT AccountId AcctId3, Count(id) ServiceCount 
                               FROM Contact 
                               WHERE AccountId in: acctIds AND RecordTypeId='0127F000001CK0k'
                               GROUP BY AccountId]){
                                   Account a3 = new Account();
                                   a3.Id = (Id) ar3.get('AcctId3');
                                   a3.Service_Count__c = (Integer) ar3.get('ServiceCount');
                                 
                                   acctsToRollup3.add(a3);
                               }
       update acctsToRollup3;
    
      List<Account> acctsToRollup4 = new List<Account>();
    for (AggregateResult ar4 : [SELECT AccountId AcctId4, Count(id) MarketingCount 
                               FROM Contact 
                               WHERE AccountId in: acctIds AND RecordTypeId='0127F000001CKJ9'
                               GROUP BY AccountId]){
                                   Account a4 = new Account();
                                   a4.Id = (Id) ar4.get('AcctId4');
                                   a4.Marketing_count__c = (Integer) ar4.get('MarketingCount');
                                 
                                   acctsToRollup4.add(a4);
                               }
       update acctsToRollup4;
  
    
     List<Account> lstmax = [Select Id,name,Sales_count__c,Marketing_count__c,Service_Count__c,RecordTypeName__c from Account where Id IN:acctIds];
       for(Account a:lstmax){
           system.debug('sale '+a.Sales_count__c+'Market'+a.Marketing_count__c+'Service'+a.Service_Count__c);
           if(a.Sales_count__c > a.Marketing_count__c){
               System.debug('true');
               if(a.Sales_count__c > a.Service_Count__c){
                   a.RecordTypeName__c = 'Sales';
                   System.debug('sales max');
               }
               else{
                   a.RecordTypeName__c = 'Service';
                   System.debug('Service max');
               }
           }
           Else{
               System.debug('False');
               if(a.Marketing_count__c > a.Service_Count__c ){
                   System.debug('Service max');
                   a.RecordTypeName__c = 'Marketing';
               }
               
               else{
                   System.debug('Service max');
                   a.RecordTypeName__c= 'Service';
               }
           }
           
       }
       update lstmax;
     
}