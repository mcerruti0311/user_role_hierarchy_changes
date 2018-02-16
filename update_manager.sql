SELECT Id,
  IsActive,
  Manager.Name,
  Name
FROM User
WHERE IsActive = true
AND Manager.Name = ''
