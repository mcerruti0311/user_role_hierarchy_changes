SELECT Id,
  IsActive,
  Director__r.Name,
  Name
FROM User
WHERE IsActive = true
AND Director__r.Name = ''
