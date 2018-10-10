trigger HelloWorldTrigger on Account (before insert,before update) {
    
    for(Account eachAccount : Trigger.New) {
        
        if(eachAccount.Industry == 'Media')
        {
        
        System.debug('@@@Inside MY Trigger');
        eachAccount.Description = 'New description';
        eachAccount.Phone='+91';
        eachAccount.Type='Software';
        }
   }   
}