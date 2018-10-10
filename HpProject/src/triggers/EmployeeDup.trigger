trigger EmployeeDup on Employee__c (before insert,before update) {
     List<Employee__c> emp = [Select Email__c,Phone_No__c from Employee__c];
     List<ParmanentEmp__c> pemp =new List<ParmanentEmp__c>();
        //ParmanentEmp__c pa = new ParmanentEmp__c();
    
    for(Employee__c e: Trigger.new){
     if (e.Gender__c == 'Male')
        {
            e.Name = 'Mr. ' + e.Name;
        }
       
       if (e.Gender__c == 'Female')
        {
            e.Name = 'Mrs. ' + e.Name;
        }
        for(Employee__c em: emp){
           
           if( em.Email__c == e.Email__c && em.Phone_No__c == e.Phone_No__c){
              
                  e.adderror('This is Duplicate record');
                }
            
            
     }
        
       
      
        
        
    pemp.add(new ParmanentEmp__c(name=e.name,Email__c=e.Email__c,Gender__c=e.Gender__c,Phone_No__c=e.Phone_No__c));
     /*  pa.name=e.name;
       pa.Email__c=e.Email__c;
       pa.Gender__c=e.Gender__c;
       pa.Phone_No__c=e.Phone_No__c;
       pemp.add(pa);*/
    
   }
  insert pemp;
    
}