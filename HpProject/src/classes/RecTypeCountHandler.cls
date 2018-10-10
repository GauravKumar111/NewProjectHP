public class RecTypeCountHandler implements TriggerInterface 
{
    public Boolean isActive()
    {
        if(Trigger_Manager__c.getAll().containsKey('RecTypeCountTrigger')) {
            return Trigger_Manager__c.getInstance('RecTypeCountTrigger').Is_Active__c;
        }
        return false;
    }
    
    public void beforeInsert() {
        
    }
    
    public void beforeUpdate() {
        
        
    }
    
    public void beforeDelete() {
        //empty
    }
    
    public void afterInsert()  {
        CountRecordTypeHelper.CountContact();
    }
    
    public void afterUpdate() {
        CountRecordTypeHelper.CountContact();	
        
    }
    
    public void afterDelete() {
        CountRecordTypeHelper.CountContact();
    }
    
    public void afterUndelete() {
       CountRecordTypeHelper.CountContact();
    }
}