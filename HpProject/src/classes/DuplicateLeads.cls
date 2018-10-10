Global class DuplicateLeads implements Database.Batchable<SObject> , Database.Stateful {
    
   global List<DupLd__c> cbList = new List<DupLd__c>();
    
   global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator([Select Email, FirstName, LastName, Status, Company from Lead where Email != null]);
   }
   
   global void execute(Database.BatchableContext BC , List<Lead> scope){  //scope contain all existing lead emails
       
       List<Lead> duplicatelist = new List<Lead>();      //initially duplicatelist is empty
       Map<String , Lead> EmailMap = new Map<String , Lead>();    //initially EmailMap is empty
       for(Lead s : scope){        	  //iterating every email in scope with s variable
           if(!EmailMap.containsKey(s.Email)){         //checking whether EmailMap contains Email
               EmailMap.put(s.Email , s);               //if it doesn't contain we are adding it to EmailMap
           }
           else{
               duplicatelist.add(s);      	//if already there in EmailMap then adding it to duplicatelist
           }
       }   
           
           For(Lead ld : duplicatelist){
               cbList.add(
                   new DupLd__c(
                       FirstName__c = ld.FirstName,
                       LastName__c	= ld.LastName,
                       Email__c = ld.email,	// what all fields you need, you can map here
                       Status__c	= ld.Status,
                       Company__c = ld.Company
                   )
               );
           }
           if(cblist.size() > 0){
               insert cblist;
           }
           if(duplicatelist.size() > 0){
               duplicatelist.clear();
           }
       
       
   }
    global void finish(Database.BatchableContext BC){
         Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
            attach.setContentType('application/pdf');
            attach.setFileName('Duplicate Leads.pdf');
            String body;
            body = '<html><head><style>th{background-color: #ffd6cc;}td{border: 1px solid green;}table {border: 0px solid green;}</style></head>';
            body += '<body><h1 style=\"text-align:center;\"> List of possible duplicates</h1><br/><br/>'; 
            body += '<table align=\"center\" style="background-color:yellow; border: 1px;"><colgroup><col span="4" style="background-color:#ccebff"><col style="background-color:yellow"></colgroup>';
            body +='<tr><th>Lead Name</th>';
            body +='<th>Email</th>';
            body +='<th>Status</th>';
            body +='<th>Company</th></tr>';
            
            for(DupLd__c lb:cblist){
                body += '<tr><td> '+ lb.FirstName__c + ' ' + lb.LastName__c + '</td>';
                body += '<td>' + lb.Email__c + '</td>';
                body += '<td>' + lb.Status__c + '</td>';
                body += '<td>' + lb.Company__c + '</td></tr>';
                }
            body +='</body>';
            body += '</table></html>';
            System.debug('HTML is ' + body);        
            attach.Body = Blob.toPDF(body);
            attach.setInline(false);          
            
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setUseSignature(false);
            String[] toAddresses = new String[] {'sreenathbandi.ds@gmail.com', 'kuma.gaurav2811@gmail.com'};
                mail.setToAddresses(toAddresses);
            mail.setSubject('Possible Lead Duplicates ');
            mail.setHtmlBody('Here is the email you requested! Check the attachment!');
            mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach }); 
            // Send the email
            System.debug('You have made ' + Limits.getEmailInvocations() + ' email calls out of ' + Limits.getLimitEmailInvocations() + ' allowed');
    		Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });  
    }
}