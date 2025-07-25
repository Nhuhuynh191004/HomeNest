USE [master]
GO
DROP DATABASE [RentalManagement]
/****** Object:  Database [RentalManagement]    Script Date: 7/14/2025 4:29:38 PM ******/
CREATE DATABASE [RentalManagement]
CONTAINMENT = NONE
/**
ON PRIMARY 
( 
    NAME = N'RentalManagement', 
    FILENAME = N'C:\SQLData\RentalManagement.mdf', 
    SIZE = 73728KB, 
    MAXSIZE = UNLIMITED, 
    FILEGROWTH = 65536KB 
)
LOG ON 
( 
    NAME = N'RentalManagement_log', 
    FILENAME = N'C:\SQLData\RentalManagement_log.ldf', 
    SIZE = 8192KB, 
    MAXSIZE = 2048GB, 
    FILEGROWTH = 65536KB 
)
WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
**/


GO
ALTER DATABASE [RentalManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RentalManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RentalManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RentalManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RentalManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [RentalManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RentalManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RentalManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RentalManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RentalManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RentalManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RentalManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RentalManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RentalManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RentalManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RentalManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
/****/
ALTER DATABASE [RentalManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RentalManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RentalManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RentalManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RentalManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RentalManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RentalManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [RentalManagement] SET  MULTI_USER 
GO
ALTER DATABASE [RentalManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RentalManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RentalManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RentalManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RentalManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RentalManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RentalManagement', N'ON'
GO
ALTER DATABASE [RentalManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [RentalManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RentalManagement]
GO
/****** Object:  Table [dbo].[AccountMember]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountMember](
	[MemberID] [nvarchar](20) NOT NULL,
	[MemberPassword] [nvarchar](80) NOT NULL,
	[FullName] [nvarchar](80) NOT NULL,
	[EmailAddress] [nvarchar](100) NULL,
	[MemberRole] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[EmailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetails]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetails](
	[BillDetailID] [int] IDENTITY(1,1) NOT NULL,
	[BillID] [int] NOT NULL,
	[RoomRent] [decimal](10, 2) NOT NULL,
	[ElectricityCost] [decimal](10, 2) NOT NULL,
	[WaterCost] [decimal](10, 2) NOT NULL,
	[WifiCost] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BillDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[BillID] [int] IDENTITY(1,1) NOT NULL,
	[ContractID] [int] NOT NULL,
	[BillDate] [date] NOT NULL,
	[TotalAmount] [decimal](10, 2) NOT NULL,
	[BillStatus] [varchar](20) NOT NULL,
	[IsSent] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blocks]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blocks](
	[BlockID] [int] IDENTITY(1,1) NOT NULL,
	[BlockName] [varchar](50) NOT NULL,
	[MaxRoom] [int] NULL,
	[RoomCount] [int] NULL,
	[BlockStatus] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[BlockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[BlockName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](100) NOT NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[ContractID] [int] IDENTITY(1,1) NOT NULL,
	[TenantID] [int] NULL,
	[RoomID] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[ContractStatus] [varchar](20) NOT NULL,
	[ContractCreatedAt] [datetime] NOT NULL,
	[Deposit] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerFullName] [varchar](100) NOT NULL,
	[PhoneNumber] [varchar](15) NULL,
	[CCCD] [varchar](20) NULL,
	[Gender] [varchar](10) NULL,
	[BirthDate] [date] NULL,
	[Address] [varchar](200) NULL,
	[Email] [varchar](100) NULL,
	[CustomerPassword] [varchar](255) NOT NULL,
	[CustomerStatus] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailLogs]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailLogs](
	[EmailLogID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[UserID] [int] NULL,
	[SentByUserID] [int] NULL,
	[Email] [varchar](100) NOT NULL,
	[Subject] [nvarchar](255) NOT NULL,
	[Message] [nvarchar](1000) NOT NULL,
	[SentAt] [datetime] NOT NULL,
	[Status] [varchar](20) NOT NULL,
	[ErrorMessage] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmailLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpenseCategories]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenseCategories](
	[ExpenseCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ExpenseCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Expenses]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expenses](
	[ExpenseID] [int] IDENTITY(1,1) NOT NULL,
	[ExpenseCategoryID] [int] NOT NULL,
	[ExpenseName] [nvarchar](255) NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[ExpenseDate] [date] NOT NULL,
	[Notes] [nvarchar](1000) NULL,
	[Payer] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ExpenseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncurredFees]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncurredFees](
	[IncurredFeeID] [int] IDENTITY(1,1) NOT NULL,
	[BillID] [int] NOT NULL,
	[IncurredFeeTypeID] [int] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IncurredFeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncurredFeeTypes]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncurredFeeTypes](
	[IncurredFeeTypeID] [int] IDENTITY(1,1) NOT NULL,
	[FeeName] [varchar](100) NOT NULL,
	[DefaultAmount] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IncurredFeeTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[FeeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Message] [nvarchar](1000) NOT NULL,
	[IsRead] [bit] NOT NULL,
	[NotificationCreatedAt] [datetime] NOT NULL,
	[SentBy] [int] NULL,
	[RedirectUrl] [nvarchar](255) NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PasswordResetTokens]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PasswordResetTokens](
	[Token] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[ExpiryTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[BillID] [int] NOT NULL,
	[AmountPaid] [money] NOT NULL,
	[PaymentDate] [date] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[PaymentMethod] [nvarchar](100) NULL,
	[PaymentNote] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[CategoryID] [int] NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitPrice] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentalRequests]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalRequests](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[RequestDate] [datetime] NOT NULL,
	[RequestStatus] [varchar](20) NOT NULL,
	[ApprovedBy] [int] NULL,
	[ApprovedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[ContractID] [int] NOT NULL,
	[IssueDescription] [nvarchar](1000) NOT NULL,
	[ReportStatus] [varchar](20) NOT NULL,
	[ReportCreatedAt] [datetime] NOT NULL,
	[ResolvedBy] [int] NULL,
	[ResolvedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RevenueCategories]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RevenueCategories](
	[RevenueCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RevenueCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Revenues]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Revenues](
	[RevenueID] [int] IDENTITY(1,1) NOT NULL,
	[RevenueName] [nvarchar](255) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[RevenueDate] [date] NOT NULL,
	[Payer] [nvarchar](100) NULL,
	[Notes] [nvarchar](max) NULL,
	[RevenueCategoryID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RevenueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[RoomNumber] [varchar](20) NOT NULL,
	[RentPrice] [decimal](10, 2) NOT NULL,
	[Area] [decimal](5, 2) NULL,
	[Location] [varchar](255) NULL,
	[RoomStatus] [varchar](20) NOT NULL,
	[BlockID] [int] NULL,
	[CategoryID] [int] NULL,
	[Highlights] [nvarchar](255) NULL,
	[ImagePath] [nvarchar](255) NULL,
	[Description] [nvarchar](1000) NULL,
	[PostedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RoomNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tenants]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenants](
	[TenantID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[JoinDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TenantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserNotifications]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserNotifications](
	[UserNotificationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[UserTitle] [nvarchar](255) NOT NULL,
	[UserMessage] [nvarchar](1000) NOT NULL,
	[IsRead] [bit] NOT NULL,
	[UserNotificationCreatedAt] [datetime] NOT NULL,
	[SentBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserNotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserFullName] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[PhoneNumber] [varchar](15) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[RoleID] [int] NOT NULL,
	[UserStatus] [varchar](20) NOT NULL,
	[UserCreatedAt] [datetime] NOT NULL,
	[BlockID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UtilityReadings]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UtilityReadings](
	[ReadingID] [int] IDENTITY(1,1) NOT NULL,
	[UtilityTypeID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[ReadingDate] [date] NOT NULL,
	[OldReading] [decimal](10, 2) NOT NULL,
	[NewReading] [decimal](10, 2) NOT NULL,
	[PriceUsed] [decimal](10, 2) NULL,
	[OldPrice] [decimal](10, 2) NULL,
	[ChangedBy] [varchar](50) NULL,
	[UtilityReadingCreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReadingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UtilityTypes]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UtilityTypes](
	[UtilityTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UtilityName] [varchar](50) NOT NULL,
	[UnitPrice] [decimal](10, 2) NOT NULL,
	[Unit] [nvarchar](50) NULL,
	[IsSystem] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UtilityTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UtilityName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Customers_CCCD]    Script Date: 7/14/2025 4:29:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Customers_CCCD] ON [dbo].[Customers]
(
	[CCCD] ASC
)
WHERE ([CCCD] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Customers_Email]    Script Date: 7/14/2025 4:29:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Customers_Email] ON [dbo].[Customers]
(
	[Email] ASC
)
WHERE ([Email] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Customers_PhoneNumber]    Script Date: 7/14/2025 4:29:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Customers_PhoneNumber] ON [dbo].[Customers]
(
	[PhoneNumber] ASC
)
WHERE ([PhoneNumber] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bills] ADD  DEFAULT ('Unpaid') FOR [BillStatus]
GO
ALTER TABLE [dbo].[Contracts] ADD  CONSTRAINT [DF_Contracts_ContractStatus]  DEFAULT ('PendingCustomerSign') FOR [ContractStatus]
GO
ALTER TABLE [dbo].[Contracts] ADD  DEFAULT (getdate()) FOR [ContractCreatedAt]
GO
ALTER TABLE [dbo].[Contracts] ADD  DEFAULT ((0)) FOR [Deposit]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT ('123456') FOR [CustomerPassword]
GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_CustomerStatus]  DEFAULT ('Active') FOR [CustomerStatus]
GO
ALTER TABLE [dbo].[EmailLogs] ADD  DEFAULT (getdate()) FOR [SentAt]
GO
ALTER TABLE [dbo].[ExpenseCategories] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Expenses] ADD  DEFAULT (getdate()) FOR [ExpenseDate]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT (getdate()) FOR [NotificationCreatedAt]
GO
ALTER TABLE [dbo].[RentalRequests] ADD  DEFAULT (getdate()) FOR [RequestDate]
GO
ALTER TABLE [dbo].[RentalRequests] ADD  DEFAULT ('Pending') FOR [RequestStatus]
GO
ALTER TABLE [dbo].[Reports] ADD  DEFAULT ('Pending') FOR [ReportStatus]
GO
ALTER TABLE [dbo].[Reports] ADD  DEFAULT (getdate()) FOR [ReportCreatedAt]
GO
ALTER TABLE [dbo].[RevenueCategories] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT ('Available') FOR [RoomStatus]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT (getdate()) FOR [PostedDate]
GO
ALTER TABLE [dbo].[Tenants] ADD  DEFAULT (getdate()) FOR [JoinDate]
GO
ALTER TABLE [dbo].[UserNotifications] ADD  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[UserNotifications] ADD  DEFAULT (getdate()) FOR [UserNotificationCreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UserStatus]  DEFAULT ('Active') FOR [UserStatus]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [UserCreatedAt]
GO
ALTER TABLE [dbo].[UtilityReadings] ADD  DEFAULT (getdate()) FOR [UtilityReadingCreatedAt]
GO
ALTER TABLE [dbo].[UtilityTypes] ADD  DEFAULT ((0)) FOR [IsSystem]
GO
ALTER TABLE [dbo].[BillDetails]  WITH CHECK ADD FOREIGN KEY([BillID])
REFERENCES [dbo].[Bills] ([BillID])
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD FOREIGN KEY([ContractID])
REFERENCES [dbo].[Contracts] ([ContractID])
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD FOREIGN KEY([TenantID])
REFERENCES [dbo].[Tenants] ([TenantID])
GO
ALTER TABLE [dbo].[EmailLogs]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[EmailLogs]  WITH CHECK ADD FOREIGN KEY([SentByUserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[EmailLogs]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD FOREIGN KEY([ExpenseCategoryID])
REFERENCES [dbo].[ExpenseCategories] ([ExpenseCategoryID])
GO
ALTER TABLE [dbo].[IncurredFees]  WITH CHECK ADD FOREIGN KEY([BillID])
REFERENCES [dbo].[Bills] ([BillID])
GO
ALTER TABLE [dbo].[IncurredFees]  WITH CHECK ADD FOREIGN KEY([IncurredFeeTypeID])
REFERENCES [dbo].[IncurredFeeTypes] ([IncurredFeeTypeID])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([SentBy])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[RentalRequests]  WITH CHECK ADD FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[RentalRequests]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[RentalRequests]  WITH CHECK ADD FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD FOREIGN KEY([ContractID])
REFERENCES [dbo].[Contracts] ([ContractID])
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD FOREIGN KEY([ResolvedBy])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO
ALTER TABLE [dbo].[Revenues]  WITH CHECK ADD FOREIGN KEY([RevenueCategoryID])
REFERENCES [dbo].[RevenueCategories] ([RevenueCategoryID])
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD FOREIGN KEY([BlockID])
REFERENCES [dbo].[Blocks] ([BlockID])
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Tenants]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[UserNotifications]  WITH CHECK ADD FOREIGN KEY([SentBy])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserNotifications]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([BlockID])
REFERENCES [dbo].[Blocks] ([BlockID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[UtilityReadings]  WITH CHECK ADD FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO
ALTER TABLE [dbo].[UtilityReadings]  WITH CHECK ADD FOREIGN KEY([UtilityTypeID])
REFERENCES [dbo].[UtilityTypes] ([UtilityTypeID])
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD CHECK  (([BillStatus]='Paid' OR [BillStatus]='Unpaid'))
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [CK__Contracts__ContractStatus] CHECK  (([ContractStatus]='Ended' OR [ContractStatus]='Expired' OR [ContractStatus]='Terminated' OR [ContractStatus]='Pending' OR [ContractStatus]='Active'))
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [CK__Contracts__ContractStatus]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [CK_Customers_CustomerStatus] CHECK  (([CustomerStatus]='Disable' OR [CustomerStatus]='Active'))
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [CK_Customers_CustomerStatus]
GO
ALTER TABLE [dbo].[EmailLogs]  WITH CHECK ADD CHECK  (([Status]='Failed' OR [Status]='Sent'))
GO
ALTER TABLE [dbo].[RentalRequests]  WITH CHECK ADD  CONSTRAINT [CK_RequestStatus_Valid] CHECK  (([RequestStatus]='Expired' OR [RequestStatus]='Rejected' OR [RequestStatus]='Approved' OR [RequestStatus]='Pending'))
GO
ALTER TABLE [dbo].[RentalRequests] CHECK CONSTRAINT [CK_RequestStatus_Valid]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD CHECK  (([ReportStatus]='Closed' OR [ReportStatus]='Resolved' OR [ReportStatus]='InProgress' OR [ReportStatus]='Pending'))
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD CHECK  (([RoomStatus]='Occupied' OR [RoomStatus]='Available'))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK_Users_UserStatus] CHECK  (([UserStatus]='Disable' OR [UserStatus]='Active'))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK_Users_UserStatus]
GO
/****** Object:  StoredProcedure [dbo].[spCountProductsUsingOutputValue]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[spCountProductsUsingOutputValue](@CategoryID int,@NumberOfProducts int Output)  As
	Select  @NumberOfProducts = Count(ProductID)
	From Products
	where CategoryID = @CategoryID
	Group by CategoryID

GO
/****** Object:  StoredProcedure [dbo].[spCountProductsUsingReturnValue]    Script Date: 7/14/2025 4:29:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[spCountProductsUsingReturnValue](@CategoryID int)  As
	Declare  @NumberOfProducts int
	Select  @NumberOfProducts = Count(ProductID)
	From Products
	where CategoryID = @CategoryID
	Group by CategoryID
	Return  @NumberOfProducts
GO
USE [master]
GO
ALTER DATABASE [RentalManagement] SET  READ_WRITE 
GO

-- Roles
SELECT * FROM Roles

INSERT INTO Roles (RoleName)
SELECT 'Admin' WHERE NOT EXISTS (SELECT 1 FROM Roles WHERE RoleName = 'Admin');

INSERT INTO Roles (RoleName)
SELECT 'Manager' WHERE NOT EXISTS (SELECT 1 FROM Roles WHERE RoleName = 'Manager');

DELETE FROM Roles WHERE RoleName IN ('Admin', 'Manager');

-- Users
INSERT INTO Users (UserFullName, Email, PhoneNumber, Password, RoleID, UserStatus, UserCreatedAt, BlockID)
VALUES 
('Admin', '	', '0123456789', '261ce7d7f59783df971a96221b892986', 1, 'Active', GETDATE(), NULL),
('Manager1', 'manager1@gmail.com', '0987654321', '2201500981376e02414d0b3484ef75d4', 2, 'Active', GETDATE(), 1),
('Manager2', 'manager12@gmail.com', '0987654312', 'c3aaf2a1f882ac132ef551ad458d3db0', 2, 'Active', GETDATE(), 2);
--Admin A@123456
--Manager1 M1@123456
--Manager2 M2@123456

SELECT * FROM Users
TRUNCATE TABLE Users;
DELETE FROM Users;
DBCC CHECKIDENT ('Users', RESEED, 0);

SELECT * FROM [dbo].[Customers]