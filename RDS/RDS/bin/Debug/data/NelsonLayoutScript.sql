USE [layouter]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertComponent]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertComponent]
	@modelID INT,
	@primitiveInstanceID INT,
	@componentName NVARCHAR(50),
	@modelComponentID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT;

BEGIN TRANSACTION

/*fill ModelComponents table*/
INSERT [ModelComponents]
(
	ModelID,
	PrimitiveInstanceID,
	ComponentName
)
VALUES
(
	@modelID,
	@primitiveInstanceID,
	@componentName
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

SET @modelComponentID=@@identity

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  Table [dbo].[Primitives]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Primitives](
	[PrimitiveID] [int] IDENTITY(1,1) NOT NULL,
	[Checksum] [nvarchar](50) NOT NULL,
	[ObjectType] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[TypeDescription] [nvarchar](50) NULL,
 CONSTRAINT [PK_Primitives] PRIMARY KEY CLUSTERED 
(
	[PrimitiveID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Models]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Models](
	[ModelID] [int] IDENTITY(1,1) NOT NULL,
	[Checksum] [nvarchar](50) NOT NULL,
	[ObjectType] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[TypeDescription] [nvarchar](50) NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatabaseVersions]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatabaseVersions](
	[VersionID] [int] IDENTITY(1,1) NOT NULL,
	[Version] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DatabaseVersions] PRIMARY KEY CLUSTERED 
(
	[VersionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cavities]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cavities](
	[CavityID] [int] IDENTITY(1,1) NOT NULL,
	[PrimitiveID] [int] NOT NULL,
	[Shape] [nvarchar](50) NOT NULL,
	[TravelHeight] [float] NOT NULL,
	[ScanHeight] [float] NOT NULL,
	[DispenseHeight] [float] NOT NULL,
	[MaxHeight] [float] NOT NULL,
 CONSTRAINT [PK_Cavity] PRIMARY KEY CLUSTERED 
(
	[CavityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bodies]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bodies](
	[BodyID] [int] IDENTITY(1,1) NOT NULL,
	[PrimitiveID] [int] NOT NULL,
	[Shape] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Bodies] PRIMARY KEY CLUSTERED 
(
	[BodyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bases]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bases](
	[BaseID] [int] IDENTITY(1,1) NOT NULL,
	[PrimitiveID] [int] NOT NULL,
	[Shape] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Base] PRIMARY KEY CLUSTERED 
(
	[BaseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BackgroundImages]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BackgroundImages](
	[BackgroundImageID] [int] IDENTITY(1,1) NOT NULL,
	[PrimitiveID] [int] NOT NULL,
	[Image] [image] NOT NULL,
	[StateName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BackgroundImages] PRIMARY KEY CLUSTERED 
(
	[BackgroundImageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BackgroundColors]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BackgroundColors](
	[BackgroundColorID] [int] IDENTITY(1,1) NOT NULL,
	[PrimitiveID] [int] NOT NULL,
	[Color] [int] NOT NULL,
	[StateName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BackgroundColors] PRIMARY KEY CLUSTERED 
(
	[BackgroundColorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AreaAccessRestrictions]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AreaAccessRestrictions](
	[AreaAccessRestrictionID] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NOT NULL,
	[PointInd] [int] NOT NULL,
	[X] [float] NOT NULL,
	[Y] [float] NOT NULL,
 CONSTRAINT [PK_AreaAccessRestrictions] PRIMARY KEY CLUSTERED 
(
	[AreaAccessRestrictionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Devices]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Devices](
	[DeviceID] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NOT NULL,
	[Driver] [nvarchar](50) NULL,
 CONSTRAINT [PK_Devices] PRIMARY KEY CLUSTERED 
(
	[DeviceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NOT NULL,
	[GripperOpen] [float] NOT NULL,
	[GripperClose] [float] NOT NULL,
 CONSTRAINT [PK_Carrier] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModelInstances]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModelInstances](
	[ModelInstanceID] [int] IDENTITY(1,1) NOT NULL,
	[ParentPrimitiveInstanceID] [int] NULL,
	[ModelID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_ItemInstances] PRIMARY KEY CLUSTERED 
(
	[ModelInstanceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Decktrays]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Decktrays](
	[DecktrayID] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NOT NULL,
 CONSTRAINT [PK_Decktray] PRIMARY KEY CLUSTERED 
(
	[DecktrayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pinpoints]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pinpoints](
	[PinpointID] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NOT NULL,
	[X] [float] NOT NULL,
	[Y] [float] NOT NULL,
	[Z] [float] NOT NULL,
 CONSTRAINT [PK_Pinpoints (maybe leave it in primary table)] PRIMARY KEY CLUSTERED 
(
	[PinpointID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModelTypeCustomProperties]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModelTypeCustomProperties](
	[ModelTypeCustomPropertyID] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ModelTypeCustomProperties] PRIMARY KEY CLUSTERED 
(
	[ModelTypeCustomPropertyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationPins]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationPins](
	[LocationPinID] [int] IDENTITY(1,1) NOT NULL,
	[PrimitiveID] [int] NOT NULL,
	[Diameter] [float] NOT NULL,
 CONSTRAINT [PK_LocationPin] PRIMARY KEY CLUSTERED 
(
	[LocationPinID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationHoles]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationHoles](
	[LocationHoleID] [int] IDENTITY(1,1) NOT NULL,
	[PrimitiveID] [int] NOT NULL,
	[Diameter] [float] NOT NULL,
 CONSTRAINT [PK_LocationHole] PRIMARY KEY CLUSTERED 
(
	[LocationHoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrimitiveTypeCustomProperties]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrimitiveTypeCustomProperties](
	[PrimitiveTypeCustomPropertyID] [int] IDENTITY(1,1) NOT NULL,
	[PrimitiveID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PrimitiveTypeCustomProperties] PRIMARY KEY CLUSTERED 
(
	[PrimitiveTypeCustomPropertyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrimitiveInstances]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrimitiveInstances](
	[PrimitiveInstanceID] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NOT NULL,
	[PrimitiveID] [int] NOT NULL,
	[ParentName] [nvarchar](50) NULL,
	[Orientation] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_PrimitiveInstances] PRIMARY KEY CLUSTERED 
(
	[PrimitiveInstanceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetPrimitiveTypesByObjectType]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_GetPrimitiveTypesByObjectType]
	@objectType NVARCHAR(50)

AS

SET NOCOUNT ON

SELECT TypeName FROM Primitives WHERE ObjectType=@objectType
GO
/****** Object:  StoredProcedure [dbo].[sp_GetPrimitiveTypes]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetPrimitiveTypes]

AS

SET NOCOUNT ON

SELECT PrimitiveID, Checksum, ObjectType, TypeName FROM Primitives
GO
/****** Object:  StoredProcedure [dbo].[sp_GetModelTypesByObjectType]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_GetModelTypesByObjectType]
	@objectType NVARCHAR(50)

AS

SET NOCOUNT ON

SELECT TypeName FROM Models WHERE ObjectType=@objectType
GO
/****** Object:  StoredProcedure [dbo].[sp_GetModelTypes]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetModelTypes]

AS

SET NOCOUNT ON

SELECT ModelID, Checksum, ObjectType, TypeName FROM Models
GO
/****** Object:  Table [dbo].[Slots]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slots](
	[SlotID] [int] IDENTITY(1,1) NOT NULL,
	[PrimitiveID] [int] NOT NULL,
	[Shape] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Handler] PRIMARY KEY CLUSTERED 
(
	[SlotID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Worktables]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Worktables](
	[WorktableID] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NOT NULL,
 CONSTRAINT [PK_Worktable] PRIMARY KEY CLUSTERED 
(
	[WorktableID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipPositions]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipPositions](
	[TipPositionID] [int] IDENTITY(1,1) NOT NULL,
	[PrimitiveID] [int] NOT NULL,
	[Diameter] [float] NOT NULL,
	[TipTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TipPositions] PRIMARY KEY CLUSTERED 
(
	[TipPositionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stackers]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stackers](
	[StackerID] [int] IDENTITY(1,1) NOT NULL,
	[PrimitiveID] [int] NOT NULL,
	[Length] [float] NOT NULL,
	[Width] [float] NOT NULL,
	[LevelNum] [int] NOT NULL,
 CONSTRAINT [PK_Stackers] PRIMARY KEY CLUSTERED 
(
	[StackerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectStacker]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectStacker]
	@primitiveID INT

AS

SET NOCOUNT ON

SELECT * FROM Primitives 
	INNER JOIN Stackers ON  Primitives.PrimitiveID=Stackers.PrimitiveID
	WHERE Primitives.PrimitiveID=@primitiveID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectWorktable]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectWorktable]
	@modelID INT

AS

SET NOCOUNT ON

SELECT * FROM Models 
	INNER JOIN Worktables ON  Models.ModelID=Worktables.ModelID
	WHERE Models.ModelID=@modelID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectTipPosition]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_SelectTipPosition]
	@primitiveID INT

AS

SET NOCOUNT ON

SELECT * FROM Primitives 
	INNER JOIN TipPositions ON  Primitives.PrimitiveID=TipPositions.PrimitiveID
	WHERE Primitives.PrimitiveID=@primitiveID
GO
/****** Object:  Table [dbo].[WorktableShapes]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorktableShapes](
	[WorktableShapeID] [int] IDENTITY(1,1) NOT NULL,
	[WorktableID] [int] NOT NULL,
	[PointInd] [int] NOT NULL,
	[X] [float] NOT NULL,
	[Y] [float] NOT NULL,
 CONSTRAINT [PK_WorktableShapes] PRIMARY KEY CLUSTERED 
(
	[WorktableShapeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StackerGripperPositions]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StackerGripperPositions](
	[StackerGripperPositionID] [int] IDENTITY(1,1) NOT NULL,
	[StackerID] [int] NOT NULL,
	[GripperPositionInd] [int] NOT NULL,
	[X] [float] NOT NULL,
	[Y] [float] NOT NULL,
	[Z] [float] NOT NULL,
	[Orientation] [float] NOT NULL,
	[Options] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StackerGripperPositions] PRIMARY KEY CLUSTERED 
(
	[StackerGripperPositionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeachingOffsets]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeachingOffsets](
	[TeachingOffsetID] [int] IDENTITY(1,1) NOT NULL,
	[ModelInstanceID] [int] NOT NULL,
	[X] [float] NOT NULL,
	[Y] [float] NOT NULL,
	[Z] [float] NOT NULL,
 CONSTRAINT [PK_TaughtPositions] PRIMARY KEY CLUSTERED 
(
	[TeachingOffsetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectPrimitiveTypeCustomProperties]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectPrimitiveTypeCustomProperties]
	@typeName NVARCHAR(50)

AS

SET NOCOUNT ON

SELECT * FROM Primitives 
	INNER JOIN PrimitiveTypeCustomProperties ON Primitives.PrimitiveID=PrimitiveTypeCustomProperties.PrimitiveID 
	WHERE TypeName=@typeName
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectPinpoint]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_SelectPinpoint]
	@modelID INT

AS

SET NOCOUNT ON

SELECT * FROM Pinpoints WHERE ModelID=@modelID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectModelTypeCustomProperties]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectModelTypeCustomProperties]
	@typeName NVARCHAR(50)

AS

SET NOCOUNT ON

SELECT * FROM ModelTypeCustomProperties 
		INNER JOIN Models ON Models.ModelID=ModelTypeCustomProperties.ModelID
		WHERE Models.TypeName=@typeName
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectModelComponents]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectModelComponents]
	@typeName NVARCHAR(50)

AS

SET NOCOUNT ON

SELECT PrimitiveInstanceID, ParentName FROM Models 
	INNER JOIN PrimitiveInstances ON Models.ModelID=PrimitiveInstances.ModelID	
	WHERE Models.TypeName=@typeName
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectLocationPin]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectLocationPin]
	@primitiveID INT

AS

SET NOCOUNT ON

SELECT * FROM Primitives 
	INNER JOIN LocationPins ON  Primitives.PrimitiveID=LocationPins.PrimitiveID
	WHERE Primitives.PrimitiveID=@primitiveID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectLocationHole]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectLocationHole]
	@primitiveID INT

AS

SET NOCOUNT ON

SELECT * FROM Primitives 
	INNER JOIN LocationHoles ON  Primitives.PrimitiveID=LocationHoles.PrimitiveID
	WHERE Primitives.PrimitiveID=@primitiveID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectItem]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectItem]
	@modelID INT

AS

SET NOCOUNT ON

SELECT * FROM Models 
	INNER JOIN Items ON  Models.ModelID=Items.ModelID
	WHERE Models.ModelID=@modelID
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteTipPosition]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteTipPosition]
	@primitiveID INT

AS

SET NOCOUNT ON

DECLARE @err INT;

BEGIN TRANSACTION

/*delete TipPositions table*/
DELETE FROM TipPositions WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete BackgroundImages table*/
DELETE BackgroundImages FROM BackgroundImages WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete BackgroundColors table*/
DELETE BackgroundColors FROM BackgroundColors WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete PrimitiveTypeCustomProperties table*/
DELETE PrimitiveTypeCustomProperties FROM PrimitiveTypeCustomProperties WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Primitives table*/
DELETE FROM Primitives WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
RETURN 0
GO
/****** Object:  Table [dbo].[LastPositions]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LastPositions](
	[LastPositionID] [int] IDENTITY(1,1) NOT NULL,
	[CavityID] [int] NOT NULL,
	[X] [float] NOT NULL,
	[Y] [float] NOT NULL,
	[Z] [float] NOT NULL,
 CONSTRAINT [PK_LastPositions] PRIMARY KEY CLUSTERED 
(
	[LastPositionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteLocationPin]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteLocationPin]
	@primitiveID INT

AS

SET NOCOUNT ON

DECLARE @err INT

BEGIN TRANSACTION

/*delete LocationPins table*/
DELETE FROM LocationPins WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete BackgroundImages table*/
DELETE BackgroundImages FROM BackgroundImages WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete BackgroundColors table*/
DELETE BackgroundColors FROM BackgroundColors WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete PrimitiveTypeCustomProperties table*/
DELETE PrimitiveTypeCustomProperties FROM PrimitiveTypeCustomProperties WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Primitives table*/
DELETE FROM Primitives WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteLocationHole]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteLocationHole]
	@primitiveID INT

AS

SET NOCOUNT ON

DECLARE @err INT;

BEGIN TRANSACTION

/*delete LocationHoles table*/
DELETE FROM LocationHoles WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete BackgroundImages table*/
DELETE BackgroundImages FROM BackgroundImages WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete BackgroundColors table*/
DELETE BackgroundColors FROM BackgroundColors WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete PrimitiveTypeCustomProperties table*/
DELETE PrimitiveTypeCustomProperties FROM PrimitiveTypeCustomProperties WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Primitives table*/
DELETE FROM Primitives WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
RETURN 0
GO
/****** Object:  Table [dbo].[SlotInstances]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlotInstances](
	[SlotInstanceID] [int] IDENTITY(1,1) NOT NULL,
	[PrimitiveInstanceID] [int] NOT NULL,
	[TiltX] [float] NOT NULL,
	[TiltY] [float] NOT NULL,
 CONSTRAINT [PK_SlotInstances] PRIMARY KEY CLUSTERED 
(
	[SlotInstanceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlotGripperPositions]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlotGripperPositions](
	[SlotGripperPositionID] [int] IDENTITY(1,1) NOT NULL,
	[SlotID] [int] NOT NULL,
	[GripperPositionInd] [int] NOT NULL,
	[X] [float] NOT NULL,
	[Y] [float] NOT NULL,
	[Z] [float] NOT NULL,
	[Orientation] [float] NOT NULL,
	[Options] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_GripperPositions] PRIMARY KEY CLUSTERED 
(
	[SlotGripperPositionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecondPipettingAreas]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecondPipettingAreas](
	[SecondPipettingAreaID] [int] IDENTITY(1,1) NOT NULL,
	[WorktableID] [int] NOT NULL,
	[PointInd] [int] NOT NULL,
	[X] [float] NOT NULL,
	[Y] [float] NOT NULL,
 CONSTRAINT [PK_SecondPipettingAreas] PRIMARY KEY CLUSTERED 
(
	[SecondPipettingAreaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertStacker]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_InsertStacker]
	@checksum NVARCHAR(50),
	@length FLOAT,
	@width FLOAT,
	@levelNum INT,
	@objectType NVARCHAR(50),
	@type NVARCHAR(50),
	@typeName NVARCHAR(50),
	@typeDescription NVARCHAR(50),
	@primitiveID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT

BEGIN TRANSACTION

/*fill Primitives table*/
INSERT [Primitives]
(
	Checksum,
	ObjectType,
	Type,
	TypeName,
	TypeDescription
)
VALUES
(
	@checksum,
	@objectType,
	@type,
	@typeName,
	@typeDescription
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill Stackers table*/
SET @primitiveID=@@identity;

INSERT [Stackers]
(
	PrimitiveID,
	Width,
	Length,
	LevelNum
)
VALUES
(
	@primitiveID,
	@width,
	@length,
	@levelNum
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertWorktable]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertWorktable]
	@checksum NVARCHAR(50),
	@objectType NVARCHAR(50),
	@type NVARCHAR(50),
	@typeName NVARCHAR(50),
	@typeDescription NVARCHAR(50),
	@modelID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT;

BEGIN TRANSACTION

/*fill Models table*/
INSERT [Models]
(
	Checksum,
	ObjectType,
	Type,
	TypeName,
	TypeDescription
)
VALUES
(
	@checksum,
	@objectType,
	@type,
	@typeName,
	@typeDescription
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill Worktable table*/
SET @modelID=@@identity;

INSERT [Worktables]
(
	ModelID
)
VALUES
(
	@modelID
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertTipPosition]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertTipPosition]
	@checksum NVARCHAR(50),
	@diameter FLOAT,
	@tipTypeName NVARCHAR(50),
	@objectType NVARCHAR(50),
	@type NVARCHAR(50),
	@typeName NVARCHAR(50),
	@typeDescription NVARCHAR(50),
	@primitiveID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT;

BEGIN TRANSACTION

/*fill Primitives table*/
INSERT [Primitives]
(
	Checksum,
	ObjectType,
	Type,
	TypeName,
	TypeDescription
)
VALUES
(
	@checksum,
	@objectType,
	@type,
	@typeName,
	@typeDescription
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill TipPositions table*/
SET @primitiveID=@@identity;

INSERT [TipPositions]
(
	PrimitiveID,
	Diameter,
	TipTypeName
)
VALUES
(
	@primitiveID,
	@diameter,
	@tipTypeName
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectBackgroundImages]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectBackgroundImages]
	@typeName NVARCHAR(50)

AS

SET NOCOUNT ON

SELECT Image, StateName FROM Primitives 
	INNER JOIN BackgroundImages ON Primitives.PrimitiveID=BackgroundImages.PrimitiveID 
	WHERE TypeName=@typeName
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectBackgroundColors]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_SelectBackgroundColors]
	@typeName NVARCHAR(50)

AS

SET NOCOUNT ON

SELECT Color, StateName FROM Primitives 
	INNER JOIN BackgroundColors ON Primitives.PrimitiveID=BackgroundColors.PrimitiveID 
	WHERE TypeName=@typeName
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectAreaAccessRestriction]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectAreaAccessRestriction]
	@typeName NVARCHAR(50)

AS

SET NOCOUNT ON

SELECT Models.ModelID, PointInd,  X, Y FROM Models INNER JOIN AreaAccessRestrictions ON Models.ModelID=AreaAccessRestrictions.ModelID
	 WHERE Models.TypeName=@typeName order by PointInd
GO
/****** Object:  StoredProcedure [dbo].[sp_PrimitiveInstanceID2TypeName]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_PrimitiveInstanceID2TypeName]
	@primitiveInstanceID INT,
	@typeName NVARCHAR(50) OUT

AS

SET NOCOUNT ON

SELECT @typeName=TypeName FROM Primitives 
	INNER JOIN PrimitiveInstances ON Primitives.PrimitiveID=PrimitiveInstances.PrimitiveID
	WHERE PrimitiveInstances.PrimitiveInstanceID=@primitiveInstanceID
GO
/****** Object:  StoredProcedure [dbo].[sp_ModelInstanceID2TypeName]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_ModelInstanceID2TypeName]
	@modelInstanceID INT,
	@typeName NVARCHAR(50) OUT

AS

SET NOCOUNT ON

SELECT @typeName=TypeName FROM Models 
	INNER JOIN ModelInstances ON Models.ModelID=ModelInstances.ModelID
	WHERE ModelInstances.ModelInstanceID=@modelInstanceID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectDevice]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectDevice]
	@modelID INT

AS

SET NOCOUNT ON

SELECT * FROM Models 
	INNER JOIN Devices ON  Models.ModelID=Devices.ModelID
	WHERE Models.ModelID=@modelID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectDecktray]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectDecktray]
	@modelID INT

AS

SET NOCOUNT ON

SELECT * FROM Models 
	INNER JOIN Decktrays ON  Models.ModelID=Decktrays.ModelID
	WHERE Models.ModelID=@modelID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectChildModelInstance]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_SelectChildModelInstance]
	@parentPrimitiveInstanceID INT

AS

SET NOCOUNT ON

SELECT * FROM ModelInstances WHERE ParentPrimitiveInstanceID=@parentPrimitiveInstanceID
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertPinpoint]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_InsertPinpoint]
	@modelID INT,
	@x FLOAT,
	@y FLOAT,
	@z FLOAT,
	@pinpointID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT;

BEGIN TRANSACTION

/*fill Pinpoints table*/
INSERT [Pinpoints]
(
	ModelID,
	X,
	Y,
	Z
)
VALUES
(
	@modelID,
	@x,
	@y,
	@z
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

SET @pinpointID=@@identity

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertModelTypeCustomProperty]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertModelTypeCustomProperty]
	@modelID INT,
	@name NVARCHAR(50),
	@value NVARCHAR(50),
	@modelTypeCustomPropertyID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT

BEGIN TRANSACTION

/*fill ModelTypeCustomProperties table*/
INSERT [ModelTypeCustomProperties]
(
	ModelID,
	Name,
	Value
)
VALUES
(
	@modelID,
	@name,
	@value
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

SET @modelTypeCustomPropertyID=@@identity

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertPrimitiveInstance]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertPrimitiveInstance]
	@modelID INT,
	@primitiveID INT,
	@parentName VARCHAR(50),
	@orientation FLOAT,
	@name VARCHAR(50),
	@description VARCHAR(50),
	@primitiveInstanceID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT;

BEGIN TRANSACTION

/*fill PrimitiveInstances table*/
INSERT [PrimitiveInstances]
(
	ModelID,
	PrimitiveID,
	ParentName,
	Orientation,
	Name,
	Description
)
VALUES
(
	@modelID,
	@primitiveID,
	@parentName,
	@orientation,
	@name ,
	@description 
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

SET @primitiveInstanceID=@@identity;

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertPrimitiveTypeCustomProperty]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertPrimitiveTypeCustomProperty]
	@primitiveID INT,
	@name NVARCHAR(50),
	@value NVARCHAR(50),
	@primitiveTypeCustomPropertyID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT

BEGIN TRANSACTION

/*fill PrimitiveTypeCustomProperties table*/
INSERT [PrimitiveTypeCustomProperties]
(
	PrimitiveID,
	Name,
	Value
)
VALUES
(
	@primitiveID,
	@name,
	@value
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

SET @primitiveTypeCustomPropertyID=@@identity

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertModelInstance]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertModelInstance]
	@parentPrimitiveInstanceID INT,
	@modelID INT,
	@name NVARCHAR(50),
	@description NVARCHAR(50),
	@modelInstanceID INT OUT
AS

SET NOCOUNT ON

DECLARE @err INT;

BEGIN TRANSACTION

INSERT [ModelInstances]
(
	ParentPrimitiveInstanceID,
	ModelID,
	Name,
	Description
)
VALUES
(
	@parentPrimitiveInstanceID,
	@modelID ,
	@name ,
	@description 
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

SET @modelInstanceID=@@identity;

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertLocationPin]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_InsertLocationPin]
	@checksum NVARCHAR(50),
	@diameter FLOAT,
	@objectType NVARCHAR(50),
	@type NVARCHAR(50),
	@typeName NVARCHAR(50),
	@typeDescription NVARCHAR(50),
	@primitiveID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT;

BEGIN TRANSACTION

/*fill Primitives table*/
INSERT [Primitives]
(
             Checksum,
	ObjectType,
	Type,
	TypeName,
	TypeDescription
)
VALUES
(
	@checksum,
	@objectType,
	@type,
	@typeName,
	@typeDescription
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill LocationPins table*/
SET @primitiveID=@@identity;

INSERT [LocationPins]
(
	PrimitiveID,
	Diameter
)
VALUES
(
	@primitiveID,
	@diameter
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertLocationHole]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_InsertLocationHole]
	@checksum NVARCHAR(50),
	@diameter FLOAT,
	@objectType NVARCHAR(50),
	@type NVARCHAR(50),
	@typeName NVARCHAR(50),
	@typeDescription NVARCHAR(50),
	@primitiveID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT;

BEGIN TRANSACTION

/*fill Primitives table*/
INSERT [Primitives]
(
             Checksum,
	ObjectType,
	Type,
	TypeName,
	TypeDescription
)
VALUES
(
	@checksum,
	@objectType,
	@type,
	@typeName,
	@typeDescription
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill LocationHoles table*/
SET @primitiveID=@@identity;

INSERT [LocationHoles]
(
	PrimitiveID,
	Diameter
)
VALUES
(
	@primitiveID,
	@diameter
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertItem]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertItem]
	@checksum NVARCHAR(50),
	@gripperOpen FLOAT,
	@gripperClose FLOAT,
	@objectType NVARCHAR(50),
	@type NVARCHAR(50),
	@typeName NVARCHAR(50),
	@typeDescription NVARCHAR(50),
	@modelID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT;

BEGIN TRANSACTION

/*fill Models table*/
INSERT [Models]
(
	Checksum,
	ObjectType,
	Type,
	TypeName,
	TypeDescription
)
VALUES
(
	@checksum,
	@objectType,
	@type,
	@typeName,
	@typeDescription
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill Items table*/
SET @modelID=@@identity;

INSERT [Items]
(
	ModelID,
	GripperOpen,
	GripperClose
)
VALUES
(
	@modelID,
	@gripperOpen,
	@gripperClose
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertDevice]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertDevice]
	@checksum NVARCHAR(50),
	@driver NVARCHAR(50),
	@objectType NVARCHAR(50),
	@type NVARCHAR(50),
	@typeName NVARCHAR(50),
	@typeDescription NVARCHAR(50),
	@modelIDID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT;

BEGIN TRANSACTION

/*fill Models table*/

INSERT [Models]
(
	Checksum,
	ObjectType,
	Type,
	TypeName,
	TypeDescription
)
VALUES
(
	@checksum,
	@objectType,
	@type,
	@typeName,
	@typeDescription
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill Devices table*/
SET @modelIDID=@@identity;

INSERT [Devices]
(
	ModelID,
	Driver
)
VALUES
(
	@modelIDID,
	@driver
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertDecktray]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertDecktray]
	@checksum NVARCHAR(50),
	@objectType NVARCHAR(50),
	@type NVARCHAR(50),
	@typeName NVARCHAR(50),
	@typeDescription NVARCHAR(50),
	@modelID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT;

BEGIN TRANSACTION

/*fill Models table*/
INSERT [Models]
(
	Checksum,
	ObjectType,
	Type,
	TypeName,
	TypeDescription
)
VALUES
(
	@checksum,
	@objectType,
	@type,
	@typeName,
	@typeDescription
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill Decktrays table*/
SET @modelID=@@identity;

INSERT [Decktrays]
(
	ModelID
)
VALUES
(
	@modelID
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END
/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertBackgroundImage]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertBackgroundImage]
	@primitiveID INT,
	@image IMAGE,
	@stateName NVARCHAR(50),
	@backgroundImageID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT

/*fill in BackgroundImages table*/
INSERT [BackgroundImages]
(
	PrimitiveID,
	Image,
	StateName
)
VALUES
(
	@primitiveID,
	@image,
	@stateName
)

SET @backgroundImageID=@@identity;

SET @err = @@error
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertBackgroundColor]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_InsertBackgroundColor]
	@primitiveID INT,
	@color INT,
	@stateName NVARCHAR(50),
	@backgroundColorID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT

/*fill in BackgroundColors table*/
INSERT [BackgroundColors]
(
	PrimitiveID,
	Color,
	StateName
)
VALUES
(
	@primitiveID,
	@color,
	@stateName
)

SET @backgroundColorID=@@identity;

SET @err = @@error
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertAreaAccessRestriction]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertAreaAccessRestriction]
	@modelID INT,
	@pointInd INT,
	@x FLOAT,
	@y FLOAT,
	@areaAccessRestrictionID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT;

INSERT [AreaAccessRestrictions]
(
	ModelID,
	PointInd,
	X,
	Y
)
VALUES
(
	@modelID,
	@pointInd,
	@x,
	@y
)

SET @areaAccessRestrictionID=@@identity
SET @err = @@error
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDependentModels]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetDependentModels]
	@typeName NVARCHAR(50)
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @primitiveID INT

	/*get primitiveID by type name*/
	SELECT @primitiveID=PrimitiveID FROM Primitives WHERE TypeName=@typeName
	/*get model type names the primitive type is used in*/
	SELECT Models.TypeName FROM 
		Models INNER JOIN PrimitiveInstances ON 
		Models.ModelID = PrimitiveInstances.ModelID WHERE 
		PrimitiveInstances.PrimitiveID=@primitiveID

END
GO
/****** Object:  Table [dbo].[PrimitiveInstanceCustomProperties]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrimitiveInstanceCustomProperties](
	[PrimitiveInstanceCustomPropertyID] [int] IDENTITY(1,1) NOT NULL,
	[PrimitiveInstanceID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PrimitiveCustomProperties] PRIMARY KEY CLUSTERED 
(
	[PrimitiveInstanceCustomPropertyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PipettingAreas]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PipettingAreas](
	[PipettingAreaID] [int] IDENTITY(1,1) NOT NULL,
	[WorktableID] [int] NOT NULL,
	[PointInd] [int] NOT NULL,
	[X] [float] NOT NULL,
	[Y] [float] NOT NULL,
 CONSTRAINT [PK_PipettingAreas] PRIMARY KEY CLUSTERED 
(
	[PipettingAreaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoundCavities]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoundCavities](
	[RoundCavityID] [int] IDENTITY(1,1) NOT NULL,
	[CavityID] [int] NOT NULL,
 CONSTRAINT [PK_RoundCavities] PRIMARY KEY CLUSTERED 
(
	[RoundCavityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoundBodies]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoundBodies](
	[RoundBodyID] [int] IDENTITY(1,1) NOT NULL,
	[BodyID] [int] NOT NULL,
	[Diameter] [float] NOT NULL,
	[Height] [float] NOT NULL,
 CONSTRAINT [PK_RoundBodies] PRIMARY KEY CLUSTERED 
(
	[RoundBodyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoundBases]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoundBases](
	[RoundBaseID] [int] IDENTITY(1,1) NOT NULL,
	[BaseID] [int] NOT NULL,
	[Diameter] [float] NOT NULL,
	[Height] [float] NOT NULL,
 CONSTRAINT [PK_RoundBases] PRIMARY KEY CLUSTERED 
(
	[RoundBaseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReferencePoints]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferencePoints](
	[ReferencePointID] [int] IDENTITY(1,1) NOT NULL,
	[WorktableID] [int] NOT NULL,
	[X] [float] NOT NULL,
	[Y] [float] NOT NULL,
	[Z] [float] NOT NULL,
 CONSTRAINT [PK_ReferencePoints] PRIMARY KEY CLUSTERED 
(
	[ReferencePointID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RectSlots]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RectSlots](
	[RectSlotID] [int] IDENTITY(1,1) NOT NULL,
	[SlotID] [int] NOT NULL,
	[Length] [float] NOT NULL,
	[Width] [float] NOT NULL,
	[Height] [float] NOT NULL,
 CONSTRAINT [PK_RectHandlers] PRIMARY KEY CLUSTERED 
(
	[RectSlotID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RectCavities]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RectCavities](
	[RectCavityID] [int] IDENTITY(1,1) NOT NULL,
	[CavityID] [int] NOT NULL,
 CONSTRAINT [PK_RectCavities] PRIMARY KEY CLUSTERED 
(
	[RectCavityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RectBodies]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RectBodies](
	[RoundBodyID] [int] IDENTITY(1,1) NOT NULL,
	[BodyID] [int] NOT NULL,
	[Length] [float] NOT NULL,
	[Width] [float] NOT NULL,
	[Height] [float] NOT NULL,
 CONSTRAINT [PK_RectBodies] PRIMARY KEY CLUSTERED 
(
	[RoundBodyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RectBases]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RectBases](
	[RectBaseID] [int] IDENTITY(1,1) NOT NULL,
	[BaseID] [int] NOT NULL,
	[Length] [float] NOT NULL,
	[Width] [float] NOT NULL,
	[Height] [float] NOT NULL,
 CONSTRAINT [PK_RectBases] PRIMARY KEY CLUSTERED 
(
	[RectBaseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriverProperties]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriverProperties](
	[DriverPropertyID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceID] [int] NOT NULL,
	[PropertyName] [nvarchar](50) NOT NULL,
	[PropertyType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DriverProperties] PRIMARY KEY CLUSTERED 
(
	[DriverPropertyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScalingPoints]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScalingPoints](
	[ScalingPointID] [int] IDENTITY(1,1) NOT NULL,
	[WorktableID] [int] NOT NULL,
	[X] [float] NOT NULL,
	[Y] [float] NOT NULL,
	[Z] [float] NOT NULL,
 CONSTRAINT [PK_ScalingPoints] PRIMARY KEY CLUSTERED 
(
	[ScalingPointID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoundSlots]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoundSlots](
	[RoundSlotID] [int] IDENTITY(1,1) NOT NULL,
	[SlotID] [int] NOT NULL,
	[Diameter] [float] NOT NULL,
	[Height] [float] NOT NULL,
 CONSTRAINT [PK_RoundHandlers] PRIMARY KEY CLUSTERED 
(
	[RoundSlotID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrimitivePositions]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrimitivePositions](
	[PrimitivePositionID] [int] IDENTITY(1,1) NOT NULL,
	[PrimitiveInstanceID] [int] NOT NULL,
	[PositionX] [float] NOT NULL,
	[PositionY] [float] NOT NULL,
	[PositionZ] [float] NOT NULL,
 CONSTRAINT [PK_PrimitivePositions] PRIMARY KEY CLUSTERED 
(
	[PrimitivePositionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModelInstanceCustomProperties]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModelInstanceCustomProperties](
	[ModelInstanceCustomPropertyID] [int] IDENTITY(1,1) NOT NULL,
	[ModelInstanceID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ItemProperties] PRIMARY KEY CLUSTERED 
(
	[ModelInstanceCustomPropertyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemInstances]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemInstances](
	[ItemInstanceID] [int] IDENTITY(1,1) NOT NULL,
	[ModelInstanceID] [int] NOT NULL,
	[RestrictionMode] [nvarchar](50) NOT NULL,
	[AccessMode] [nvarchar](50) NOT NULL,
	[Timeout] [int] NOT NULL,
	[History] [nvarchar](50) NULL,
 CONSTRAINT [PK_CarrierInstances] PRIMARY KEY CLUSTERED 
(
	[ItemInstanceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GripperPositions]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GripperPositions](
	[GripperPositionID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL,
	[X] [float] NOT NULL,
	[Y] [float] NOT NULL,
	[Z] [float] NOT NULL,
	[Orientation] [float] NOT NULL,
	[Options] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CarrierGripperPositions] PRIMARY KEY CLUSTERED 
(
	[GripperPositionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GripperAreas]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GripperAreas](
	[GripperAreaID] [int] IDENTITY(1,1) NOT NULL,
	[WorktableID] [int] NOT NULL,
	[PointInd] [int] NOT NULL,
	[X] [float] NOT NULL,
	[Y] [float] NOT NULL,
 CONSTRAINT [PK_GripperAreas] PRIMARY KEY CLUSTERED 
(
	[GripperAreaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FirstPositions]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FirstPositions](
	[FirstPositionID] [int] IDENTITY(1,1) NOT NULL,
	[CavityID] [int] NOT NULL,
	[X] [float] NOT NULL,
	[Y] [float] NOT NULL,
	[Z] [float] NOT NULL,
 CONSTRAINT [PK_FirstPositions] PRIMARY KEY CLUSTERED 
(
	[FirstPositionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceInstances]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceInstances](
	[DeviceInstanceID] [int] IDENTITY(1,1) NOT NULL,
	[ModelInstanceID] [int] NOT NULL,
	[DisplayMode] [int] NOT NULL,
	[DisplayModeString] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DeviceInstances] PRIMARY KEY CLUSTERED 
(
	[DeviceInstanceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceBinaries]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceBinaries](
	[DeviceBinaryID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceID] [int] NOT NULL,
	[Binary] [image] NOT NULL,
 CONSTRAINT [PK_DeviceBinaries] PRIMARY KEY CLUSTERED 
(
	[DeviceBinaryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Layouts]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Layouts](
	[LayoutID] [int] IDENTITY(1,1) NOT NULL,
	[ModelInstanceID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Binary] [image] NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[LayoutID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LayoutPrimitiveInstances]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LayoutPrimitiveInstances](
	[LayoutPrimitiveInstanceID] [int] IDENTITY(1,1) NOT NULL,
	[ModelInstanceID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[BackgroundColorIndex] [int] NOT NULL,
	[BackgroundImageIndex] [int] NOT NULL,
 CONSTRAINT [PK_LayoutPrimitiveInstances] PRIMARY KEY CLUSTERED 
(
	[LayoutPrimitiveInstanceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LayoutCavityInstances]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LayoutCavityInstances](
	[LayoutCavityInstanceID] [int] IDENTITY(1,1) NOT NULL,
	[LayoutPrimitiveInstanceID] [int] NOT NULL,
	[AccessMode] [nvarchar](50) NOT NULL,
	[Timeout] [int] NOT NULL,
	[History] [nvarchar](50) NULL,
 CONSTRAINT [PK_LayoutCavityInstances] PRIMARY KEY CLUSTERED 
(
	[LayoutCavityInstanceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DriverPropertyValues]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriverPropertyValues](
	[DriverPropertyValueID] [int] IDENTITY(1,1) NOT NULL,
	[DriverPropertyID] [int] NOT NULL,
	[PropertyIndex] [int] NOT NULL,
	[PropertyValue] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DriverPropertyValues] PRIMARY KEY CLUSTERED 
(
	[DriverPropertyValueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoundCavityShapes]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoundCavityShapes](
	[RoundCavityShapeID] [int] IDENTITY(1,1) NOT NULL,
	[RoundCavityID] [int] NOT NULL,
	[CircleInd] [int] NOT NULL,
	[Diameter] [float] NOT NULL,
	[TranslationX] [float] NOT NULL,
	[TranslationY] [float] NOT NULL,
	[TranslationZ] [float] NOT NULL,
 CONSTRAINT [PK_RoundCavityShapes] PRIMARY KEY CLUSTERED 
(
	[RoundCavityShapeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RectCavityShapes]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RectCavityShapes](
	[RectCavityShapeID] [int] IDENTITY(1,1) NOT NULL,
	[RectCavityID] [int] NOT NULL,
	[RectangleInd] [int] NOT NULL,
	[Width] [float] NOT NULL,
	[Length] [float] NOT NULL,
	[TranslationX] [float] NOT NULL,
	[TranslationY] [float] NOT NULL,
	[TranslationZ] [float] NOT NULL,
 CONSTRAINT [PK_RectCavityShapes] PRIMARY KEY CLUSTERED 
(
	[RectCavityShapeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LayoutTipPositionInstances]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LayoutTipPositionInstances](
	[LayoutTipPositionInstanceID] [int] IDENTITY(1,1) NOT NULL,
	[LayoutPrimitiveInstanceID] [int] NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[AccessMode] [nvarchar](50) NOT NULL,
	[Timeout] [int] NOT NULL,
 CONSTRAINT [PK_LayoutTipPositionInstances] PRIMARY KEY CLUSTERED 
(
	[LayoutTipPositionInstanceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LayoutStackerInstances]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LayoutStackerInstances](
	[LayoutStackerInstanceID] [int] IDENTITY(1,1) NOT NULL,
	[LayoutPrimitiveInstanceID] [int] NOT NULL,
	[AccessMode] [nvarchar](50) NOT NULL,
	[Timeout] [int] NOT NULL,
	[Timer] [float] NOT NULL,
	[History] [nvarchar](50) NULL,
 CONSTRAINT [PK_LayoutStackerInstances] PRIMARY KEY CLUSTERED 
(
	[LayoutStackerInstanceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LayoutSlotInstances]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LayoutSlotInstances](
	[LayoutSlotInstanceID] [int] IDENTITY(1,1) NOT NULL,
	[LayoutPrimitiveInstanceID] [int] NOT NULL,
	[AccessMode] [nvarchar](50) NOT NULL,
	[Timeout] [int] NOT NULL,
	[Timer] [float] NOT NULL,
	[History] [nvarchar](50) NULL,
 CONSTRAINT [PK_LayoutSlotInstances] PRIMARY KEY CLUSTERED 
(
	[LayoutSlotInstanceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDependentLayouts]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetDependentLayouts]
	@typeName NVARCHAR(50)
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @modelID INT
	DECLARE @parentModelInstanceID NVARCHAR(50)
	DECLARE @parentTypeName NVARCHAR(50)

	/*get modelID by type name*/
	SELECT @modelID=ModelID FROM Models WHERE TypeName=@typeName
	/*if the model type is a root of a layout*/
	IF EXISTS(SELECT Layouts.Name FROM 
		Layouts INNER JOIN ModelInstances ON 
		Layouts.ModelInstanceID = ModelInstances.ModelInstanceID WHERE 
		ModelInstances.ModelID=@modelID)
	BEGIN
		/*get layout names the model type is used in*/
		SELECT Layouts.Name FROM 
			Layouts INNER JOIN ModelInstances ON 
			Layouts.ModelInstanceID = ModelInstances.ModelInstanceID WHERE 
			ModelInstances.ModelID=@modelID
	END
	ELSE
	BEGIN
		/*get parentModelInstanceID*/
		SELECT @parentModelInstanceID=LayoutPrimitiveInstances.ModelInstanceID FROM 
			ModelInstances INNER JOIN LayoutPrimitiveInstances ON 
			ModelInstances.ParentPrimitiveInstanceID = LayoutPrimitiveInstances.LayoutPrimitiveInstanceID WHERE 
			ModelInstances.ModelID=@modelID
		/*if parent instance is there*/
		IF @parentModelInstanceID>0
		BEGIN
			/*get type name of the model instance*/
			SELECT @parentTypeName=Models.TypeName FROM 
				Models INNER JOIN ModelInstances ON 
				Models.ModelID = ModelInstances.ModelID WHERE 
				ModelInstances.ModelInstanceID=@parentModelInstanceID

			/*call recursively*/
			EXEC sp_GetDependentLayouts @typeName=@parentTypeName
		END

	END

END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteWorktable]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteWorktable]
	@modelID INT

AS

SET NOCOUNT ON

DECLARE @err INT
DECLARE @objectType NVARCHAR(50)

BEGIN TRANSACTION

/*get ObjectType by modelID*/
SELECT @objectType=ObjectType FROM Primitives
	INNER JOIN PrimitiveInstances ON Primitives.PrimitiveID=PrimitiveInstances.PrimitiveID
	INNER JOIN SlotInstances ON PrimitiveInstances.PrimitiveInstanceID=SlotInstances.PrimitiveInstanceID
	WHERE PrimitiveInstances.ModelID=@modelID

/*delete Pinpoints table*/
DELETE FROM Pinpoints WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete PipettingAreas table */
DELETE PipettingAreas FROM PipettingAreas INNER JOIN Worktables ON PipettingAreas.WorktableID=Worktables.WorktableID WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete SecondPipettingAreas table */
DELETE SecondPipettingAreas FROM SecondPipettingAreas INNER JOIN Worktables ON SecondPipettingAreas.WorktableID=Worktables.WorktableID WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete GripperAreas table */
DELETE GripperAreas FROM GripperAreas INNER JOIN Worktables ON GripperAreas.WorktableID=Worktables.WorktableID WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete ReferencePoints table */
DELETE ReferencePoints FROM ReferencePoints INNER JOIN Worktables ON ReferencePoints.WorktableID=Worktables.WorktableID WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete ScalingPoints table */
DELETE ScalingPoints FROM ScalingPoints INNER JOIN Worktables ON ScalingPoints.WorktableID=Worktables.WorktableID WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete WorktableShapes table */
DELETE WorktableShapes FROM WorktableShapes INNER JOIN Worktables ON WorktableShapes.WorktableID=Worktables.WorktableID WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Worktables table*/
DELETE FROM Worktables WHERE ModelID=@modelID

/*delete AreaAccessRestrictions table*/
DELETE FROM AreaAccessRestrictions WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete ModelTypeCustomProperties table*/
DELETE FROM ModelTypeCustomProperties WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete PrimitivePositions table*/
DELETE PrimitivePositions FROM PrimitivePositions
	INNER JOIN PrimitiveInstances ON PrimitivePositions.PrimitiveInstanceID=PrimitiveInstances.PrimitiveInstanceID
	WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete PrimitiveInstanceCustomProperties table*/
DELETE PrimitiveInstanceCustomProperties FROM PrimitiveInstanceCustomProperties
	INNER JOIN PrimitiveInstances ON PrimitiveInstanceCustomProperties.PrimitiveInstanceID=PrimitiveInstances.PrimitiveInstanceID
	WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

IF (@objectType='RectSlot')
	BEGIN
		DELETE SlotInstances FROM SlotInstances INNER JOIN PrimitiveInstances ON PrimitiveInstances.PrimitiveInstanceID=SlotInstances.PrimitiveInstanceID WHERE ModelID=@modelID
		SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END
	END
ELSE IF (@objectType='RoundSlot') 
	BEGIN
		DELETE SlotInstances FROM SlotInstances INNER JOIN PrimitiveInstances ON PrimitiveInstances.PrimitiveInstanceID=SlotInstances.PrimitiveInstanceID WHERE ModelID=@modelID
		SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END
	END

/*delete PrimitiveInstances table*/
DELETE FROM PrimitiveInstances WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Models table*/
DELETE FROM Models WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteRectBody]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteRectBody]
	@primitiveID INT

AS

SET NOCOUNT ON

DECLARE @err INT

BEGIN TRANSACTION

/*delete RectBodies table */
DELETE RectBodies FROM RectBodies INNER JOIN Bodies ON Bodies.BodyID=RectBodies.BodyID WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Bodies table*/
DELETE FROM Bodies WHERE PrimitiveID=@primitiveID

/*delete BackgroundImages table*/
DELETE BackgroundImages FROM BackgroundImages WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete BackgroundColors table*/
DELETE BackgroundColors FROM BackgroundColors WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete PrimitiveTypeCustomProperties table*/
DELETE PrimitiveTypeCustomProperties FROM PrimitiveTypeCustomProperties WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Primitives table*/
DELETE FROM Primitives WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteRectBase]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteRectBase]
	@primitiveID INT

AS

SET NOCOUNT ON

DECLARE @err INT

BEGIN TRANSACTION

/*delete RectBases table */
DELETE RectBases FROM RectBases INNER JOIN Bases ON Bases.BaseID=RectBases.BaseID WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Bases table*/
DELETE FROM Bases WHERE PrimitiveID=@primitiveID

/*delete BackgroundImages table*/
DELETE BackgroundImages FROM BackgroundImages WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete BackgroundColors table*/
DELETE BackgroundColors FROM BackgroundColors WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete PrimitiveTypeCustomProperties table*/
DELETE PrimitiveTypeCustomProperties FROM PrimitiveTypeCustomProperties WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Primitives table*/
DELETE FROM Primitives WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[sp_GetLayouts]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetLayouts]

AS

SET NOCOUNT ON

SELECT Name FROM Layouts
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteDecktray]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteDecktray]
	@modelID INT

AS

SET NOCOUNT ON

DECLARE @err INT
DECLARE @objectType NVARCHAR(50)

BEGIN TRANSACTION

/*get ObjectType by modelID*/
SELECT @objectType=ObjectType FROM Primitives
	INNER JOIN PrimitiveInstances ON Primitives.PrimitiveID=PrimitiveInstances.PrimitiveID
	INNER JOIN SlotInstances ON PrimitiveInstances.PrimitiveInstanceID=SlotInstances.PrimitiveInstanceID
	WHERE PrimitiveInstances.ModelID=@modelID

/*delete Decktrays table*/
DELETE FROM Decktrays WHERE ModelID=@modelID

/*delete Pinpoints table*/
DELETE FROM Pinpoints WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete AreaAccessRestrictions table*/
DELETE FROM AreaAccessRestrictions WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete ModelTypeCustomProperties table*/
DELETE FROM ModelTypeCustomProperties WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete PrimitivePositions table*/
DELETE PrimitivePositions FROM PrimitivePositions
	INNER JOIN PrimitiveInstances ON PrimitivePositions.PrimitiveInstanceID=PrimitiveInstances.PrimitiveInstanceID
	WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete PrimitiveInstanceCustomProperties table*/
DELETE PrimitiveInstanceCustomProperties FROM PrimitiveInstanceCustomProperties
	INNER JOIN PrimitiveInstances ON PrimitiveInstanceCustomProperties.PrimitiveInstanceID=PrimitiveInstances.PrimitiveInstanceID
	WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

IF (@objectType='RectSlot')
	BEGIN
		DELETE SlotInstances FROM SlotInstances INNER JOIN PrimitiveInstances ON PrimitiveInstances.PrimitiveInstanceID=SlotInstances.PrimitiveInstanceID WHERE ModelID=@modelID
		SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END
	END
ELSE IF (@objectType='RoundSlot') 
	BEGIN
		DELETE SlotInstances FROM SlotInstances INNER JOIN PrimitiveInstances ON PrimitiveInstances.PrimitiveInstanceID=SlotInstances.PrimitiveInstanceID WHERE ModelID=@modelID
		SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END
	END

/*delete PrimitiveInstances table*/
DELETE FROM PrimitiveInstances WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Models table*/
DELETE FROM Models WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCavityLastPosition]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_InsertCavityLastPosition]
	@primitiveID INT,
	@x FLOAT,
	@y FLOAT,
	@z FLOAT,
	@lastPositionID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT

DECLARE @cavityID INT

/*determine cavityID by primitiveID*/
SELECT @cavityID=CavityID FROM Primitives INNER JOIN Cavities ON Primitives.PrimitiveID=Cavities.PrimitiveID WHERE Primitives.PrimitiveID=@primitiveID

/*fill in LastPositions table*/
INSERT [LastPositions]
(
	CavityID,
	X,
	Y,
	Z
)
VALUES
(
	@cavityID,
	@x,
	@y,
	@z
)

SET @lastPositionID=@@identity;

SET @err = @@error
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCavityFirstPosition]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertCavityFirstPosition]
	@primitiveID INT,
	@x FLOAT,
	@y FLOAT,
	@z FLOAT,
	@firstPositionID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT
DECLARE @cavityID INT

/*determine cavityID by primitiveID*/
SELECT @cavityID=CavityID FROM Primitives INNER JOIN Cavities ON Primitives.PrimitiveID=Cavities.PrimitiveID WHERE Primitives.PrimitiveID=@primitiveID

/*fill in FirstPositions table*/
INSERT [FirstPositions]
(
	CavityID,
	X,
	Y,
	Z
)
VALUES
(
	@cavityID,
	@x,
	@y,
	@z
)

SET @firstPositionID=@@identity;

SET @err = @@error
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertGripperPosition]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_InsertGripperPosition]
	@modelID INT,
	@x FLOAT,
	@y FLOAT,
	@z FLOAT,
	@orientation FLOAT,
	@options NVARCHAR(50),
	@gripperPositionID INT OUT

AS

SET NOCOUNT ON

DECLARE @itemID INT
DECLARE @err INT

/*determine itemID by modelID*/
SELECT @itemID=ItemID FROM Models INNER JOIN Items ON Models.ModelID=Items.ModelID WHERE Models.ModelID=@modelID

/*fill in GripperPositions table*/
INSERT [GripperPositions]
(
	ItemID,
	X,
	Y,
	Z,
	Orientation,
	Options
)
VALUES
(
	@itemID,
	@x,
	@y,
	@z,
	@orientation,
	@options
)

SET @gripperPositionID=@@identity;

SET @err = @@error
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertGripperArea]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertGripperArea]
	@modelID INT,
	@pointInd INT,
	@x FLOAT,
	@y FLOAT,
	@gripperAreaID INT OUT

AS

SET NOCOUNT ON

DECLARE @worktableID INT
DECLARE @err INT

/*determine worktableID by modelID*/
SELECT @worktableID=WorktableID FROM Models INNER JOIN Worktables ON Models.ModelID=Worktables.ModelID WHERE Models.ModelID=@modelID

/*fill in GripperAreas table*/
INSERT [GripperAreas]
(
	WorktableID,
	PointInd,
	X,
	Y
)
VALUES
(
	@worktableID,
	@pointInd,
	@x,
	@y
)

SET @gripperAreaID=@@identity
SET @err = @@error
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertLayout]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertLayout]
	@modelInstanceID INT,
	@name NVARCHAR(50),
	@description NVARCHAR(50),
	@binary IMAGE,
	@layoutID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT;

BEGIN TRANSACTION

/*fill Layouts table*/
INSERT [Layouts]
(
	ModelInstanceID,
	Name,
	Description,
	Binary
)
VALUES
(
	@modelInstanceID,
	@name,
	@description,
	@binary
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

SET @layoutID=@@identity;

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertItemInstance]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertItemInstance]
	@parentPrimitiveInstanceID INT,
	@modelID INT,
	@restrictionMode NVARCHAR(50),
	@accessMode NVARCHAR(50),
	@timeout INT,
	@name NVARCHAR(50),
	@description NVARCHAR(50),
	@modelInstanceID INT OUT
AS

SET NOCOUNT ON

DECLARE @err INT

BEGIN TRANSACTION

INSERT [ModelInstances]
(
	ParentPrimitiveInstanceID,
	ModelID,
	Name,
	Description
)
VALUES
(
	@parentPrimitiveInstanceID,
	@modelID ,
	@name ,
	@description
)

SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

SET @modelInstanceID=@@identity;

INSERT [ItemInstances]
(
	ModelInstanceID,
	RestrictionMode,
	AccessMode,
	Timeout
)
VALUES
(
	@modelInstanceID ,
	@restrictionMode,
	@accessMode,
	@timeout
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertDriverProperty]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertDriverProperty]
	@modelID INT,
	@propertyName NVARCHAR(50),
	@propertyType NVARCHAR(50),
	@driverPropertyID INT OUT

AS

SET NOCOUNT ON

DECLARE @deviceID INT
DECLARE @err INT

/*determine driverID by modelID*/
SELECT @deviceID=DeviceID FROM Models INNER JOIN Devices ON Models.ModelID=Devices.ModelID WHERE Models.ModelID=@modelID

/*fill in DriverPropertyAssignments table*/
INSERT [DriverProperties]
(
	DeviceID,
	PropertyName,
	PropertyType
)
VALUES
(
	@deviceID,
	@propertyName,
	@propertyType
)

SET @driverPropertyID=@@identity
SET @err = @@error
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertDriverBinary]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertDriverBinary]
	@modelID INT,
	@binary IMAGE,
	@deviceBinaryID INT OUT

AS

SET NOCOUNT ON

DECLARE @deviceID INT
DECLARE @err INT

/*determine driverID by modelID*/
SELECT @deviceID=DeviceID FROM Models INNER JOIN Devices ON Models.ModelID=Devices.ModelID WHERE Models.ModelID=@modelID

/*fill in DriverPropertyAssignments table*/
INSERT [DeviceBinaries]
(
	DeviceID,
	Binary
)
VALUES
(
	@deviceID,
	@binary
)

SET @deviceBinaryID=@@identity
SET @err = @@error
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertDeviceInstance]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertDeviceInstance]
	@parentPrimitiveInstanceID INT,
	@modelID INT,
	@displayMode INT,
	@displayModeString NVARCHAR(50),
	@name NVARCHAR(50),
	@description NVARCHAR(50),
	@modelInstanceID INT OUT
AS

SET NOCOUNT ON

DECLARE @err INT

BEGIN TRANSACTION

INSERT [ModelInstances]
(
	ParentPrimitiveInstanceID,
	ModelID,
	Name,
	Description
)
VALUES
(
	@parentPrimitiveInstanceID,
	@modelID,
	@name,
	@description
)

SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

SET @modelInstanceID=@@identity

INSERT [DeviceInstances]
(
	ModelInstanceID,
	DisplayMode,
	DisplayModeString
)
VALUES
(
	@modelInstanceID,
	@displayMode,
	@displayModeString
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertPrimitivePosition]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertPrimitivePosition]
	@primitiveInstanceID INT,
	@positionX FLOAT,
	@positionY FLOAT,
	@positionZ FLOAT,
	@primitivePositionID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT

/*fill in PrimitivePositions table*/
INSERT [PrimitivePositions]
(
	PrimitiveInstanceID,
	PositionX,
	PositionY,
	PositionZ
)
VALUES
(
	@primitiveInstanceID,
	@positionX,
	@positionY,
	@positionZ
)

SET @primitivePositionID=@@identity;

SET @err = @@error
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertPrimitiveInstanceCustomProperty]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertPrimitiveInstanceCustomProperty]
	@primitiveInstanceID INT,
	@name NVARCHAR(50),
	@value NVARCHAR(50),
	@primitiveInstanceCustomPropertyID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT;

BEGIN TRANSACTION

/*fill PrimitiveInstanceCustomProperties table*/
INSERT [PrimitiveInstanceCustomProperties]
(
	PrimitiveInstanceID,
	Name,
	Value
)
VALUES
(
	@primitiveInstanceID,
	@name,
	@value
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

SET @primitiveInstanceCustomPropertyID=@@identity

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertPipettingArea]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertPipettingArea]
	@modelID INT,
	@pointInd INT,
	@x FLOAT,
	@y FLOAT,
	@pipettingAreaID INT OUT

AS

SET NOCOUNT ON

DECLARE @worktableID INT
DECLARE @err INT

/*determine worktableID by modelID*/
SELECT @worktableID=WorktableID FROM Models INNER JOIN Worktables ON Models.ModelID=Worktables.ModelID WHERE Models.ModelID=@modelID

/*fill in PipettingAreas table*/
INSERT [PipettingAreas]
(
	WorktableID,
	PointInd,
	X,
	Y
)
VALUES
(
	@worktableID,
	@pointInd,
	@x,
	@y
)

SET @pipettingAreaID=@@identity
SET @err = @@error
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertModelInstanceCustomProperty]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertModelInstanceCustomProperty]
	@modelInstanceID INT,
	@name NVARCHAR(50),
	@value NVARCHAR(50),
	@modelInstanceCustomPropertyID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT;

BEGIN TRANSACTION

/*fill ModelInstanceCustomProperties table*/
INSERT [ModelInstanceCustomProperties]
(
	ModelInstanceID,
	Name,
	Value
)
VALUES
(
	@modelInstanceID,
	@name,
	@value
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

SET @modelInstanceCustomPropertyID=@@identity

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertLayoutPrimitiveInstance]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertLayoutPrimitiveInstance]
	@modelInstanceID INT,
	@name NVARCHAR(50),
	@backgroundColorIndex INT,
	@backgroundImageIndex INT,
	@layoutPrimitiveInstanceID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT

BEGIN TRANSACTION

/*fill LayoutPrimitiveInstances table*/
INSERT [LayoutPrimitiveInstances]
(
	ModelInstanceID,
	Name,
	BackgroundColorIndex,
	BackgroundImageIndex
)
VALUES
(
	@modelInstanceID,
	@name,
	@backgroundColorIndex,
	@backgroundImageIndex
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

SET @layoutPrimitiveInstanceID=@@identity;

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertRoundCavity]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertRoundCavity]
	@checksum NVARCHAR(50),
	@shape NVARCHAR(50),
	@travelHeight FLOAT,
	@scanHeight FLOAT,
	@dispenseHeight FLOAT,
	@maxHeight FLOAT,
	@objectType NVARCHAR(50),
	@type NVARCHAR(50),
	@typeName NVARCHAR(50),
	@typeDescription NVARCHAR(50),
	@primitiveID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT;
DECLARE @cavityID INT;

BEGIN TRANSACTION

/*fill Primitives table*/
INSERT [Primitives]
(
	Checksum,
	ObjectType,
	Type,
	TypeName,
	TypeDescription
)
VALUES
(
	@checksum,
	@objectType,
	@type,
	@typeName,
	@typeDescription
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill Cavities table*/
SET @primitiveID=@@identity;

INSERT [Cavities]
(
	PrimitiveID,
	Shape,
	TravelHeight,
	DispenseHeight,
	ScanHeight,
	MaxHeight
)
VALUES
(
	@primitiveID,
	@shape,
	@travelHeight,
	@dispenseHeight,
	@scanHeight,
	@maxHeight
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill RoundCavities table */
SET @cavityID=@@identity;

insert [RoundCavities]
(
	CavityID
)
values
(
	@cavityID
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertRoundBody]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_InsertRoundBody]
	@checksum NVARCHAR(50),
	@diameter FLOAT,
	@height FLOAT,
	@shape NVARCHAR(50),
	@objectType NVARCHAR(50),
	@type NVARCHAR(50),
	@typeName NVARCHAR(50),
	@typeDescription NVARCHAR(50),
	@primitiveID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT
DECLARE @bodyID INT

BEGIN TRANSACTION

/*fill Primitives table*/
INSERT [Primitives]
(
	Checksum,
	ObjectType,
	Type,
	TypeName,
	TypeDescription
)
VALUES
(
	@checksum,
	@objectType,
	@type,
	@typeName,
	@typeDescription
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill Bodies table*/
SET @primitiveID=@@identity;

INSERT [Bodies]
(
	PrimitiveID,
	Shape
)
VALUES
(
	@primitiveID,
	@shape
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill RoundBodies table */
SET @bodyID=@@identity;

INSERT [RoundBodies]
(
	BodyID,
	Diameter,
	Height
)
VALUES
(
	@bodyID,
	@diameter,
	@height
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertRoundBase]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertRoundBase]
	@checksum NVARCHAR(50),
	@diameter FLOAT,
	@height FLOAT,
	@shape NVARCHAR(50),
	@objectType NVARCHAR(50),
	@type NVARCHAR(50),
	@typeName NVARCHAR(50),
	@typeDescription NVARCHAR(50),
	@primitiveID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT;
DECLARE @baseID INT;

BEGIN TRANSACTION

/*fill Primitives table*/
INSERT [Primitives]
(
	Checksum,
	ObjectType,
	Type,
	TypeName,
	TypeDescription
)
VALUES
(
	@checksum,
	@objectType,
	@type,
	@typeName,
	@typeDescription
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill Bases table*/
SET @primitiveID=@@identity;

INSERT [Bases]
(
	PrimitiveID,
	Shape
)
VALUES
(
	@primitiveID,
	@shape
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill RoundBases table */
SET @baseID=@@identity;

INSERT [RoundBases]
(
	BaseID,
	Diameter,
	Height
)
VALUES
(
	@baseID,
	@diameter,
	@height
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertReferencePoint]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_InsertReferencePoint]
	@modelID INT,
	@x FLOAT,
	@y FLOAT,
	@z FLOAT,
	@referencePointID INT OUT

AS

SET NOCOUNT ON

DECLARE @worktableID INT
DECLARE @err INT

/*determine worktableID by modelID*/
SELECT @worktableID=WorktableID FROM Models INNER JOIN Worktables ON Models.ModelID=Worktables.ModelID WHERE Models.ModelID=@modelID

/*fill in WorktableShapes table*/
INSERT [ReferencePoints]
(
	WorktableID,
	X,
	Y,
	Z
)
VALUES
(
	@worktableID,
	@x,
	@y,
	@z
)

SET @referencePointID=@@identity
SET @err = @@error
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertRectSlot]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertRectSlot]
	@checksum NVARCHAR(50),
	@length FLOAT,
	@width FLOAT,
	@height FLOAT,
	@shape NVARCHAR(50),
	@objectType NVARCHAR(50),
	@type NVARCHAR(50),
	@typeName NVARCHAR(50),
	@typeDescription NVARCHAR(50),
	@primitiveID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT
DECLARE @SlotID INT

BEGIN TRANSACTION

/*fill Primitives table*/
INSERT [Primitives]
(
	Checksum,
	ObjectType,
	Type,
	TypeName,
	TypeDescription
)
VALUES
(
	@checksum,
	@objectType,
	@type,
	@typeName,
	@typeDescription
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill Slots table*/
SET @primitiveID=@@identity;

INSERT [Slots]
(
	PrimitiveID,
	Shape
)
VALUES
(
	@primitiveID,
	@shape
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill RectSlots table */
SET @SlotID=@@identity;

INSERT [RectSlots]
(
	SlotID,
	Width,
	Length,
	Height
)
VALUES
(
	@SlotID,
	@width,
	@length,
	@height
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertRectCavity]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertRectCavity]
	@checksum NVARCHAR(50),
	@shape NVARCHAR(50),
	@travelHeight FLOAT,
	@scanHeight FLOAT,
	@dispenseHeight FLOAT,
	@maxHeight FLOAT,
	@objectType NVARCHAR(50),
	@type NVARCHAR(50),
	@typeName NVARCHAR(50),
	@typeDescription NVARCHAR(50),
	@primitiveID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT;
DECLARE @cavityID INT;

BEGIN TRANSACTION

/*fill Primitives table*/
INSERT [Primitives]
(
	Checksum,
	ObjectType,
	Type,
	TypeName,
	TypeDescription
)
VALUES
(
	@checksum,
	@objectType,
	@type,
	@typeName,
	@typeDescription
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill Cavities table*/
SET @primitiveID=@@identity;

INSERT [Cavities]
(
	PrimitiveID,
	Shape,
	TravelHeight,
	DispenseHeight,
	ScanHeight,
	MaxHeight
)
VALUES
(
	@primitiveID,
	@shape,
	@travelHeight,
	@dispenseHeight,
	@scanHeight,
	@maxHeight
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill RectCavities table */
SET @cavityID=@@identity;

insert [RectCavities]
(
	CavityID
)
values
(
	@cavityID
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertRectBody]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_InsertRectBody]
	@checksum NVARCHAR(50),
	@length FLOAT,
	@width FLOAT,
	@height FLOAT,
	@shape NVARCHAR(50),
	@objectType NVARCHAR(50),
	@type NVARCHAR(50),
	@typeName NVARCHAR(50),
	@typeDescription NVARCHAR(50),
	@primitiveID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT
DECLARE @bodyID INT

BEGIN TRANSACTION

/*fill Primitives table*/
INSERT [Primitives]
(
	Checksum,
	ObjectType,
	Type,
	TypeName,
	TypeDescription
)
VALUES
(
	@checksum,
	@objectType,
	@type,
	@typeName,
	@typeDescription
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill Bodies table*/
SET @primitiveID=@@identity;

INSERT [Bodies]
(
	PrimitiveID,
	Shape
)
VALUES
(
	@primitiveID,
	@shape
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill RectBodies table */
SET @bodyID=@@identity;

INSERT [RectBodies]
(
	BodyID,
	Width,
	Length,
	Height
)
VALUES
(
	@bodyID,
	@width,
	@length,
	@height
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertRectBase]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertRectBase]
	@checksum NVARCHAR(50),
	@length FLOAT,
	@width FLOAT,
	@height FLOAT,
	@shape NVARCHAR(50),
	@objectType NVARCHAR(50),
	@type NVARCHAR(50),
	@typeName NVARCHAR(50),
	@typeDescription NVARCHAR(50),
	@primitiveID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT;
DECLARE @baseID INT;

BEGIN TRANSACTION

/*fill Primitives table*/
INSERT [Primitives]
(
	Checksum,
	ObjectType,
	Type,
	TypeName,
	TypeDescription
)
VALUES
(
	@checksum,
	@objectType,
	@type,
	@typeName,
	@typeDescription
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill Bases table*/
SET @primitiveID=@@identity;

INSERT [Bases]
(
	PrimitiveID,
	Shape
)
VALUES
(
	@primitiveID,
	@shape
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill RectBases table */
SET @baseID=@@identity;

INSERT [RectBases]
(
	BaseID,
	Width,
	Length,
	Height
)
VALUES
(
	@baseID,
	@width,
	@length,
	@height
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertScalingPoint]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_InsertScalingPoint]
	@modelID INT,
	@x FLOAT,
	@y FLOAT,
	@z FLOAT,
	@scalingPointID INT OUT

AS

SET NOCOUNT ON

DECLARE @worktableID INT
DECLARE @err INT

/*determine worktableID by modelID*/
SELECT @worktableID=WorktableID FROM Models INNER JOIN Worktables ON Models.ModelID=Worktables.ModelID WHERE Models.ModelID=@modelID

/*fill in WorktableShapes table*/
INSERT [ScalingPoints]
(
	WorktableID,
	X,
	Y,
	Z
)
VALUES
(
	@worktableID,
	@x,
	@y,
	@z
)

SET @scalingPointID=@@identity
SET @err = @@error
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertRoundSlot]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertRoundSlot]
	@checksum NVARCHAR(50),
	@diameter FLOAT,
	@height FLOAT,
	@shape NVARCHAR(50),
	@objectType NVARCHAR(50),
	@type NVARCHAR(50),
	@typeName NVARCHAR(50),
	@typeDescription NVARCHAR(50),
	@primitiveID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT;
DECLARE @SlotID INT;

BEGIN TRANSACTION

/*fill Primitives table*/
INSERT [Primitives]
(
	Checksum,
	ObjectType,
	Type,
	TypeName,
	TypeDescription
)
VALUES
(
	@checksum,
	@objectType,
	@type,
	@typeName,
	@typeDescription
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill Slots table*/
SET @primitiveID=@@identity;

INSERT [Slots]
(
	PrimitiveID,
	Shape
)
VALUES
(
	@primitiveID,
	@shape
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*fill RoundSlots table */
SET @SlotID=@@identity;

INSERT [RoundSlots]
(
	SlotID,
	Diameter,
	Height
)
VALUES
(
	@SlotID,
	@diameter,
	@height
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectCavityLastPosition]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_SelectCavityLastPosition]
	@cavityID INT

AS

SET NOCOUNT ON

SELECT * FROM LastPositions WHERE CavityID=@cavityID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectCavityFirstPosition]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_SelectCavityFirstPosition]
	@cavityID INT

AS

SET NOCOUNT ON

SELECT * FROM FirstPositions WHERE cavityID=@cavityID
GO
/****** Object:  StoredProcedure [dbo].[sp_LayoutExists]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_LayoutExists]
	@name NVARCHAR(50),
	@result INT OUT

AS

SET NOCOUNT ON

IF EXISTS(SELECT * FROM Layouts WHERE Name=@name)
	BEGIN
		SELECT @result=LayoutID FROM Layouts WHERE Name=@name
	END
ELSE
	BEGIN
		SET @result=0
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertWorktableShape]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertWorktableShape]
	@modelID INT,
	@pointInd INT,
	@x FLOAT,
	@y FLOAT,
	@worktableShapeID INT OUT

AS

SET NOCOUNT ON

DECLARE @worktableID INT
DECLARE @err INT

/*determine worktableID by modelID*/
SELECT @worktableID=WorktableID FROM Models INNER JOIN Worktables ON Models.ModelID=Worktables.ModelID WHERE Models.ModelID=@modelID

/*fill in WorktableShapes table*/
INSERT [WorktableShapes]
(
	WorktableID,
	PointInd,
	X,
	Y
)
VALUES
(
	@worktableID,
	@pointInd,
	@x,
	@y
)

SET @worktableShapeID=@@identity
SET @err = @@error
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertTeachingOffset]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_InsertTeachingOffset]
	@modelInstanceID INT,
	@x FLOAT,
	@y FLOAT,
	@z FLOAT,
	@teachingOffsetID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT;

BEGIN TRANSACTION

/*fill TeachingOffsets table*/
INSERT [TeachingOffsets]
(
	ModelInstanceID,
	X,
	Y,
	Z
)
VALUES
(
	@modelInstanceID,
	@x,
	@y,
	@z
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

SET @teachingOffsetID=@@identity

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertStackerGripperPosition]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertStackerGripperPosition]
	@primitiveID INT,
	@gripperPositionInd INT,
	@x FLOAT,
	@y FLOAT,
	@z FLOAT,
	@orientation FLOAT,
	@options NVARCHAR(50),
	@stackerGripperPositionID INT OUT

AS

SET NOCOUNT ON

DECLARE @stackerID INT
DECLARE @err INT

/*determine stackerID by primitiveID*/
SELECT @stackerID=StackerID FROM Primitives INNER JOIN Stackers ON Primitives.PrimitiveID=Stackers.PrimitiveID WHERE Primitives.PrimitiveID=@primitiveID

/*fill in StackerGripperPositions table*/
INSERT [StackerGripperPositions]
(
	StackerID,
	GripperPositionInd,
	X,
	Y,
	Z,
	Orientation,
	Options
)
VALUES
(
	@stackerID,
	@gripperPositionInd,
	@x,
	@y,
	@z,
	@orientation,
	@options
)

SET @stackerGripperPositionID=@@identity;

SET @err = @@error
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertSlotInstance]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertSlotInstance]
	@modelID INT,
	@primitiveID INT,
	@parentName VARCHAR(50),
	@tiltX FLOAT,
	@tiltY FLOAT,
	@orientation FLOAT,
	@name VARCHAR(50),
	@description VARCHAR(50),
	@primitiveInstanceID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT;

BEGIN TRANSACTION

/*fill PrimitiveInstances table*/
INSERT [PrimitiveInstances]
(
	ModelID,
	PrimitiveID,
	ParentName,
	Orientation,
	Name,
	Description
)
VALUES
(
	@modelID,
	@primitiveID,
	@parentName,
	@orientation,
	@name ,
	@description
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

SET @primitiveInstanceID=@@identity

INSERT [SlotInstances]
(
	PrimitiveInstanceID,
	TiltX,
	TiltY
)
VALUES
(
	@primitiveInstanceID ,
	@tiltX,
	@tiltY
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertSlotGripperPosition]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertSlotGripperPosition]
	@primitiveID INT,
	@gripperPositionInd INT,
	@x FLOAT,
	@y FLOAT,
	@z FLOAT,
	@orientation FLOAT,
	@options NVARCHAR(50),
	@slotGripperPositionID INT OUT

AS

SET NOCOUNT ON

DECLARE @slotID INT
DECLARE @err INT

/*determine slotID by primitiveID*/
SELECT @slotID=SlotID FROM Primitives INNER JOIN Slots ON Primitives.PrimitiveID=Slots.PrimitiveID WHERE Primitives.PrimitiveID=@primitiveID

/*fill in SlotGripperPositions table*/
INSERT [SlotGripperPositions]
(
	SlotID,
	GripperPositionInd,
	X,
	Y,
	Z,
	Orientation,
	Options
)
VALUES
(
	@slotID,
	@gripperPositionInd,
	@x,
	@y,
	@z,
	@orientation,
	@options
)

SET @slotGripperPositionID=@@identity;

SET @err = @@error
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertSecondPipettingArea]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertSecondPipettingArea]
	@modelID INT,
	@pointInd INT,
	@x FLOAT,
	@y FLOAT,
	@secondPipettingAreaID INT OUT

AS

SET NOCOUNT ON

DECLARE @worktableID INT
DECLARE @err INT

/*determine worktableID by modelID*/
SELECT @worktableID=WorktableID FROM Models INNER JOIN Worktables ON Models.ModelID=Worktables.ModelID WHERE Models.ModelID=@modelID

/*fill in SecondPipettingAreas table*/
INSERT [SecondPipettingAreas]
(
	WorktableID,
	PointInd,
	X,
	Y
)
VALUES
(
	@worktableID,
	@pointInd,
	@x,
	@y
)

SET @secondPipettingAreaID=@@identity
SET @err = @@error
GO
/****** Object:  Table [dbo].[ScalingVectors]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScalingVectors](
	[ScalingVectorID] [int] IDENTITY(1,1) NOT NULL,
	[LayoutID] [int] NOT NULL,
	[X] [float] NOT NULL,
	[Y] [float] NOT NULL,
	[Z] [float] NOT NULL,
 CONSTRAINT [PK_ScalingVectors] PRIMARY KEY CLUSTERED 
(
	[ScalingVectorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteItemInstance]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteItemInstance]
	@modelInstanceID INT,
	@result INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT

/*delete ItemInstances table*/
DELETE FROM ItemInstances WHERE ModelInstanceID=@modelInstanceID
SET @err = @@error IF @err <> 0 BEGIN SET @result=@err RETURN @err END

/*delete TeachingOffsets table*/
DELETE FROM TeachingOffsets WHERE ModelInstanceID=@modelInstanceID
SET @err = @@error IF @err <> 0 BEGIN SET @result=@err RETURN @err END

/*delete ModelInstanceCustomProperties table*/
DELETE FROM ModelInstanceCustomProperties WHERE ModelInstanceID=@modelInstanceID
SET @err = @@error IF @err <> 0 BEGIN SET @result=@err RETURN @err END

/*delete ModelInstances table*/
DELETE FROM ModelInstances WHERE ModelInstanceID=@modelInstanceID
SET @err = @@error IF @err <> 0 BEGIN SET @result=@err RETURN @err END
SET @result=0
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteItem]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteItem]
	@modelID INT

AS

SET NOCOUNT ON

DECLARE @err INT
DECLARE @objectType NVARCHAR(50)

BEGIN TRANSACTION

/*get ObjectType by modelID*/
SELECT @objectType=ObjectType FROM Primitives
	INNER JOIN PrimitiveInstances ON Primitives.PrimitiveID=PrimitiveInstances.PrimitiveID
	INNER JOIN SlotInstances ON PrimitiveInstances.PrimitiveInstanceID=SlotInstances.PrimitiveInstanceID
	WHERE PrimitiveInstances.ModelID=@modelID

/*delete Pinpoints table*/
DELETE FROM Pinpoints WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete GripperPositions table */
DELETE GripperPositions FROM GripperPositions INNER JOIN Items ON GripperPositions.ItemID=Items.ItemID WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Items table*/
DELETE FROM Items WHERE ModelID=@modelID

/*delete AreaAccessRestrictions table*/
DELETE FROM AreaAccessRestrictions WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete ModelTypeCustomProperties table*/
DELETE FROM ModelTypeCustomProperties WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete PrimitivePositions table*/
DELETE PrimitivePositions FROM PrimitivePositions
	INNER JOIN PrimitiveInstances ON PrimitivePositions.PrimitiveInstanceID=PrimitiveInstances.PrimitiveInstanceID
	WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete PrimitiveInstanceCustomProperties table*/
DELETE PrimitiveInstanceCustomProperties FROM PrimitiveInstanceCustomProperties
	INNER JOIN PrimitiveInstances ON PrimitiveInstanceCustomProperties.PrimitiveInstanceID=PrimitiveInstances.PrimitiveInstanceID
	WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

IF (@objectType='RectSlot')
	BEGIN
		DELETE SlotInstances FROM SlotInstances INNER JOIN PrimitiveInstances ON PrimitiveInstances.PrimitiveInstanceID=SlotInstances.PrimitiveInstanceID WHERE ModelID=@modelID
		SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END
	END
ELSE IF (@objectType='RoundSlot') 
	BEGIN
		DELETE SlotInstances FROM SlotInstances INNER JOIN PrimitiveInstances ON PrimitiveInstances.PrimitiveInstanceID=SlotInstances.PrimitiveInstanceID WHERE ModelID=@modelID
		SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END
	END

/*delete PrimitiveInstances table*/
DELETE FROM PrimitiveInstances WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Models table*/
DELETE FROM Models WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteDeviceInstance]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteDeviceInstance]
	@modelInstanceID INT,
	@result INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT

/*delete DeviceInstances table*/
DELETE FROM DeviceInstances WHERE ModelInstanceID=@modelInstanceID
SET @err = @@error IF @err <> 0 BEGIN SET @result=@err RETURN @err END

/*delete TeachingOffsets table*/
DELETE FROM TeachingOffsets WHERE ModelInstanceID=@modelInstanceID
SET @err = @@error IF @err <> 0 BEGIN SET @result=@err RETURN @err END

/*delete ModelInstanceCustomProperties table*/
DELETE FROM ModelInstanceCustomProperties WHERE ModelInstanceID=@modelInstanceID
SET @err = @@error IF @err <> 0 BEGIN SET @result=@err RETURN @err END

/*delete ModelInstances table*/
DELETE FROM ModelInstances WHERE ModelInstanceID=@modelInstanceID
SET @err = @@error IF @err <> 0 BEGIN SET @result=@err RETURN @err END
SET @result=0
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteRoundBody]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteRoundBody]
	@primitiveID INT

AS

SET NOCOUNT ON

DECLARE @err INT

BEGIN TRANSACTION

/*delete RoundBodies table */
DELETE RoundBodies FROM RoundBodies INNER JOIN Bodies ON Bodies.BodyID=RoundBodies.BodyID WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Bodies table*/
DELETE FROM Bodies WHERE PrimitiveID=@primitiveID

/*delete BackgroundImages table*/
DELETE BackgroundImages FROM BackgroundImages WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete BackgroundColors table*/
DELETE BackgroundColors FROM BackgroundColors WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete PrimitiveTypeCustomProperties table*/
DELETE PrimitiveTypeCustomProperties FROM PrimitiveTypeCustomProperties WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Primitives table*/
DELETE FROM Primitives WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteRoundBase]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteRoundBase]
	@primitiveID INT

AS

SET NOCOUNT ON

DECLARE @err INT;

BEGIN TRANSACTION

/*delete RoundBases table */
DELETE RoundBases FROM RoundBases INNER JOIN Bases ON Bases.BaseID=RoundBases.BaseID WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Bases table*/
DELETE FROM Bases WHERE PrimitiveID=@primitiveID

/*delete BackgroundImages table*/
DELETE BackgroundImages FROM BackgroundImages WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete BackgroundColors table*/
DELETE BackgroundColors FROM BackgroundColors WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete PrimitiveTypeCustomProperties table*/
DELETE PrimitiveTypeCustomProperties FROM PrimitiveTypeCustomProperties WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Primitives table*/
DELETE FROM Primitives WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteRectSlot]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteRectSlot]
	@primitiveID INT

AS

SET NOCOUNT ON

DECLARE @err INT

BEGIN TRANSACTION

/*delete RectSlots table */
DELETE RectSlots FROM RectSlots INNER JOIN Slots ON Slots.SlotID=RectSlots.SlotID WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete SlotGripperPositions table*/
DELETE SlotGripperPositions FROM SlotGripperPositions INNER JOIN Slots ON Slots.SlotID=SlotGripperPositions.SlotID WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Slots table*/
DELETE FROM Slots WHERE PrimitiveID=@primitiveID

/*delete BackgroundImages table*/
DELETE BackgroundImages FROM BackgroundImages WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete BackgroundColors table*/
DELETE BackgroundColors FROM BackgroundColors WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete PrimitiveTypeCustomProperties table*/
DELETE PrimitiveTypeCustomProperties FROM PrimitiveTypeCustomProperties WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Primitives table*/
DELETE FROM Primitives WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteStacker]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteStacker]
	@primitiveID INT

AS

SET NOCOUNT ON

DECLARE @err INT;

BEGIN TRANSACTION

/*delete StackerGripperPositions table*/
DELETE StackerGripperPositions FROM StackerGripperPositions INNER JOIN Stackers ON Stackers.StackerID=StackerGripperPositions.StackerID WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Stackers table*/
DELETE FROM Stackers WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete BackgroundImages table*/
DELETE BackgroundImages FROM BackgroundImages WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete BackgroundColors table*/
DELETE BackgroundColors FROM BackgroundColors WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete PrimitiveTypeCustomProperties table*/
DELETE PrimitiveTypeCustomProperties FROM PrimitiveTypeCustomProperties WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Primitives table*/
DELETE FROM Primitives WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteRoundSlot]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteRoundSlot]
	@primitiveID INT

AS

SET NOCOUNT ON

DECLARE @err INT

BEGIN TRANSACTION

/*delete RoundSlots table */
DELETE RoundSlots FROM RoundSlots INNER JOIN Slots ON Slots.SlotID=RoundSlots.SlotID WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete SlotGripperPositions table*/
DELETE SlotGripperPositions FROM SlotGripperPositions INNER JOIN Slots ON Slots.SlotID=SlotGripperPositions.SlotID WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Slots table*/
DELETE FROM Slots WHERE PrimitiveID=@primitiveID

/*delete BackgroundImages table*/
DELETE BackgroundImages FROM BackgroundImages WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete BackgroundColors table*/
DELETE BackgroundColors FROM BackgroundColors WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete PrimitiveTypeCustomProperties table*/
DELETE PrimitiveTypeCustomProperties FROM PrimitiveTypeCustomProperties WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Primitives table*/
DELETE FROM Primitives WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectDriverProperties]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_SelectDriverProperties]
	@typeName NVARCHAR(50)

AS

SET NOCOUNT ON

SELECT Devices.DeviceID, DriverPropertyID, PropertyName, PropertyType FROM Models
	INNER JOIN Devices ON Models.ModelID=Devices.ModelID
	INNER JOIN DriverProperties ON Devices.DeviceID=DriverProperties.DeviceID
	WHERE TypeName=@typeName
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectDeviceInstance]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectDeviceInstance]
	@modelInstanceID INT

AS

SET NOCOUNT ON

SELECT * FROM ModelInstances INNER JOIN DeviceInstances ON ModelInstances.ModelInstanceID=DeviceInstances.ModelInstanceID
	WHERE ModelInstances.ModelInstanceID=@modelInstanceID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectDeviceBinary]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_SelectDeviceBinary]
	@typeName NVARCHAR(50)

AS

SET NOCOUNT ON

SELECT  * FROM Models
	INNER JOIN Devices ON Models.ModelID=Devices.ModelID
	INNER JOIN DeviceBinaries ON Devices.DeviceID=DeviceBinaries.DeviceID
	WHERE TypeName=@typeName
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectGripperPosition]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectGripperPosition]
	@typeName NVARCHAR(50)

AS

SET NOCOUNT ON

SELECT  X, Y, Z, Orientation, Options FROM Models
	INNER JOIN Items ON Models.ModelID=Items.ModelID
	INNER JOIN GripperPositions ON Items.ItemID=GripperPositions.ItemID
	WHERE TypeName=@typeName
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectGripperArea]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectGripperArea]
	@typeName NVARCHAR(50)

AS

SET NOCOUNT ON

SELECT Worktables.WorktableID, PointInd, X, Y FROM Models
	INNER JOIN Worktables ON Models.ModelID=Worktables.ModelID
	INNER JOIN GripperAreas ON Worktables.WorktableID=GripperAreas.WorktableID
	WHERE TypeName=@typeName ORDER BY PointInd
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectLayoutPrimitiveInstances]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_SelectLayoutPrimitiveInstances]
	@modelInstanceID INT

AS

SET NOCOUNT ON

SELECT * FROM LayoutPrimitiveInstances WHERE ModelInstanceID=@modelInstanceID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectModelType]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_SelectModelType]
	@typeName NVARCHAR(50)

AS

SET NOCOUNT ON

DECLARE @modelID INT
DECLARE @objectType NVARCHAR(50)
DECLARE @shape NVARCHAR(50)

/*try Models*/
SET @modelID=-1
SELECT @modelID=ModelID, @objectType=ObjectType FROM Models WHERE TypeName=@typeName
IF (@modelID>0)
	BEGIN
		/*get the Model by ObjectType*/
		IF (@objectType='Worktable')
			EXEC sp_SelectWorktable @modelID=@modelID
		ELSE IF (@objectType='Decktray')
			EXEC sp_SelectDecktray @modelID=@modelID
		ELSE IF (@objectType='Device')
			EXEC sp_SelectDevice @modelID=@modelID
		ELSE IF (@objectType='Item')
			EXEC sp_SelectItem @modelID=@modelID
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectModelInstanceCustomProperties]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectModelInstanceCustomProperties]
	@modelInstanceID INT

AS

SET NOCOUNT ON

SELECT * FROM ModelInstanceCustomProperties WHERE ModelInstanceID=@modelInstanceID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectLayout]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectLayout]
	@layoutName NVARCHAR(50)

AS

SET NOCOUNT ON

SELECT * FROM Layouts WHERE Name=@layoutName
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectItemInstance]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_SelectItemInstance]
	@modelInstanceID INT

AS

SET NOCOUNT ON

SELECT * FROM ModelInstances INNER JOIN ItemInstances ON ModelInstances.ModelInstanceID=ItemInstances.ModelInstanceID
	WHERE ModelInstances.ModelInstanceID=@modelInstanceID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectPipettingArea]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectPipettingArea]
	@typeName NVARCHAR(50)

AS

SET NOCOUNT ON

SELECT Worktables.WorktableID, PointInd, X, Y FROM Models
	INNER JOIN Worktables ON Models.ModelID=Worktables.ModelID
	INNER JOIN PipettingAreas ON Worktables.WorktableID=PipettingAreas.WorktableID
	WHERE TypeName=@typeName ORDER BY PointInd
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectPrimitiveInstancePosition]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_SelectPrimitiveInstancePosition]
	@primitiveInstanceID INT

AS

SET NOCOUNT ON

SELECT * FROM PrimitivePositions WHERE PrimitiveInstanceID=@primitiveInstanceID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectPrimitiveInstanceCustomProperties]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectPrimitiveInstanceCustomProperties]
	@primitiveInstanceID INT

AS

SET NOCOUNT ON

SELECT * FROM PrimitiveInstanceCustomProperties WHERE PrimitiveInstanceID=@primitiveInstanceID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectRoundCavity]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectRoundCavity]
	@primitiveID INT

AS

SET NOCOUNT ON

SELECT * FROM Primitives INNER JOIN Cavities ON  Primitives.PrimitiveID=Cavities.PrimitiveID 
	INNER JOIN RoundCavities ON Cavities.CavityID=RoundCavities.CavityID
	WHERE Primitives.PrimitiveID=@primitiveID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectRoundBody]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_SelectRoundBody]
	@primitiveID INT

AS

SET NOCOUNT ON

SELECT * FROM Primitives 
	INNER JOIN Bodies ON  Primitives.PrimitiveID=Bodies.PrimitiveID 
	INNER JOIN RoundBodies ON Bodies.BodyID=RoundBodies.BodyID
	WHERE Primitives.PrimitiveID=@primitiveID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectRoundBase]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectRoundBase]
	@primitiveID INT

AS

SET NOCOUNT ON

SELECT * FROM Primitives 
	INNER JOIN Bases ON  Primitives.PrimitiveID=Bases.PrimitiveID 
	INNER JOIN RoundBases ON Bases.BaseID=RoundBases.BaseID
	WHERE Primitives.PrimitiveID=@primitiveID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectReferencePoint]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_SelectReferencePoint]
	@typeName NVARCHAR(50)

AS

SET NOCOUNT ON

SELECT Worktables.WorktableID,  X, Y, Z FROM Models
	INNER JOIN Worktables ON Models.ModelID=Worktables.ModelID
	INNER JOIN ReferencePoints ON Worktables.WorktableID=ReferencePoints.WorktableID
	WHERE TypeName=@typeName
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectRectSlot]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectRectSlot]
	@primitiveID INT

AS

SET NOCOUNT ON

SELECT * FROM Primitives 
	INNER JOIN Slots ON  Primitives.PrimitiveID=Slots.PrimitiveID 
	INNER JOIN RectSlots ON Slots.SlotID=RectSlots.SlotID
	WHERE Primitives.PrimitiveID=@primitiveID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectWorktableShape]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectWorktableShape]
	@typeName NVARCHAR(50)

AS

SET NOCOUNT ON

SELECT Worktables.WorktableID, PointInd, X, Y FROM Models
	INNER JOIN Worktables ON Models.ModelID=Worktables.ModelID
	INNER JOIN WorktableShapes ON Worktables.WorktableID=WorktableShapes.WorktableID
	WHERE TypeName=@typeName ORDER BY PointInd
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectRectCavity]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectRectCavity]
	@primitiveID INT

AS

SET NOCOUNT ON

SELECT * FROM Primitives 
	INNER JOIN Cavities ON  Primitives.PrimitiveID=Cavities.PrimitiveID 
	INNER JOIN RectCavities ON Cavities.CavityID=RectCavities.CavityID
	WHERE Primitives.PrimitiveID=@primitiveID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectRectBody]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_SelectRectBody]
	@primitiveID INT

AS

SET NOCOUNT ON

SELECT * FROM Primitives 
	INNER JOIN Bodies ON  Primitives.PrimitiveID=Bodies.PrimitiveID 
	INNER JOIN RectBodies ON Bodies.BodyID=RectBodies.BodyID
	WHERE Primitives.PrimitiveID=@primitiveID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectRectBase]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectRectBase]
	@primitiveID INT

AS

SET NOCOUNT ON

SELECT * FROM Primitives 
	INNER JOIN Bases ON  Primitives.PrimitiveID=Bases.PrimitiveID 
	INNER JOIN RectBases ON Bases.BaseID=RectBases.BaseID
	WHERE Primitives.PrimitiveID=@primitiveID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectScalingPoint]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_SelectScalingPoint]
	@typeName NVARCHAR(50)

AS

SET NOCOUNT ON

SELECT Worktables.WorktableID,  X, Y, Z FROM Models
	INNER JOIN Worktables ON Models.ModelID=Worktables.ModelID
	INNER JOIN ScalingPoints ON Worktables.WorktableID=ScalingPoints.WorktableID
	WHERE TypeName=@typeName
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectRoundSlot]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectRoundSlot]
	@primitiveID INT

AS

SET NOCOUNT ON

SELECT * FROM Primitives 
	INNER JOIN Slots ON  Primitives.PrimitiveID=Slots.PrimitiveID 
	INNER JOIN RoundSlots ON Slots.SlotID=RoundSlots.SlotID
	WHERE Primitives.PrimitiveID=@primitiveID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectTeachingOffset]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_SelectTeachingOffset]
	@modelInstanceID INT

AS

SET NOCOUNT ON

SELECT * FROM TeachingOffsets WHERE ModelInstanceID=@modelInstanceID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectStackerGripperPositions]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectStackerGripperPositions]
	@typeName NVARCHAR(50)

AS

SET NOCOUNT ON

SELECT GripperPositionInd, X, Y, Z, Orientation, Options FROM Primitives
	INNER JOIN Stackers ON Primitives.PrimitiveID=Stackers.PrimitiveID
	INNER JOIN StackerGripperPositions ON Stackers.StackerID=StackerGripperPositions.StackerID
	WHERE TypeName=@typeName
	ORDER BY GripperPositionInd
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectSlotInstance]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_SelectSlotInstance]
	@primitiveInstanceID INT

AS

SET NOCOUNT ON

SELECT * FROM PrimitiveInstances 
	INNER JOIN SlotInstances ON PrimitiveInstances.PrimitiveInstanceID=SlotInstances.PrimitiveInstanceID
	WHERE PrimitiveInstances.PrimitiveInstanceID=@primitiveInstanceID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectSlotGripperPositions]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_SelectSlotGripperPositions]
	@typeName NVARCHAR(50)

AS

SET NOCOUNT ON

SELECT GripperPositionInd, X, Y, Z, Orientation, Options FROM Primitives
	INNER JOIN Slots ON Primitives.PrimitiveID=Slots.PrimitiveID
	INNER JOIN SlotGripperPositions ON Slots.SlotID=SlotGripperPositions.SlotID
	WHERE TypeName=@typeName
	ORDER BY GripperPositionInd
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectSecondPipettingArea]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectSecondPipettingArea]
	@typeName NVARCHAR(50)

AS

SET NOCOUNT ON

SELECT Worktables.WorktableID, PointInd, X, Y FROM Models
	INNER JOIN Worktables ON Models.ModelID=Worktables.ModelID
	INNER JOIN SecondPipettingAreas ON Worktables.WorktableID=SecondPipettingAreas.WorktableID
	WHERE TypeName=@typeName ORDER BY PointInd
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectScalingVector]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_SelectScalingVector]
	@layoutID INT

AS

SET NOCOUNT ON

SELECT * FROM ScalingVectors WHERE ScalingVectors.LayoutID=@layoutID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectRoundCavityShape]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_SelectRoundCavityShape]
	@typeName NVARCHAR(50)

AS

SET NOCOUNT ON

SELECT CircleInd, Diameter, TranslationX, TranslationY, TranslationZ FROM Primitives
	INNER JOIN Cavities ON Primitives.PrimitiveID=Cavities.PrimitiveID
	INNER JOIN RoundCavities ON Cavities.CavityID=RoundCavities.CavityID
	INNER JOIN RoundCavityShapes ON RoundCavities.RoundCavityID=RoundCavityShapes.RoundCavityID
	WHERE TypeName=@typeName
	ORDER BY CircleInd
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectRectCavityShape]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_SelectRectCavityShape]
	@typeName NVARCHAR(50)

AS

SET NOCOUNT ON

SELECT RectangleInd, Width, Length, TranslationX, TranslationY, TranslationZ FROM Primitives
	INNER JOIN Cavities ON Primitives.PrimitiveID=Cavities.PrimitiveID
	INNER JOIN RectCavities ON Cavities.CavityID=RectCavities.CavityID
	INNER JOIN RectCavityShapes ON RectCavities.RectCavityID=RectCavityShapes.RectCavityID
	WHERE TypeName=@typeName
	ORDER BY RectangleInd
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectPrimitiveType]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectPrimitiveType]
	@typeName NVARCHAR(50)

AS

SET NOCOUNT ON

DECLARE @primitiveID INT
DECLARE @objectType NVARCHAR(50)
DECLARE @shape NVARCHAR(50)

SET @primitiveID=-1
SELECT @primitiveID=PrimitiveID, @objectType=ObjectType FROM Primitives WHERE TypeName=@typeName
IF (@primitiveID>0)
	BEGIN
		/*get the Primitive by ObjectType*/
		IF (@objectType='LocationPin')
			EXEC sp_SelectLocationPin @primitiveID=@primitiveID
		ELSE IF (@objectType='LocationHole')
			EXEC sp_SelectLocationHole @primitiveID=@primitiveID
		ELSE IF (@objectType='Stacker')
			EXEC sp_SelectStacker @primitiveID=@primitiveID
		ELSE IF (@objectType='RectSlot')
			EXEC sp_SelectRectSlot @primitiveID=@primitiveID
		ELSE IF (@objectType='RoundSlot')
			EXEC sp_SelectRoundSlot @primitiveID=@primitiveID
		ELSE IF (@objectType='RectBase')
			EXEC sp_SelectRectBase @primitiveID=@primitiveID
		ELSE IF (@objectType='RoundBase')
			EXEC sp_SelectRoundBase @primitiveID=@primitiveID
		ELSE IF (@objectType='RectBody')
			EXEC sp_SelectRectBody @primitiveID=@primitiveID
		ELSE IF (@objectType='RoundBody')
			EXEC sp_SelectRoundBody @primitiveID=@primitiveID
		ELSE IF (@objectType='RectCavity')
			EXEC sp_SelectRectCavity @primitiveID=@primitiveID
		ELSE IF (@objectType='RoundCavity')
			EXEC sp_SelectRoundCavity @primitiveID=@primitiveID
		ELSE IF (@objectType='TipPosition')
			EXEC sp_SelectTipPosition @primitiveID=@primitiveID
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectPrimitiveInstance]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectPrimitiveInstance]
	@primitiveInstanceID INT

AS

SET NOCOUNT ON

DECLARE @objectType NVARCHAR(50)

/*get ObjectType by primitiveInstanceID*/
SELECT @objectType=Primitives.ObjectType FROM PrimitiveInstances 
	INNER JOIN Primitives ON PrimitiveInstances.PrimitiveID=Primitives.PrimitiveID 
	WHERE PrimitiveInstances.PrimitiveInstanceID=@primitiveInstanceID

/*get instance by ObjectType*/
IF (@objectType='RectSlot')
	EXEC sp_SelectSlotInstance @primitiveInstanceID=@primitiveInstanceID
ELSE IF (@objectType='RoundSlot')
	EXEC sp_SelectSlotInstance @primitiveInstanceID=@primitiveInstanceID
ELSE 
	SELECT * FROM PrimitiveInstances WHERE PrimitiveInstanceID=@primitiveInstanceID
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteModelInstance]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteModelInstance]
	@modelInstanceID INT,
	@result INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT

DECLARE @objectType NVARCHAR(50)

/*get ObjectType by modelID*/
SELECT @objectType=Models.ObjectType FROM ModelInstances INNER JOIN Models ON ModelInstances.ModelID=Models.ModelID WHERE ModelInstances.ModelInstanceID=@modelInstanceID

/*get instance by ObjectType*/
IF (@objectType='Item')
	EXEC sp_DeleteItemInstance @modelInstanceID=@modelInstanceID, @result=@result OUT
ELSE IF (@objectType='Device')
	EXEC sp_DeleteDeviceInstance @modelInstanceID=@modelInstanceID, @result=@result OUT
ELSE 
	BEGIN
		/*delete TeachingOffsets table*/
		DELETE FROM TeachingOffsets WHERE ModelInstanceID=@modelInstanceID
		SET @err = @@error IF @err <> 0 BEGIN SET @result=@err RETURN @err END

		/*delete ModelInstanceCustomProperties table*/
		DELETE FROM ModelInstanceCustomProperties WHERE ModelInstanceID=@modelInstanceID
		SET @err = @@error IF @err <> 0 BEGIN SET @result=@err RETURN @err END
		
		/*delete ModelInstances table*/
		DELETE FROM ModelInstances WHERE ModelInstanceID=@modelInstanceID
		SET @err = @@error IF @err <> 0 BEGIN SET @result=@err RETURN @err END
		SET @result=0
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectModelInstance]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectModelInstance]
	@modelInstanceID INT

AS

SET NOCOUNT ON

DECLARE @objectType NVARCHAR(50)

/*get ObjectType by modelID*/
SELECT @objectType=Models.ObjectType FROM ModelInstances INNER JOIN Models ON ModelInstances.ModelID=Models.ModelID WHERE ModelInstances.ModelInstanceID=@modelInstanceID

/*get instance by ObjectType*/
IF (@objectType='Item')
	EXEC sp_SelectItemInstance @modelInstanceID=@modelInstanceID
ELSE IF (@objectType='Device')
	EXEC sp_SelectDeviceInstance @modelInstanceID=@modelInstanceID
ELSE 
	SELECT * FROM ModelInstances WHERE ModelInstanceID=@modelInstanceID
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectLayoutPrimitiveInstance]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SelectLayoutPrimitiveInstance]
	@modelInstanceID INT,
	@name NVARCHAR(50)

AS

SET NOCOUNT ON

/*if this is instance of Slot*/
IF EXISTS(SELECT * FROM LayoutSlotInstances INNER JOIN LayoutPrimitiveInstances 
	ON LayoutSlotInstances.LayoutPrimitiveInstanceID=LayoutPrimitiveInstances.LayoutPrimitiveInstanceID
	WHERE ModelInstanceID=@modelInstanceID AND Name=@name)
	BEGIN
		SELECT * FROM LayoutSlotInstances INNER JOIN LayoutPrimitiveInstances 
			ON LayoutSlotInstances.LayoutPrimitiveInstanceID=LayoutPrimitiveInstances.LayoutPrimitiveInstanceID
			WHERE ModelInstanceID=@modelInstanceID AND Name=@name
	END
/*if this is instance of TipPosition*/
ELSE IF EXISTS(SELECT * FROM LayoutTipPositionInstances INNER JOIN LayoutPrimitiveInstances 
	ON LayoutTipPositionInstances.LayoutPrimitiveInstanceID=LayoutPrimitiveInstances.LayoutPrimitiveInstanceID
	WHERE ModelInstanceID=@modelInstanceID AND Name=@name)
	BEGIN
		SELECT * FROM LayoutTipPositionInstances INNER JOIN LayoutPrimitiveInstances 
			ON LayoutTipPositionInstances.LayoutPrimitiveInstanceID=LayoutPrimitiveInstances.LayoutPrimitiveInstanceID
			WHERE ModelInstanceID=@modelInstanceID AND Name=@name
	END
/*if this is instance of Stacker*/
ELSE IF EXISTS(SELECT * FROM LayoutStackerInstances INNER JOIN LayoutPrimitiveInstances 
	ON LayoutStackerInstances.LayoutPrimitiveInstanceID=LayoutPrimitiveInstances.LayoutPrimitiveInstanceID
	WHERE ModelInstanceID=@modelInstanceID AND Name=@name)
	BEGIN
		SELECT * FROM LayoutStackerInstances INNER JOIN LayoutPrimitiveInstances 
			ON LayoutStackerInstances.LayoutPrimitiveInstanceID=LayoutPrimitiveInstances.LayoutPrimitiveInstanceID
			WHERE ModelInstanceID=@modelInstanceID AND Name=@name
	END
/*if this is instance of Cavity*/
ELSE IF EXISTS(SELECT * FROM LayoutCavityInstances INNER JOIN LayoutPrimitiveInstances 
	ON LayoutCavityInstances.LayoutPrimitiveInstanceID=LayoutPrimitiveInstances.LayoutPrimitiveInstanceID
	WHERE ModelInstanceID=@modelInstanceID AND Name=@name)
	BEGIN
		SELECT * FROM LayoutCavityInstances INNER JOIN LayoutPrimitiveInstances 
			ON LayoutCavityInstances.LayoutPrimitiveInstanceID=LayoutPrimitiveInstances.LayoutPrimitiveInstanceID
			WHERE ModelInstanceID=@modelInstanceID AND Name=@name
	END
/*if this is instance of other primitive*/
ELSE
	BEGIN
		SELECT * FROM LayoutPrimitiveInstances WHERE ModelInstanceID=@modelInstanceID AND Name=@name
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectDriverPropertyValue]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_SelectDriverPropertyValue]
	@deviceID INT,
	@driverPropertyID INT

AS

SET NOCOUNT ON

SELECT PropertyIndex, PropertyValue FROM DriverProperties INNER JOIN DriverPropertyValues
	ON DriverProperties.DriverPropertyID=DriverPropertyValues.DriverPropertyID
	WHERE DeviceID=@deviceID AND DriverPropertyValues.DriverPropertyID=@driverPropertyID
	ORDER BY PropertyIndex
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteRoundCavity]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteRoundCavity]
	@primitiveID INT

AS

SET NOCOUNT ON

DECLARE @err INT;

BEGIN TRANSACTION

/*delete RoundCavityShapes table*/
DELETE RoundCavityShapes FROM RoundCavityShapes 
	INNER JOIN RoundCavities ON RoundCavityShapes.RoundCavityID=RoundCavities.RoundCavityID
	INNER JOIN Cavities ON RoundCavities.CavityID=Cavities.CavityID WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete RoundCavities table */
DELETE RoundCavities FROM RoundCavities INNER JOIN Cavities ON Cavities.CavityID=RoundCavities.CavityID WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete FirstPositions table*/
DELETE FirstPositions FROM FirstPositions 
	INNER JOIN Cavities ON FirstPositions.CavityID=Cavities.CavityID WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete LastPositions table*/
DELETE LastPositions FROM LastPositions
	INNER JOIN Cavities ON LastPositions.CavityID=Cavities.CavityID WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Cavities table*/
DELETE FROM Cavities WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete BackgroundImages table*/
DELETE BackgroundImages FROM BackgroundImages WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete BackgroundColors table*/
DELETE BackgroundColors FROM BackgroundColors WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete PrimitiveTypeCustomProperties table*/
DELETE PrimitiveTypeCustomProperties FROM PrimitiveTypeCustomProperties WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Primitives table*/
DELETE FROM Primitives WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteRectCavity]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteRectCavity]
	@primitiveID INT

AS

SET NOCOUNT ON

DECLARE @err INT

BEGIN TRANSACTION

/*delete RectCavityShapes table*/
DELETE RectCavityShapes FROM RectCavityShapes 
	INNER JOIN RectCavities ON RectCavityShapes.RectCavityID=RectCavities.RectCavityID
	INNER JOIN Cavities ON RectCavities.CavityID=Cavities.CavityID WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete RectCavities table */
DELETE RectCavities FROM RectCavities INNER JOIN Cavities ON Cavities.CavityID=RectCavities.CavityID WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete FirstPositions table*/
DELETE FirstPositions FROM FirstPositions 
	INNER JOIN Cavities ON FirstPositions.CavityID=Cavities.CavityID WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete LastPositions table*/
DELETE LastPositions FROM LastPositions
	INNER JOIN Cavities ON LastPositions.CavityID=Cavities.CavityID WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Cavities table*/
DELETE FROM Cavities WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete BackgroundImages table*/
DELETE BackgroundImages FROM BackgroundImages WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete BackgroundColors table*/
DELETE BackgroundColors FROM BackgroundColors WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete PrimitiveTypeCustomProperties table*/
DELETE PrimitiveTypeCustomProperties FROM PrimitiveTypeCustomProperties WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Primitives table*/
DELETE FROM Primitives WHERE PrimitiveID=@primitiveID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteLayoutPrimitiveInstance]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteLayoutPrimitiveInstance]
	@layoutPrimitiveInstanceID INT,
	@result INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT

DELETE LayoutStackerInstances FROM LayoutPrimitiveInstances INNER JOIN LayoutStackerInstances
	ON LayoutPrimitiveInstances.LayoutPrimitiveInstanceID=LayoutStackerInstances.LayoutPrimitiveInstanceID
	WHERE LayoutPrimitiveInstances.LayoutPrimitiveInstanceID=@layoutPrimitiveInstanceID

DELETE LayoutTipPositionInstances FROM LayoutPrimitiveInstances INNER JOIN LayoutTipPositionInstances
	ON LayoutPrimitiveInstances.LayoutPrimitiveInstanceID=LayoutTipPositionInstances.LayoutPrimitiveInstanceID
	WHERE LayoutPrimitiveInstances.LayoutPrimitiveInstanceID=@layoutPrimitiveInstanceID

DELETE LayoutSlotInstances FROM LayoutPrimitiveInstances INNER JOIN LayoutSlotInstances
	ON LayoutPrimitiveInstances.LayoutPrimitiveInstanceID=LayoutSlotInstances.LayoutPrimitiveInstanceID
	WHERE LayoutPrimitiveInstances.LayoutPrimitiveInstanceID=@layoutPrimitiveInstanceID

DELETE LayoutCavityInstances FROM LayoutPrimitiveInstances INNER JOIN LayoutCavityInstances
	ON LayoutPrimitiveInstances.LayoutPrimitiveInstanceID=LayoutCavityInstances.LayoutPrimitiveInstanceID
	WHERE LayoutPrimitiveInstances.LayoutPrimitiveInstanceID=@layoutPrimitiveInstanceID

DELETE FROM LayoutPrimitiveInstances WHERE LayoutPrimitiveInstanceID=@layoutPrimitiveInstanceID
SET @err = @@error IF @err <> 0 BEGIN SET @result=@err RETURN @err END
SET @result=0
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteLayout]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_DeleteLayout]
	@name NVARCHAR(50),
	@result INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT

/*delete ScalingVectors table*/
DELETE ScalingVectors FROM ScalingVectors INNER JOIN Layouts ON Layouts.LayoutID=ScalingVectors.LayoutID WHERE Name=@name
SET @err = @@error IF @err <> 0 BEGIN SET @result=@err RETURN @err END
/*delete Layouts table*/
DELETE FROM Layouts WHERE Name=@name
SET @err = @@error IF @err <> 0 BEGIN SET @result=@err RETURN @err END
SET @result=0
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteDevice]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteDevice]
	@modelID INT

AS

SET NOCOUNT ON

DECLARE @err INT
DECLARE @objectType NVARCHAR(50)

BEGIN TRANSACTION

/*get ObjectType by modelID*/
SELECT @objectType=ObjectType FROM Primitives
	INNER JOIN PrimitiveInstances ON Primitives.PrimitiveID=PrimitiveInstances.PrimitiveID
	INNER JOIN SlotInstances ON PrimitiveInstances.PrimitiveInstanceID=SlotInstances.PrimitiveInstanceID
	WHERE PrimitiveInstances.ModelID=@modelID

/*delete DriverProperties table */
DELETE DeviceBinaries FROM DeviceBinaries INNER JOIN Devices ON DeviceBinaries.DeviceID=Devices.DeviceID WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Pinpoints table*/
DELETE FROM Pinpoints WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete DriverPropertyValues table */
DELETE DriverPropertyValues FROM DriverPropertyValues
	INNER JOIN DriverProperties ON DriverPropertyValues.DriverPropertyID= DriverProperties.DriverPropertyID
	INNER JOIN Devices ON DriverProperties.DeviceID=Devices.DeviceID WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete DriverProperties table */
DELETE DriverProperties FROM DriverProperties INNER JOIN Devices ON DriverProperties.DeviceID=Devices.DeviceID WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Devices table*/
DELETE FROM Devices WHERE ModelID=@modelID

/*delete AreaAccessRestrictions table*/
DELETE FROM AreaAccessRestrictions WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete ModelTypeCustomProperties table*/
DELETE FROM ModelTypeCustomProperties WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete PrimitivePositions table*/
DELETE PrimitivePositions FROM PrimitivePositions
	INNER JOIN PrimitiveInstances ON PrimitivePositions.PrimitiveInstanceID=PrimitiveInstances.PrimitiveInstanceID
	WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete PrimitiveInstanceCustomProperties table*/
DELETE PrimitiveInstanceCustomProperties FROM PrimitiveInstanceCustomProperties
	INNER JOIN PrimitiveInstances ON PrimitiveInstanceCustomProperties.PrimitiveInstanceID=PrimitiveInstances.PrimitiveInstanceID
	WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

IF (@objectType='RectSlot')
	BEGIN
		DELETE SlotInstances FROM SlotInstances INNER JOIN PrimitiveInstances ON PrimitiveInstances.PrimitiveInstanceID=SlotInstances.PrimitiveInstanceID WHERE ModelID=@modelID
		SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END
	END
ELSE IF (@objectType='RoundSlot') 
	BEGIN
		DELETE SlotInstances FROM SlotInstances INNER JOIN PrimitiveInstances ON PrimitiveInstances.PrimitiveInstanceID=SlotInstances.PrimitiveInstanceID WHERE ModelID=@modelID
		SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END
	END

/*delete PrimitiveInstances table*/
DELETE FROM PrimitiveInstances WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*delete Models table*/
DELETE FROM Models WHERE ModelID=@modelID
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertScalingVector]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_InsertScalingVector]
	@layoutID INT,
	@x FLOAT,
	@y FLOAT,
	@z FLOAT,
	@scalingVectorID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT

/*fill in ScalingVectors table*/
INSERT [ScalingVectors]
(
	LayoutID,
	X,
	Y,
	Z
)
VALUES
(
	@layoutID,
	@x,
	@y,
	@z
)

SET @scalingVectorID=@@identity
SET @err = @@error
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertRoundCavityShape]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_InsertRoundCavityShape]
	@primitiveID INT,
	@circleInd INT,
	@diameter FLOAT,
	@translationX FLOAT,
	@translationY FLOAT,
	@translationZ FLOAT,
	@roundCavityShapeID INT OUT

AS

SET NOCOUNT ON

DECLARE @roundCavityID INT
DECLARE @err INT

/*determine roundCavityID by primitiveID*/
SELECT @roundCavityID=RoundCavityID FROM RoundCavities INNER JOIN Cavities ON RoundCavities.CavityID=Cavities.CavityID 
                                                                                                       INNER JOIN Primitives ON Cavities.PrimitiveID=Primitives.PrimitiveID WHERE Primitives.PrimitiveID=@primitiveID

/*fill in RoundCavityShapes table*/
INSERT [RoundCavityShapes]
(
	RoundCavityID,
	CircleInd,
	Diameter,
	TranslationX,
	TranslationY,
	TranslationZ
)
VALUES
(
	@roundCavityID,
	@circleInd,
	@diameter,
	@translationX,
	@translationY,
	@translationZ
)
SET @roundCavityShapeID=@@identity
SET @err = @@error
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertRectCavityShape]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertRectCavityShape]
	@primitiveID INT,
	@rectangleInd INT,
	@width FLOAT,
	@length FLOAT,
	@translationX FLOAT,
	@translationY FLOAT,
	@translationZ FLOAT,
	@rectCavityShapeID INT OUT

AS

SET NOCOUNT ON

DECLARE @rectCavityID INT
DECLARE @err INT

/*determine rectCavityID by primitiveID*/
SELECT @rectCavityID=RectCavityID FROM RectCavities INNER JOIN Cavities ON RectCavities.CavityID=Cavities.CavityID 
                                                                                              INNER JOIN Primitives ON Cavities.PrimitiveID=Primitives.PrimitiveID WHERE Primitives.PrimitiveID=@primitiveID

/*fill in RectCavityShapes table*/
INSERT [RectCavityShapes]
(
	RectCavityID,
	RectangleInd,
	Width,
	Length,
	TranslationX,
	TranslationY,
	TranslationZ
)
VALUES
(
	@rectCavityID,
	@rectangleInd,
	@width,
	@length,
	@translationX,
	@translationY,
	@translationZ
)
SET @rectCavityShapeID=@@identity
SET @err = @@error
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertLayoutCavityInstance]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_InsertLayoutCavityInstance]
	@modelInstanceID INT,
	@name NVARCHAR(50),
	@accessMode INT,
	@timeout INT,
	@backgroundColorIndex INT,
	@backgroundImageIndex INT,
	@layoutPrimitiveInstanceID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT

BEGIN TRANSACTION

/*fill LayoutPrimitiveInstances table*/
INSERT [LayoutPrimitiveInstances]
(
	ModelInstanceID,
	Name,
	BackgroundColorIndex,
	BackgroundImageIndex
)
VALUES
(
	@modelInstanceID,
	@name,
	@backgroundColorIndex,
	@backgroundImageIndex
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

SET @layoutPrimitiveInstanceID=@@identity;

/*fill LayoutCavityInstances table*/
INSERT [LayoutCavityInstances]
(
	LayoutPrimitiveInstanceID,
	AccessMode,
	Timeout
)
VALUES
(
	@layoutPrimitiveInstanceID,
	@accessMode,
	@timeout
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertLayoutTipPositionInstance]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_InsertLayoutTipPositionInstance]
	@modelInstanceID INT,
	@name NVARCHAR(50),
	@state NVARCHAR(50),
	@accessMode INT,
	@timeout INT,
	@backgroundColorIndex INT,
	@backgroundImageIndex INT,
	@layoutPrimitiveInstanceID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT

BEGIN TRANSACTION

/*fill LayoutPrimitiveInstances table*/
INSERT [LayoutPrimitiveInstances]
(
	ModelInstanceID,
	Name,
	BackgroundColorIndex,
	BackgroundImageIndex
)
VALUES
(
	@modelInstanceID,
	@name,
	@backgroundColorIndex,
	@backgroundImageIndex
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

SET @layoutPrimitiveInstanceID=@@identity

/*fill LayoutTipPositionInstances table*/
INSERT [LayoutTipPositionInstances]
(
	LayoutPrimitiveInstanceID,
	State,
	AccessMode,
	Timeout
)
VALUES
(
	@layoutPrimitiveInstanceID,
	@state,
	@accessMode,
	@timeout
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertLayoutStackerInstance]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertLayoutStackerInstance]
	@modelInstanceID INT,
	@name NVARCHAR(50),
	@accessMode INT,
	@timeout INT,
	@timer FLOAT,
	@backgroundColorIndex INT,
	@backgroundImageIndex INT,
	@layoutPrimitiveInstanceID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT

BEGIN TRANSACTION

/*fill LayoutPrimitiveInstances table*/
INSERT [LayoutPrimitiveInstances]
(
	ModelInstanceID,
	Name,
	BackgroundColorIndex,
	BackgroundImageIndex
)
VALUES
(
	@modelInstanceID,
	@name,
	@backgroundColorIndex,
	@backgroundImageIndex
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

SET @layoutPrimitiveInstanceID=@@identity

/*fill LayoutStackerInstances table*/
INSERT [LayoutStackerInstances]
(
	LayoutPrimitiveInstanceID,
	AccessMode,
	Timeout,
	Timer
)
VALUES
(
	@layoutPrimitiveInstanceID,
	@accessMode,
	@timeout,
	@timer
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertLayoutSlotInstance]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_InsertLayoutSlotInstance]
	@modelInstanceID INT,
	@name NVARCHAR(50),
	@accessMode INT,
	@timeout INT,
	@timer FLOAT,
	@backgroundColorIndex INT,
	@backgroundImageIndex INT,
	@layoutPrimitiveInstanceID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT

BEGIN TRANSACTION

/*fill LayoutPrimitiveInstances table*/
INSERT [LayoutPrimitiveInstances]
(
	ModelInstanceID,
	Name,
	BackgroundColorIndex,
	BackgroundImageIndex
)
VALUES
(
	@modelInstanceID,
	@name,
	@backgroundColorIndex,
	@backgroundImageIndex
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

SET @layoutPrimitiveInstanceID=@@identity;

/*fill LayoutSlotInstances table*/
INSERT [LayoutSlotInstances]
(
	LayoutPrimitiveInstanceID,
	AccessMode,
	Timeout,
	Timer
)
VALUES
(
	@layoutPrimitiveInstanceID,
	@accessMode,
	@timeout,
	@timer
)
SET @err = @@error IF @err <> 0 BEGIN ROLLBACK TRANSACTION RETURN @err END

/*success*/
COMMIT TRANSACTION
SET @err = @@error IF @err <> 0 RETURN @err
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertDriverPropertyValue]    Script Date: 03/12/2015 15:00:33 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_InsertDriverPropertyValue]
	@driverPropertyID INT,
	@propertyIndex INT,
	@propertyValue NVARCHAR(50),
	@driverPropertyValueID INT OUT

AS

SET NOCOUNT ON

DECLARE @err INT

/*fill in DriverPropertyValues table*/
INSERT [DriverPropertyValues]
(
	DriverPropertyID,
	PropertyIndex,
	PropertyValue
)
VALUES
(
	@driverPropertyID,
	@propertyIndex,
	@propertyValue
)

SET @driverPropertyValueID=@@identity
SET @err = @@error
GO
/****** Object:  StoredProcedure [dbo].[sp_ClearDB]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ClearDB]

AS

SET NOCOUNT ON

DELETE FROM AreaAccessRestrictions
DELETE FROM BackgroundColors
DELETE FROM BackgroundImages
DELETE FROM Bases
DELETE FROM Bodies
DELETE FROM Cavities
DELETE FROM Decktrays
DELETE FROM DeviceBinaries
DELETE FROM DeviceInstances
DELETE FROM Devices
DELETE FROM DriverProperties
DELETE FROM DriverPropertyValues
DELETE FROM FirstPositions
DELETE FROM GripperAreas
DELETE FROM GripperPositions
DELETE FROM ItemInstances
DELETE FROM Items
DELETE FROM LastPositions
DELETE FROM LayoutCavityInstances
DELETE FROM LayoutPrimitiveInstances
DELETE FROM Layouts
DELETE FROM LayoutSlotInstances
DELETE FROM LayoutStackerInstances
DELETE FROM LayoutTipPositionInstances
DELETE FROM LocationHoles
DELETE FROM LocationPins
DELETE FROM ModelInstanceCustomProperties
DELETE FROM ModelInstances
DELETE FROM Models
DELETE FROM ModelTypeCustomProperties
DELETE FROM Pinpoints
DELETE FROM PipettingAreas
DELETE FROM PrimitiveInstanceCustomProperties
DELETE FROM PrimitiveInstances
DELETE FROM PrimitivePositions
DELETE FROM Primitives
DELETE FROM PrimitiveTypeCustomProperties
DELETE FROM RectBases
DELETE FROM RectBodies
DELETE FROM RectCavities
DELETE FROM RectCavityShapes
DELETE FROM RectSlots
DELETE FROM ReferencePoints
DELETE FROM RoundBases
DELETE FROM RoundBodies
DELETE FROM RoundCavities
DELETE FROM RoundCavityShapes
DELETE FROM RoundSlots
DELETE FROM ScalingPoints
DELETE FROM ScalingVectors
DELETE FROM SecondPipettingAreas
DELETE FROM SlotGripperPositions
DELETE FROM SlotInstances
DELETE FROM Slots
DELETE FROM StackerGripperPositions
DELETE FROM Stackers
DELETE FROM TeachingOffsets
DELETE FROM TipPositions
DELETE FROM Worktables
DELETE FROM WorktableShapes
GO
/****** Object:  StoredProcedure [dbo].[sp_DeletePrimitiveType]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_DeletePrimitiveType]
	@typeName NVARCHAR(50),
	@result INT OUT

AS

SET NOCOUNT ON

DECLARE @primitiveID INT
DECLARE @objectType NVARCHAR(50)

/*if the type name exists*/
IF EXISTS(SELECT * FROM Primitives WHERE TypeName=@typeName)
	BEGIN
		SELECT @primitiveID=PrimitiveID, @objectType=ObjectType FROM Primitives WHERE TypeName=@typeName
		/*if the primitive type is used in models*/
		IF NOT EXISTS(SELECT * FROM PrimitiveInstances WHERE PrimitiveID=@primitiveID)
			BEGIN
				/*delete the Primitive by ObjectType*/
				IF (@objectType='LocationPin')
					EXEC @result=sp_DeleteLocationPin @primitiveID=@primitiveID
				ELSE IF (@objectType='LocationHole')
					EXEC @result=sp_DeleteLocationHole @primitiveID=@primitiveID
				ELSE IF (@objectType='Stacker')
					EXEC @result=sp_DeleteStacker @primitiveID=@primitiveID
				ELSE IF (@objectType='RectSlot')
					EXEC @result=sp_DeleteRectSlot @primitiveID=@primitiveID
				ELSE IF (@objectType='RoundSlot')
					EXEC @result=sp_DeleteRoundSlot @primitiveID=@primitiveID
				ELSE IF (@objectType='RectBase')
					EXEC @result=sp_DeleteRectBase @primitiveID=@primitiveID
				ELSE IF (@objectType='RoundBase')
					EXEC @result=sp_DeleteRoundBase @primitiveID=@primitiveID
				ELSE IF (@objectType='RectBody')
					EXEC @result=sp_DeleteRectBody @primitiveID=@primitiveID
				ELSE IF (@objectType='RoundBody')
					EXEC @result=sp_DeleteRoundBody @primitiveID=@primitiveID
				ELSE IF (@objectType='RectCavity')
					EXEC @result=sp_DeleteRectCavity @primitiveID=@primitiveID
				ELSE IF (@objectType='RoundCavity')
					EXEC @result=sp_DeleteRoundCavity @primitiveID=@primitiveID
				ELSE IF (@objectType='TipPosition')
					EXEC @result=sp_DeleteTipPosition @primitiveID=@primitiveID
				IF @result=0
					BEGIN
						/*success*/
						SET @result=1
					END
			END
		ELSE
			BEGIN
				/*primitive type is used in models*/
				SET @result=-2
			END
	END
ELSE
	BEGIN
		/*primitive type doesn't exist*/
		SET @result=-1
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteModelType]    Script Date: 03/12/2015 15:00:32 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_DeleteModelType]
	@typeName NVARCHAR(50),
	@result INT OUT

AS

SET NOCOUNT ON

DECLARE @modelID INT
DECLARE @objectType NVARCHAR(50)

/*if the type name exists*/
IF EXISTS(SELECT * FROM Models WHERE TypeName=@typeName)
	BEGIN
		SELECT @modelID=ModelID, @objectType=ObjectType FROM Models WHERE TypeName=@typeName
		/*if the model type is used in layout*/
		IF NOT EXISTS(SELECT * FROM ModelInstances WHERE ModelID=@modelID)
			BEGIN
				/*delete the Model by ObjectType*/
				IF (@objectType='Worktable')
					EXEC @result=sp_DeleteWorktable @modelID=@modelID
				ELSE IF (@objectType='Decktray')
					EXEC @result=sp_DeleteDecktray @modelID=@modelID
				ELSE IF (@objectType='Device')
					EXEC @result=sp_DeleteDevice @modelID=@modelID
				ELSE IF (@objectType='Item')
					EXEC @result=sp_DeleteItem @modelID=@modelID
				IF @result=0
					BEGIN
						/*success*/
						SET @result=1
					END
			END
		ELSE
			BEGIN
				/*model type is used in layout*/
				SET @result=-2
			END
	END
ELSE
	BEGIN
		/*model type doesn't exist*/
		SET @result=-1
	END
GO
/****** Object:  ForeignKey [FK_AreaAccessRestrictions_Items]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[AreaAccessRestrictions]  WITH NOCHECK ADD  CONSTRAINT [FK_AreaAccessRestrictions_Items] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Models] ([ModelID])
GO
ALTER TABLE [dbo].[AreaAccessRestrictions] CHECK CONSTRAINT [FK_AreaAccessRestrictions_Items]
GO
/****** Object:  ForeignKey [FK_BackgroundColors_Primitives]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[BackgroundColors]  WITH NOCHECK ADD  CONSTRAINT [FK_BackgroundColors_Primitives] FOREIGN KEY([PrimitiveID])
REFERENCES [dbo].[Primitives] ([PrimitiveID])
GO
ALTER TABLE [dbo].[BackgroundColors] CHECK CONSTRAINT [FK_BackgroundColors_Primitives]
GO
/****** Object:  ForeignKey [FK_BackgroundImages_Primitives]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[BackgroundImages]  WITH NOCHECK ADD  CONSTRAINT [FK_BackgroundImages_Primitives] FOREIGN KEY([PrimitiveID])
REFERENCES [dbo].[Primitives] ([PrimitiveID])
GO
ALTER TABLE [dbo].[BackgroundImages] CHECK CONSTRAINT [FK_BackgroundImages_Primitives]
GO
/****** Object:  ForeignKey [FK_Bases_Primitives]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[Bases]  WITH CHECK ADD  CONSTRAINT [FK_Bases_Primitives] FOREIGN KEY([PrimitiveID])
REFERENCES [dbo].[Primitives] ([PrimitiveID])
GO
ALTER TABLE [dbo].[Bases] CHECK CONSTRAINT [FK_Bases_Primitives]
GO
/****** Object:  ForeignKey [FK_Bodies_Primitives]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[Bodies]  WITH CHECK ADD  CONSTRAINT [FK_Bodies_Primitives] FOREIGN KEY([PrimitiveID])
REFERENCES [dbo].[Primitives] ([PrimitiveID])
GO
ALTER TABLE [dbo].[Bodies] CHECK CONSTRAINT [FK_Bodies_Primitives]
GO
/****** Object:  ForeignKey [FK_Cavities_Primitives]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[Cavities]  WITH NOCHECK ADD  CONSTRAINT [FK_Cavities_Primitives] FOREIGN KEY([PrimitiveID])
REFERENCES [dbo].[Primitives] ([PrimitiveID])
GO
ALTER TABLE [dbo].[Cavities] CHECK CONSTRAINT [FK_Cavities_Primitives]
GO
/****** Object:  ForeignKey [FK_Decktray_Item1]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[Decktrays]  WITH NOCHECK ADD  CONSTRAINT [FK_Decktray_Item1] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Models] ([ModelID])
GO
ALTER TABLE [dbo].[Decktrays] CHECK CONSTRAINT [FK_Decktray_Item1]
GO
/****** Object:  ForeignKey [FK_DeviceBinaries_Devices]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[DeviceBinaries]  WITH NOCHECK ADD  CONSTRAINT [FK_DeviceBinaries_Devices] FOREIGN KEY([DeviceID])
REFERENCES [dbo].[Devices] ([DeviceID])
GO
ALTER TABLE [dbo].[DeviceBinaries] CHECK CONSTRAINT [FK_DeviceBinaries_Devices]
GO
/****** Object:  ForeignKey [FK_DeviceInstances_ItemInstances]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[DeviceInstances]  WITH NOCHECK ADD  CONSTRAINT [FK_DeviceInstances_ItemInstances] FOREIGN KEY([ModelInstanceID])
REFERENCES [dbo].[ModelInstances] ([ModelInstanceID])
GO
ALTER TABLE [dbo].[DeviceInstances] CHECK CONSTRAINT [FK_DeviceInstances_ItemInstances]
GO
/****** Object:  ForeignKey [FK_Devices_Items]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[Devices]  WITH CHECK ADD  CONSTRAINT [FK_Devices_Items] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Models] ([ModelID])
GO
ALTER TABLE [dbo].[Devices] CHECK CONSTRAINT [FK_Devices_Items]
GO
/****** Object:  ForeignKey [FK_DriverProperties_Devices]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[DriverProperties]  WITH NOCHECK ADD  CONSTRAINT [FK_DriverProperties_Devices] FOREIGN KEY([DeviceID])
REFERENCES [dbo].[Devices] ([DeviceID])
GO
ALTER TABLE [dbo].[DriverProperties] CHECK CONSTRAINT [FK_DriverProperties_Devices]
GO
/****** Object:  ForeignKey [FK_DriverPropertyValues_DriverProperties]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[DriverPropertyValues]  WITH CHECK ADD  CONSTRAINT [FK_DriverPropertyValues_DriverProperties] FOREIGN KEY([DriverPropertyID])
REFERENCES [dbo].[DriverProperties] ([DriverPropertyID])
GO
ALTER TABLE [dbo].[DriverPropertyValues] CHECK CONSTRAINT [FK_DriverPropertyValues_DriverProperties]
GO
/****** Object:  ForeignKey [FK_FirstPositions_Cavities]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[FirstPositions]  WITH NOCHECK ADD  CONSTRAINT [FK_FirstPositions_Cavities] FOREIGN KEY([CavityID])
REFERENCES [dbo].[Cavities] ([CavityID])
GO
ALTER TABLE [dbo].[FirstPositions] CHECK CONSTRAINT [FK_FirstPositions_Cavities]
GO
/****** Object:  ForeignKey [FK_GripperArea_Worktable]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[GripperAreas]  WITH NOCHECK ADD  CONSTRAINT [FK_GripperArea_Worktable] FOREIGN KEY([WorktableID])
REFERENCES [dbo].[Worktables] ([WorktableID])
GO
ALTER TABLE [dbo].[GripperAreas] CHECK CONSTRAINT [FK_GripperArea_Worktable]
GO
/****** Object:  ForeignKey [FK_CarrierGripperPositions_Carriers]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[GripperPositions]  WITH NOCHECK ADD  CONSTRAINT [FK_CarrierGripperPositions_Carriers] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID])
GO
ALTER TABLE [dbo].[GripperPositions] CHECK CONSTRAINT [FK_CarrierGripperPositions_Carriers]
GO
/****** Object:  ForeignKey [FK_RackInstances_ItemInstances]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[ItemInstances]  WITH CHECK ADD  CONSTRAINT [FK_RackInstances_ItemInstances] FOREIGN KEY([ModelInstanceID])
REFERENCES [dbo].[ModelInstances] ([ModelInstanceID])
GO
ALTER TABLE [dbo].[ItemInstances] CHECK CONSTRAINT [FK_RackInstances_ItemInstances]
GO
/****** Object:  ForeignKey [FK_Carrier_Item]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[Items]  WITH NOCHECK ADD  CONSTRAINT [FK_Carrier_Item] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Models] ([ModelID])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Carrier_Item]
GO
/****** Object:  ForeignKey [FK_LastPositions_Cavities]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[LastPositions]  WITH NOCHECK ADD  CONSTRAINT [FK_LastPositions_Cavities] FOREIGN KEY([CavityID])
REFERENCES [dbo].[Cavities] ([CavityID])
GO
ALTER TABLE [dbo].[LastPositions] CHECK CONSTRAINT [FK_LastPositions_Cavities]
GO
/****** Object:  ForeignKey [FK_LayoutCavityInstances_LayoutPrimitiveInstances]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[LayoutCavityInstances]  WITH NOCHECK ADD  CONSTRAINT [FK_LayoutCavityInstances_LayoutPrimitiveInstances] FOREIGN KEY([LayoutPrimitiveInstanceID])
REFERENCES [dbo].[LayoutPrimitiveInstances] ([LayoutPrimitiveInstanceID])
GO
ALTER TABLE [dbo].[LayoutCavityInstances] CHECK CONSTRAINT [FK_LayoutCavityInstances_LayoutPrimitiveInstances]
GO
/****** Object:  ForeignKey [FK_LayoutPrimitiveInstances_ItemInstances]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[LayoutPrimitiveInstances]  WITH NOCHECK ADD  CONSTRAINT [FK_LayoutPrimitiveInstances_ItemInstances] FOREIGN KEY([ModelInstanceID])
REFERENCES [dbo].[ModelInstances] ([ModelInstanceID])
GO
ALTER TABLE [dbo].[LayoutPrimitiveInstances] CHECK CONSTRAINT [FK_LayoutPrimitiveInstances_ItemInstances]
GO
/****** Object:  ForeignKey [FK_Layouts_ItemInstances]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[Layouts]  WITH NOCHECK ADD  CONSTRAINT [FK_Layouts_ItemInstances] FOREIGN KEY([ModelInstanceID])
REFERENCES [dbo].[ModelInstances] ([ModelInstanceID])
GO
ALTER TABLE [dbo].[Layouts] CHECK CONSTRAINT [FK_Layouts_ItemInstances]
GO
/****** Object:  ForeignKey [FK_LayoutSlotInstances_LayoutPrimitiveInstances]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[LayoutSlotInstances]  WITH NOCHECK ADD  CONSTRAINT [FK_LayoutSlotInstances_LayoutPrimitiveInstances] FOREIGN KEY([LayoutPrimitiveInstanceID])
REFERENCES [dbo].[LayoutPrimitiveInstances] ([LayoutPrimitiveInstanceID])
GO
ALTER TABLE [dbo].[LayoutSlotInstances] CHECK CONSTRAINT [FK_LayoutSlotInstances_LayoutPrimitiveInstances]
GO
/****** Object:  ForeignKey [FK_LayoutStackerInstances_LayoutPrimitiveInstances]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[LayoutStackerInstances]  WITH NOCHECK ADD  CONSTRAINT [FK_LayoutStackerInstances_LayoutPrimitiveInstances] FOREIGN KEY([LayoutPrimitiveInstanceID])
REFERENCES [dbo].[LayoutPrimitiveInstances] ([LayoutPrimitiveInstanceID])
GO
ALTER TABLE [dbo].[LayoutStackerInstances] CHECK CONSTRAINT [FK_LayoutStackerInstances_LayoutPrimitiveInstances]
GO
/****** Object:  ForeignKey [FK_LayoutTipPositionInstances_LayoutPrimitiveInstances]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[LayoutTipPositionInstances]  WITH NOCHECK ADD  CONSTRAINT [FK_LayoutTipPositionInstances_LayoutPrimitiveInstances] FOREIGN KEY([LayoutPrimitiveInstanceID])
REFERENCES [dbo].[LayoutPrimitiveInstances] ([LayoutPrimitiveInstanceID])
GO
ALTER TABLE [dbo].[LayoutTipPositionInstances] CHECK CONSTRAINT [FK_LayoutTipPositionInstances_LayoutPrimitiveInstances]
GO
/****** Object:  ForeignKey [FK_LocationHoles_Primitives]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[LocationHoles]  WITH CHECK ADD  CONSTRAINT [FK_LocationHoles_Primitives] FOREIGN KEY([PrimitiveID])
REFERENCES [dbo].[Primitives] ([PrimitiveID])
GO
ALTER TABLE [dbo].[LocationHoles] CHECK CONSTRAINT [FK_LocationHoles_Primitives]
GO
/****** Object:  ForeignKey [FK_LocationPins_Primitives]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[LocationPins]  WITH CHECK ADD  CONSTRAINT [FK_LocationPins_Primitives] FOREIGN KEY([PrimitiveID])
REFERENCES [dbo].[Primitives] ([PrimitiveID])
GO
ALTER TABLE [dbo].[LocationPins] CHECK CONSTRAINT [FK_LocationPins_Primitives]
GO
/****** Object:  ForeignKey [FK_ModelInstanceCustomProperties_ModelInstances]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[ModelInstanceCustomProperties]  WITH CHECK ADD  CONSTRAINT [FK_ModelInstanceCustomProperties_ModelInstances] FOREIGN KEY([ModelInstanceID])
REFERENCES [dbo].[ModelInstances] ([ModelInstanceID])
GO
ALTER TABLE [dbo].[ModelInstanceCustomProperties] CHECK CONSTRAINT [FK_ModelInstanceCustomProperties_ModelInstances]
GO
/****** Object:  ForeignKey [FK_ItemInstances_ItemTypes]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[ModelInstances]  WITH NOCHECK ADD  CONSTRAINT [FK_ItemInstances_ItemTypes] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Models] ([ModelID])
GO
ALTER TABLE [dbo].[ModelInstances] CHECK CONSTRAINT [FK_ItemInstances_ItemTypes]
GO
/****** Object:  ForeignKey [FK_ModelTypeCustomProperties_Models]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[ModelTypeCustomProperties]  WITH CHECK ADD  CONSTRAINT [FK_ModelTypeCustomProperties_Models] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Models] ([ModelID])
GO
ALTER TABLE [dbo].[ModelTypeCustomProperties] CHECK CONSTRAINT [FK_ModelTypeCustomProperties_Models]
GO
/****** Object:  ForeignKey [FK_Pinpoints_Models]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[Pinpoints]  WITH CHECK ADD  CONSTRAINT [FK_Pinpoints_Models] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Models] ([ModelID])
GO
ALTER TABLE [dbo].[Pinpoints] CHECK CONSTRAINT [FK_Pinpoints_Models]
GO
/****** Object:  ForeignKey [FK_PipettingArea_Worktable]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[PipettingAreas]  WITH NOCHECK ADD  CONSTRAINT [FK_PipettingArea_Worktable] FOREIGN KEY([WorktableID])
REFERENCES [dbo].[Worktables] ([WorktableID])
GO
ALTER TABLE [dbo].[PipettingAreas] CHECK CONSTRAINT [FK_PipettingArea_Worktable]
GO
/****** Object:  ForeignKey [FK_PrimitiveCustomProperties_PrimitiveInstances]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[PrimitiveInstanceCustomProperties]  WITH NOCHECK ADD  CONSTRAINT [FK_PrimitiveCustomProperties_PrimitiveInstances] FOREIGN KEY([PrimitiveInstanceID])
REFERENCES [dbo].[PrimitiveInstances] ([PrimitiveInstanceID])
GO
ALTER TABLE [dbo].[PrimitiveInstanceCustomProperties] CHECK CONSTRAINT [FK_PrimitiveCustomProperties_PrimitiveInstances]
GO
/****** Object:  ForeignKey [FK_PrimitiveInstances_Items]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[PrimitiveInstances]  WITH NOCHECK ADD  CONSTRAINT [FK_PrimitiveInstances_Items] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Models] ([ModelID])
GO
ALTER TABLE [dbo].[PrimitiveInstances] CHECK CONSTRAINT [FK_PrimitiveInstances_Items]
GO
/****** Object:  ForeignKey [FK_PrimitiveInstances_Primitives]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[PrimitiveInstances]  WITH NOCHECK ADD  CONSTRAINT [FK_PrimitiveInstances_Primitives] FOREIGN KEY([PrimitiveID])
REFERENCES [dbo].[Primitives] ([PrimitiveID])
GO
ALTER TABLE [dbo].[PrimitiveInstances] CHECK CONSTRAINT [FK_PrimitiveInstances_Primitives]
GO
/****** Object:  ForeignKey [FK_PrimitivePositions_PrimitiveInstances]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[PrimitivePositions]  WITH NOCHECK ADD  CONSTRAINT [FK_PrimitivePositions_PrimitiveInstances] FOREIGN KEY([PrimitiveInstanceID])
REFERENCES [dbo].[PrimitiveInstances] ([PrimitiveInstanceID])
GO
ALTER TABLE [dbo].[PrimitivePositions] CHECK CONSTRAINT [FK_PrimitivePositions_PrimitiveInstances]
GO
/****** Object:  ForeignKey [FK_PrimitiveTypeCustomProperties_Primitives]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[PrimitiveTypeCustomProperties]  WITH CHECK ADD  CONSTRAINT [FK_PrimitiveTypeCustomProperties_Primitives] FOREIGN KEY([PrimitiveID])
REFERENCES [dbo].[Primitives] ([PrimitiveID])
GO
ALTER TABLE [dbo].[PrimitiveTypeCustomProperties] CHECK CONSTRAINT [FK_PrimitiveTypeCustomProperties_Primitives]
GO
/****** Object:  ForeignKey [FK_RectBases_Bases]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[RectBases]  WITH NOCHECK ADD  CONSTRAINT [FK_RectBases_Bases] FOREIGN KEY([BaseID])
REFERENCES [dbo].[Bases] ([BaseID])
GO
ALTER TABLE [dbo].[RectBases] CHECK CONSTRAINT [FK_RectBases_Bases]
GO
/****** Object:  ForeignKey [FK_RectBodies_Bodies]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[RectBodies]  WITH CHECK ADD  CONSTRAINT [FK_RectBodies_Bodies] FOREIGN KEY([BodyID])
REFERENCES [dbo].[Bodies] ([BodyID])
GO
ALTER TABLE [dbo].[RectBodies] CHECK CONSTRAINT [FK_RectBodies_Bodies]
GO
/****** Object:  ForeignKey [FK_RectCavities_Cavities]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[RectCavities]  WITH NOCHECK ADD  CONSTRAINT [FK_RectCavities_Cavities] FOREIGN KEY([CavityID])
REFERENCES [dbo].[Cavities] ([CavityID])
GO
ALTER TABLE [dbo].[RectCavities] CHECK CONSTRAINT [FK_RectCavities_Cavities]
GO
/****** Object:  ForeignKey [FK_RectCavityShapes_RectCavities1]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[RectCavityShapes]  WITH NOCHECK ADD  CONSTRAINT [FK_RectCavityShapes_RectCavities1] FOREIGN KEY([RectCavityID])
REFERENCES [dbo].[RectCavities] ([RectCavityID])
GO
ALTER TABLE [dbo].[RectCavityShapes] CHECK CONSTRAINT [FK_RectCavityShapes_RectCavities1]
GO
/****** Object:  ForeignKey [FK_RectHandlers_Handlers]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[RectSlots]  WITH NOCHECK ADD  CONSTRAINT [FK_RectHandlers_Handlers] FOREIGN KEY([SlotID])
REFERENCES [dbo].[Slots] ([SlotID])
GO
ALTER TABLE [dbo].[RectSlots] CHECK CONSTRAINT [FK_RectHandlers_Handlers]
GO
/****** Object:  ForeignKey [FK_ReferencePoints_Worktables]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[ReferencePoints]  WITH CHECK ADD  CONSTRAINT [FK_ReferencePoints_Worktables] FOREIGN KEY([WorktableID])
REFERENCES [dbo].[Worktables] ([WorktableID])
GO
ALTER TABLE [dbo].[ReferencePoints] CHECK CONSTRAINT [FK_ReferencePoints_Worktables]
GO
/****** Object:  ForeignKey [FK_RoundBases_Bases]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[RoundBases]  WITH NOCHECK ADD  CONSTRAINT [FK_RoundBases_Bases] FOREIGN KEY([BaseID])
REFERENCES [dbo].[Bases] ([BaseID])
GO
ALTER TABLE [dbo].[RoundBases] CHECK CONSTRAINT [FK_RoundBases_Bases]
GO
/****** Object:  ForeignKey [FK_RoundBodies_Bodies]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[RoundBodies]  WITH CHECK ADD  CONSTRAINT [FK_RoundBodies_Bodies] FOREIGN KEY([BodyID])
REFERENCES [dbo].[Bodies] ([BodyID])
GO
ALTER TABLE [dbo].[RoundBodies] CHECK CONSTRAINT [FK_RoundBodies_Bodies]
GO
/****** Object:  ForeignKey [FK_RoundCavities_Cavities]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[RoundCavities]  WITH NOCHECK ADD  CONSTRAINT [FK_RoundCavities_Cavities] FOREIGN KEY([CavityID])
REFERENCES [dbo].[Cavities] ([CavityID])
GO
ALTER TABLE [dbo].[RoundCavities] CHECK CONSTRAINT [FK_RoundCavities_Cavities]
GO
/****** Object:  ForeignKey [FK_RoundCavityShapes_RoundCavities1]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[RoundCavityShapes]  WITH NOCHECK ADD  CONSTRAINT [FK_RoundCavityShapes_RoundCavities1] FOREIGN KEY([RoundCavityID])
REFERENCES [dbo].[RoundCavities] ([RoundCavityID])
GO
ALTER TABLE [dbo].[RoundCavityShapes] CHECK CONSTRAINT [FK_RoundCavityShapes_RoundCavities1]
GO
/****** Object:  ForeignKey [FK_RoundHandlers_Handlers]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[RoundSlots]  WITH NOCHECK ADD  CONSTRAINT [FK_RoundHandlers_Handlers] FOREIGN KEY([SlotID])
REFERENCES [dbo].[Slots] ([SlotID])
GO
ALTER TABLE [dbo].[RoundSlots] CHECK CONSTRAINT [FK_RoundHandlers_Handlers]
GO
/****** Object:  ForeignKey [FK_ScalingPoints_Worktables]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[ScalingPoints]  WITH CHECK ADD  CONSTRAINT [FK_ScalingPoints_Worktables] FOREIGN KEY([WorktableID])
REFERENCES [dbo].[Worktables] ([WorktableID])
GO
ALTER TABLE [dbo].[ScalingPoints] CHECK CONSTRAINT [FK_ScalingPoints_Worktables]
GO
/****** Object:  ForeignKey [FK_ScalingVectors_Layouts]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[ScalingVectors]  WITH CHECK ADD  CONSTRAINT [FK_ScalingVectors_Layouts] FOREIGN KEY([LayoutID])
REFERENCES [dbo].[Layouts] ([LayoutID])
GO
ALTER TABLE [dbo].[ScalingVectors] CHECK CONSTRAINT [FK_ScalingVectors_Layouts]
GO
/****** Object:  ForeignKey [FK_SecondPipettingAreas_Worktables]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[SecondPipettingAreas]  WITH NOCHECK ADD  CONSTRAINT [FK_SecondPipettingAreas_Worktables] FOREIGN KEY([WorktableID])
REFERENCES [dbo].[Worktables] ([WorktableID])
GO
ALTER TABLE [dbo].[SecondPipettingAreas] CHECK CONSTRAINT [FK_SecondPipettingAreas_Worktables]
GO
/****** Object:  ForeignKey [FK_GripperPositions_Slots]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[SlotGripperPositions]  WITH NOCHECK ADD  CONSTRAINT [FK_GripperPositions_Slots] FOREIGN KEY([SlotID])
REFERENCES [dbo].[Slots] ([SlotID])
GO
ALTER TABLE [dbo].[SlotGripperPositions] CHECK CONSTRAINT [FK_GripperPositions_Slots]
GO
/****** Object:  ForeignKey [FK_SlotInstances_PrimitiveInstances]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[SlotInstances]  WITH NOCHECK ADD  CONSTRAINT [FK_SlotInstances_PrimitiveInstances] FOREIGN KEY([PrimitiveInstanceID])
REFERENCES [dbo].[PrimitiveInstances] ([PrimitiveInstanceID])
GO
ALTER TABLE [dbo].[SlotInstances] CHECK CONSTRAINT [FK_SlotInstances_PrimitiveInstances]
GO
/****** Object:  ForeignKey [FK_Sockets_Primitives]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[Slots]  WITH CHECK ADD  CONSTRAINT [FK_Sockets_Primitives] FOREIGN KEY([PrimitiveID])
REFERENCES [dbo].[Primitives] ([PrimitiveID])
GO
ALTER TABLE [dbo].[Slots] CHECK CONSTRAINT [FK_Sockets_Primitives]
GO
/****** Object:  ForeignKey [FK_StackerGripperPositions_Stackers]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[StackerGripperPositions]  WITH NOCHECK ADD  CONSTRAINT [FK_StackerGripperPositions_Stackers] FOREIGN KEY([StackerID])
REFERENCES [dbo].[Stackers] ([StackerID])
GO
ALTER TABLE [dbo].[StackerGripperPositions] CHECK CONSTRAINT [FK_StackerGripperPositions_Stackers]
GO
/****** Object:  ForeignKey [FK_Stackers_Primitives]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[Stackers]  WITH CHECK ADD  CONSTRAINT [FK_Stackers_Primitives] FOREIGN KEY([PrimitiveID])
REFERENCES [dbo].[Primitives] ([PrimitiveID])
GO
ALTER TABLE [dbo].[Stackers] CHECK CONSTRAINT [FK_Stackers_Primitives]
GO
/****** Object:  ForeignKey [FK_TaughtPositions_ModelInstances]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[TeachingOffsets]  WITH CHECK ADD  CONSTRAINT [FK_TaughtPositions_ModelInstances] FOREIGN KEY([ModelInstanceID])
REFERENCES [dbo].[ModelInstances] ([ModelInstanceID])
GO
ALTER TABLE [dbo].[TeachingOffsets] CHECK CONSTRAINT [FK_TaughtPositions_ModelInstances]
GO
/****** Object:  ForeignKey [FK_TipPositions_Primitives]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[TipPositions]  WITH NOCHECK ADD  CONSTRAINT [FK_TipPositions_Primitives] FOREIGN KEY([PrimitiveID])
REFERENCES [dbo].[Primitives] ([PrimitiveID])
GO
ALTER TABLE [dbo].[TipPositions] CHECK CONSTRAINT [FK_TipPositions_Primitives]
GO
/****** Object:  ForeignKey [FK_Worktable_Item]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[Worktables]  WITH NOCHECK ADD  CONSTRAINT [FK_Worktable_Item] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Models] ([ModelID])
GO
ALTER TABLE [dbo].[Worktables] CHECK CONSTRAINT [FK_Worktable_Item]
GO
/****** Object:  ForeignKey [FK_WorktableShape_Worktable]    Script Date: 03/12/2015 15:00:32 ******/
ALTER TABLE [dbo].[WorktableShapes]  WITH NOCHECK ADD  CONSTRAINT [FK_WorktableShape_Worktable] FOREIGN KEY([WorktableID])
REFERENCES [dbo].[Worktables] ([WorktableID])
GO
ALTER TABLE [dbo].[WorktableShapes] CHECK CONSTRAINT [FK_WorktableShape_Worktable]
GO
