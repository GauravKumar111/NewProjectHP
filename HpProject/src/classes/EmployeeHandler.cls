public class EmployeeHandler implements TriggerInterface
{
    
    
    public Boolean isActive()
    {
        if(Trigger_Manager__c.getAll().containsKey('EmployeeTrigger')) {
            return Trigger_Manager__c.getInstance('EmployeeTrigger').Is_Active__c;
        }
        return false;
    }
    
    public void beforeInsert() {
       
        EmployeeTriggerHelper.DuplicateCheck();
        //EmployeeTriggerHelper.UpdateAsPerGender();
    }
    
    public void beforeUpdate() {
       
        EmployeeTriggerHelper.DuplicateCheck();
        //EmployeeTriggerHelper.UpdateAsPerGender(); 
        
    }
    
    public void beforeDelete() {
        //empty
    }
    
    public void afterInsert()  {
        EmployeeTriggerHelper.SameRecord();
        
    }
    
    public void afterUpdate() {

        EmployeeTriggerHelper.SameRecord();
        
    }
    
    public void afterDelete() {
    }
    
    public void afterUndelete() {
        //empty
    }    
}