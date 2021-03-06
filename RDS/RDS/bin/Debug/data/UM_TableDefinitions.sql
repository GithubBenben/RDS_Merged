if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_UM_PrivilegeSetEntry_UM_PrivilegeSets]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[UM_PrivilegeSetEntries] DROP CONSTRAINT FK_UM_PrivilegeSetEntry_UM_PrivilegeSets
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_UM_Users_UM_PrivilegeSets]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[UM_Users] DROP CONSTRAINT FK_UM_Users_UM_PrivilegeSets
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_UM_PrivilegeSetEntry_UM_Privileges]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[UM_PrivilegeSetEntries] DROP CONSTRAINT FK_UM_PrivilegeSetEntry_UM_Privileges
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UM_PrivilegeSetEntries]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[UM_PrivilegeSetEntries]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UM_Users]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[UM_Users]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UM_PrivilegeSets]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[UM_PrivilegeSets]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UM_Privileges]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[UM_Privileges]
GO

CREATE TABLE [dbo].[UM_PrivilegeSets] (
	[PrivilegeSetID] [bigint] IDENTITY (1, 1) NOT NULL ,
	[Name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL  ,
	CONSTRAINT CK_UM_PrivilegeSets UNIQUE (Name)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[UM_Privileges] (
	[PrivilegeID] [bigint] IDENTITY (1, 1) NOT NULL ,
	[Name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Description] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	CONSTRAINT CK_UM_Privileges UNIQUE (Name)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[UM_PrivilegeSetEntries] (
	[PrivilegeSet] [bigint] NOT NULL ,
	[Privilege] [bigint] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[UM_Users] (
	[UserID] [bigint] IDENTITY (1, 1) NOT NULL ,
	[Username] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Password] [varchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[FirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[LastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Active] [bit] NOT NULL ,
	[PrivilegeSet] [bigint] NOT NULL ,
	[CreationDate] [datetime] NOT NULL ,
	[ModificationDate] [datetime] NULL ,
	[DeletionDate] [datetime] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[UM_PrivilegeSets] WITH NOCHECK ADD 
	CONSTRAINT [PK_UM_PrivilegeSets] PRIMARY KEY  CLUSTERED 
	(
		[PrivilegeSetID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[UM_Privileges] WITH NOCHECK ADD 
	CONSTRAINT [PK_UM_Privileges] PRIMARY KEY  CLUSTERED 
	(
		[PrivilegeID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[UM_Users] WITH NOCHECK ADD 
	CONSTRAINT [PK_UM_Users] PRIMARY KEY  CLUSTERED 
	(
		[UserID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[UM_Users] ADD 
	CONSTRAINT [DF_UM_Users_Active] DEFAULT (1) FOR [Active],
	CONSTRAINT [DF_UM_Users_ModificationDate] DEFAULT (null) FOR [ModificationDate],
	CONSTRAINT [DF_UM_Users_DeletionDate] DEFAULT (null) FOR [DeletionDate]
GO

ALTER TABLE [dbo].[UM_PrivilegeSetEntries] ADD 
	CONSTRAINT [FK_UM_PrivilegeSetEntry_UM_Privileges] FOREIGN KEY 
	(
		[Privilege]
	) REFERENCES [dbo].[UM_Privileges] (
		[PrivilegeID]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_UM_PrivilegeSetEntry_UM_PrivilegeSets] FOREIGN KEY 
	(
		[PrivilegeSet]
	) REFERENCES [dbo].[UM_PrivilegeSets] (
		[PrivilegeSetID]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[UM_Users] ADD 
	CONSTRAINT [FK_UM_Users_UM_PrivilegeSets] FOREIGN KEY 
	(
		[PrivilegeSet]
	) REFERENCES [dbo].[UM_PrivilegeSets] (
		[PrivilegeSetID]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

