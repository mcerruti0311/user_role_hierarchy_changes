SELECT Id,
  Name,
  ReportsTo.Name,
  Salesforce_User__r.Name
FROM Contact
WHERE Employment_Status__c = 'Active'
  AND Salesforce_User__c != null
  AND ReportsTo.Name = 'Nicole Mogannam'
  AND Name != 'Samuel Nix'
