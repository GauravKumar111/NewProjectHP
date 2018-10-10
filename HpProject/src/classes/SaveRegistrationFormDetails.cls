public class SaveRegistrationFormDetails {

     @AuraEnabled 
    public static Id SaveRegistrationDetail(Registration_Form__c regForm){
        insert regForm;
        return regForm.id;
    }
    
    @AuraEnabled 
      public static Id SaveEducationDetail(EducationDetail__c EduDet){
        insert EduDet;
        return EduDet.id;
    }
    
}