public class CandidateListClass{

    // Controller code goes here
 public List<Candidate__c> CandidateList{get;set;}
   
    
    public CandidateListClass(){
    
    CandidateList= [Select First_Name__c,Education__c,City__c,State__c
                         From Candidate__c
                           ];
                         
    System.debug('@@@INsideConstructor'+CandidateList)  ;

   
    }
    }