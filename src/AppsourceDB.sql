USE [master]
GO
/****** Object:  Database [MSAPPSOURCE]    Script Date: 11-02-2025 12:46:42 ******/
CREATE DATABASE [MSAPPSOURCE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MSAPPSOURCE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MSAPPSOURCE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MSAPPSOURCE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MSAPPSOURCE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MSAPPSOURCE] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MSAPPSOURCE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MSAPPSOURCE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MSAPPSOURCE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MSAPPSOURCE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MSAPPSOURCE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MSAPPSOURCE] SET ARITHABORT OFF 
GO
ALTER DATABASE [MSAPPSOURCE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MSAPPSOURCE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MSAPPSOURCE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MSAPPSOURCE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MSAPPSOURCE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MSAPPSOURCE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MSAPPSOURCE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MSAPPSOURCE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MSAPPSOURCE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MSAPPSOURCE] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MSAPPSOURCE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MSAPPSOURCE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MSAPPSOURCE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MSAPPSOURCE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MSAPPSOURCE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MSAPPSOURCE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MSAPPSOURCE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MSAPPSOURCE] SET RECOVERY FULL 
GO
ALTER DATABASE [MSAPPSOURCE] SET  MULTI_USER 
GO
ALTER DATABASE [MSAPPSOURCE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MSAPPSOURCE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MSAPPSOURCE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MSAPPSOURCE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MSAPPSOURCE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MSAPPSOURCE] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MSAPPSOURCE', N'ON'
GO
ALTER DATABASE [MSAPPSOURCE] SET QUERY_STORE = ON
GO
ALTER DATABASE [MSAPPSOURCE] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MSAPPSOURCE]
GO
/****** Object:  Table [dbo].[Plans]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plans](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlanId] [varchar](100) NULL,
	[Description] [varchar](500) NULL,
	[DisplayName] [varchar](100) NULL,
	[IsmeteringSupported] [bit] NULL,
	[IsPerUser] [bit] NULL,
	[PlanGUID] [uniqueidentifier] NOT NULL,
	[OfferID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Plans] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeteredDimensions]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeteredDimensions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Dimension] [varchar](150) NULL,
	[PlanId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Description] [varchar](250) NULL,
 CONSTRAINT [PK_MeteredDimensions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscriptions]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscriptions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AMPSubscriptionId] [uniqueidentifier] NOT NULL,
	[SubscriptionStatus] [varchar](50) NULL,
	[AMPPlanId] [varchar](100) NULL,
	[IsActive] [bit] NULL,
	[CreateBy] [int] NULL,
	[CreateDate] [datetime] NULL,
	[ModifyDate] [datetime] NULL,
	[UserId] [int] NULL,
	[Name] [varchar](100) NULL,
	[AMPQuantity] [int] NOT NULL,
	[PurchaserEmail] [varchar](225) NULL,
	[PurchaserTenantId] [uniqueidentifier] NULL,
	[AmpOfferId] [nvarchar](max) NULL,
	[EndDate] [datetime2](7) NULL,
	[StartDate] [datetime2](7) NULL,
	[Term] [nvarchar](max) NULL,
 CONSTRAINT [PK_Subscriptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchedulerFrequency]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchedulerFrequency](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Frequency] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SchedulerFrequency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeteredPlanSchedulerManagement]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeteredPlanSchedulerManagement](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SchedulerName] [nvarchar](50) NOT NULL,
	[SubscriptionId] [int] NOT NULL,
	[PlanId] [int] NOT NULL,
	[DimensionId] [int] NOT NULL,
	[FrequencyId] [int] NOT NULL,
	[Quantity] [float] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[NextRunTime] [datetime2](7) NULL,
 CONSTRAINT [PK_MeteredPlanSchedulerManagement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[SchedulerManagerView]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[SchedulerManagerView]
	AS SELECT 
	m.Id,
	m.SchedulerName,
	s.AMPSubscriptionId,
	s.Name as SubscriptionName,
	s.PurchaserEmail,
	p.PlanId,
	d.Dimension,
	f.Frequency,
	m.Quantity,
	m.StartDate,
	m.NextRunTime
	FROM MeteredPlanSchedulerManagement m
	inner join SchedulerFrequency f	on m.FrequencyId=f.Id
	inner join Subscriptions s on m.SubscriptionId=s.Id
	inner join Plans p on m.PlanId=p.Id
	inner join MeteredDimensions d on m.DimensionId=d.Id
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationConfiguration]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationConfiguration](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Value] [nvarchar](max) NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_ApplicationConfiguration] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationLog]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActionTime] [datetime] NULL,
	[LogDetail] [varchar](4000) NULL,
 CONSTRAINT [PK_ApplicationLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatabaseVersionHistory]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatabaseVersionHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VersionNumber] [decimal](6, 2) NOT NULL,
	[ChangeLog] [nvarchar](max) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateBy] [nvarchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailTemplate]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailTemplate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](1000) NULL,
	[Description] [varchar](1000) NULL,
	[InsertDate] [datetime] NULL,
	[TemplateBody] [varchar](max) NULL,
	[Subject] [varchar](1000) NULL,
	[ToRecipients] [varchar](1000) NULL,
	[CC] [varchar](1000) NULL,
	[BCC] [varchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_EmailTemplate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[EventsId] [int] IDENTITY(1,1) NOT NULL,
	[EventsName] [varchar](225) NULL,
	[IsActive] [bit] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[EventsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KnownUsers]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KnownUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserEmail] [varchar](50) NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_KnownUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeteredAuditLogs]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeteredAuditLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubscriptionId] [int] NULL,
	[RequestJson] [varchar](500) NULL,
	[ResponseJson] [varchar](500) NULL,
	[StatusCode] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[SubscriptionUsageDate] [datetime] NULL,
	[RunBy] [varchar](255) NULL,
 CONSTRAINT [PK_MeteredAuditLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfferAttributes]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfferAttributes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParameterId] [varchar](225) NULL,
	[DisplayName] [varchar](225) NULL,
	[Description] [varchar](225) NULL,
	[ValueTypeId] [int] NULL,
	[FromList] [bit] NOT NULL,
	[ValuesList] [varchar](max) NULL,
	[Max] [int] NULL,
	[Min] [int] NULL,
	[Type] [varchar](225) NULL,
	[DisplaySequence] [int] NULL,
	[Isactive] [bit] NOT NULL,
	[CreateDate] [datetime] NULL,
	[UserId] [int] NULL,
	[OfferId] [uniqueidentifier] NOT NULL,
	[IsDelete] [bit] NULL,
	[IsRequired] [bit] NULL,
 CONSTRAINT [PK_OfferAttributes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offers]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OfferId] [varchar](225) NULL,
	[OfferName] [varchar](225) NULL,
	[CreateDate] [datetime] NULL,
	[UserId] [int] NULL,
	[OfferGUId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Offers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanAttributeMapping]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanAttributeMapping](
	[PlanAttributeId] [int] IDENTITY(1,1) NOT NULL,
	[PlanId] [uniqueidentifier] NOT NULL,
	[OfferAttributeID] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[CreateDate] [datetime] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK__PlanAttr__8B476A98C058FAF2] PRIMARY KEY CLUSTERED 
(
	[PlanAttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanAttributeOutput]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanAttributeOutput](
	[RowNumber] [int] NOT NULL,
	[PlanAttributeId] [int] NOT NULL,
	[PlanId] [uniqueidentifier] NOT NULL,
	[OfferAttributeId] [int] NOT NULL,
	[DisplayName] [varchar](225) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[Type] [varchar](225) NULL,
 CONSTRAINT [PK__PlanAttr__AAAC09D888FE3E40] PRIMARY KEY CLUSTERED 
(
	[RowNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanEventsMapping]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanEventsMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlanId] [uniqueidentifier] NOT NULL,
	[EventId] [int] NOT NULL,
	[Isactive] [bit] NOT NULL,
	[SuccessStateEmails] [varchar](225) NULL,
	[FailureStateEmails] [varchar](225) NULL,
	[CreateDate] [datetime] NULL,
	[UserId] [int] NULL,
	[CopyToCustomer] [bit] NULL,
 CONSTRAINT [PK_PlanEventsMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanEventsOutPut]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanEventsOutPut](
	[RowNumber] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[PlanId] [uniqueidentifier] NOT NULL,
	[Isactive] [bit] NOT NULL,
	[SuccessStateEmails] [varchar](max) NULL,
	[FailureStateEmails] [varchar](max) NULL,
	[EventId] [int] NOT NULL,
	[EventsName] [varchar](225) NOT NULL,
	[CopyToCustomer] [bit] NULL,
 CONSTRAINT [PK__PlanEven__AAAC09D8C9229532] PRIMARY KEY CLUSTERED 
(
	[RowNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubscriptionAttributeValues]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubscriptionAttributeValues](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PlanAttributeId] [int] NOT NULL,
	[Value] [varchar](225) NULL,
	[SubscriptionId] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NULL,
	[UserId] [int] NULL,
	[PlanID] [uniqueidentifier] NOT NULL,
	[OfferID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_SubscriptionAttributeValues] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubscriptionAuditLogs]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubscriptionAuditLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubscriptionID] [int] NULL,
	[Attribute] [varchar](20) NULL,
	[OldValue] [varchar](50) NULL,
	[NewValue] [varchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [int] NULL,
 CONSTRAINT [PK_SubscriptionAuditLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubscriptionEmailOutput]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubscriptionEmailOutput](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](225) NULL,
	[Value] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubscriptionParametersOutput]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubscriptionParametersOutput](
	[RowNumber] [int] NOT NULL,
	[Id] [int] NOT NULL,
	[PlanAttributeId] [int] NOT NULL,
	[OfferAttributeID] [int] NOT NULL,
	[DisplayName] [varchar](225) NOT NULL,
	[Type] [varchar](225) NOT NULL,
	[ValueType] [varchar](225) NOT NULL,
	[DisplaySequence] [int] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[IsRequired] [bit] NULL,
	[Value] [varchar](max) NOT NULL,
	[SubscriptionId] [uniqueidentifier] NOT NULL,
	[OfferId] [uniqueidentifier] NOT NULL,
	[PlanId] [uniqueidentifier] NOT NULL,
	[UserId] [int] NULL,
	[CreateDate] [datetime] NULL,
	[FromList] [bit] NOT NULL,
	[ValuesList] [varchar](225) NOT NULL,
	[Max] [int] NOT NULL,
	[Min] [int] NOT NULL,
	[HTMLType] [varchar](225) NOT NULL,
 CONSTRAINT [PK__Subscrip__AAAC09D8BA727059] PRIMARY KEY CLUSTERED 
(
	[RowNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[FullName] [varchar](200) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ValueTypes]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ValueTypes](
	[ValueTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ValueType] [varchar](225) NULL,
	[CreateDate] [datetime] NULL,
	[HTMLType] [varchar](225) NULL,
 CONSTRAINT [PK__ValueTyp__A51E9C5AEA096123] PRIMARY KEY CLUSTERED 
(
	[ValueTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebJobSubscriptionStatus]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebJobSubscriptionStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubscriptionId] [uniqueidentifier] NULL,
	[SubscriptionStatus] [varchar](225) NULL,
	[Description] [varchar](max) NULL,
	[InsertDate] [datetime] NULL,
 CONSTRAINT [PK_WebJobSubscriptionStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221118045814_Baseline_v2', N'8.0.6')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221118203340_Baseline_v5', N'8.0.6')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221118211554_Baseline_v6', N'8.0.6')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230726232155_Baseline_v7', N'8.0.6')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230912052848_SubscriptionDetails_v740', N'8.0.6')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231115232155_Baseline_v741', N'8.0.6')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240312055030_baseline751', N'8.0.6')
GO
SET IDENTITY_INSERT [dbo].[ApplicationConfiguration] ON 
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (1, N'SMTPFromEmail', N'', N'SMTP Email')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (2, N'SMTPPassword', N'', N'SMTP Password')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (3, N'SMTPHost', N'', N'SMTP Host')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (4, N'SMTPPort', N'', N'SMTP Port')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (5, N'SMTPUserName', N'', N'SMTP User Name')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (6, N'SMTPSslEnabled', N'', N'SMTP Ssl Enabled')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (7, N'ApplicationName', N'Contoso', N'Application Name')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (8, N'IsEmailEnabledForSubscriptionActivation', N'true', N'Active Email Enabled')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (9, N'IsEmailEnabledForUnsubscription', N'true', N'Unsubscribe Email Enabled')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (10, N'IsAutomaticProvisioningSupported', N'false', N'Skip Activation - Automatic Provisioning Supported')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (11, N'IsEmailEnabledForPendingActivation', N'false', N'Email Enabled For Pending Activation')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (12, N'AcceptSubscriptionUpdates', N'false', N'Accepts subscriptions plan or quantity updates')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (13, N'LogoFile', N'', N'Logo File')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (14, N'FaviconFile', N'', N'Favicon File')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (15, N'EnableHourlyMeterSchedules', N'False', N'This will enable to run Hourly meter scheduled items')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (16, N'EnableDailyMeterSchedules', N'False', N'This will enable to run Daily meter scheduled items')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (17, N'EnableWeeklyMeterSchedules', N'False', N'This will enable to run Weekly meter scheduled items')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (18, N'EnableMonthlyMeterSchedules', N'False', N'This will enable to run Monthly meter scheduled items')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (19, N'EnableYearlyMeterSchedules', N'False', N'This will enable to run Yearly meter scheduled items')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (20, N'EnableOneTimeMeterSchedules', N'False', N'This will enable to run OneTime meter scheduled items')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (21, N'WebNotificationUrl', N'', N'Setting this URL will enable pushing LandingPage/Webhook events to this external URL')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (22, N'EnablesSuccessfulSchedulerEmail', N'False', N'This will enable sending email for successful metered usage.')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (23, N'EnablesFailureSchedulerEmail', N'False', N'This will enable sending email for failure metered usage.')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (24, N'EnablesMissingSchedulerEmail', N'False', N'This will enable sending email for missing metered usage.')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (25, N'SchedulerEmailTo', N'', N'Scheduler email receiver(s) ')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (26, N'IsMeteredBillingEnabled', N'true', N'Enable Metered Billing Feature')
GO
INSERT [dbo].[ApplicationConfiguration] ([ID], [Name], [Value], [Description]) VALUES (27, N'ValidateWebhookJwtToken', N'true', N'Validates JWT token when webhook event is recieved.')
GO
SET IDENTITY_INSERT [dbo].[ApplicationConfiguration] OFF
GO
SET IDENTITY_INSERT [dbo].[EmailTemplate] ON 
GO
INSERT [dbo].[EmailTemplate] ([ID], [Status], [Description], [InsertDate], [TemplateBody], [Subject], [ToRecipients], [CC], [BCC], [IsActive]) VALUES (1, N'Failed', N'Failed', CAST(N'2025-01-20T00:00:00.000' AS DateTime), N'
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <!--<note>Use this Template for Pending Activation email </note>-->      
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <!--<title>Cloud Market Place - Your registration is successful</title>-->      
      <style type="text/css">          /* /\/\/\/\/\/\/\/\/ CLIENT-SPECIFIC STYLES /\/\/\/\/\/\/\/\/ */            #outlook a {              padding: 0;          }          /* Force Outlook to provide a view in browser message */            .ReadMsgBody {              width: 100%;          }            .ExternalClass {              width: 100%;          }              /* Force Hotmail to display emails at full width */                .ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div {                  line-height: 100%;              }          /* Force Hotmail to display normal line spacing */            body, table, td, p, a, li, blockquote {              -webkit-text-size-adjust: 100%;              -ms-text-size-adjust: 100%;          }          /* Prevent WebKit and Windows mobile changing default text sizes */            table, td {              mso-table-lspace: 0pt;              mso-table-rspace: 0pt;          }          /* Remove spacing between tables in Outlook 2007 and up */            img {              -ms-interpolation-mode: bicubic;          }          /* Allow smoother rendering of resized image in Internet Explorer */ /* /\/\/\/\/\/\/\/\/ RESET STYLES /\/\/\/\/\/\/\/\/ */            body {              margin: 0;              padding: 0;          }            img {              border: 0;              height: auto;              line-height: 100%;              outline: none;              text-decoration: none;          }            table {              border-collapse: collapse !important;          }            body, #bodyTable, #bodyCell {              height: 100% !important;              margin: 0;              padding: 0;              width: 100% !important;          }          /* /\/\/\/\/\/\/\/\/ TEMPLATE STYLES /\/\/\/\/\/\/\/\/ */ /* ========== Page Styles ========== */            #bodyCell {              padding: 20px;          }            #templateContainer {              width: 600px;          }          /*** @tab Page* @section background style* @tip Set the background color and top border for your email. You may want to choose colors that match your companys branding.* @theme page*/            body, #bodyTable { /*@editable*/              background-color: #FFFFFF;          }          /*** @tab Page* @section background style* @tip Set the background color and top border for your email. You may want to choose colors that match your companys branding.* @theme page*/            #bodyCell { /*@editable*/              border-top: 4px solid #FFFFFF;          }          /*** @tab Page* @section email border* @tip Set the border for your email.*/            #templateContainer { /*@editable*/              border: 1px solid #BBBBBB;          }          /*** @tab Page* @section heading 1* @tip Set the styling for all first-level headings in your emails. These should be the largest of your headings.* @style heading 1*/            h1 { /*@editable*/              color: #202020 !important;              display: block; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 26px; /*@editable*/              font-style: normal; /*@editable*/              font-weight: bold; /*@editable*/              line-height: 100%; /*@editable*/              letter-spacing: normal;              margin-top: 0;              margin-right: 0;              margin-bottom: 10px;              margin-left: 0; /*@editable*/              text-align: left;          }          /*** @tab Page* @section heading 2* @tip Set the styling for all second-level headings in your emails.* @style heading 2*/            h2 { /*@editable*/              color: #404040 !important;              display: block; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 20px; /*@editable*/              font-style: normal; /*@editable*/              font-weight: bold; /*@editable*/              line-height: 100%; /*@editable*/              letter-spacing: normal;              margin-top: 0;              margin-right: 0;              margin-bottom: 10px;              margin-left: 0; /*@editable*/              text-align: left;          }          /*** @tab Page* @section heading 3* @tip Set the styling for all third-level headings in your emails.* @style heading 3*/            h3 { /*@editable*/              color: #606060 !important;              display: block; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 16px; /*@editable*/              font-style: italic; /*@editable*/              font-weight: normal; /*@editable*/              line-height: 100%; /*@editable*/              letter-spacing: normal;              margin-top: 0;              margin-right: 0;              margin-bottom: 10px;              margin-left: 0; /*@editable*/              text-align: left;          }          /*** @tab Page* @section heading 4* @tip Set the styling for all fourth-level headings in your emails. These should be the smallest of your headings.* @style heading 4*/            h4 { /*@editable*/              color: #000000 !important;              display: block; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 14px; /*@editable*/              font-style: italic; /*@editable*/              font-weight: normal; /*@editable*/              line-height: 100%; /*@editable*/              letter-spacing: normal;              margin-top: 0;              margin-right: 0;              margin-bottom: 10px;              margin-left: 0; /*@editable*/              text-align: left;          }          /* ========== Header Styles ========== */ /*** @tab Header* @section preheader style* @tip Set the background color and bottom border for your emails preheader area.* @theme header*/            #templatePreheader { /*@editable*/              background-color: #FFFFFF; /*@editable*/              border-bottom: 1px solid #CCCCCC;          }          /*** @tab Header* @section preheader text* @tip Set the styling for your emails preheader text. Choose a size and color that is easy to read.*/            .preheaderContent { /*@editable*/              color: #000000; /*@editable*/              font-family: wf_segoe-ui_normal, "Segoe UI", "Segoe WP", Tahoma, Arial, sans-serif; /*@editable*/              font-size: 10px; /*@editable*/              line-height: 125%; /*@editable*/              text-align: left;          }              /*** @tab Header* @section preheader link* @tip Set the styling for your emails preheader links. Choose a color that helps them stand out from your text.*/                .preheaderContent a:link, .preheaderContent a:visited, /* Yahoo! Mail Override */ .preheaderContent a .yshortcuts /* Yahoo! Mail Override */ { /*@editable*/                  color: #606060; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }          /*** @tab Header* @section header style* @tip Set the background color and borders for your emails header area.* @theme header*/            #templateHeader { /*@editable*/              background-color: #FFFFFF; /*@editable*/              border-top: 1px solid #FFFFFF; /*@editable*/              border-bottom: 1px solid #CCCCCC;          }          /*** @tab Header* @section header text* @tip Set the styling for your emails header text. Choose a size and color that is easy to read.*/            .headerContent { /*@editable*/              color: #505050; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 20px; /*@editable*/              font-weight: bold; /*@editable*/              line-height: 100%; /*@editable*/              padding-top: 0; /*@editable*/              padding-right: 0; /*@editable*/              padding-bottom: 0; /*@editable*/              padding-left: 0; /*@editable*/              text-align: left; /*@editable*/              vertical-align: middle;          }              /*** @tab Header* @section header link* @tip Set the styling for your emails header links. Choose a color that helps them stand out from your text.*/                .headerContent a:link, .headerContent a:visited, /* Yahoo! Mail Override */ .headerContent a .yshortcuts /* Yahoo! Mail Override */ { /*@editable*/                  color: #EB4102; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }            #headerImage {              height: auto;              max-width: 600px;          }          /* ========== Body Styles ========== */ /*** @tab Body* @section body style* @tip Set the background color and borders for your emails body area.*/            #templateBody { /*@editable*/              background-color: #FFFFFF; /*@editable*/              border-top: 1px solid #FFFFFF; /*@editable*/              border-bottom: 1px solid #CCCCCC;          }          /*** @tab Body* @section body text* @tip Set the styling for your emails main content text. Choose a size and color that is easy to read.* @theme main*/            .bodyContent { /*@editable*/              color: #505050; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 16px; /*@editable*/              line-height: 150%;              padding-top: 20px;              padding-right: 20px;              padding-bottom: 20px;              padding-left: 20px; /*@editable*/              text-align: left;          }              /*** @tab Body* @section body link* @tip Set the styling for your emails main content links. Choose a color that helps them stand out from your text.*/                .bodyContent a:link, .bodyContent a:visited, /* Yahoo! Mail Override */ .bodyContent a .yshortcuts /* Yahoo! Mail Override */ { /*@editable*/                  color: #EB4102; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }                .bodyContent img {                  display: inline;                  height: auto;                  max-width: 560px;              }          /* ========== Column Styles ========== */            .templateColumnContainer {              display: inline;              width: 260px;          }          /*** @tab Columns* @section column style* @tip Set the background color and borders for your emails column area.*/            #templateColumns { /*@editable*/              background-color: #FFFFFF; /*@editable*/              border-top: 1px solid #FFFFFF; /*@editable*/              border-bottom: 1px solid #CCCCCC;          }          /*** @tab Columns* @section left column text* @tip Set the styling for your emails left column content text. Choose a size and color that is easy to read.*/            .leftColumnContent { /*@editable*/              color: #505050; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 14px; /*@editable*/              line-height: 150%;              padding-top: 0;              padding-right: 0;              padding-bottom: 20px;              padding-left: 0; /*@editable*/              text-align: left;          }              /*** @tab Columns* @section left column link* @tip Set the styling for your emails left column content links. Choose a color that helps them stand out from your text.*/                .leftColumnContent a:link, .leftColumnContent a:visited, /* Yahoo! Mail Override */ .leftColumnContent a .yshortcuts /* Yahoo! Mail Override */ { /*@editable*/                  color: #EB4102; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }          /*** @tab Columns* @section right column text* @tip Set the styling for your emails right column content text. Choose a size and color that is easy to read.*/            .rightColumnContent { /*@editable*/              color: #505050; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 14px; /*@editable*/              line-height: 150%;              padding-top: 0;              padding-right: 0;              padding-bottom: 20px;              padding-left: 0; /*@editable*/              text-align: left;          }              /*** @tab Columns* @section right column link* @tip Set the styling for your emails right column content links. Choose a color that helps them stand out from your text.*/                .rightColumnContent a:link, .rightColumnContent a:visited, /* Yahoo! Mail Override */ .rightColumnContent a .yshortcuts /* Yahoo! Mail Override */ { /*@editable*/                  color: #EB4102; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }                .leftColumnContent img, .rightColumnContent img {                  display: inline;                  height: auto;                  max-width: 260px;              }          /* ========== Footer Styles ========== */ /*** @tab Footer* @section footer style* @tip Set the background color and borders for your emails footer area.* @theme footer*/            #templateFooter { /*@editable*/              background-color: #FFFFFF; /*@editable*/              border-top: 1px solid #FFFFFF;          }          /*** @tab Footer* @section footer text* @tip Set the styling for your emails footer text. Choose a size and color that is easy to read.* @theme footer*/            .footerContent { /*@editable*/              color: #808080; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 10px; /*@editable*/              line-height: 150%;              padding-top: 20px;              padding-right: 20px;              padding-bottom: 20px;              padding-left: 20px; /*@editable*/              text-align: left;          }              /*** @tab Footer* @section footer link* @tip Set the styling for your emails footer links. Choose a color that helps them stand out from your text.*/                .footerContent a:link, .footerContent a:visited, /* Yahoo! Mail Override */ .footerContent a .yshortcuts, .footerContent a span /* Yahoo! Mail Override */ { /*@editable*/                  color: #606060; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }          /* /\/\/\/\/\/\/\/\/ MOBILE STYLES /\/\/\/\/\/\/\/\/ */            @media only screen and (max-width: 480px) { /* /\/\/\/\/\/\/ CLIENT-SPECIFIC MOBILE STYLES /\/\/\/\/\/\/ */                body, table, td, p, a, li, blockquote {                  -webkit-text-size-adjust: none !important;              }              /* Prevent Webkit platforms from changing default text sizes */                body {                  width: 100% !important;                  min-width: 100% !important;              }              /* Prevent iOS Mail from adding padding to the body */ /* /\/\/\/\/\/\/ MOBILE RESET STYLES /\/\/\/\/\/\/ */                #bodyCell {                  padding: 10px !important;              }              /* /\/\/\/\/\/\/ MOBILE TEMPLATE STYLES /\/\/\/\/\/\/ */ /* ======== Page Styles ======== */ /*** @tab Mobile Styles* @section template width* @tip Make the template fluid for portrait or landscape view adaptability. If a fluid layout doesnt work for you, set the width to 300px instead.*/                #templateContainer {                  max-width: 600px !important; /*@editable*/                  width: 100% !important;              }              /*** @tab Mobile Styles* @section heading 1* @tip Make the first-level headings larger in size for better readability on small screens.*/                h1 { /*@editable*/                  font-size: 24px !important; /*@editable*/                  line-height: 100% !important;              }              /*** @tab Mobile Styles* @section heading 2* @tip Make the second-level headings larger in size for better readability on small screens.*/                h2 { /*@editable*/                  font-size: 20px !important; /*@editable*/                  line-height: 100% !important;              }              /*** @tab Mobile Styles* @section heading 3* @tip Make the third-level headings larger in size for better readability on small screens.*/                h3 { /*@editable*/                  font-size: 18px !important; /*@editable*/                  line-height: 100% !important;              }              /*** @tab Mobile Styles* @section heading 4* @tip Make the fourth-level headings larger in size for better readability on small screens.*/                h4 { /*@editable*/                  font-size: 16px !important; /*@editable*/                  line-height: 100% !important;              }              /* ======== Header Styles ======== */                #templatePreheader {                  display: none !important;              }              /* Hide the template preheader to save space */ /*** @tab Mobile Styles* @section header image* @tip Make the main header image fluid for portrait or landscape view adaptability, and set the images original width as the max-width. If a fluid setting doesnt work, set the image width to half its original size instead.*/                #headerImage {                  height: auto !important; /*@editable*/                  max-width: 600px !important; /*@editable*/                  width: 100% !important;              }              /*** @tab Mobile Styles* @section header text* @tip Make the header content text larger in size for better readability on small screens. We recommend a font size of at least 16px.*/                .headerContent { /*@editable*/                  font-size: 20px !important; /*@editable*/                  line-height: 125% !important;              }              /* ======== Body Styles ======== */ /*** @tab Mobile Styles* @section body image* @tip Make the main body image fluid for portrait or landscape view adaptability, and set the images original width as the max-width. If a fluid setting doesnt work, set the image width to half its original size instead.*/                #bodyImage {                  height: auto !important; /*@editable*/                  max-width: 560px !important; /*@editable*/                  width: 100% !important;              }              /*** @tab Mobile Styles* @section body text* @tip Make the body content text larger in size for better readability on small screens. We recommend a font size of at least 16px.*/                .bodyContent { /*@editable*/                  font-size: 18px !important; /*@editable*/                  line-height: 125% !important;              }              /* ======== Column Styles ======== */                .templateColumnContainer {                  display: block !important;                  width: 100% !important;              }              /*** @tab Mobile Styles* @section column image* @tip Make the column image fluid for portrait or landscape view adaptability, and set the images original width as the max-width. If a fluid setting doesnt work, set the image width to half its original size instead.*/                .columnImage {                  height: auto !important; /*@editable*/                  max-width: 260px !important; /*@editable*/                  width: 100% !important;              }              /*** @tab Mobile Styles* @section left column text* @tip Make the left column content text larger in size for better readability on small screens. We recommend a font size of at least 16px.*/                .leftColumnContent { /*@editable*/                  font-size: 16px !important; /*@editable*/                  line-height: 125% !important;              }              /*** @tab Mobile Styles* @section right column text* @tip Make the right column content text larger in size for better readability on small screens. We recommend a font size of at least 16px.*/                .rightColumnContent { /*@editable*/                  font-size: 16px !important; /*@editable*/                  line-height: 125% !important;              }              /* ======== Footer Styles ======== */ /*** @tab Mobile Styles* @section footer text* @tip Make the body content text larger in size for better readability on small screens.*/                .footerContent { /*@editable*/                  font-size: 14px !important; /*@editable*/                  line-height: 115% !important;              }                    .footerContent a {                      display: block !important;                  }              /* Place footer social and utility links on their own lines, for easier access */          }      </style>
   </head>
   <body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" offset="0">
      <center>
         <table align="center" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%" id="bodyTable">
            <tr>
               <td align="center" valign="top" id="bodyCell">
                  <!-- BEGIN TEMPLATE // -->                      
                  <table border="0" cellpadding="0" cellspacing="0" id="templateContainer">
                     <tr>
                        <td align="center" valign="top">
                           <!-- BEGIN HEADER // -->                                  
                           <table border="0" cellpadding="0" cellspacing="0" width="100%" id="templateHeader">
                              <tr>
                                 <td valign="top" class="headerContent">                                              <img src="https://raw.githubusercontent.com/Azure/Commercial-Marketplace-SaaS-Accelerator/main/src/CustomerSite/wwwroot/contoso-sales.png" style="max-width: 300px; display: block; margin-left: auto; margin-right: auto; padding-top:10px;padding-bottom:10px;" id="headerImage" />                                          </td>
                              </tr>
                           </table>
                           <!-- // END HEADER -->                              
                        </td>
                     </tr>
                     <tr>
                        <td align="center" valign="top">
                           <!-- BEGIN BODY // -->                                  
                           <table border="0" cellpadding="0" cellspacing="0" width="100%" id="templateBody">
                              <tr>
                                 <td valign="top" class="bodyContent">
                                    <h1 style="display: block;  margin-left: auto;  margin-right: auto;  width: 75%;">Welcome to ${ApplicationName}!</h1>
                                                                        <p>${welcometext}</p>
                                                                          <table border="0" cellpadding="0" cellspacing="0" width="100%" id="templateBody">
                                                                          ${subscriptiondetails}   
                                                                                                              </table>
                                    <p style=" margin-left: auto; margin-right: auto; text-align:right;">                                                  <a href="https://saaskitdemoapp.azurewebsites.net/">                                                      <button style="background-color:#2168A6;line-height:30px;color:white"><b>View Details</b></button>                                                  </a>                                              </p>
                                    <!--     CTA button -->                                              <!--<table style="background: #0078D7;" cellspacing="0" cellpadding="0" align="left">                                                  <tbody>                                                      <tr>                                                          <td style="padding-left: 15px; font-size: 18px; line-height: 20px; font-family:"Segoe UI Light"; color: #ffffff;">                                                              <a style="text-decoration: none; font-size: 18px; line-height: 20px; font-family:"Segoe UI Light"; color: #ffffff;" href="${LinkToPortal}/#/login">${LoginButtonTextInEmail}</a>                                                          </td>                                                          <td style="line-height: 1px; font-size: 1px; padding: 10px;">                                                              <a>                                                                  <img src="https://info.microsoft.com/rs/157-GQE-382/images/Program-CTAButton-whiteltr.png" border="0" alt="" height="20" />                                                              </a>                                                          </td>                                                      </tr>                                                  </tbody>                                              </table>-->                                              <!--     end CTA button -->                                          
                                 </td>
                              </tr>
                     <tr>
                        <td align="center" valign="top">
                           <!-- BEGIN PREHEADER // -->                                  
                           <table border="0" cellpadding="0" cellspacing="0" width="100%" id="templatePreheader">
                              <tr>
                                 <td valign="top" class="preheaderContent" style="padding-top: 10px; padding-right: 20px; padding-bottom: 10px; padding-left: 20px;">                                              You are receiving this message because of an interaction with                                              <a href="https://saaskitdemoapp.azurewebsites.net/">Contoso</a>.                                              Please contact us at <a href="https://saaskitdemoapp.azurewebsites.net/">Contoso</a>                                              in case you think you have received this message in error or need help.                                          </td>
                                 <!-- *|IFNOT:ARCHIVE_PAGE|* -->                                                      <!-- *|END:IF|* -->                                      
                              </tr>
                           </table>
                           <!-- // END PREHEADER -->                              
                        </td>
                     </tr>
                  </table>
               </td>
            </tr>
         </table>
         <!-- // END BODY -->          </td>          </tr>          </table>           <!-- // END TEMPLATE -->      
      </center>
   </body>
</html>', N'Failed', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[EmailTemplate] ([ID], [Status], [Description], [InsertDate], [TemplateBody], [Subject], [ToRecipients], [CC], [BCC], [IsActive]) VALUES (2, N'PendingActivation', N'Pending Activation', CAST(N'2025-01-20T00:00:00.000' AS DateTime), N'
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <!--<note>Use this Template for Pending Activation email </note>-->      
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <!--<title>Cloud Market Place - Your registration is successful</title>-->      
      <style type="text/css">          /* /\/\/\/\/\/\/\/\/ CLIENT-SPECIFIC STYLES /\/\/\/\/\/\/\/\/ */            #outlook a {              padding: 0;          }          /* Force Outlook to provide a view in browser message */            .ReadMsgBody {              width: 100%;          }            .ExternalClass {              width: 100%;          }              /* Force Hotmail to display emails at full width */                .ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div {                  line-height: 100%;              }          /* Force Hotmail to display normal line spacing */            body, table, td, p, a, li, blockquote {              -webkit-text-size-adjust: 100%;              -ms-text-size-adjust: 100%;          }          /* Prevent WebKit and Windows mobile changing default text sizes */            table, td {              mso-table-lspace: 0pt;              mso-table-rspace: 0pt;          }          /* Remove spacing between tables in Outlook 2007 and up */            img {              -ms-interpolation-mode: bicubic;          }          /* Allow smoother rendering of resized image in Internet Explorer */ /* /\/\/\/\/\/\/\/\/ RESET STYLES /\/\/\/\/\/\/\/\/ */            body {              margin: 0;              padding: 0;          }            img {              border: 0;              height: auto;              line-height: 100%;              outline: none;              text-decoration: none;          }            table {              border-collapse: collapse !important;          }            body, #bodyTable, #bodyCell {              height: 100% !important;              margin: 0;              padding: 0;              width: 100% !important;          }          /* /\/\/\/\/\/\/\/\/ TEMPLATE STYLES /\/\/\/\/\/\/\/\/ */ /* ========== Page Styles ========== */            #bodyCell {              padding: 20px;          }            #templateContainer {              width: 600px;          }          /*** @tab Page* @section background style* @tip Set the background color and top border for your email. You may want to choose colors that match your companys branding.* @theme page*/            body, #bodyTable { /*@editable*/              background-color: #FFFFFF;          }          /*** @tab Page* @section background style* @tip Set the background color and top border for your email. You may want to choose colors that match your companys branding.* @theme page*/            #bodyCell { /*@editable*/              border-top: 4px solid #FFFFFF;          }          /*** @tab Page* @section email border* @tip Set the border for your email.*/            #templateContainer { /*@editable*/              border: 1px solid #BBBBBB;          }          /*** @tab Page* @section heading 1* @tip Set the styling for all first-level headings in your emails. These should be the largest of your headings.* @style heading 1*/            h1 { /*@editable*/              color: #202020 !important;              display: block; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 26px; /*@editable*/              font-style: normal; /*@editable*/              font-weight: bold; /*@editable*/              line-height: 100%; /*@editable*/              letter-spacing: normal;              margin-top: 0;              margin-right: 0;              margin-bottom: 10px;              margin-left: 0; /*@editable*/              text-align: left;          }          /*** @tab Page* @section heading 2* @tip Set the styling for all second-level headings in your emails.* @style heading 2*/            h2 { /*@editable*/              color: #404040 !important;              display: block; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 20px; /*@editable*/              font-style: normal; /*@editable*/              font-weight: bold; /*@editable*/              line-height: 100%; /*@editable*/              letter-spacing: normal;              margin-top: 0;              margin-right: 0;              margin-bottom: 10px;              margin-left: 0; /*@editable*/              text-align: left;          }          /*** @tab Page* @section heading 3* @tip Set the styling for all third-level headings in your emails.* @style heading 3*/            h3 { /*@editable*/              color: #606060 !important;              display: block; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 16px; /*@editable*/              font-style: italic; /*@editable*/              font-weight: normal; /*@editable*/              line-height: 100%; /*@editable*/              letter-spacing: normal;              margin-top: 0;              margin-right: 0;              margin-bottom: 10px;              margin-left: 0; /*@editable*/              text-align: left;          }          /*** @tab Page* @section heading 4* @tip Set the styling for all fourth-level headings in your emails. These should be the smallest of your headings.* @style heading 4*/            h4 { /*@editable*/              color: #000000 !important;              display: block; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 14px; /*@editable*/              font-style: italic; /*@editable*/              font-weight: normal; /*@editable*/              line-height: 100%; /*@editable*/              letter-spacing: normal;              margin-top: 0;              margin-right: 0;              margin-bottom: 10px;              margin-left: 0; /*@editable*/              text-align: left;          }          /* ========== Header Styles ========== */ /*** @tab Header* @section preheader style* @tip Set the background color and bottom border for your emails preheader area.* @theme header*/            #templatePreheader { /*@editable*/              background-color: #FFFFFF; /*@editable*/              border-bottom: 1px solid #CCCCCC;          }          /*** @tab Header* @section preheader text* @tip Set the styling for your emails preheader text. Choose a size and color that is easy to read.*/            .preheaderContent { /*@editable*/              color: #000000; /*@editable*/              font-family: wf_segoe-ui_normal, "Segoe UI", "Segoe WP", Tahoma, Arial, sans-serif; /*@editable*/              font-size: 10px; /*@editable*/              line-height: 125%; /*@editable*/              text-align: left;          }              /*** @tab Header* @section preheader link* @tip Set the styling for your emails preheader links. Choose a color that helps them stand out from your text.*/                .preheaderContent a:link, .preheaderContent a:visited, /* Yahoo! Mail Override */ .preheaderContent a .yshortcuts /* Yahoo! Mail Override */ { /*@editable*/                  color: #606060; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }          /*** @tab Header* @section header style* @tip Set the background color and borders for your emails header area.* @theme header*/            #templateHeader { /*@editable*/              background-color: #FFFFFF; /*@editable*/              border-top: 1px solid #FFFFFF; /*@editable*/              border-bottom: 1px solid #CCCCCC;          }          /*** @tab Header* @section header text* @tip Set the styling for your emails header text. Choose a size and color that is easy to read.*/            .headerContent { /*@editable*/              color: #505050; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 20px; /*@editable*/              font-weight: bold; /*@editable*/              line-height: 100%; /*@editable*/              padding-top: 0; /*@editable*/              padding-right: 0; /*@editable*/              padding-bottom: 0; /*@editable*/              padding-left: 0; /*@editable*/              text-align: left; /*@editable*/              vertical-align: middle;          }              /*** @tab Header* @section header link* @tip Set the styling for your emails header links. Choose a color that helps them stand out from your text.*/                .headerContent a:link, .headerContent a:visited, /* Yahoo! Mail Override */ .headerContent a .yshortcuts /* Yahoo! Mail Override */ { /*@editable*/                  color: #EB4102; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }            #headerImage {              height: auto;              max-width: 600px;          }          /* ========== Body Styles ========== */ /*** @tab Body* @section body style* @tip Set the background color and borders for your emails body area.*/            #templateBody { /*@editable*/              background-color: #FFFFFF; /*@editable*/              border-top: 1px solid #FFFFFF; /*@editable*/              border-bottom: 1px solid #CCCCCC;          }          /*** @tab Body* @section body text* @tip Set the styling for your emails main content text. Choose a size and color that is easy to read.* @theme main*/            .bodyContent { /*@editable*/              color: #505050; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 16px; /*@editable*/              line-height: 150%;              padding-top: 20px;              padding-right: 20px;              padding-bottom: 20px;              padding-left: 20px; /*@editable*/              text-align: left;          }              /*** @tab Body* @section body link* @tip Set the styling for your emails main content links. Choose a color that helps them stand out from your text.*/                .bodyContent a:link, .bodyContent a:visited, /* Yahoo! Mail Override */ .bodyContent a .yshortcuts /* Yahoo! Mail Override */ { /*@editable*/                  color: #EB4102; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }                .bodyContent img {                  display: inline;                  height: auto;                  max-width: 560px;              }          /* ========== Column Styles ========== */            .templateColumnContainer {              display: inline;              width: 260px;          }          /*** @tab Columns* @section column style* @tip Set the background color and borders for your emails column area.*/            #templateColumns { /*@editable*/              background-color: #FFFFFF; /*@editable*/              border-top: 1px solid #FFFFFF; /*@editable*/              border-bottom: 1px solid #CCCCCC;          }          /*** @tab Columns* @section left column text* @tip Set the styling for your emails left column content text. Choose a size and color that is easy to read.*/            .leftColumnContent { /*@editable*/              color: #505050; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 14px; /*@editable*/              line-height: 150%;              padding-top: 0;              padding-right: 0;              padding-bottom: 20px;              padding-left: 0; /*@editable*/              text-align: left;          }              /*** @tab Columns* @section left column link* @tip Set the styling for your emails left column content links. Choose a color that helps them stand out from your text.*/                .leftColumnContent a:link, .leftColumnContent a:visited, /* Yahoo! Mail Override */ .leftColumnContent a .yshortcuts /* Yahoo! Mail Override */ { /*@editable*/                  color: #EB4102; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }          /*** @tab Columns* @section right column text* @tip Set the styling for your emails right column content text. Choose a size and color that is easy to read.*/            .rightColumnContent { /*@editable*/              color: #505050; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 14px; /*@editable*/              line-height: 150%;              padding-top: 0;              padding-right: 0;              padding-bottom: 20px;              padding-left: 0; /*@editable*/              text-align: left;          }              /*** @tab Columns* @section right column link* @tip Set the styling for your emails right column content links. Choose a color that helps them stand out from your text.*/                .rightColumnContent a:link, .rightColumnContent a:visited, /* Yahoo! Mail Override */ .rightColumnContent a .yshortcuts /* Yahoo! Mail Override */ { /*@editable*/                  color: #EB4102; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }                .leftColumnContent img, .rightColumnContent img {                  display: inline;                  height: auto;                  max-width: 260px;              }          /* ========== Footer Styles ========== */ /*** @tab Footer* @section footer style* @tip Set the background color and borders for your emails footer area.* @theme footer*/            #templateFooter { /*@editable*/              background-color: #FFFFFF; /*@editable*/              border-top: 1px solid #FFFFFF;          }          /*** @tab Footer* @section footer text* @tip Set the styling for your emails footer text. Choose a size and color that is easy to read.* @theme footer*/            .footerContent { /*@editable*/              color: #808080; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 10px; /*@editable*/              line-height: 150%;              padding-top: 20px;              padding-right: 20px;              padding-bottom: 20px;              padding-left: 20px; /*@editable*/              text-align: left;          }              /*** @tab Footer* @section footer link* @tip Set the styling for your emails footer links. Choose a color that helps them stand out from your text.*/                .footerContent a:link, .footerContent a:visited, /* Yahoo! Mail Override */ .footerContent a .yshortcuts, .footerContent a span /* Yahoo! Mail Override */ { /*@editable*/                  color: #606060; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }          /* /\/\/\/\/\/\/\/\/ MOBILE STYLES /\/\/\/\/\/\/\/\/ */            @media only screen and (max-width: 480px) { /* /\/\/\/\/\/\/ CLIENT-SPECIFIC MOBILE STYLES /\/\/\/\/\/\/ */                body, table, td, p, a, li, blockquote {                  -webkit-text-size-adjust: none !important;              }              /* Prevent Webkit platforms from changing default text sizes */                body {                  width: 100% !important;                  min-width: 100% !important;              }              /* Prevent iOS Mail from adding padding to the body */ /* /\/\/\/\/\/\/ MOBILE RESET STYLES /\/\/\/\/\/\/ */                #bodyCell {                  padding: 10px !important;              }              /* /\/\/\/\/\/\/ MOBILE TEMPLATE STYLES /\/\/\/\/\/\/ */ /* ======== Page Styles ======== */ /*** @tab Mobile Styles* @section template width* @tip Make the template fluid for portrait or landscape view adaptability. If a fluid layout doesnt work for you, set the width to 300px instead.*/                #templateContainer {                  max-width: 600px !important; /*@editable*/                  width: 100% !important;              }              /*** @tab Mobile Styles* @section heading 1* @tip Make the first-level headings larger in size for better readability on small screens.*/                h1 { /*@editable*/                  font-size: 24px !important; /*@editable*/                  line-height: 100% !important;              }              /*** @tab Mobile Styles* @section heading 2* @tip Make the second-level headings larger in size for better readability on small screens.*/                h2 { /*@editable*/                  font-size: 20px !important; /*@editable*/                  line-height: 100% !important;              }              /*** @tab Mobile Styles* @section heading 3* @tip Make the third-level headings larger in size for better readability on small screens.*/                h3 { /*@editable*/                  font-size: 18px !important; /*@editable*/                  line-height: 100% !important;              }              /*** @tab Mobile Styles* @section heading 4* @tip Make the fourth-level headings larger in size for better readability on small screens.*/                h4 { /*@editable*/                  font-size: 16px !important; /*@editable*/                  line-height: 100% !important;              }              /* ======== Header Styles ======== */                #templatePreheader {                  display: none !important;              }              /* Hide the template preheader to save space */ /*** @tab Mobile Styles* @section header image* @tip Make the main header image fluid for portrait or landscape view adaptability, and set the images original width as the max-width. If a fluid setting doesnt work, set the image width to half its original size instead.*/                #headerImage {                  height: auto !important; /*@editable*/                  max-width: 600px !important; /*@editable*/                  width: 100% !important;              }              /*** @tab Mobile Styles* @section header text* @tip Make the header content text larger in size for better readability on small screens. We recommend a font size of at least 16px.*/                .headerContent { /*@editable*/                  font-size: 20px !important; /*@editable*/                  line-height: 125% !important;              }              /* ======== Body Styles ======== */ /*** @tab Mobile Styles* @section body image* @tip Make the main body image fluid for portrait or landscape view adaptability, and set the images original width as the max-width. If a fluid setting doesnt work, set the image width to half its original size instead.*/                #bodyImage {                  height: auto !important; /*@editable*/                  max-width: 560px !important; /*@editable*/                  width: 100% !important;              }              /*** @tab Mobile Styles* @section body text* @tip Make the body content text larger in size for better readability on small screens. We recommend a font size of at least 16px.*/                .bodyContent { /*@editable*/                  font-size: 18px !important; /*@editable*/                  line-height: 125% !important;              }              /* ======== Column Styles ======== */                .templateColumnContainer {                  display: block !important;                  width: 100% !important;              }              /*** @tab Mobile Styles* @section column image* @tip Make the column image fluid for portrait or landscape view adaptability, and set the images original width as the max-width. If a fluid setting doesnt work, set the image width to half its original size instead.*/                .columnImage {                  height: auto !important; /*@editable*/                  max-width: 260px !important; /*@editable*/                  width: 100% !important;              }              /*** @tab Mobile Styles* @section left column text* @tip Make the left column content text larger in size for better readability on small screens. We recommend a font size of at least 16px.*/                .leftColumnContent { /*@editable*/                  font-size: 16px !important; /*@editable*/                  line-height: 125% !important;              }              /*** @tab Mobile Styles* @section right column text* @tip Make the right column content text larger in size for better readability on small screens. We recommend a font size of at least 16px.*/                .rightColumnContent { /*@editable*/                  font-size: 16px !important; /*@editable*/                  line-height: 125% !important;              }              /* ======== Footer Styles ======== */ /*** @tab Mobile Styles* @section footer text* @tip Make the body content text larger in size for better readability on small screens.*/                .footerContent { /*@editable*/                  font-size: 14px !important; /*@editable*/                  line-height: 115% !important;              }                    .footerContent a {                      display: block !important;                  }              /* Place footer social and utility links on their own lines, for easier access */          }      </style>
   </head>
   <body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" offset="0">
      <center>
         <table align="center" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%" id="bodyTable">
            <tr>
               <td align="center" valign="top" id="bodyCell">
                  <!-- BEGIN TEMPLATE // -->                      
                  <table border="0" cellpadding="0" cellspacing="0" id="templateContainer">
                     <tr>
                        <td align="center" valign="top">
                           <!-- BEGIN HEADER // -->                                  
                           <table border="0" cellpadding="0" cellspacing="0" width="100%" id="templateHeader">
                              <tr>
                                 <td valign="top" class="headerContent">                                              <img src="https://raw.githubusercontent.com/Azure/Commercial-Marketplace-SaaS-Accelerator/main/src/CustomerSite/wwwroot/contoso-sales.png" style="max-width: 300px; display: block; margin-left: auto; margin-right: auto; padding-top:10px;padding-bottom:10px;" id="headerImage" />                                          </td>
                              </tr>
                           </table>
                           <!-- // END HEADER -->                              
                        </td>
                     </tr>
                     <tr>
                        <td align="center" valign="top">
                           <!-- BEGIN BODY // -->                                  
                           <table border="0" cellpadding="0" cellspacing="0" width="100%" id="templateBody">
                              <tr>
                                 <td valign="top" class="bodyContent">
                                    <h1 style="display: block;  margin-left: auto;  margin-right: auto;  width: 75%;">Welcome to ${ApplicationName}!</h1>
                                                                        <p>${welcometext}</p>
                                                                          <table border="0" cellpadding="0" cellspacing="0" width="100%" id="templateBody">
                                                                          ${subscriptiondetails}   
                                                                                                              </table>
                                    <p style=" margin-left: auto; margin-right: auto; text-align:right;">                                                  <a href="https://saaskitdemoapp.azurewebsites.net/">                                                      <button style="background-color:#2168A6;line-height:30px;color:white"><b>View Details</b></button>                                                  </a>                                              </p>
                                    <!--     CTA button -->                                              <!--<table style="background: #0078D7;" cellspacing="0" cellpadding="0" align="left">                                                  <tbody>                                                      <tr>                                                          <td style="padding-left: 15px; font-size: 18px; line-height: 20px; font-family:"Segoe UI Light"; color: #ffffff;">                                                              <a style="text-decoration: none; font-size: 18px; line-height: 20px; font-family:"Segoe UI Light"; color: #ffffff;" href="${LinkToPortal}/#/login">${LoginButtonTextInEmail}</a>                                                          </td>                                                          <td style="line-height: 1px; font-size: 1px; padding: 10px;">                                                              <a>                                                                  <img src="https://info.microsoft.com/rs/157-GQE-382/images/Program-CTAButton-whiteltr.png" border="0" alt="" height="20" />                                                              </a>                                                          </td>                                                      </tr>                                                  </tbody>                                              </table>-->                                              <!--     end CTA button -->                                          
                                 </td>
                              </tr>
                     <tr>
                        <td align="center" valign="top">
                           <!-- BEGIN PREHEADER // -->                                  
                           <table border="0" cellpadding="0" cellspacing="0" width="100%" id="templatePreheader">
                              <tr>
                                 <td valign="top" class="preheaderContent" style="padding-top: 10px; padding-right: 20px; padding-bottom: 10px; padding-left: 20px;">                                              You are receiving this message because of an interaction with                                              <a href="https://saaskitdemoapp.azurewebsites.net/">Contoso</a>.                                              Please contact us at <a href="https://saaskitdemoapp.azurewebsites.net/">Contoso</a>                                              in case you think you have received this message in error or need help.                                          </td>
                                 <!-- *|IFNOT:ARCHIVE_PAGE|* -->                                                      <!-- *|END:IF|* -->                                      
                              </tr>
                           </table>
                           <!-- // END PREHEADER -->                              
                        </td>
                     </tr>
                  </table>
               </td>
            </tr>
         </table>
         <!-- // END BODY -->          </td>          </tr>          </table>           <!-- // END TEMPLATE -->      
      </center>
   </body>
</html>
', N'Pending Activation', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[EmailTemplate] ([ID], [Status], [Description], [InsertDate], [TemplateBody], [Subject], [ToRecipients], [CC], [BCC], [IsActive]) VALUES (3, N'Subscribed', N'Subscribed', CAST(N'2025-01-20T00:00:00.000' AS DateTime), N'
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <!--<note>Use this Template for Pending Activation email </note>-->      
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <!--<title>Cloud Market Place - Your registration is successful</title>-->      
      <style type="text/css">          /* /\/\/\/\/\/\/\/\/ CLIENT-SPECIFIC STYLES /\/\/\/\/\/\/\/\/ */            #outlook a {              padding: 0;          }          /* Force Outlook to provide a view in browser message */            .ReadMsgBody {              width: 100%;          }            .ExternalClass {              width: 100%;          }              /* Force Hotmail to display emails at full width */                .ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div {                  line-height: 100%;              }          /* Force Hotmail to display normal line spacing */            body, table, td, p, a, li, blockquote {              -webkit-text-size-adjust: 100%;              -ms-text-size-adjust: 100%;          }          /* Prevent WebKit and Windows mobile changing default text sizes */            table, td {              mso-table-lspace: 0pt;              mso-table-rspace: 0pt;          }          /* Remove spacing between tables in Outlook 2007 and up */            img {              -ms-interpolation-mode: bicubic;          }          /* Allow smoother rendering of resized image in Internet Explorer */ /* /\/\/\/\/\/\/\/\/ RESET STYLES /\/\/\/\/\/\/\/\/ */            body {              margin: 0;              padding: 0;          }            img {              border: 0;              height: auto;              line-height: 100%;              outline: none;              text-decoration: none;          }            table {              border-collapse: collapse !important;          }            body, #bodyTable, #bodyCell {              height: 100% !important;              margin: 0;              padding: 0;              width: 100% !important;          }          /* /\/\/\/\/\/\/\/\/ TEMPLATE STYLES /\/\/\/\/\/\/\/\/ */ /* ========== Page Styles ========== */            #bodyCell {              padding: 20px;          }            #templateContainer {              width: 600px;          }          /*** @tab Page* @section background style* @tip Set the background color and top border for your email. You may want to choose colors that match your companys branding.* @theme page*/            body, #bodyTable { /*@editable*/              background-color: #FFFFFF;          }          /*** @tab Page* @section background style* @tip Set the background color and top border for your email. You may want to choose colors that match your companys branding.* @theme page*/            #bodyCell { /*@editable*/              border-top: 4px solid #FFFFFF;          }          /*** @tab Page* @section email border* @tip Set the border for your email.*/            #templateContainer { /*@editable*/              border: 1px solid #BBBBBB;          }          /*** @tab Page* @section heading 1* @tip Set the styling for all first-level headings in your emails. These should be the largest of your headings.* @style heading 1*/            h1 { /*@editable*/              color: #202020 !important;              display: block; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 26px; /*@editable*/              font-style: normal; /*@editable*/              font-weight: bold; /*@editable*/              line-height: 100%; /*@editable*/              letter-spacing: normal;              margin-top: 0;              margin-right: 0;              margin-bottom: 10px;              margin-left: 0; /*@editable*/              text-align: left;          }          /*** @tab Page* @section heading 2* @tip Set the styling for all second-level headings in your emails.* @style heading 2*/            h2 { /*@editable*/              color: #404040 !important;              display: block; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 20px; /*@editable*/              font-style: normal; /*@editable*/              font-weight: bold; /*@editable*/              line-height: 100%; /*@editable*/              letter-spacing: normal;              margin-top: 0;              margin-right: 0;              margin-bottom: 10px;              margin-left: 0; /*@editable*/              text-align: left;          }          /*** @tab Page* @section heading 3* @tip Set the styling for all third-level headings in your emails.* @style heading 3*/            h3 { /*@editable*/              color: #606060 !important;              display: block; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 16px; /*@editable*/              font-style: italic; /*@editable*/              font-weight: normal; /*@editable*/              line-height: 100%; /*@editable*/              letter-spacing: normal;              margin-top: 0;              margin-right: 0;              margin-bottom: 10px;              margin-left: 0; /*@editable*/              text-align: left;          }          /*** @tab Page* @section heading 4* @tip Set the styling for all fourth-level headings in your emails. These should be the smallest of your headings.* @style heading 4*/            h4 { /*@editable*/              color: #000000 !important;              display: block; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 14px; /*@editable*/              font-style: italic; /*@editable*/              font-weight: normal; /*@editable*/              line-height: 100%; /*@editable*/              letter-spacing: normal;              margin-top: 0;              margin-right: 0;              margin-bottom: 10px;              margin-left: 0; /*@editable*/              text-align: left;          }          /* ========== Header Styles ========== */ /*** @tab Header* @section preheader style* @tip Set the background color and bottom border for your emails preheader area.* @theme header*/            #templatePreheader { /*@editable*/              background-color: #FFFFFF; /*@editable*/              border-bottom: 1px solid #CCCCCC;          }          /*** @tab Header* @section preheader text* @tip Set the styling for your emails preheader text. Choose a size and color that is easy to read.*/            .preheaderContent { /*@editable*/              color: #000000; /*@editable*/              font-family: wf_segoe-ui_normal, "Segoe UI", "Segoe WP", Tahoma, Arial, sans-serif; /*@editable*/              font-size: 10px; /*@editable*/              line-height: 125%; /*@editable*/              text-align: left;          }              /*** @tab Header* @section preheader link* @tip Set the styling for your emails preheader links. Choose a color that helps them stand out from your text.*/                .preheaderContent a:link, .preheaderContent a:visited, /* Yahoo! Mail Override */ .preheaderContent a .yshortcuts /* Yahoo! Mail Override */ { /*@editable*/                  color: #606060; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }          /*** @tab Header* @section header style* @tip Set the background color and borders for your emails header area.* @theme header*/            #templateHeader { /*@editable*/              background-color: #FFFFFF; /*@editable*/              border-top: 1px solid #FFFFFF; /*@editable*/              border-bottom: 1px solid #CCCCCC;          }          /*** @tab Header* @section header text* @tip Set the styling for your emails header text. Choose a size and color that is easy to read.*/            .headerContent { /*@editable*/              color: #505050; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 20px; /*@editable*/              font-weight: bold; /*@editable*/              line-height: 100%; /*@editable*/              padding-top: 0; /*@editable*/              padding-right: 0; /*@editable*/              padding-bottom: 0; /*@editable*/              padding-left: 0; /*@editable*/              text-align: left; /*@editable*/              vertical-align: middle;          }              /*** @tab Header* @section header link* @tip Set the styling for your emails header links. Choose a color that helps them stand out from your text.*/                .headerContent a:link, .headerContent a:visited, /* Yahoo! Mail Override */ .headerContent a .yshortcuts /* Yahoo! Mail Override */ { /*@editable*/                  color: #EB4102; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }            #headerImage {              height: auto;              max-width: 600px;          }          /* ========== Body Styles ========== */ /*** @tab Body* @section body style* @tip Set the background color and borders for your emails body area.*/            #templateBody { /*@editable*/              background-color: #FFFFFF; /*@editable*/              border-top: 1px solid #FFFFFF; /*@editable*/              border-bottom: 1px solid #CCCCCC;          }          /*** @tab Body* @section body text* @tip Set the styling for your emails main content text. Choose a size and color that is easy to read.* @theme main*/            .bodyContent { /*@editable*/              color: #505050; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 16px; /*@editable*/              line-height: 150%;              padding-top: 20px;              padding-right: 20px;              padding-bottom: 20px;              padding-left: 20px; /*@editable*/              text-align: left;          }              /*** @tab Body* @section body link* @tip Set the styling for your emails main content links. Choose a color that helps them stand out from your text.*/                .bodyContent a:link, .bodyContent a:visited, /* Yahoo! Mail Override */ .bodyContent a .yshortcuts /* Yahoo! Mail Override */ { /*@editable*/                  color: #EB4102; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }                .bodyContent img {                  display: inline;                  height: auto;                  max-width: 560px;              }          /* ========== Column Styles ========== */            .templateColumnContainer {              display: inline;              width: 260px;          }          /*** @tab Columns* @section column style* @tip Set the background color and borders for your emails column area.*/            #templateColumns { /*@editable*/              background-color: #FFFFFF; /*@editable*/              border-top: 1px solid #FFFFFF; /*@editable*/              border-bottom: 1px solid #CCCCCC;          }          /*** @tab Columns* @section left column text* @tip Set the styling for your emails left column content text. Choose a size and color that is easy to read.*/            .leftColumnContent { /*@editable*/              color: #505050; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 14px; /*@editable*/              line-height: 150%;              padding-top: 0;              padding-right: 0;              padding-bottom: 20px;              padding-left: 0; /*@editable*/              text-align: left;          }              /*** @tab Columns* @section left column link* @tip Set the styling for your emails left column content links. Choose a color that helps them stand out from your text.*/                .leftColumnContent a:link, .leftColumnContent a:visited, /* Yahoo! Mail Override */ .leftColumnContent a .yshortcuts /* Yahoo! Mail Override */ { /*@editable*/                  color: #EB4102; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }          /*** @tab Columns* @section right column text* @tip Set the styling for your emails right column content text. Choose a size and color that is easy to read.*/            .rightColumnContent { /*@editable*/              color: #505050; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 14px; /*@editable*/              line-height: 150%;              padding-top: 0;              padding-right: 0;              padding-bottom: 20px;              padding-left: 0; /*@editable*/              text-align: left;          }              /*** @tab Columns* @section right column link* @tip Set the styling for your emails right column content links. Choose a color that helps them stand out from your text.*/                .rightColumnContent a:link, .rightColumnContent a:visited, /* Yahoo! Mail Override */ .rightColumnContent a .yshortcuts /* Yahoo! Mail Override */ { /*@editable*/                  color: #EB4102; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }                .leftColumnContent img, .rightColumnContent img {                  display: inline;                  height: auto;                  max-width: 260px;              }          /* ========== Footer Styles ========== */ /*** @tab Footer* @section footer style* @tip Set the background color and borders for your emails footer area.* @theme footer*/            #templateFooter { /*@editable*/              background-color: #FFFFFF; /*@editable*/              border-top: 1px solid #FFFFFF;          }          /*** @tab Footer* @section footer text* @tip Set the styling for your emails footer text. Choose a size and color that is easy to read.* @theme footer*/            .footerContent { /*@editable*/              color: #808080; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 10px; /*@editable*/              line-height: 150%;              padding-top: 20px;              padding-right: 20px;              padding-bottom: 20px;              padding-left: 20px; /*@editable*/              text-align: left;          }              /*** @tab Footer* @section footer link* @tip Set the styling for your emails footer links. Choose a color that helps them stand out from your text.*/                .footerContent a:link, .footerContent a:visited, /* Yahoo! Mail Override */ .footerContent a .yshortcuts, .footerContent a span /* Yahoo! Mail Override */ { /*@editable*/                  color: #606060; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }          /* /\/\/\/\/\/\/\/\/ MOBILE STYLES /\/\/\/\/\/\/\/\/ */            @media only screen and (max-width: 480px) { /* /\/\/\/\/\/\/ CLIENT-SPECIFIC MOBILE STYLES /\/\/\/\/\/\/ */                body, table, td, p, a, li, blockquote {                  -webkit-text-size-adjust: none !important;              }              /* Prevent Webkit platforms from changing default text sizes */                body {                  width: 100% !important;                  min-width: 100% !important;              }              /* Prevent iOS Mail from adding padding to the body */ /* /\/\/\/\/\/\/ MOBILE RESET STYLES /\/\/\/\/\/\/ */                #bodyCell {                  padding: 10px !important;              }              /* /\/\/\/\/\/\/ MOBILE TEMPLATE STYLES /\/\/\/\/\/\/ */ /* ======== Page Styles ======== */ /*** @tab Mobile Styles* @section template width* @tip Make the template fluid for portrait or landscape view adaptability. If a fluid layout doesnt work for you, set the width to 300px instead.*/                #templateContainer {                  max-width: 600px !important; /*@editable*/                  width: 100% !important;              }              /*** @tab Mobile Styles* @section heading 1* @tip Make the first-level headings larger in size for better readability on small screens.*/                h1 { /*@editable*/                  font-size: 24px !important; /*@editable*/                  line-height: 100% !important;              }              /*** @tab Mobile Styles* @section heading 2* @tip Make the second-level headings larger in size for better readability on small screens.*/                h2 { /*@editable*/                  font-size: 20px !important; /*@editable*/                  line-height: 100% !important;              }              /*** @tab Mobile Styles* @section heading 3* @tip Make the third-level headings larger in size for better readability on small screens.*/                h3 { /*@editable*/                  font-size: 18px !important; /*@editable*/                  line-height: 100% !important;              }              /*** @tab Mobile Styles* @section heading 4* @tip Make the fourth-level headings larger in size for better readability on small screens.*/                h4 { /*@editable*/                  font-size: 16px !important; /*@editable*/                  line-height: 100% !important;              }              /* ======== Header Styles ======== */                #templatePreheader {                  display: none !important;              }              /* Hide the template preheader to save space */ /*** @tab Mobile Styles* @section header image* @tip Make the main header image fluid for portrait or landscape view adaptability, and set the images original width as the max-width. If a fluid setting doesnt work, set the image width to half its original size instead.*/                #headerImage {                  height: auto !important; /*@editable*/                  max-width: 600px !important; /*@editable*/                  width: 100% !important;              }              /*** @tab Mobile Styles* @section header text* @tip Make the header content text larger in size for better readability on small screens. We recommend a font size of at least 16px.*/                .headerContent { /*@editable*/                  font-size: 20px !important; /*@editable*/                  line-height: 125% !important;              }              /* ======== Body Styles ======== */ /*** @tab Mobile Styles* @section body image* @tip Make the main body image fluid for portrait or landscape view adaptability, and set the images original width as the max-width. If a fluid setting doesnt work, set the image width to half its original size instead.*/                #bodyImage {                  height: auto !important; /*@editable*/                  max-width: 560px !important; /*@editable*/                  width: 100% !important;              }              /*** @tab Mobile Styles* @section body text* @tip Make the body content text larger in size for better readability on small screens. We recommend a font size of at least 16px.*/                .bodyContent { /*@editable*/                  font-size: 18px !important; /*@editable*/                  line-height: 125% !important;              }              /* ======== Column Styles ======== */                .templateColumnContainer {                  display: block !important;                  width: 100% !important;              }              /*** @tab Mobile Styles* @section column image* @tip Make the column image fluid for portrait or landscape view adaptability, and set the images original width as the max-width. If a fluid setting doesnt work, set the image width to half its original size instead.*/                .columnImage {                  height: auto !important; /*@editable*/                  max-width: 260px !important; /*@editable*/                  width: 100% !important;              }              /*** @tab Mobile Styles* @section left column text* @tip Make the left column content text larger in size for better readability on small screens. We recommend a font size of at least 16px.*/                .leftColumnContent { /*@editable*/                  font-size: 16px !important; /*@editable*/                  line-height: 125% !important;              }              /*** @tab Mobile Styles* @section right column text* @tip Make the right column content text larger in size for better readability on small screens. We recommend a font size of at least 16px.*/                .rightColumnContent { /*@editable*/                  font-size: 16px !important; /*@editable*/                  line-height: 125% !important;              }              /* ======== Footer Styles ======== */ /*** @tab Mobile Styles* @section footer text* @tip Make the body content text larger in size for better readability on small screens.*/                .footerContent { /*@editable*/                  font-size: 14px !important; /*@editable*/                  line-height: 115% !important;              }                    .footerContent a {                      display: block !important;                  }              /* Place footer social and utility links on their own lines, for easier access */          }      </style>
   </head>
   <body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" offset="0">
      <center>
         <table align="center" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%" id="bodyTable">
            <tr>
               <td align="center" valign="top" id="bodyCell">
                  <!-- BEGIN TEMPLATE // -->                      
                  <table border="0" cellpadding="0" cellspacing="0" id="templateContainer">
                     <tr>
                        <td align="center" valign="top">
                           <!-- BEGIN HEADER // -->                                  
                           <table border="0" cellpadding="0" cellspacing="0" width="100%" id="templateHeader">
                              <tr>
                                 <td valign="top" class="headerContent">                                              <img src="https://raw.githubusercontent.com/Azure/Commercial-Marketplace-SaaS-Accelerator/main/src/CustomerSite/wwwroot/contoso-sales.png" style="max-width: 300px; display: block; margin-left: auto; margin-right: auto; padding-top:10px;padding-bottom:10px;" id="headerImage" />                                          </td>
                              </tr>
                           </table>
                           <!-- // END HEADER -->                              
                        </td>
                     </tr>
                     <tr>
                        <td align="center" valign="top">
                           <!-- BEGIN BODY // -->                                  
                           <table border="0" cellpadding="0" cellspacing="0" width="100%" id="templateBody">
                              <tr>
                                 <td valign="top" class="bodyContent">
                                    <h1 style="display: block;  margin-left: auto;  margin-right: auto;  width: 75%;">Welcome to ${ApplicationName}!</h1>
                                                                        <p>${welcometext}</p>
                                                                          <table border="0" cellpadding="0" cellspacing="0" width="100%" id="templateBody">
                                                                          ${subscriptiondetails}   
                                                                                                              </table>
                                    <p style=" margin-left: auto; margin-right: auto; text-align:right;">                                                  <a href="https://saaskitdemoapp.azurewebsites.net/">                                                      <button style="background-color:#2168A6;line-height:30px;color:white"><b>View Details</b></button>                                                  </a>                                              </p>
                                    <!--     CTA button -->                                              <!--<table style="background: #0078D7;" cellspacing="0" cellpadding="0" align="left">                                                  <tbody>                                                      <tr>                                                          <td style="padding-left: 15px; font-size: 18px; line-height: 20px; font-family:"Segoe UI Light"; color: #ffffff;">                                                              <a style="text-decoration: none; font-size: 18px; line-height: 20px; font-family:"Segoe UI Light"; color: #ffffff;" href="${LinkToPortal}/#/login">${LoginButtonTextInEmail}</a>                                                          </td>                                                          <td style="line-height: 1px; font-size: 1px; padding: 10px;">                                                              <a>                                                                  <img src="https://info.microsoft.com/rs/157-GQE-382/images/Program-CTAButton-whiteltr.png" border="0" alt="" height="20" />                                                              </a>                                                          </td>                                                      </tr>                                                  </tbody>                                              </table>-->                                              <!--     end CTA button -->                                          
                                 </td>
                              </tr>
                     <tr>
                        <td align="center" valign="top">
                           <!-- BEGIN PREHEADER // -->                                  
                           <table border="0" cellpadding="0" cellspacing="0" width="100%" id="templatePreheader">
                              <tr>
                                 <td valign="top" class="preheaderContent" style="padding-top: 10px; padding-right: 20px; padding-bottom: 10px; padding-left: 20px;">                                              You are receiving this message because of an interaction with                                              <a href="https://saaskitdemoapp.azurewebsites.net/">Contoso</a>.                                              Please contact us at <a href="https://saaskitdemoapp.azurewebsites.net/">Contoso</a>                                              in case you think you have received this message in error or need help.                                          </td>
                                 <!-- *|IFNOT:ARCHIVE_PAGE|* -->                                                      <!-- *|END:IF|* -->                                      
                              </tr>
                           </table>
                           <!-- // END PREHEADER -->                              
                        </td>
                     </tr>
                  </table>
               </td>
            </tr>
         </table>
         <!-- // END BODY -->          </td>          </tr>          </table>           <!-- // END TEMPLATE -->      
      </center>
   </body>
</html>
', N'Subscribed', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[EmailTemplate] ([ID], [Status], [Description], [InsertDate], [TemplateBody], [Subject], [ToRecipients], [CC], [BCC], [IsActive]) VALUES (4, N'Unsubscribed', N'Unsubscribed', CAST(N'2025-01-20T00:00:00.000' AS DateTime), N'
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <!--<note>Use this Template for Pending Activation email </note>-->      
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <!--<title>Cloud Market Place - Your registration is successful</title>-->      
      <style type="text/css">          /* /\/\/\/\/\/\/\/\/ CLIENT-SPECIFIC STYLES /\/\/\/\/\/\/\/\/ */            #outlook a {              padding: 0;          }          /* Force Outlook to provide a view in browser message */            .ReadMsgBody {              width: 100%;          }            .ExternalClass {              width: 100%;          }              /* Force Hotmail to display emails at full width */                .ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div {                  line-height: 100%;              }          /* Force Hotmail to display normal line spacing */            body, table, td, p, a, li, blockquote {              -webkit-text-size-adjust: 100%;              -ms-text-size-adjust: 100%;          }          /* Prevent WebKit and Windows mobile changing default text sizes */            table, td {              mso-table-lspace: 0pt;              mso-table-rspace: 0pt;          }          /* Remove spacing between tables in Outlook 2007 and up */            img {              -ms-interpolation-mode: bicubic;          }          /* Allow smoother rendering of resized image in Internet Explorer */ /* /\/\/\/\/\/\/\/\/ RESET STYLES /\/\/\/\/\/\/\/\/ */            body {              margin: 0;              padding: 0;          }            img {              border: 0;              height: auto;              line-height: 100%;              outline: none;              text-decoration: none;          }            table {              border-collapse: collapse !important;          }            body, #bodyTable, #bodyCell {              height: 100% !important;              margin: 0;              padding: 0;              width: 100% !important;          }          /* /\/\/\/\/\/\/\/\/ TEMPLATE STYLES /\/\/\/\/\/\/\/\/ */ /* ========== Page Styles ========== */            #bodyCell {              padding: 20px;          }            #templateContainer {              width: 600px;          }          /*** @tab Page* @section background style* @tip Set the background color and top border for your email. You may want to choose colors that match your companys branding.* @theme page*/            body, #bodyTable { /*@editable*/              background-color: #FFFFFF;          }          /*** @tab Page* @section background style* @tip Set the background color and top border for your email. You may want to choose colors that match your companys branding.* @theme page*/            #bodyCell { /*@editable*/              border-top: 4px solid #FFFFFF;          }          /*** @tab Page* @section email border* @tip Set the border for your email.*/            #templateContainer { /*@editable*/              border: 1px solid #BBBBBB;          }          /*** @tab Page* @section heading 1* @tip Set the styling for all first-level headings in your emails. These should be the largest of your headings.* @style heading 1*/            h1 { /*@editable*/              color: #202020 !important;              display: block; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 26px; /*@editable*/              font-style: normal; /*@editable*/              font-weight: bold; /*@editable*/              line-height: 100%; /*@editable*/              letter-spacing: normal;              margin-top: 0;              margin-right: 0;              margin-bottom: 10px;              margin-left: 0; /*@editable*/              text-align: left;          }          /*** @tab Page* @section heading 2* @tip Set the styling for all second-level headings in your emails.* @style heading 2*/            h2 { /*@editable*/              color: #404040 !important;              display: block; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 20px; /*@editable*/              font-style: normal; /*@editable*/              font-weight: bold; /*@editable*/              line-height: 100%; /*@editable*/              letter-spacing: normal;              margin-top: 0;              margin-right: 0;              margin-bottom: 10px;              margin-left: 0; /*@editable*/              text-align: left;          }          /*** @tab Page* @section heading 3* @tip Set the styling for all third-level headings in your emails.* @style heading 3*/            h3 { /*@editable*/              color: #606060 !important;              display: block; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 16px; /*@editable*/              font-style: italic; /*@editable*/              font-weight: normal; /*@editable*/              line-height: 100%; /*@editable*/              letter-spacing: normal;              margin-top: 0;              margin-right: 0;              margin-bottom: 10px;              margin-left: 0; /*@editable*/              text-align: left;          }          /*** @tab Page* @section heading 4* @tip Set the styling for all fourth-level headings in your emails. These should be the smallest of your headings.* @style heading 4*/            h4 { /*@editable*/              color: #000000 !important;              display: block; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 14px; /*@editable*/              font-style: italic; /*@editable*/              font-weight: normal; /*@editable*/              line-height: 100%; /*@editable*/              letter-spacing: normal;              margin-top: 0;              margin-right: 0;              margin-bottom: 10px;              margin-left: 0; /*@editable*/              text-align: left;          }          /* ========== Header Styles ========== */ /*** @tab Header* @section preheader style* @tip Set the background color and bottom border for your emails preheader area.* @theme header*/            #templatePreheader { /*@editable*/              background-color: #FFFFFF; /*@editable*/              border-bottom: 1px solid #CCCCCC;          }          /*** @tab Header* @section preheader text* @tip Set the styling for your emails preheader text. Choose a size and color that is easy to read.*/            .preheaderContent { /*@editable*/              color: #000000; /*@editable*/              font-family: wf_segoe-ui_normal, "Segoe UI", "Segoe WP", Tahoma, Arial, sans-serif; /*@editable*/              font-size: 10px; /*@editable*/              line-height: 125%; /*@editable*/              text-align: left;          }              /*** @tab Header* @section preheader link* @tip Set the styling for your emails preheader links. Choose a color that helps them stand out from your text.*/                .preheaderContent a:link, .preheaderContent a:visited, /* Yahoo! Mail Override */ .preheaderContent a .yshortcuts /* Yahoo! Mail Override */ { /*@editable*/                  color: #606060; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }          /*** @tab Header* @section header style* @tip Set the background color and borders for your emails header area.* @theme header*/            #templateHeader { /*@editable*/              background-color: #FFFFFF; /*@editable*/              border-top: 1px solid #FFFFFF; /*@editable*/              border-bottom: 1px solid #CCCCCC;          }          /*** @tab Header* @section header text* @tip Set the styling for your emails header text. Choose a size and color that is easy to read.*/            .headerContent { /*@editable*/              color: #505050; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 20px; /*@editable*/              font-weight: bold; /*@editable*/              line-height: 100%; /*@editable*/              padding-top: 0; /*@editable*/              padding-right: 0; /*@editable*/              padding-bottom: 0; /*@editable*/              padding-left: 0; /*@editable*/              text-align: left; /*@editable*/              vertical-align: middle;          }              /*** @tab Header* @section header link* @tip Set the styling for your emails header links. Choose a color that helps them stand out from your text.*/                .headerContent a:link, .headerContent a:visited, /* Yahoo! Mail Override */ .headerContent a .yshortcuts /* Yahoo! Mail Override */ { /*@editable*/                  color: #EB4102; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }            #headerImage {              height: auto;              max-width: 600px;          }          /* ========== Body Styles ========== */ /*** @tab Body* @section body style* @tip Set the background color and borders for your emails body area.*/            #templateBody { /*@editable*/              background-color: #FFFFFF; /*@editable*/              border-top: 1px solid #FFFFFF; /*@editable*/              border-bottom: 1px solid #CCCCCC;          }          /*** @tab Body* @section body text* @tip Set the styling for your emails main content text. Choose a size and color that is easy to read.* @theme main*/            .bodyContent { /*@editable*/              color: #505050; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 16px; /*@editable*/              line-height: 150%;              padding-top: 20px;              padding-right: 20px;              padding-bottom: 20px;              padding-left: 20px; /*@editable*/              text-align: left;          }              /*** @tab Body* @section body link* @tip Set the styling for your emails main content links. Choose a color that helps them stand out from your text.*/                .bodyContent a:link, .bodyContent a:visited, /* Yahoo! Mail Override */ .bodyContent a .yshortcuts /* Yahoo! Mail Override */ { /*@editable*/                  color: #EB4102; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }                .bodyContent img {                  display: inline;                  height: auto;                  max-width: 560px;              }          /* ========== Column Styles ========== */            .templateColumnContainer {              display: inline;              width: 260px;          }          /*** @tab Columns* @section column style* @tip Set the background color and borders for your emails column area.*/            #templateColumns { /*@editable*/              background-color: #FFFFFF; /*@editable*/              border-top: 1px solid #FFFFFF; /*@editable*/              border-bottom: 1px solid #CCCCCC;          }          /*** @tab Columns* @section left column text* @tip Set the styling for your emails left column content text. Choose a size and color that is easy to read.*/            .leftColumnContent { /*@editable*/              color: #505050; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 14px; /*@editable*/              line-height: 150%;              padding-top: 0;              padding-right: 0;              padding-bottom: 20px;              padding-left: 0; /*@editable*/              text-align: left;          }              /*** @tab Columns* @section left column link* @tip Set the styling for your emails left column content links. Choose a color that helps them stand out from your text.*/                .leftColumnContent a:link, .leftColumnContent a:visited, /* Yahoo! Mail Override */ .leftColumnContent a .yshortcuts /* Yahoo! Mail Override */ { /*@editable*/                  color: #EB4102; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }          /*** @tab Columns* @section right column text* @tip Set the styling for your emails right column content text. Choose a size and color that is easy to read.*/            .rightColumnContent { /*@editable*/              color: #505050; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 14px; /*@editable*/              line-height: 150%;              padding-top: 0;              padding-right: 0;              padding-bottom: 20px;              padding-left: 0; /*@editable*/              text-align: left;          }              /*** @tab Columns* @section right column link* @tip Set the styling for your emails right column content links. Choose a color that helps them stand out from your text.*/                .rightColumnContent a:link, .rightColumnContent a:visited, /* Yahoo! Mail Override */ .rightColumnContent a .yshortcuts /* Yahoo! Mail Override */ { /*@editable*/                  color: #EB4102; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }                .leftColumnContent img, .rightColumnContent img {                  display: inline;                  height: auto;                  max-width: 260px;              }          /* ========== Footer Styles ========== */ /*** @tab Footer* @section footer style* @tip Set the background color and borders for your emails footer area.* @theme footer*/            #templateFooter { /*@editable*/              background-color: #FFFFFF; /*@editable*/              border-top: 1px solid #FFFFFF;          }          /*** @tab Footer* @section footer text* @tip Set the styling for your emails footer text. Choose a size and color that is easy to read.* @theme footer*/            .footerContent { /*@editable*/              color: #808080; /*@editable*/              font-family: "Segoe UI", Tahoma,Sans-serif; /*@editable*/              font-size: 10px; /*@editable*/              line-height: 150%;              padding-top: 20px;              padding-right: 20px;              padding-bottom: 20px;              padding-left: 20px; /*@editable*/              text-align: left;          }              /*** @tab Footer* @section footer link* @tip Set the styling for your emails footer links. Choose a color that helps them stand out from your text.*/                .footerContent a:link, .footerContent a:visited, /* Yahoo! Mail Override */ .footerContent a .yshortcuts, .footerContent a span /* Yahoo! Mail Override */ { /*@editable*/                  color: #606060; /*@editable*/                  font-weight: normal; /*@editable*/                  text-decoration: underline;              }          /* /\/\/\/\/\/\/\/\/ MOBILE STYLES /\/\/\/\/\/\/\/\/ */            @media only screen and (max-width: 480px) { /* /\/\/\/\/\/\/ CLIENT-SPECIFIC MOBILE STYLES /\/\/\/\/\/\/ */                body, table, td, p, a, li, blockquote {                  -webkit-text-size-adjust: none !important;              }              /* Prevent Webkit platforms from changing default text sizes */                body {                  width: 100% !important;                  min-width: 100% !important;              }              /* Prevent iOS Mail from adding padding to the body */ /* /\/\/\/\/\/\/ MOBILE RESET STYLES /\/\/\/\/\/\/ */                #bodyCell {                  padding: 10px !important;              }              /* /\/\/\/\/\/\/ MOBILE TEMPLATE STYLES /\/\/\/\/\/\/ */ /* ======== Page Styles ======== */ /*** @tab Mobile Styles* @section template width* @tip Make the template fluid for portrait or landscape view adaptability. If a fluid layout doesnt work for you, set the width to 300px instead.*/                #templateContainer {                  max-width: 600px !important; /*@editable*/                  width: 100% !important;              }              /*** @tab Mobile Styles* @section heading 1* @tip Make the first-level headings larger in size for better readability on small screens.*/                h1 { /*@editable*/                  font-size: 24px !important; /*@editable*/                  line-height: 100% !important;              }              /*** @tab Mobile Styles* @section heading 2* @tip Make the second-level headings larger in size for better readability on small screens.*/                h2 { /*@editable*/                  font-size: 20px !important; /*@editable*/                  line-height: 100% !important;              }              /*** @tab Mobile Styles* @section heading 3* @tip Make the third-level headings larger in size for better readability on small screens.*/                h3 { /*@editable*/                  font-size: 18px !important; /*@editable*/                  line-height: 100% !important;              }              /*** @tab Mobile Styles* @section heading 4* @tip Make the fourth-level headings larger in size for better readability on small screens.*/                h4 { /*@editable*/                  font-size: 16px !important; /*@editable*/                  line-height: 100% !important;              }              /* ======== Header Styles ======== */                #templatePreheader {                  display: none !important;              }              /* Hide the template preheader to save space */ /*** @tab Mobile Styles* @section header image* @tip Make the main header image fluid for portrait or landscape view adaptability, and set the images original width as the max-width. If a fluid setting doesnt work, set the image width to half its original size instead.*/                #headerImage {                  height: auto !important; /*@editable*/                  max-width: 600px !important; /*@editable*/                  width: 100% !important;              }              /*** @tab Mobile Styles* @section header text* @tip Make the header content text larger in size for better readability on small screens. We recommend a font size of at least 16px.*/                .headerContent { /*@editable*/                  font-size: 20px !important; /*@editable*/                  line-height: 125% !important;              }              /* ======== Body Styles ======== */ /*** @tab Mobile Styles* @section body image* @tip Make the main body image fluid for portrait or landscape view adaptability, and set the images original width as the max-width. If a fluid setting doesnt work, set the image width to half its original size instead.*/                #bodyImage {                  height: auto !important; /*@editable*/                  max-width: 560px !important; /*@editable*/                  width: 100% !important;              }              /*** @tab Mobile Styles* @section body text* @tip Make the body content text larger in size for better readability on small screens. We recommend a font size of at least 16px.*/                .bodyContent { /*@editable*/                  font-size: 18px !important; /*@editable*/                  line-height: 125% !important;              }              /* ======== Column Styles ======== */                .templateColumnContainer {                  display: block !important;                  width: 100% !important;              }              /*** @tab Mobile Styles* @section column image* @tip Make the column image fluid for portrait or landscape view adaptability, and set the images original width as the max-width. If a fluid setting doesnt work, set the image width to half its original size instead.*/                .columnImage {                  height: auto !important; /*@editable*/                  max-width: 260px !important; /*@editable*/                  width: 100% !important;              }              /*** @tab Mobile Styles* @section left column text* @tip Make the left column content text larger in size for better readability on small screens. We recommend a font size of at least 16px.*/                .leftColumnContent { /*@editable*/                  font-size: 16px !important; /*@editable*/                  line-height: 125% !important;              }              /*** @tab Mobile Styles* @section right column text* @tip Make the right column content text larger in size for better readability on small screens. We recommend a font size of at least 16px.*/                .rightColumnContent { /*@editable*/                  font-size: 16px !important; /*@editable*/                  line-height: 125% !important;              }              /* ======== Footer Styles ======== */ /*** @tab Mobile Styles* @section footer text* @tip Make the body content text larger in size for better readability on small screens.*/                .footerContent { /*@editable*/                  font-size: 14px !important; /*@editable*/                  line-height: 115% !important;              }                    .footerContent a {                      display: block !important;                  }              /* Place footer social and utility links on their own lines, for easier access */          }      </style>
   </head>
   <body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" offset="0">
      <center>
         <table align="center" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%" id="bodyTable">
            <tr>
               <td align="center" valign="top" id="bodyCell">
                  <!-- BEGIN TEMPLATE // -->                      
                  <table border="0" cellpadding="0" cellspacing="0" id="templateContainer">
                     <tr>
                        <td align="center" valign="top">
                           <!-- BEGIN HEADER // -->                                  
                           <table border="0" cellpadding="0" cellspacing="0" width="100%" id="templateHeader">
                              <tr>
                                 <td valign="top" class="headerContent">                                              <img src="https://raw.githubusercontent.com/Azure/Commercial-Marketplace-SaaS-Accelerator/main/src/CustomerSite/wwwroot/contoso-sales.png" style="max-width: 300px; display: block; margin-left: auto; margin-right: auto; padding-top:10px;padding-bottom:10px;" id="headerImage" />                                          </td>
                              </tr>
                           </table>
                           <!-- // END HEADER -->                              
                        </td>
                     </tr>
                     <tr>
                        <td align="center" valign="top">
                           <!-- BEGIN BODY // -->                                  
                           <table border="0" cellpadding="0" cellspacing="0" width="100%" id="templateBody">
                              <tr>
                                 <td valign="top" class="bodyContent">
                                    <h1 style="display: block;  margin-left: auto;  margin-right: auto;  width: 75%;">Welcome to ${ApplicationName}!</h1>
                                                                        <p>${welcometext}</p>
                                                                          <table border="0" cellpadding="0" cellspacing="0" width="100%" id="templateBody">
                                                                          ${subscriptiondetails}   
                                                                                                              </table>
                                    <p style=" margin-left: auto; margin-right: auto; text-align:right;">                                                  <a href="https://saaskitdemoapp.azurewebsites.net/">                                                      <button style="background-color:#2168A6;line-height:30px;color:white"><b>View Details</b></button>                                                  </a>                                              </p>
                                    <!--     CTA button -->                                              <!--<table style="background: #0078D7;" cellspacing="0" cellpadding="0" align="left">                                                  <tbody>                                                      <tr>                                                          <td style="padding-left: 15px; font-size: 18px; line-height: 20px; font-family:"Segoe UI Light"; color: #ffffff;">                                                              <a style="text-decoration: none; font-size: 18px; line-height: 20px; font-family:"Segoe UI Light"; color: #ffffff;" href="${LinkToPortal}/#/login">${LoginButtonTextInEmail}</a>                                                          </td>                                                          <td style="line-height: 1px; font-size: 1px; padding: 10px;">                                                              <a>                                                                  <img src="https://info.microsoft.com/rs/157-GQE-382/images/Program-CTAButton-whiteltr.png" border="0" alt="" height="20" />                                                              </a>                                                          </td>                                                      </tr>                                                  </tbody>                                              </table>-->                                              <!--     end CTA button -->                                          
                                 </td>
                              </tr>
                     <tr>
                        <td align="center" valign="top">
                           <!-- BEGIN PREHEADER // -->                                  
                           <table border="0" cellpadding="0" cellspacing="0" width="100%" id="templatePreheader">
                              <tr>
                                 <td valign="top" class="preheaderContent" style="padding-top: 10px; padding-right: 20px; padding-bottom: 10px; padding-left: 20px;">                                              You are receiving this message because of an interaction with                                              <a href="https://saaskitdemoapp.azurewebsites.net/">Contoso</a>.                                              Please contact us at <a href="https://saaskitdemoapp.azurewebsites.net/">Contoso</a>                                              in case you think you have received this message in error or need help.                                          </td>
                                 <!-- *|IFNOT:ARCHIVE_PAGE|* -->                                                      <!-- *|END:IF|* -->                                      
                              </tr>
                           </table>
                           <!-- // END PREHEADER -->                              
                        </td>
                     </tr>
                  </table>
               </td>
            </tr>
         </table>
         <!-- // END BODY -->          </td>          </tr>          </table>           <!-- // END TEMPLATE -->      
      </center>
   </body>
</html>
', N'Unsubscribed', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[EmailTemplate] ([ID], [Status], [Description], [InsertDate], [TemplateBody], [Subject], [ToRecipients], [CC], [BCC], [IsActive]) VALUES (5, N'Accepted', N'Accepted', CAST(N'2025-01-20T15:24:32.757' AS DateTime), N'<html> <head> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/> </head> <body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" offset="0"> <center> <table align="center" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%" id="bodyTable"> <tr><td align="center" valign="top" id="bodyCell"><!-- BEGIN TEMPLATE // --><table border="0" cellpadding="0" cellspacing="0" id="templateContainer"><tr><td align="center" valign="top"><!-- BEGIN BODY // --><table border="0" cellpadding="0" cellspacing="0" width="100%" id="templateBody"><tr><td valign="top" class="bodyContent"><h2>Subscription ****SubscriptionName****</h2><br><p>The Scheduled Task ****SchedulerTaskName**** was fired <b>Successfully</b></p><p>The following section is the deatil results.</p><hr/><table border="0" cellpadding="0" cellspacing="0" width="100%" id="templateBody">****ResponseJson**** </table></td></tr></table></td></tr></table><!-- // END BODY --></td></tr> </table> <!-- // END TEMPLATE --> </center> </body> </html>', N'Scheduled SaaS Metered Usage Submitted Successfully!', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[EmailTemplate] ([ID], [Status], [Description], [InsertDate], [TemplateBody], [Subject], [ToRecipients], [CC], [BCC], [IsActive]) VALUES (6, N'Failure', N'Failure', CAST(N'2025-01-20T15:24:32.757' AS DateTime), N'<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head><body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" offset="0"><center><table align="center" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%" id="bodyTable"><tr><td align="center" valign="top" id="bodyCell"><!-- BEGIN TEMPLATE // --><table border="0" cellpadding="0" cellspacing="0" id="templateContainer"> 	<tr><td align="center" valign="top"><!-- BEGIN BODY // -->	<table border="0" cellpadding="0" cellspacing="0" width="100%" id="templateBody"><tr>	<td valign="top" class="bodyContent"><h2 >Subscription ****SubscriptionName****</h2><br><p>The Scheduled Task ****SchedulerTaskName**** was fired<b> but Failed to Submit Data</b></p><br>Please try again or contact technical support to troubleshoot the issue.<p>The following section is the deatil results.</p><hr/><table border="0" cellpadding="0" cellspacing="0" width="100%" id="templateBody">****ResponseJson****</table></td></tr></table></td>	</tr></table><!-- // END BODY --></td></tr></table><!-- // END TEMPLATE --></center></body> </html>', N'Scheduled SaaS Metered Usage Failure!', NULL, NULL, NULL, 1)
GO
INSERT [dbo].[EmailTemplate] ([ID], [Status], [Description], [InsertDate], [TemplateBody], [Subject], [ToRecipients], [CC], [BCC], [IsActive]) VALUES (7, N'Missing', N'Missing', CAST(N'2025-01-20T15:24:32.757' AS DateTime), N'<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head><body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" offset="0"><center><table align="center" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%" id="bodyTable"><tr><td align="center" valign="top" id="bodyCell"><!-- BEGIN TEMPLATE // --><table border="0" cellpadding="0" cellspacing="0" id="templateContainer"> 	<tr><td align="center" valign="top"><!-- BEGIN BODY // -->	<table border="0" cellpadding="0" cellspacing="0" width="100%" id="templateBody"><tr>	<td valign="top" class="bodyContent"><h2 >Subscription ****SubscriptionName****</h2><br><p>The Scheduled Task ****SchedulerTaskName**** was skipped by scheduler engine!</b></p><br>Please try again or contact technical support to troubleshoot the issue.<p>The following section is the deatil results.</p><hr/><table border="0" cellpadding="0" cellspacing="0" width="100%" id="templateBody">****ResponseJson****</table></td></tr></table></td>	</tr></table><!-- // END BODY --></td></tr></table><!-- // END TEMPLATE --></center></body> </html>', N'Scheduled SaaS Metered Task was Skipped!', NULL, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[EmailTemplate] OFF
GO
SET IDENTITY_INSERT [dbo].[Events] ON 
GO
INSERT [dbo].[Events] ([EventsId], [EventsName], [IsActive], [CreateDate]) VALUES (1, N'Activate', 1, CAST(N'2025-01-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Events] ([EventsId], [EventsName], [IsActive], [CreateDate]) VALUES (2, N'Unsubscribe', 1, CAST(N'2025-01-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Events] ([EventsId], [EventsName], [IsActive], [CreateDate]) VALUES (3, N'Pending Activation', 1, CAST(N'2025-01-20T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Events] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'PublisherAdmin')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[SchedulerFrequency] ON 
GO
INSERT [dbo].[SchedulerFrequency] ([Id], [Frequency]) VALUES (1, N'Hourly')
GO
INSERT [dbo].[SchedulerFrequency] ([Id], [Frequency]) VALUES (2, N'Daily')
GO
INSERT [dbo].[SchedulerFrequency] ([Id], [Frequency]) VALUES (3, N'Weekly')
GO
INSERT [dbo].[SchedulerFrequency] ([Id], [Frequency]) VALUES (4, N'Monthly')
GO
INSERT [dbo].[SchedulerFrequency] ([Id], [Frequency]) VALUES (5, N'Yearly')
GO
INSERT [dbo].[SchedulerFrequency] ([Id], [Frequency]) VALUES (6, N'OneTime')
GO
SET IDENTITY_INSERT [dbo].[SchedulerFrequency] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserId], [EmailAddress], [CreatedDate], [FullName]) VALUES (1, N'prasad.jachak@convertool.com', CAST(N'2025-01-20T16:19:54.423' AS DateTime), N'Prasad Jachak')
GO
INSERT [dbo].[Users] ([UserId], [EmailAddress], [CreatedDate], [FullName]) VALUES (2, N'test@kbhuvanacyberindigo.onmicrosoft.com', CAST(N'2025-01-21T13:49:37.843' AS DateTime), N'test')
GO
INSERT [dbo].[Users] ([UserId], [EmailAddress], [CreatedDate], [FullName]) VALUES (3, N'prasadjachak@hotmail.com', CAST(N'2025-01-23T17:58:42.107' AS DateTime), N'prasad jachak')
GO
INSERT [dbo].[Users] ([UserId], [EmailAddress], [CreatedDate], [FullName]) VALUES (4, N'testuser@maventra.in', CAST(N'2025-02-04T14:25:50.170' AS DateTime), N'tesuser')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[ValueTypes] ON 
GO
INSERT [dbo].[ValueTypes] ([ValueTypeId], [ValueType], [CreateDate], [HTMLType]) VALUES (1, N'Int', CAST(N'2025-01-20T00:00:00.000' AS DateTime), N'int')
GO
INSERT [dbo].[ValueTypes] ([ValueTypeId], [ValueType], [CreateDate], [HTMLType]) VALUES (2, N'String', CAST(N'2025-01-20T00:00:00.000' AS DateTime), N'string')
GO
INSERT [dbo].[ValueTypes] ([ValueTypeId], [ValueType], [CreateDate], [HTMLType]) VALUES (3, N'Date', CAST(N'2025-01-20T00:00:00.000' AS DateTime), N'date')
GO
SET IDENTITY_INSERT [dbo].[ValueTypes] OFF
GO
/****** Object:  Index [IX_KnownUsers_RoleId]    Script Date: 11-02-2025 12:46:42 ******/
CREATE NONCLUSTERED INDEX [IX_KnownUsers_RoleId] ON [dbo].[KnownUsers]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MeteredAuditLogs_SubscriptionId]    Script Date: 11-02-2025 12:46:42 ******/
CREATE NONCLUSTERED INDEX [IX_MeteredAuditLogs_SubscriptionId] ON [dbo].[MeteredAuditLogs]
(
	[SubscriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MeteredDimensions_PlanId]    Script Date: 11-02-2025 12:46:42 ******/
CREATE NONCLUSTERED INDEX [IX_MeteredDimensions_PlanId] ON [dbo].[MeteredDimensions]
(
	[PlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MeteredPlanSchedulerManagement_DimensionId]    Script Date: 11-02-2025 12:46:42 ******/
CREATE NONCLUSTERED INDEX [IX_MeteredPlanSchedulerManagement_DimensionId] ON [dbo].[MeteredPlanSchedulerManagement]
(
	[DimensionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MeteredPlanSchedulerManagement_FrequencyId]    Script Date: 11-02-2025 12:46:42 ******/
CREATE NONCLUSTERED INDEX [IX_MeteredPlanSchedulerManagement_FrequencyId] ON [dbo].[MeteredPlanSchedulerManagement]
(
	[FrequencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MeteredPlanSchedulerManagement_PlanId]    Script Date: 11-02-2025 12:46:42 ******/
CREATE NONCLUSTERED INDEX [IX_MeteredPlanSchedulerManagement_PlanId] ON [dbo].[MeteredPlanSchedulerManagement]
(
	[PlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MeteredPlanSchedulerManagement_SubscriptionId]    Script Date: 11-02-2025 12:46:42 ******/
CREATE NONCLUSTERED INDEX [IX_MeteredPlanSchedulerManagement_SubscriptionId] ON [dbo].[MeteredPlanSchedulerManagement]
(
	[SubscriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubscriptionAuditLogs_SubscriptionID]    Script Date: 11-02-2025 12:46:42 ******/
CREATE NONCLUSTERED INDEX [IX_SubscriptionAuditLogs_SubscriptionID] ON [dbo].[SubscriptionAuditLogs]
(
	[SubscriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Subscriptions_UserId]    Script Date: 11-02-2025 12:46:42 ******/
CREATE NONCLUSTERED INDEX [IX_Subscriptions_UserId] ON [dbo].[Subscriptions]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Subscriptions] ADD  DEFAULT (newid()) FOR [AMPSubscriptionId]
GO
ALTER TABLE [dbo].[KnownUsers]  WITH CHECK ADD  CONSTRAINT [FK__KnownUser__RoleI__619B8048] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[KnownUsers] CHECK CONSTRAINT [FK__KnownUser__RoleI__619B8048]
GO
ALTER TABLE [dbo].[MeteredAuditLogs]  WITH CHECK ADD  CONSTRAINT [FK__MeteredAu__Subsc__628FA481] FOREIGN KEY([SubscriptionId])
REFERENCES [dbo].[Subscriptions] ([Id])
GO
ALTER TABLE [dbo].[MeteredAuditLogs] CHECK CONSTRAINT [FK__MeteredAu__Subsc__628FA481]
GO
ALTER TABLE [dbo].[MeteredDimensions]  WITH CHECK ADD  CONSTRAINT [FK__MeteredDi__PlanI__6383C8BA] FOREIGN KEY([PlanId])
REFERENCES [dbo].[Plans] ([Id])
GO
ALTER TABLE [dbo].[MeteredDimensions] CHECK CONSTRAINT [FK__MeteredDi__PlanI__6383C8BA]
GO
ALTER TABLE [dbo].[MeteredPlanSchedulerManagement]  WITH CHECK ADD  CONSTRAINT [FK_MeteredPlanSchedulerManagement_MeteredDimensions_DimensionId] FOREIGN KEY([DimensionId])
REFERENCES [dbo].[MeteredDimensions] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MeteredPlanSchedulerManagement] CHECK CONSTRAINT [FK_MeteredPlanSchedulerManagement_MeteredDimensions_DimensionId]
GO
ALTER TABLE [dbo].[MeteredPlanSchedulerManagement]  WITH CHECK ADD  CONSTRAINT [FK_MeteredPlanSchedulerManagement_Plans_PlanId] FOREIGN KEY([PlanId])
REFERENCES [dbo].[Plans] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MeteredPlanSchedulerManagement] CHECK CONSTRAINT [FK_MeteredPlanSchedulerManagement_Plans_PlanId]
GO
ALTER TABLE [dbo].[MeteredPlanSchedulerManagement]  WITH CHECK ADD  CONSTRAINT [FK_MeteredPlanSchedulerManagement_SchedulerFrequency_FrequencyId] FOREIGN KEY([FrequencyId])
REFERENCES [dbo].[SchedulerFrequency] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MeteredPlanSchedulerManagement] CHECK CONSTRAINT [FK_MeteredPlanSchedulerManagement_SchedulerFrequency_FrequencyId]
GO
ALTER TABLE [dbo].[MeteredPlanSchedulerManagement]  WITH CHECK ADD  CONSTRAINT [FK_MeteredPlanSchedulerManagement_Subscriptions_SubscriptionId] FOREIGN KEY([SubscriptionId])
REFERENCES [dbo].[Subscriptions] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MeteredPlanSchedulerManagement] CHECK CONSTRAINT [FK_MeteredPlanSchedulerManagement_Subscriptions_SubscriptionId]
GO
ALTER TABLE [dbo].[SubscriptionAuditLogs]  WITH CHECK ADD  CONSTRAINT [FK__Subscript__Subsc__6477ECF3] FOREIGN KEY([SubscriptionID])
REFERENCES [dbo].[Subscriptions] ([Id])
GO
ALTER TABLE [dbo].[SubscriptionAuditLogs] CHECK CONSTRAINT [FK__Subscript__Subsc__6477ECF3]
GO
ALTER TABLE [dbo].[Subscriptions]  WITH CHECK ADD  CONSTRAINT [FK__Subscript__UserI__656C112C] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK__Subscript__UserI__656C112C]
GO
/****** Object:  StoredProcedure [dbo].[spGetFormattedEmailBody]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    Create Procedure [dbo].[spGetFormattedEmailBody]  
    (  
    @subscriptionId varchar(225),  
    @processStatus varchar(225)   
    )  
  
    /*  
    EXEC spGetFormattedEmailBody '86C334EC-5973-D337-7B2B-0D676513B0F9','success'
    */  
  
    AS  
    BEGIN  
    declare @html varchar(max)   
  
    DECLARE   
      @planId varchar(225)  
    , @planGUId varchar(225)  
    , @planName varchar(225)  
    , @offerId varchar(225)  
    , @offerGUId varchar(225)  
    , @subscriptionStatus varchar(225)  
    , @subscriptionName varchar(225)  
    , @offerName varchar(225)  
    , @customerName  varchar(225)  
    , @customerEmailAddress  varchar(225)  
    , @purchaserEmial  varchar(225)  
    , @purchaserTenant  varchar(225)  
    , @UserId int  
  
    Declare @applicationName Varchar(225) =(select [value] from [ApplicationConfiguration] where [Name]='ApplicationName')  
    Declare @welcomeText varchar(MAX)=''  
  
  
    IF EXISTS (SELECT 1 FROM SUBSCRIPTIONS WHERE AMPSubscriptionId=@subscriptionId)  
    BEGIN  
     select  @planId =AMPPLanId,  
     @subscriptionStatus =subscriptionstatus,  
     @subscriptionName= [Name],  
     @purchaserEmial=PurchaserEmail,  
     @purchaserTenant=PurchaserTenantId,  
     @UserId = UserId  
     FROM SUBSCRIPTIONS WHERE AMPSubscriptionId=@subscriptionId  
   
      select   
     @customerName =FullName,  
     @customerEmailAddress= EmailAddress  
     FROM USERS WHERE USERID=@UserId  
  
  
     IF EXISTS (SELECT 1 FROM PLANS WHERE PLANID=@planId)  
     BEGIN  
      SELECT @offerGUId = OFFERID,  
        @planName= DISPLAYNAME,  
        @planGUId=PlanGUID  
       FROM PLANS WHERE  PLANID=@planId  
    
      IF EXISTS (SELECT 1 FROM OFFERS WHERE OFFERGUID=@offerGUId)  
      BEGIN  
       Select @offerId = OFFERID ,  
         @offerName=OFFERNAME   
       FROM OFFERS WHERE  OFFERGUID=@offerGUId  
      END  
     END  
    END  
  
    Create Table #Temp(HtmlLabel varchar(max), HtmlValue varchar(max))  
    Insert into #Temp  
  
    select 'Customer Email Address',@customerEmailAddress   UNION ALL  
    select 'Customer Name',@customerName       UNION ALL  
    select 'SaaS Subscription Id',@subscriptionId     UNION ALL  
    select 'SaaS Subscription Name',@subscriptionName    UNION ALL  
    select 'SaaS Subscription Status',@subscriptionStatus   UNION ALL  
    select 'Plan',@planName           UNION ALL  
    select 'Purchaser Email Address',@customerEmailAddress   UNION ALL  
    select 'Purchaser Tenant',@purchaserTenant      UNION ALL     
    -- Parameters  
    select   
    ISNULL(OA.DisplayName,'') DisplayName, ISNULL(Value,'')Value      
    from      [dbo].[OfferAttributes] OA      
    Inner  join       
    [dbo].[PlanAttributeMapping]  PA      
    on OA.ID= PA.OfferAttributeID and OA.OfferId=@OfferguId      
    and  PA.PlanId=@PlanguId      
    INNER Join  SubscriptionAttributeValues SAV      
    on SAV.PlanAttributeId= PA.PlanAttributeId      
    and SAV.SubscriptionId=@SubscriptionId      
    where OA.Isactive=1   and PA.IsEnabled=1    
  
  
    -- Cursor Begin  
    Declare @subscriptionContent VARCHAR(MAX)=''  
  
    DECLARE   
        @htmlLabel VARCHAR(MAX),   
        @htmlValue   VARCHAR(MAX)  
  
    DECLARE cursor_html CURSOR  
    FOR SELECT   
            htmlLabel,   
            HtmlValue  
        FROM   
            #Temp  
  
    OPEN cursor_html;  
  
    FETCH NEXT FROM cursor_html INTO   
        @htmlLabel,   
        @htmlValue;  
  
    WHILE @@FETCH_STATUS = 0  
        BEGIN  
         
        set @subscriptionContent = @subscriptionContent + '<tr><td><b>'+ @htmlLabel+'</b></td> <td>' + @htmlValue + '</td> </tr>'  
  
            FETCH NEXT FROM cursor_html INTO   
                @htmlLabel,   
        @htmlValue;  
        END;  
  
    CLOSE cursor_html;  
  
    DEALLOCATE cursor_html;  
  
    -- Cursor End  
  
    -- Welcome text  
  
    IF (@processStatus ='failure')  
     BEGIN  
      set @welcomeText= 'Your request for the subscription has been failed.'  
      set @html = (SELECT TemplateBody FROM EmailTemplate WHERE Status = 'Failed')
     END  
  
    IF (@processStatus ='success')   
     BEGIN  
     IF (@subscriptionStatus= 'PendingActivation')  
        BEGIN  
      set @welcomeText= 'A request for purchase with the following details is awaiting your action for activation.'  
       END  
     IF (@subscriptionStatus= 'Subscribed')  
        BEGIN  
      set @welcomeText= 'Your request for the purchase has been approved.'  
       END  
     IF (@subscriptionStatus= 'Unsubscribed')  
        BEGIN  
      set @welcomeText= 'A subscription with the following details was deleted from Azure.'  
       END   
         set @html = (SELECT TemplateBody FROM EmailTemplate WHERE Status = @subscriptionStatus)
    END  
 
     select  @html=REPLACE(@html,'${subscriptiondetails}',@subscriptionContent)  
      ,@html=REPLACE(@html,'${welcometext}',@welcomeText)  
      ,@html=REPLACE(@html,'${ApplicationName}',@applicationName)  
   
  
     select 1 AS ID,'Email' AS [Name], @html as [Value]  
  
  
    /* test values  
     --select @subscriptionContent  
     -- select * from #Temp  
  
    SELECT   
      @subscriptionId    as 'subscriptionId'  
    , @processStatus    as 'processStatus'  
    , @planId       as 'planId'  
    , @offerId       as 'offerId'  
    , @offerGUId      as 'offerGUId'  
    , @subscriptionStatus    as 'subscriptionStatus'  
    , @subscriptionName    as 'subscriptionName'  
    , @planName      as 'planName'  
    , @offerName      as 'offerName'  
    , @customerName      as 'customerName'  
    , @customerEmailAddress   as 'customerEmailAddress'  
    , @purchaserEmial      as 'purchaserEmial'  
    , @purchaserTenant     as 'purchaserTenant'  
    , @UserId       as 'UserId'  
    , @applicationName    as 'applicationName'  
    , @welcomeText     as 'welcomeText'  
    , @tablehtml     as 'tablehtml'  
    */  
  
    End
GO
/****** Object:  StoredProcedure [dbo].[spGetOfferParameters]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[spGetOfferParameters]  
(  
@PlanId Uniqueidentifier  
)  
AS  
BEGIN  
   
Declare @OfferId Uniqueidentifier   
Set @OfferId=(Select OfferId from Plans where PlanGuId =@PlanId )  
SELECT    
  Cast( ROW_NUMBER() OVER ( ORDER BY OA.ID) as Int)RowNumber  
,isnull(PA.PlanAttributeId,0) PlanAttributeId  
,ISNULL(PA.PlanId,@PlanId) PlanId   
,ISNULL(PA.OfferAttributeID ,OA.ID)  OfferAttributeID  
  
,OA.DisplayName  
--,OA.DisplaySequence  
,isnull(PA.IsEnabled,0) IsEnabled  
,OA.Type
from [dbo].[OfferAttributes] OA  
left  join   
[dbo].[PlanAttributeMapping]  PA  
on OA.ID= PA.OfferAttributeID and OA.OfferId=@OfferId  
and  PA.PlanId=@PlanId  
where    
OA.Isactive=1   
  
END
GO
/****** Object:  StoredProcedure [dbo].[spGetPlanEvents]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[spGetPlanEvents]  
(  
@PlanId Uniqueidentifier  
)  
AS  
BEGIN  
   
Declare @OfferId Uniqueidentifier   
--Set @OfferId=(Select OfferId from Plans where PlanGuId =@PlanId )  
--isnull(PlanAttributeId,ID),ParameterId,DisplayName,DisplaySequence,isnull(IsEnabled,0)  
  
SELECT    
 Cast(ROW_NUMBER() OVER ( ORDER BY E.EventsId)  as Int) RowNumber  
 ,ISNULL(OEM.Id,0)  Id  
,ISNULL(OEM.PlanId,@PlanId) PlanId  
--,OEM.ARMTemplateId  
,ISNULL(OEM.Isactive,0) Isactive  
,ISNULL(OEM.CopyToCustomer,0) CopyToCustomer
,ISNULL(OEM.SuccessStateEmails,'')SuccessStateEmails  
,ISNULL(OEM.FailureStateEmails,'')FailureStateEmails  
,E.EventsId as EventId  
  
,E.EventsName  
from Events  E  
left  join   
PlanEventsMapping  OEM  
on  
E.EventsId= OEM.EventId and  OEM.PlanId= @PlanId  
where    
E.Isactive=1   
  
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSubscriptionParameters]    Script Date: 11-02-2025 12:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[spGetSubscriptionParameters]  
(  
@SubscriptionId Uniqueidentifier,  
@PlanId Uniqueidentifier  
)  
AS  
BEGIN  
   
Declare @OfferId Uniqueidentifier   
Set @OfferId=(Select OfferId from Plans where PlanGuId =@PlanId )  
SELECT    
  Cast( ROW_NUMBER() OVER ( ORDER BY OA.ID) as Int)RowNumber  
,isnull(SAV.ID,0) ID  
,isnull(SAV.PlanAttributeId,PA.PlanAttributeId) PlanAttributeId  
,ISNULL(SAV.PlanId,@PlanId) PlanId   
,ISNULL(PA.OfferAttributeID ,OA.ID)  OfferAttributeID  
,ISNULL(OA.DisplayName,'')DisplayName  
,ISNULL(OA.Type,'')Type  
,ISNULL(VT.ValueType,'') ValueType  
,ISnull(OA.DisplaySequence,0)DisplaySequence  
,isnull(PA.IsEnabled,0) IsEnabled  
,isnull(OA.IsRequired,0) IsRequired  
,ISNULL(Value,'')Value  
,ISNULL(SubscriptionId,@SubscriptionId) SubscriptionId  
,ISNULL(SAV.OfferID,OA.OfferId) OfferID  
,SAV.UserId  
,SAV.CreateDate  
,ISNULL(oA.FromList,0) FromList  
,ISNULL(OA.ValuesList,'') ValuesList  
,ISNULL(OA.Max,0) Max  
,ISNULL(OA.Min,0) Min
,ISNULL(VT.HTMLType,'') HTMLType  
from   
[dbo].[OfferAttributes] OA  
Inner  join   
[dbo].[PlanAttributeMapping]  PA  
on OA.ID= PA.OfferAttributeID and OA.OfferId=@OfferId  
  
and  PA.PlanId=@PlanId  
Left Join   
SubscriptionAttributeValues SAV  
on SAV.PlanAttributeId= PA.PlanAttributeId  
and SAV.SubscriptionId=@SubscriptionId  
  
inner join ValueTypes VT  
ON OA.ValueTypeId=VT.ValueTypeId  
  
where    
OA.Isactive=1   
and PA.IsEnabled=1  
END
GO
USE [master]
GO
ALTER DATABASE [MSAPPSOURCE] SET  READ_WRITE 
GO
