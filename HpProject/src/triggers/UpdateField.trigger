trigger UpdateField on Account(before insert,before update) 
{
   List<Account> accList = new List<Account>();

       for(Account eachacc : trigger.new)
       {
             system.debug('@@@Insideloop1');
             
             if(eachacc.Status__c == 'Closed Lost')
             {
             system.debug('@@@Insidecond2'+eachacc);
              
              eachacc.Sic = '1234';
              
             }
             
         
       }
}