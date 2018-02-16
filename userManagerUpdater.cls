/**
 * Run this script in an Execute Anonymous Window to update a user record with
 * a new Manager
 */

 // Samuel Nix Id = 005A00000074Gi1IAE
 // Nicole Mogannam Id = 005A0000001BavhIAC

String newManagerName = 'Samuel Nix';
String oldManagerName = 'Nicole Mogannam';
Boolean toUpdate = false;

List<Contact> contacts = new List<Contact>(
    [
      SELECT Id,
        ReportsTo.Salesforce_User__c,
        Salesforce_User__c
      FROM Contact
      WHERE Employment_Status__c = 'Active'
        AND Salesforce_User__c != null
        AND ReportsTo.Name = :oldManagerName
        AND Name != :newManagerName
    ]
  );

ID oldManagerUserId = contacts[0].ReportsTo.Salesforce_User__c;
System.debug('Old Manager: ' + oldManagerUserId);

List<Contact> newManager = new List<Contact>(
  [
    SELECT Id,
    Salesforce_User__c
    FROM Contact
    WHERE Name = :newManagerName
  ]
);

// TODO change name to employee number.

ID newManagerUserId = newManager[0].Salesforce_User__c;

System.debug('contacts: ' + contacts.size());
System.assertEquals(8, contacts.size());

List<User> usersFromContact = new List<User>();

// Use ID In List

for (Contact c : contacts) {
  usersFromContact.add(
    [
      SELECT Id, Name, ManagerId
      FROM User
      WHERE Id = :c.Salesforce_User__c
    ]
  );
}

List<User> usersToUpdate = new List<User>();

System.debug('Size Users From Contacts: ' + usersFromContact.size());
System.assertEquals(contacts.size(), usersFromContact.size());

for (User u : usersFromContact) {
  u.ManagerId = oldManagerUserId;
  usersToUpdate.add(u);
  System.debug('UserName: ' + u.Name + ' Manger: ' + u.ManagerId);
}

if (toUpdate) {
update usersToUpdate;
}
