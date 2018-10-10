trigger test3 on Account (before insert) {
list<Account> newlist=trigger.new;
Map<id,Account> newMap=trigger.newmap;
 Map<id,Account> oldMap=trigger.oldmap;
    
    if (trigger.isInsert){
        
        if (trigger.isbefore){
            
            Set<String> anames = new set<string>();
            for (Account a:newlist){
                anames.add(a.name);
            }
            List<Account>temac=[select name from Account where name in : anames];
            map<String,Account> tmap=new map<string,Account>();
            for (Account a:temac){
                tmap.put(a.name,a);
                
            }
            for (Account a:newlist){
                if (tmap.get(a.name)!=Null){
                    a.addError('duplicate not allowed');
                    
                }
            }
        }
        }
}