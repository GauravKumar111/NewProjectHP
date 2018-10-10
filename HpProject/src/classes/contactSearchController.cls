public class contactSearchController {
   @AuraEnabled
   public static List<contact> getContactList(string searchTerm){
       string modifiedsearchterm = '%'+searchTerm+'%';
       List<contact> matchedcontactList = [Select name,email from contact where name like :modifiedsearchterm];
       return matchedcontactList;
   }

}