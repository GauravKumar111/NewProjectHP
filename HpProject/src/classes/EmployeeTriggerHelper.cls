public class EmployeeTriggerHelper {
    
    public Static Void DuplicateCheck(){
        for(Employee__c emp:(List<Employee__c>)Trigger.new)
        {
            string Name = emp.Name;
            string str;
            if(trigger.isInsert){
                List<Employee__c> emplist=[select ID from Employee__c where Email__c=:emp.Email__c and Phone_No__c=:emp.Phone_No__c];
                
                if(emplist.size()>0)
                {
                    emp.Email__c.adderror('You cannot create a dulplicate Employee Record');
                }
                if(emp.Gender__c=='Male'){
                    emp.Name = 'Mr.'+emp.Name;
                }
                else if(emp.Gender__c=='Female'){
                    emp.Name = 'Mrs.'+emp.Name;
                    
                }
                
            }
            if(trigger.isUpdate){
                if(emp.Gender__c=='Male'){
                    if(name.startsWith('Mr.')){
                        str = name.remove('Mr.');
                        emp.Name = 'Mr.'+str;
                    }
                    else if(name.startsWith('Mrs.')){
                        str = name.remove('Mrs.');
                        emp.Name = 'Mr.'+str;
                    }else {
                        emp.Name = 'Mr.'+emp.Name;
                    }
                    
                }
                if(emp.Gender__c=='Female'){
                    if(name.startsWith('Mrs.')){
                        str = name.remove('Mrs.');
                        emp.Name = 'Mrs.'+str;
                    }
                    else if(name.startsWith('Mr.')){
                        str = name.remove('Mr.');
                        emp.Name = 'Mrs.'+str;
                    }else {
                        emp.Name = 'Mrs.'+emp.Name;
                    }    
                }
            }
        }
    }
    Public Static Void SameRecord(){
        List<ParmanentEmp__c> perEmpInsert =new List<ParmanentEmp__c>();
        List<ParmanentEmp__c> perEmpupdate =new List<ParmanentEmp__c>();
        for(Employee__c emp:(List<Employee__c>)Trigger.new)
        {
            if(trigger.isInsert){
                perEmpInsert.add(new ParmanentEmp__c(Employee__c=emp.Id,name=emp.name,Email__c=emp.Email__c,Gender__c=emp.Gender__c,Phone_No__c=emp.Phone_No__c));
                
            }
            
                perEmpupdate = [Select id,name,Email__c,Employee__c,Gender__c,Phone_No__c From ParmanentEmp__c Where Employee__c=:emp.Id];
                //perEmpupdate.add(new ParmanentEmp__c(Employee__c=emp.Id,name=emp.name,Email__c=emp.Email__c,Gender__c=emp.Gender__c,Phone_No__c=emp.Phone_No__c));
            if(trigger.isUpdate){
            for(ParmanentEmp__c per:perEmpupdate){
                per.Name = emp.Name;
                per.Email__c = emp.Email__c;
                per.Gender__c = emp.Gender__c;
                per.Phone_No__c = emp.Phone_No__c;
                
                
            }
            }
        }
        Insert perEmpInsert;
        Update perEmpupdate;
        
    }
}
/* List<Employee__c> emp = [Select Email__c,Phone_No__c from Employee__c];
for(Employee__c e: (List<Employee__c>)Trigger.new){
for(Employee__c em: emp){
if( em.Email__c == e.Email__c && em.Phone_No__c == e.Phone_No__c){
}
}
}
for(Employee__c ep: (List<Employee__c>)Trigger.new){
if (ep.Gender__c == 'Male')
{
ep.Name = 'Mr. ' + ep.Name;
}
if (ep.Gender__c == 'Female')
{
ep.Name = 'Mrs. ' + ep.Name;
}  
} 
}
=======================*/


/*public Static Void someMethod2(){
List<ParmanentEmp__c> pemp =new List<ParmanentEmp__c>();
for(Employee__c e2: (List<Employee__c>)Trigger.new)
{
pemp.add(new ParmanentEmp__c(Employee__c=e2.Id,name=e2.name,Email__c=e2.Email__c,Gender__c=e2.Gender__c,Phone_No__c=e2.Phone_No__c));
/*    ParmanentEmp__c pa = new ParmanentEmp__c();
pa.name=e.name;
pa.Email__c=e.Email__c;
pa.Gender__c=e.Gender__c;
pa.Phone_No__c=e.Phone_No__c;
pemp.add(pa);
}
upsert pemp;  */