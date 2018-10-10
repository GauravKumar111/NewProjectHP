public class p1 {
    public list<Account> acc{get;set;}
    public p1(){
   acc=[select name,type,industry,phone from account where industry='technology'];
        
    }
 

}