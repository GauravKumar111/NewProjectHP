trigger ParentToChild on Account (after update) {
  Set<Id> accountIds    = new Set<Id>();
   List<Account> accList = new List <Account>();
   List<Contact> conList = new List <Contact>();
   
       for(Account eachacc : trigger.new)
       {
         system.debug('@@@Insideloop');
        
            if(eachacc.Status__c == 'Closed Lost'){
              system.debug('@@@Insidecond1'+eachacc);
              accountIds.add(eachacc.Id); 
              }
        }
   
   accList  = [Select id,name, (Select id,name,Status__c from Contacts) From Account where ID IN :accountIds];
   
        for(Account eachacc : accList){
          
          for(Contact eachCon : eachacc.Contacts){

              eachCon.Status__c = 'Closed Lost';
              conList.add(eachCon);
          }
        }
        
    update conList ;
   
}