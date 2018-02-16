Set<String> contacts = new Set<String> (
    [
      SELECT Salesforce_User__c,
      FROM Contact
      WHERE Employment_Status__c = 'Active'
        AND Salesforce_User__c != null
        AND ReportsTo.Name = 'Nicole Mogannam'
        AND Name != 'Samuel Nix'
    ]
);

System.assert(contacts.length() = 8);
