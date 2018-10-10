trigger dupempl on Employee__c (before insert,before update) {
     List<Employee__c> emp = [Select Email__c,Phone_No__c from Employee__c];
     List<ParmanentEmp__c> pemp =new List<ParmanentEmp__c>();
        ParmanentEmp__c pa = new ParmanentEmp__c();
    if (trigger.isInsert){
        if (trigger.isbefore){
            for(Employee__c e: Trigger.new){
                for(Employee__c em: emp){
           
           if( em.Email__c == e.Email__c && em.Phone_No__c == e.Phone_No__c){
              
                  e.adderror('This is Duplicate record');
               
           }
                }
            
                } 
        }else if (Trigger.isAfter){
                    for(Employee__c i: Trigger.new){
                        
                        if (i.Gender__c == 'Male')
                             {
                               i.Name = 'Mr. ' + i.Name;
                              }
                        if (i.Gender__c == 'Female')
                               {
                              i.Name = 'Mrs. ' + i.Name;
                                }
                        
                     pa.name=i.name;
                     pa.Email__c=i.Email__c;
                     pa.Gender__c=i.Gender__c;
                     pa.Phone_No__c=i.Phone_No__c;
                     pemp.add(pa);
                    
                    } 
             insert pemp;  
                }            
        }
           
  
}