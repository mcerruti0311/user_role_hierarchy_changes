/**
 * Run this script in an Execute Anonymous Window to update a user record with
 * a new Manager.  This won't be accurate if the reports to has changed from
 * old to new
 */

 // Samuel Nix Id = '20947'
 // Nicole Mogannam Employee Number = '15034'

// Magic variables
String newManagerEmployeeNumber = '20947';
String oldManagerEmployeeNumber = '15034';
Integer expectedUserRecords = 8;

// Change to true to run update
Boolean toUpdate = false;

List<Contact> contacts = new List<Contact>(
    [
      SELECT Id,
        ReportsTo.Salesforce_User__c,
        Salesforce_User__c
      FROM Contact
      WHERE Employment_Status__c = 'Active'
        AND Salesforce_User__c != null
        AND ReportsTo.Employee_Number__c = :oldManagerEmployeeNumber
        AND Employee_Number__c != :newManagerEmployeeNumber
    ]
  );

ID oldManagerUserId = contacts[0].ReportsTo.Salesforce_User__c;
System.debug('Old Manager: ' + oldManagerUserId);

List<Contact> newManager = new List<Contact>(
  [
    SELECT Id,
    Salesforce_User__c
    FROM Contact
    WHERE Employee_Number__c = :newManagerEmployeeNumber
  ]
);

ID newManagerUserId = newManager[0].Salesforce_User__c;

System.debug('contacts: ' + contacts.size());
System.assertEquals(expectedUserRecords, contacts.size());

List<User> usersFromContact = new List<User>();

// Use ID In List; can't be done because the field isn't the contact Id field.
// The Id field belongs to the Salesforce_User__c

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
