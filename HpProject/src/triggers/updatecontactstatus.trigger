trigger updatecontactstatus on Account (before insert,before update) {
 for(Account eachacc : Trigger.new){
			
			if(eachacc.Status__c == 'Closed Won'){
				
				 for(Contact eachcon : eachacc.Contacts){
				
				     eachcon.Status__c = eachacc.Status__c;
					 
			     }
				
			}
			
		}
}