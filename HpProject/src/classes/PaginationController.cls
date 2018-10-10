public class PaginationController {
 private integer count=1;   //to track the function calling
    private integer counter=0;   //to keep track of offset
    private integer list_size=10; //to set the page size to show the rows/records
    public integer total_size; //used to show user the total size of the list   
    Public List<Account> cnd {get; set;}
   
    public PaginationController (){
        cnd= new List<Account>();
        cnd = [select Name, AccountNumber,Industry from Account ORDER BY Name limit 10];
        total_size=[select count() from Account];    //set the total size in the constructor
        
    }

    public PageReference Beginning() {  //when the user clicked the beginning button
        counter=0;
        cnd=[select Name, AccountNumber,Industry from Account ORDER BY Name limit 10];
        return null;
    }

    public PageReference Previous() { //user clicked the previous button
         counter -= list_size;
         if(count==1){
         cnd=[select Name, AccountNumber,Industry from Account ORDER BY Name limit 10];
         count++;
         }
         else 
         cnd=[select Name, AccountNumber,Industry from Account ORDER BY Name limit 10];
         return null;
    }
    
    public PageReference Next() {    //user clicked the Next button
        counter += list_size;
        cnd=[select Name, AccountNumber,Industry from Account ORDER BY Name limit 10];
        return null;
        
    }

    public PageReference End() {      //user clicked the End button
        counter = total_size - math.mod(total_size, list_size);
         cnd=[select Name, AccountNumber,Industry from Account ORDER BY Name limit 10];
        return null;
    }
    
     public Boolean getDisabledPrevious() {           //this will disable the previous and beginning buttons
        if(counter>0)
             return false;
         else 
             return true;
        
    }


     public Boolean getDisabledNext() {            //this will disable the next and end buttons
        if (counter + list_size < total_size) 
            return false; 
        else 
            return true;
     
    }
    
     public Integer getTotal_size() {
      return total_size;
   }
    public Integer getPageNumber() {
        return counter/list_size + 1;
    }

    public Integer getTotalPages() {
        if (math.mod(total_size, list_size) > 0) {
         return total_size/list_size + 1;
      } 
      else {
         return (total_size/list_size);
      }
    }


}