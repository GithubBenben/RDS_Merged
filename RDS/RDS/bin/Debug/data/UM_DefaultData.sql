INSERT INTO UM_Privileges
(Name, Description)
VALUES
('Admin Privilege', 'Base administrator privilege. Should have access to user management to prevent accidental lock out.')
GO

INSERT INTO UM_PrivilegeSets
(Name)
VALUES
('Admin Privilege Set')
GO

INSERT INTO UM_PrivilegeSetEntries
(PrivilegeSet, Privilege)
VALUES
(1,1)
GO

INSERT INTO UM_Users
(Username, Password, FirstName, LastName, PrivilegeSet, Active, CreationDate)
VALUES
('admin', '5FBDEB044A0B84671100CD8B44CF2460', 'Administrator', 'Sias AG', 1, 1, '2005/01/01')
GO
