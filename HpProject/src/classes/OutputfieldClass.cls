public class OutputfieldClass {
    
    public opportunity opp{get;set;}
    
    public OutputfieldClass(ApexPages.StandardController controller){
        id oppid = ApexPages.currentPage().
             getParameters().
             get('id');
        system.debug('@@@oppid' + oppid);
        
        /*this.opp = (Opportunity)controller.getRecord();
        
        opp = new Opportunity();
      opp =[Select id,name,accountId from Opportunity where id =: oppid];
        system.debug('@@@opp' + opp);
        
        Id Accid = opp.accountId;
        
        system.debug('@@@opp' + opp);*/
       
     }
    
     public PageReference nextPage() {
        PageReference pg = new PageReference('/apex/AccountDetail/');
        //pg.getParameters().put('str', strText);
        pg.setRedirect(true);
        return pg;
    }
}