trigger Test1 on Account (before insert) {
list<Account> newlist=trigger.new;
    if (trigger.isInsert){
        if (trigger.isbefore){
            for (Account a:newlist){
                list<Account> temac=[select name from Account where name=:a.name];
                if (temac.size()>0){
                    a.addError('no duplicate is allowed');
                    
                }
            }
        }
    }
}