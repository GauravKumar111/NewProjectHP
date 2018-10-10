public class ConListController{

    // Controller code goes here
    
    
    public List<Contact> conList{get;set;}
    public id accid{get;set;}
    
    public ConListController(){
        
    accid = ApexPages.currentPage().getParameters().get('id');      
    System.debug('@@@'+accid);
    
    conList = [Select id,name,Accountid
                         From Contact
                         where Accountid =: accid 
                         limit 5];
                         
        System.debug('@@@1'+conList);

    }
    

}