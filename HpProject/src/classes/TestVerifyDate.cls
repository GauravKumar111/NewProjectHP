@isTest
public class TestVerifyDate {
    @isTest static void testOldDate(){
        Date dateTest = VerifyDate.CheckDates(date.today(), date.today().addDays(-1));
        System.assertEquals(date.newInstance(2018, 2, 28), dateTest);
    }
    
    @isTest static void testLessThan28Days(){
        Date dateTest = VerifyDate.CheckDates(date.today(), date.today().addDays(20));
        System.assertEquals(date.today().addDays(20), dateTest);
    }
    
    @isTest static void testMoreThan28Days(){
        Date dateTest = VerifyDate.CheckDates(date.today(), date.today().addDays(31));
        System.assertEquals(date.newInstance(2018, 2, 28), dateTest);
    }

}