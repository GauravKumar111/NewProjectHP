trigger BasicTrigger on Account(before insert,after insert,before update,after update,before delete,after delete,
                                  after undelete) {
   if(Trigger.isBefore){
       System.debug('Before Triggers');
       System.debug('New '+Trigger.New);
       System.debug('New Map '+Trigger.NewMap);
       System.debug('Old '+Trigger.Old);
       System.debug('Old Map '+Trigger.OldMap);
       
   }
   if(Trigger.isAfter){
       
        System.debug('After Triggers');
        System.debug('New '+Trigger.New);
        System.debug('New Map '+Trigger.NewMap);
        System.debug('Old '+Trigger.Old);
        System.debug('Old Map '+Trigger.OldMap);
   }

}