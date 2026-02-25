public with sharing class AccountService {
    
    public static List<Account> updateAccountRating(List<Account> accountsList) {
        
        if (accountsList == null || accountsList.isEmpty()) {
            return new List<Account>();
        }
        
        for (Account acc : accountsList) {
            if (acc.AnnualRevenue != null) {
                if (acc.AnnualRevenue > 1000000) {
                    acc.Rating = 'Hot';
                } else if (acc.AnnualRevenue > 500000) {
                    acc.Rating = 'Warm';
                } else {
                    acc.Rating = 'Cold';
                }
            }
        }
        
        update accountsList;
        return accountsList;
    }
}