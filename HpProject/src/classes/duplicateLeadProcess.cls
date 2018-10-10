public class duplicateLeadProcess {
public List<Lead> leadList{get;set;} //to display in the page
	public List<Lead> duplicatelist{get;set;}
	public List<DupLd__c> cbList{get;set;}
	public Map<String, Lead> EmailMap{get;set;}

    public void removeDuplicate(){
		system.debug('@@@Inside method');
	    leadList = new List<Lead>(); 
		leadList = [Select Email, FirstName, LastName, Status, Company from Lead where Email != null];
		system.debug('@@@1'+leadList);
        
		duplicatelist = new List<Lead>();
		EmailMap = new Map<String, Lead>();
		
		
		for(Lead eachlead : leadList){        //iterating every email in scope with s variable
            if(!EmailMap.containsKey(eachlead.Email)){       //checking whether EmailMap contains Email which is present in scope
                EmailMap.put(eachlead.Email, eachlead);               //if it doesn't contain we are adding it to EmailMap
            }
            else{
                duplicatelist.add(eachlead);      //if already there in EmailMap then adding it to duplicatelist
            }
        }
		
        system.debug('@@@2'+duplicatelist);
		
	    cbList = new List<DupLd__c>();
		for(Lead ld : duplicatelist){
            cbList.add(
                new DupLd__c(
                    FirstName__c = ld.FirstName,
                    LastName__c	= ld.LastName,
                    Email__c = ld.email,	               // what all fields you need, you can map here
                    Status__c	= ld.Status,
                    Company__c = ld.Company
                )
            );
        }
		
		try{
			if(cblist.size() > 0){
			insert cblist;
		  }
			
		} catch(Exception e){
			System.debug('The following exception has occurred: ' + e.getMessage());

		}
		
		
		
		try{
			if(duplicatelist.size() > 0){
			delete duplicatelist;
		  }
			
		} catch(Exception e){
			System.debug('The following exception has occurred: ' + e.getMessage());

		}
		
		
       
	}

}