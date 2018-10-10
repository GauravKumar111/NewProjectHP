public class AccountUpdateController{

    public AccountUpdateController(ApexPages.StandardController controller) {

    }
 // Controller code goes here
    
    
   // private String sortOrder = 'Position__c';
    public List<Account> AccountList{get;set;}
   // public id accid{get;set;}
    
    public AccountUpdateController(){
    
    AccountList = [Select id,name,AccountNumber,Industry,Phone
                         From Account];
                         
    System.debug('@@@INsideConstructor'+AccountList)  ;

    //accid   = '0017F00000DM1Q4';
    }
    }