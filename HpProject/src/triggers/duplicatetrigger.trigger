trigger duplicatetrigger on Inputout__c (before insert) {
    set<string>s=new set<string>();
    for(Inputout__c op:trigger.new)
    {
        s.add(op.Doctor_Name__c);
    }
    list<Inputout__c>d=[select id,Doctor_Name__c from Inputout__c where Doctor_Name__c=:s];
set<string>dupids=new set<string>();
    for(Inputout__c don:d)
    {
        dupids.add(don.Doctor_Name__c);
    }
    for(Inputout__c c:trigger.new)
    {
     if(c.Doctor_Name__c!=null)
     {
         if(dupids.contains(c.Doctor_Name__c))
         {
             c.Doctor_Name__c.adderror('already existing record');
         }
     }
    }
}