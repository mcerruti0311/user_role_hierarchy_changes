Select Id, Name, Employee_Number__c, ReportsTo.Name, ReportsTo.Employee_Number__c
FROM Contact
WHERE ReportsTo.Name = 'Nicole Mogannam'
AND Salesforce_User__c != null
AND Salesforce_User__r.IsActive = true
