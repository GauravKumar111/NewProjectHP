public class p2 {
    public account acc{get;set;}
    public p2(){	
         acc=new account();
    }
    public pagereference save(){
        insert acc;
        return null;
    }
    
    public pagereference edit(){
        pagereference pr = new pagereference('/apex/p2');
        return pr;
    }
    
                                          
                                        	
     
}