trigger Accountdup on Account (before insert) {
    set<string>s=new set<string>();
    for(Account op:trigger.new)
    {
        s.add(op.name); //S contains unique new records which contains name
    }
    
    list<Account>d=[select id,name from Account where name=:s];//D contains duplicates
    
    set<string>dupids=new set<string>();
    
    for(Account don:d)
    {
        dupids.add(don.name);
    }
    
    for(Account c:trigger.new)
    {
     if(c.name!=null)
     {
         if(dupids.contains(c.name))
         {
             c.name.adderror('already existing record');
         }
     }
    }
}