@isTest
private class AccountServiceTest {
    
    @isTest
    static void testUpdateAccountRating() {
        
        // Create test accounts
        List<Account> testAccounts = new List<Account>{
            new Account(Name = 'High Revenue', AnnualRevenue = 2000000),
            new Account(Name = 'Medium Revenue', AnnualRevenue = 700000),
            new Account(Name = 'Low Revenue', AnnualRevenue = 100000)
        };
        
        insert testAccounts;
        
        Test.startTest();
        List<Account> updatedAccounts = 
            AccountService.updateAccountRating(testAccounts);
        Test.stopTest();
        
        // Query updated records
        Map<String, Account> resultMap = new Map<String, Account>();
        for (Account acc : [
            SELECT Name, Rating 
            FROM Account 
            WHERE Id IN :updatedAccounts
        ]) {
            resultMap.put(acc.Name, acc);
        }
        
        System.assertEquals('Hot', resultMap.get('High Revenue').Rating);
        System.assertEquals('Warm', resultMap.get('Medium Revenue').Rating);
        System.assertEquals('Cold', resultMap.get('Low Revenue').Rating);
    }
    
    
    @isTest
    static void testEmptyList() {
        
        Test.startTest();
        List<Account> result = 
            AccountService.updateAccountRating(new List<Account>());
        Test.stopTest();
        
        System.assertEquals(0, result.size());
    }
    
    
    @isTest
    static void testNullInput() {
        
        Test.startTest();
        List<Account> result = 
            AccountService.updateAccountRating(null);
        Test.stopTest();
        
        System.assertEquals(0, result.size());
    }
}