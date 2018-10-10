public class JobAppListController{

    // Controller code goes here
    
    
    private String sortOrder = 'Position__c';
    public List<Job_Application__c> JobAppList{get;set;}
    public id accid{get;set;}
    
    public JobAppListController(){
    
    JobAppList = [Select id,name,Candidate__c,Position__c,Status__c,Total_Rating__c 
                         From Job_Application__c
                         Where Status__c = 'HIred'  ];
                         
    System.debug('@@@INsideConstructor'+JobAppList)  ;

    accid   = '0017F00000DM1Q4';
    
    }
    
    
     public PageReference redirecttoFirstVfPage() {
        PageReference pg = new PageReference('/apex/firstCustompage');
        //pg.getParameters().put('str', strText);
        pg.setRedirect(true);
        return pg;
    }
    
     public PageReference redirecttoStdListController() {
        PageReference pg = new PageReference('/apex/StdListControllerfilter');
        //pg.getParameters().put('str', strText);
        pg.setRedirect(true);
        return pg;
    }
    
    
    public void SendEmail()
    {
    Contact con = [Select id,email from Contact where Firstname = 'Ank'];
    
    EmailTemplate et = [SELECT id FROM EmailTemplate WHERE Name = 'Marketing: Product Inquiry Response'];

    
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    mail.setTargetObjectId(con.id);
    mail.setTemplateId(et.id);
    Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
    
        
    
    
    /*
    public List<Job_Application__c> getJobApplicatipnList() {
        
        List<Job_Application__c> results = Database.query(
            'SELECT Id,Candidate__c,Position__c,Status__c,Total_Rating__c ' +
            'FROM  Job_Application__c' +
            'ORDER BY ' + sortOrder + ' ASC ' +
            'LIMIT 10'
        );
        
        return results;
       
    }
    
    */

}