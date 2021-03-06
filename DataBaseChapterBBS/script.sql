USE [master]
GO
/****** Object:  Database [DB_BBS]    Script Date: 2020-01-08 12:16:42 ******/
CREATE DATABASE [DB_BBS] ON  PRIMARY 
( NAME = N'BBSDB', FILENAME = N'D:\WorkSpace\Project_BBSSystem\DataBaseChapterBBS\BBSDB.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BBSDB_log', FILENAME = N'D:\WorkSpace\Project_BBSSystem\DataBaseChapterBBS\BBSDB_log.ldf' , SIZE = 5824KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_BBS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_BBS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_BBS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_BBS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_BBS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_BBS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_BBS] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_BBS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_BBS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_BBS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_BBS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_BBS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_BBS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_BBS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_BBS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_BBS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_BBS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_BBS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_BBS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_BBS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_BBS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_BBS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_BBS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_BBS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_BBS] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_BBS] SET  MULTI_USER 
GO
ALTER DATABASE [DB_BBS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_BBS] SET DB_CHAINING OFF 
GO
USE [DB_BBS]
GO
/****** Object:  Table [dbo].[tb_Column]    Script Date: 2020-01-08 12:16:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Column](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ColumnCode] [varchar](10) NULL,
	[ColumnName] [varchar](60) NOT NULL,
	[Url] [varchar](256) NULL,
	[LogoClassName] [varchar](32) NULL,
 CONSTRAINT [PK_UserByPermission] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_ForumArea]    Script Date: 2020-01-08 12:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_ForumArea](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AreaName] [varchar](64) NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK__ForumAre__3214EC273FA2DAEF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_ForumClassify]    Script Date: 2020-01-08 12:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_ForumClassify](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ForumAreaID] [int] NOT NULL,
	[ForumUserID] [int] NOT NULL,
	[ClassifyName] [varchar](45) NOT NULL CONSTRAINT [DF__ForumClas__Class__1ED998B2]  DEFAULT (NULL),
	[ClassifyLogo] [varchar](526) NOT NULL,
	[ClassifyInnerLogo] [varchar](526) NULL,
	[ClassifyOrder] [int] NOT NULL CONSTRAINT [DF__ForumClas__Class__1FCDBCEB]  DEFAULT ((0)),
	[ClassifyIsleaf] [bit] NULL CONSTRAINT [DF__ForumClas__Class__20C1E124]  DEFAULT ((0)),
 CONSTRAINT [PK__ForumCla__3214EC27A4ABF5C8] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_ForumInfoStatus]    Script Date: 2020-01-08 12:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ForumInfoStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ForumMainID] [int] NOT NULL,
	[ReplyNumber] [int] NOT NULL DEFAULT ((0)),
	[SeeNumber] [int] NOT NULL DEFAULT ((0)),
	[LastReplyUserID] [int] NULL DEFAULT ((0)),
	[LastReplytime] [datetime] NULL,
 CONSTRAINT [PK_ForumInfoStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_ForumMain]    Script Date: 2020-01-08 12:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_ForumMain](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](128) NOT NULL,
	[ForumAreaID] [int] NOT NULL,
	[ForumClassifyID] [int] NOT NULL,
	[CreateUserID] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[Content] [text] NOT NULL,
	[IsRecommend] [bit] NOT NULL,
	[Isdelete] [bit] NOT NULL,
	[IsExamine] [int] NOT NULL,
	[Zan] [int] NULL CONSTRAINT [DF__ForumMain__Zan__239E4DCF]  DEFAULT (NULL),
 CONSTRAINT [PK__ForumMai__3214EC27C0FA3AEC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_ForumReport]    Script Date: 2020-01-08 12:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ForumReport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReportForumTypeID] [int] NOT NULL,
	[ForumID] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CreateUserID] [int] NOT NULL,
	[ReportTypeID] [int] NOT NULL,
	[ReportDetailContent] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_ForumSecond]    Script Date: 2020-01-08 12:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ForumSecond](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ForumMainID] [int] NOT NULL,
	[Content] [text] NOT NULL,
	[CreateUserID] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[CurSequence] [int] NOT NULL,
	[ReplySequenceID] [int] NOT NULL,
	[IsDelete] [bit] NOT NULL,
 CONSTRAINT [PK__ForumSec__3214EC27F4FEB22D] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_UserByRole]    Script Date: 2020-01-08 12:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_UserByRole](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](60) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_UserByRoleJoinColumn]    Script Date: 2020-01-08 12:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_UserByRoleJoinColumn](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[ColumnID] [int] NOT NULL,
 CONSTRAINT [PK_tb_UserByRoleJoinColumn] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_UsersByCustomer]    Script Date: 2020-01-08 12:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_UsersByCustomer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](60) NOT NULL,
	[UserPassword] [varbinary](1024) NOT NULL,
	[NickName] [varchar](10) NOT NULL,
	[SexID] [int] NOT NULL,
	[Age] [int] NOT NULL,
	[IsModerator] [bit] NOT NULL,
	[PhotoUrl] [varchar](255) NULL CONSTRAINT [DF__UsersByCu__Photo__108B795B]  DEFAULT (NULL),
	[Email] [varchar](128) NULL CONSTRAINT [DF__UsersByCu__Shenf__117F9D94]  DEFAULT ((0)),
	[Fatieshu] [int] NULL CONSTRAINT [DF__UsersByCu__Fatie__1273C1CD]  DEFAULT ((0)),
	[Huitieshu] [int] NULL CONSTRAINT [DF__UsersByCu__Huiti__1367E606]  DEFAULT ((0)),
 CONSTRAINT [PK__UsersByC__3214EC27084F6FDF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_UsersBySystem]    Script Date: 2020-01-08 12:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_UsersBySystem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[UserName] [varchar](60) NOT NULL,
	[NickName] [varchar](60) NOT NULL,
	[UserPassword] [varbinary](1024) NOT NULL,
	[Email] [varchar](45) NULL CONSTRAINT [DF__UsersBySy__Email__164452B1]  DEFAULT (NULL),
 CONSTRAINT [PK__UsersByS__3214EC27D7E07920] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_ZY_ForumReportType]    Script Date: 2020-01-08 12:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_ZY_ForumReportType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [varchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_ZY_ReportType]    Script Date: 2020-01-08 12:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_ZY_ReportType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReportType] [int] NOT NULL,
	[Content] [varchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_ZY_Sex]    Script Date: 2020-01-08 12:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_ZY_Sex](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [char](2) NOT NULL,
 CONSTRAINT [PK_ZY_Sex] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Column] ON 

INSERT [dbo].[tb_Column] ([ID], [ColumnCode], [ColumnName], [Url], [LogoClassName]) VALUES (1, N'A', N'首页', NULL, N'glyphicon-home')
INSERT [dbo].[tb_Column] ([ID], [ColumnCode], [ColumnName], [Url], [LogoClassName]) VALUES (2, N'B', N'栏目管理', N'ColumnManage', N'glyphicon-tasks')
INSERT [dbo].[tb_Column] ([ID], [ColumnCode], [ColumnName], [Url], [LogoClassName]) VALUES (3, N'B-1', N'栏目列表', N'/admins/Column/ColumnList', N'glyphicon-list')
INSERT [dbo].[tb_Column] ([ID], [ColumnCode], [ColumnName], [Url], [LogoClassName]) VALUES (4, N'B-2', N'添加栏目', N'/admins/Column/CreateColumn', N'glyphicon-plus-sign')
INSERT [dbo].[tb_Column] ([ID], [ColumnCode], [ColumnName], [Url], [LogoClassName]) VALUES (5, N'C', N'用户管理', N'UserManage', N'glyphicon-user')
INSERT [dbo].[tb_Column] ([ID], [ColumnCode], [ColumnName], [Url], [LogoClassName]) VALUES (6, N'C-1', N'管理用户列表', N'/admins/Users/UserList', N'glyphicon-list')
INSERT [dbo].[tb_Column] ([ID], [ColumnCode], [ColumnName], [Url], [LogoClassName]) VALUES (7, N'C-2', N'创建管理用户', N'/admins/Users/CreateAdmins', N'glyphicon-saved')
INSERT [dbo].[tb_Column] ([ID], [ColumnCode], [ColumnName], [Url], [LogoClassName]) VALUES (8, N'C-3', N'普通用户列表', N'/admins/Users/CustomerUserList', N'glyphicon-list')
INSERT [dbo].[tb_Column] ([ID], [ColumnCode], [ColumnName], [Url], [LogoClassName]) VALUES (9, N'C-4', N'角色列表', N'/admins/Users/RoleList', N'glyphicon-list')
INSERT [dbo].[tb_Column] ([ID], [ColumnCode], [ColumnName], [Url], [LogoClassName]) VALUES (10, N'C-5', N'创建角色', N'/admins/Users/CreateRole', N'glyphicon-saved')
INSERT [dbo].[tb_Column] ([ID], [ColumnCode], [ColumnName], [Url], [LogoClassName]) VALUES (11, N'D', N'专区管理', N'SectionManage', N'glyphicon-asterisk')
INSERT [dbo].[tb_Column] ([ID], [ColumnCode], [ColumnName], [Url], [LogoClassName]) VALUES (12, N'D-1', N'专区列表', N'/admins/Section/SectionList', N'glyphicon-list')
INSERT [dbo].[tb_Column] ([ID], [ColumnCode], [ColumnName], [Url], [LogoClassName]) VALUES (13, N'D-2', N'创建专区', N'/admins/Section/CreateSection', N'glyphicon-saved')
SET IDENTITY_INSERT [dbo].[tb_Column] OFF
SET IDENTITY_INSERT [dbo].[tb_ForumArea] ON 

INSERT [dbo].[tb_ForumArea] ([ID], [AreaName], [UserID]) VALUES (1, N'编程语言 专区', 4)
INSERT [dbo].[tb_ForumArea] ([ID], [AreaName], [UserID]) VALUES (2, N'数据库 专区', 3)
INSERT [dbo].[tb_ForumArea] ([ID], [AreaName], [UserID]) VALUES (3, N'Web专区', 1)
INSERT [dbo].[tb_ForumArea] ([ID], [AreaName], [UserID]) VALUES (4, N'系统专区', 1)
INSERT [dbo].[tb_ForumArea] ([ID], [AreaName], [UserID]) VALUES (5, N'数据验证 专区', 1)
SET IDENTITY_INSERT [dbo].[tb_ForumArea] OFF
SET IDENTITY_INSERT [dbo].[tb_ForumClassify] ON 

INSERT [dbo].[tb_ForumClassify] ([ID], [ForumAreaID], [ForumUserID], [ClassifyName], [ClassifyLogo], [ClassifyInnerLogo], [ClassifyOrder], [ClassifyIsleaf]) VALUES (11, 1, 4, N'Java SE 专区版块', N'language_java.png', N'language_length1.png', 1, 1)
INSERT [dbo].[tb_ForumClassify] ([ID], [ForumAreaID], [ForumUserID], [ClassifyName], [ClassifyLogo], [ClassifyInnerLogo], [ClassifyOrder], [ClassifyIsleaf]) VALUES (12, 2, 3, N'Sql server 专区', N'language_sqlsever.png', N'language_length16.png', 1, 1)
INSERT [dbo].[tb_ForumClassify] ([ID], [ForumAreaID], [ForumUserID], [ClassifyName], [ClassifyLogo], [ClassifyInnerLogo], [ClassifyOrder], [ClassifyIsleaf]) VALUES (15, 1, 3, N'DotNet专区', N'language_net.png', N'language_length11', 1, 1)
INSERT [dbo].[tb_ForumClassify] ([ID], [ForumAreaID], [ForumUserID], [ClassifyName], [ClassifyLogo], [ClassifyInnerLogo], [ClassifyOrder], [ClassifyIsleaf]) VALUES (16, 1, 3, N'PHP 专区', N'language_php.png', N'language_length6.png', 1, 1)
INSERT [dbo].[tb_ForumClassify] ([ID], [ForumAreaID], [ForumUserID], [ClassifyName], [ClassifyLogo], [ClassifyInnerLogo], [ClassifyOrder], [ClassifyIsleaf]) VALUES (18, 1, 3, N'Android专区', N'language_andriod.png', N'language_length2.png', 12, NULL)
INSERT [dbo].[tb_ForumClassify] ([ID], [ForumAreaID], [ForumUserID], [ClassifyName], [ClassifyLogo], [ClassifyInnerLogo], [ClassifyOrder], [ClassifyIsleaf]) VALUES (19, 2, 3, N'mysql 专区', N'language_mysql.png', N'language_length14.png', 13, NULL)
SET IDENTITY_INSERT [dbo].[tb_ForumClassify] OFF
SET IDENTITY_INSERT [dbo].[tb_ForumInfoStatus] ON 

INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (1, 4, 5, 18, 3, CAST(N'2016-12-13 16:37:00.000' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (2, 5, 3, 20, 3, CAST(N'2016-12-13 16:39:00.000' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (3, 7, 7, 30, 3, CAST(N'2016-12-13 16:39:00.000' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (4, 9, 10, 15, 3, CAST(N'2016-12-13 16:39:00.000' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (5, 10, 35, 80, 3, CAST(N'2016-12-15 12:50:00.000' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (6, 11, 16, 76, 3, CAST(N'2016-12-15 10:35:17.870' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (7, 12, 17, 95, 3, CAST(N'2016-12-15 10:36:14.990' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (8, 13, 44, 96, 3, CAST(N'2016-12-15 10:36:14.990' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (9, 14, 39, 98, 3, CAST(N'2016-12-15 10:36:14.993' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (10, 15, 40, 90, 3, CAST(N'2016-12-15 10:36:14.997' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (11, 16, 37, 84, 3, CAST(N'2016-12-15 10:36:14.997' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (12, 17, 7, 57, 3, CAST(N'2016-12-15 10:36:15.000' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (13, 18, 13, 91, 3, CAST(N'2016-12-15 10:36:15.000' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (14, 19, 2, 62, 3, CAST(N'2016-12-15 10:36:15.003' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (15, 20, 29, 87, 3, CAST(N'2016-12-15 10:36:15.003' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (16, 21, 35, 85, 3, CAST(N'2016-12-15 10:36:15.003' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (17, 22, 30, 59, 3, CAST(N'2016-12-15 10:36:15.003' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (18, 23, 34, 99, 3, CAST(N'2016-12-15 10:36:15.003' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (19, 24, 45, 55, 3, CAST(N'2016-12-15 10:36:15.003' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (20, 25, 49, 65, 3, CAST(N'2016-12-15 10:36:15.003' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (21, 26, 39, 99, 3, CAST(N'2016-12-15 10:36:15.003' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (22, 27, 22, 83, 3, CAST(N'2016-12-15 10:36:15.007' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (23, 28, 14, 96, 3, CAST(N'2016-12-15 10:36:15.007' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (24, 29, 11, 98, 3, CAST(N'2016-12-15 10:36:15.007' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (25, 30, 20, 66, 3, CAST(N'2016-12-15 10:36:15.007' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (26, 31, 34, 95, 3, CAST(N'2016-12-15 10:36:15.007' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (27, 32, 18, 85, 3, CAST(N'2016-12-15 10:36:15.007' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (28, 33, 24, 91, 3, CAST(N'2016-12-15 10:36:15.010' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (29, 34, 25, 56, 3, CAST(N'2016-12-15 10:36:15.013' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (30, 35, 48, 78, 3, CAST(N'2016-12-15 10:36:15.013' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (31, 36, 21, 59, 3, CAST(N'2016-12-15 10:36:15.013' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (32, 37, 48, 90, 3, CAST(N'2016-12-15 10:36:15.013' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (33, 38, 28, 95, 3, CAST(N'2016-12-15 10:36:15.013' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (34, 39, 1, 58, 3, CAST(N'2016-12-15 10:36:15.013' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (35, 40, 41, 81, 3, CAST(N'2016-12-15 10:36:15.020' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (36, 41, 32, 81, 3, CAST(N'2016-12-15 10:36:15.020' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (37, 42, 18, 79, 3, CAST(N'2016-12-15 10:36:15.023' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (38, 43, 0, 97, 3, CAST(N'2016-12-15 10:36:15.023' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (39, 44, 13, 87, 3, CAST(N'2016-12-15 10:36:15.027' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (40, 45, 0, 60, 3, CAST(N'2016-12-15 10:36:15.030' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (41, 46, 9, 70, 3, CAST(N'2016-12-15 10:36:15.030' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (42, 47, 40, 76, 3, CAST(N'2016-12-15 10:36:15.030' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (43, 48, 40, 61, 3, CAST(N'2016-12-15 10:36:15.030' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (44, 49, 32, 81, 3, CAST(N'2016-12-15 10:36:15.030' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (45, 50, 42, 73, 3, CAST(N'2016-12-15 10:36:15.030' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (46, 51, 30, 92, 3, CAST(N'2016-12-15 10:36:15.030' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (47, 52, 1, 63, 3, CAST(N'2016-12-15 10:36:15.030' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (48, 53, 33, 70, 3, CAST(N'2016-12-15 10:36:15.033' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (49, 54, 2, 97, 3, CAST(N'2016-12-15 10:36:15.033' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (50, 55, 7, 99, 3, CAST(N'2016-12-15 10:36:15.033' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (51, 56, 16, 60, 3, CAST(N'2016-12-15 10:36:15.033' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (52, 57, 26, 58, 3, CAST(N'2016-12-15 10:36:15.033' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (53, 58, 31, 87, 3, CAST(N'2016-12-15 10:36:15.033' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (54, 59, 22, 83, 3, CAST(N'2016-12-15 10:36:15.033' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (55, 60, 48, 97, 3, CAST(N'2016-12-15 10:36:15.033' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (56, 61, 44, 91, 3, CAST(N'2016-12-15 10:36:15.037' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (57, 62, 28, 95, 3, CAST(N'2016-12-15 10:36:15.037' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (58, 63, 0, 69, 3, CAST(N'2016-12-15 10:36:15.037' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (59, 64, 11, 84, 3, CAST(N'2016-12-15 10:36:15.037' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (60, 65, 42, 78, 3, CAST(N'2016-12-15 10:36:15.037' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (61, 66, 18, 71, 3, CAST(N'2016-12-15 10:36:15.037' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (62, 67, 48, 94, 3, CAST(N'2016-12-15 10:36:15.043' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (63, 68, 20, 75, 3, CAST(N'2016-12-15 10:36:15.043' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (64, 69, 48, 69, 3, CAST(N'2016-12-15 10:36:15.043' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (65, 70, 9, 70, 3, CAST(N'2016-12-15 10:36:15.043' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (66, 71, 26, 94, 3, CAST(N'2016-12-15 10:36:15.043' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (67, 72, 6, 93, 3, CAST(N'2016-12-15 10:36:15.043' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (68, 73, 22, 57, 3, CAST(N'2016-12-15 10:36:15.043' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (69, 74, 22, 56, 3, CAST(N'2016-12-15 10:36:15.050' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (70, 75, 44, 62, 3, CAST(N'2016-12-15 10:36:15.050' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (71, 76, 45, 79, 3, CAST(N'2016-12-15 10:36:15.050' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (72, 77, 34, 82, 3, CAST(N'2016-12-15 10:36:15.050' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (73, 78, 6, 53, 3, CAST(N'2016-12-15 10:36:15.050' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (74, 79, 41, 90, 3, CAST(N'2016-12-15 10:36:15.050' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (75, 80, 3, 52, 3, CAST(N'2016-12-15 10:36:15.050' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (76, 81, 27, 88, 3, CAST(N'2016-12-15 10:36:15.050' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (77, 82, 29, 63, 3, CAST(N'2016-12-15 10:36:15.053' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (78, 83, 33, 53, 3, CAST(N'2016-12-15 10:36:15.053' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (79, 84, 8, 80, 3, CAST(N'2016-12-15 10:36:15.053' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (80, 85, 24, 73, 3, CAST(N'2016-12-15 10:36:15.053' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (81, 86, 16, 79, 3, CAST(N'2016-12-15 10:36:15.053' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (82, 87, 30, 91, 3, CAST(N'2016-12-15 10:36:15.053' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (83, 88, 43, 84, 3, CAST(N'2016-12-15 10:36:15.053' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (84, 89, 40, 52, 3, CAST(N'2016-12-15 10:36:15.053' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (85, 90, 23, 93, 3, CAST(N'2016-12-15 10:36:15.057' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (86, 91, 22, 80, 3, CAST(N'2016-12-15 10:36:15.057' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (87, 92, 47, 75, 3, CAST(N'2016-12-15 10:36:15.057' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (88, 93, 10, 88, 3, CAST(N'2016-12-15 10:36:15.057' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (89, 94, 34, 69, 3, CAST(N'2016-12-15 10:36:15.057' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (90, 95, 30, 55, 3, CAST(N'2016-12-15 10:36:15.060' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (91, 96, 37, 54, 3, CAST(N'2016-12-15 10:36:15.067' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (92, 97, 18, 88, 3, CAST(N'2016-12-15 10:36:15.067' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (93, 98, 24, 79, 3, CAST(N'2016-12-15 10:36:15.067' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (94, 99, 49, 56, 3, CAST(N'2016-12-15 10:36:15.067' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (95, 100, 44, 76, 3, CAST(N'2016-12-15 10:36:15.067' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (96, 101, 4, 63, 3, CAST(N'2016-12-15 10:36:15.067' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (97, 102, 8, 73, 3, CAST(N'2016-12-15 10:36:15.067' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (98, 103, 25, 83, 3, CAST(N'2016-12-15 10:36:15.070' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (99, 104, 48, 61, 3, CAST(N'2016-12-15 10:36:15.070' AS DateTime))
GO
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (100, 105, 43, 67, 3, CAST(N'2016-12-15 10:36:15.070' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (101, 106, 42, 53, 3, CAST(N'2016-12-15 10:36:15.070' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (102, 107, 36, 72, 3, CAST(N'2016-12-15 10:36:15.070' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (103, 108, 34, 99, 3, CAST(N'2016-12-15 10:36:15.070' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (104, 109, 46, 55, 3, CAST(N'2016-12-15 10:36:15.073' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (105, 110, 2, 51, 3, CAST(N'2016-12-15 10:36:15.073' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (106, 111, 32, 77, 3, CAST(N'2016-12-15 10:36:15.077' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (107, 112, 47, 71, 3, CAST(N'2016-12-15 10:36:15.077' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (108, 113, 32, 56, 3, CAST(N'2016-12-15 10:36:15.077' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (109, 114, 7, 90, 3, CAST(N'2016-12-15 10:36:15.077' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (110, 115, 21, 96, 3, CAST(N'2016-12-15 10:36:15.077' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (111, 116, 4, 65, 3, CAST(N'2016-12-15 10:36:15.077' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (112, 117, 44, 96, 3, CAST(N'2016-12-15 10:36:15.077' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (113, 118, 22, 85, 3, CAST(N'2016-12-15 10:36:15.077' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (114, 119, 16, 89, 3, CAST(N'2016-12-15 10:36:15.080' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (115, 120, 32, 73, 3, CAST(N'2016-12-15 10:36:15.080' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (116, 121, 42, 99, 3, CAST(N'2016-12-15 10:36:15.080' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (117, 122, 3, 72, 3, CAST(N'2016-12-15 10:36:15.080' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (118, 123, 20, 51, 3, CAST(N'2016-12-15 10:36:15.080' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (119, 124, 19, 53, 3, CAST(N'2016-12-15 10:36:15.080' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (120, 125, 46, 88, 3, CAST(N'2016-12-15 10:36:15.083' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (121, 126, 9, 79, 3, CAST(N'2016-12-15 10:36:15.090' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (122, 127, 9, 94, 3, CAST(N'2016-12-15 10:36:15.090' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (123, 128, 47, 100, 3, CAST(N'2016-12-15 10:36:15.090' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (124, 129, 45, 95, 3, CAST(N'2016-12-15 10:36:15.090' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (125, 130, 32, 94, 3, CAST(N'2016-12-15 10:36:15.090' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (126, 131, 47, 90, 3, CAST(N'2016-12-15 10:36:15.090' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (127, 132, 5, 64, 3, CAST(N'2016-12-15 10:36:15.090' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (128, 133, 1, 90, 3, CAST(N'2016-12-15 10:36:15.090' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (129, 134, 31, 96, 3, CAST(N'2016-12-15 10:36:15.090' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (130, 135, 31, 72, 3, CAST(N'2016-12-15 10:36:15.093' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (131, 136, 36, 77, 3, CAST(N'2016-12-15 10:36:15.093' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (132, 137, 13, 96, 3, CAST(N'2016-12-15 10:36:15.093' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (133, 138, 2, 63, 3, CAST(N'2016-12-15 10:36:15.093' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (134, 139, 41, 95, 3, CAST(N'2016-12-15 10:36:15.093' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (135, 140, 3, 75, 3, CAST(N'2016-12-15 10:36:15.093' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (136, 141, 47, 98, 3, CAST(N'2016-12-15 10:36:15.093' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (137, 142, 27, 90, 3, CAST(N'2016-12-15 10:36:15.093' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (138, 143, 4, 91, 3, CAST(N'2016-12-15 10:36:15.093' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (139, 144, 49, 72, 3, CAST(N'2016-12-15 10:36:15.093' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (140, 145, 3, 57, 3, CAST(N'2016-12-15 10:36:15.093' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (141, 146, 38, 68, 3, CAST(N'2016-12-15 10:36:15.093' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (142, 147, 42, 95, 3, CAST(N'2016-12-15 10:36:15.093' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (143, 148, 1, 57, 3, CAST(N'2016-12-15 10:36:15.093' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (144, 149, 9, 62, 3, CAST(N'2016-12-15 10:36:15.093' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (145, 150, 10, 89, 3, CAST(N'2016-12-15 10:36:15.093' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (146, 151, 1, 63, 3, CAST(N'2016-12-15 10:36:15.093' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (147, 152, 40, 89, 3, CAST(N'2016-12-15 10:36:15.097' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (148, 153, 8, 89, 3, CAST(N'2016-12-15 10:36:15.100' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (149, 154, 43, 73, 3, CAST(N'2016-12-15 10:36:15.100' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (150, 155, 40, 82, 3, CAST(N'2016-12-15 10:36:15.100' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (151, 156, 12, 64, 3, CAST(N'2016-12-15 10:36:15.100' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (152, 157, 27, 65, 3, CAST(N'2016-12-15 10:36:15.100' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (153, 158, 11, 79, 3, CAST(N'2016-12-15 10:36:15.100' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (154, 159, 14, 60, 3, CAST(N'2016-12-15 10:36:15.100' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (155, 160, 6, 87, 3, CAST(N'2016-12-15 10:36:15.100' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (156, 161, 37, 79, 3, CAST(N'2016-12-15 10:36:15.100' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (157, 162, 45, 53, 3, CAST(N'2016-12-15 10:36:15.100' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (158, 163, 9, 59, 3, CAST(N'2016-12-15 10:36:15.100' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (159, 164, 1, 60, 3, CAST(N'2016-12-15 10:36:15.100' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (160, 165, 10, 62, 3, CAST(N'2016-12-15 10:36:15.100' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (161, 166, 25, 82, 3, CAST(N'2016-12-15 10:36:15.100' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (162, 167, 48, 90, 3, CAST(N'2016-12-15 10:36:15.100' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (163, 168, 17, 86, 3, CAST(N'2016-12-15 10:36:15.100' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (164, 169, 21, 99, 3, CAST(N'2016-12-15 10:36:15.103' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (165, 170, 2, 74, 3, CAST(N'2016-12-15 10:36:15.107' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (166, 171, 9, 88, 3, CAST(N'2016-12-15 10:36:15.107' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (167, 172, 6, 89, 3, CAST(N'2016-12-15 10:36:15.107' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (168, 173, 9, 56, 3, CAST(N'2016-12-15 10:36:15.107' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (169, 174, 31, 84, 3, CAST(N'2016-12-15 10:36:15.107' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (170, 175, 37, 79, 3, CAST(N'2016-12-15 10:36:15.107' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (171, 176, 38, 96, 3, CAST(N'2016-12-15 10:36:15.107' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (172, 177, 12, 87, 3, CAST(N'2016-12-15 10:36:15.107' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (173, 178, 9, 85, 3, CAST(N'2016-12-15 10:36:15.107' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (174, 179, 12, 71, 3, CAST(N'2016-12-15 10:36:15.107' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (175, 180, 15, 82, 3, CAST(N'2016-12-15 10:36:15.107' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (176, 181, 9, 93, 3, CAST(N'2016-12-15 10:36:15.110' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (177, 182, 41, 68, 3, CAST(N'2016-12-15 10:36:15.110' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (178, 183, 14, 79, 3, CAST(N'2016-12-15 10:36:15.110' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (179, 184, 5, 81, 3, CAST(N'2016-12-15 10:36:15.110' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (180, 185, 11, 77, 3, CAST(N'2016-12-15 10:36:15.110' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (181, 186, 6, 83, 3, CAST(N'2016-12-15 10:36:15.110' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (182, 187, 36, 77, 3, CAST(N'2016-12-15 10:36:15.110' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (183, 188, 6, 86, 3, CAST(N'2016-12-15 10:36:15.110' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (184, 189, 18, 62, 3, CAST(N'2016-12-15 10:36:15.110' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (185, 190, 45, 71, 3, CAST(N'2016-12-15 10:36:15.113' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (186, 195, 0, 0, 3, CAST(N'2016-12-20 14:18:09.183' AS DateTime))
INSERT [dbo].[tb_ForumInfoStatus] ([ID], [ForumMainID], [ReplyNumber], [SeeNumber], [LastReplyUserID], [LastReplytime]) VALUES (187, 196, 0, 0, 3, CAST(N'2016-12-20 14:22:08.450' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_ForumInfoStatus] OFF
SET IDENTITY_INSERT [dbo].[tb_ForumMain] ON 

INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (4, N'用getClass()已经获得类名了，为什么还要在getClass()后面加getName()?', 1, 11, 3, CAST(N'2016-12-12 16:54:30.000' AS DateTime), N'测试测试', 1, 0, 1, 1)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (5, N'SqlServer打印日志', 2, 12, 3, CAST(N'2016-12-13 12:47:23.000' AS DateTime), N'日志怎么输出', 1, 0, 1, 1)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (7, N'SqlServer代理服务', 2, 12, 3, CAST(N'2016-12-13 12:55:00.000' AS DateTime), N'启动代理服务用什么账户', 1, 0, 1, 1)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (9, N'SqlServer函数类型', 2, 12, 3, CAST(N'2016-12-13 12:58:00.000' AS DateTime), N'函数类型有哪些', 1, 0, 1, 2)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (10, N'关于架设IIS的问题', 1, 11, 3, CAST(N'2016-12-14 16:50:00.000' AS DateTime), N'如何发布到IIS服务器', 0, 0, 1, 5)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (11, N'JavaSE标题1?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容1', 1, 0, 1, 1)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (12, N'JavaSE标题2?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容2', 1, 0, 1, 2)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (13, N'JavaSE标题3?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容3', 1, 0, 1, 3)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (14, N'JavaSE标题4?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容4', 1, 0, 1, 4)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (15, N'JavaSE标题5?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容5', 1, 0, 1, 5)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (16, N'JavaSE标题6?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容6', 1, 0, 1, 6)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (17, N'JavaSE标题7?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容7', 1, 0, 1, 7)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (18, N'JavaSE标题8?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容8', 1, 0, 1, 8)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (19, N'JavaSE标题9?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容9', 1, 0, 1, 9)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (20, N'JavaSE标题10?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容10', 1, 0, 1, 10)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (21, N'JavaSE标题11?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容11', 1, 0, 1, 11)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (22, N'JavaSE标题12?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容12', 1, 0, 1, 12)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (23, N'JavaSE标题13?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容13', 1, 0, 1, 13)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (24, N'JavaSE标题14?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容14', 1, 0, 1, 14)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (25, N'JavaSE标题15?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容15', 1, 0, 1, 15)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (26, N'JavaSE标题16?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容16', 1, 0, 1, 16)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (27, N'JavaSE标题17?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容17', 1, 0, 1, 17)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (28, N'JavaSE标题18?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容18', 1, 0, 1, 18)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (29, N'JavaSE标题19?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容19', 1, 0, 1, 19)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (30, N'JavaSE标题20?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容20', 1, 0, 1, 20)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (31, N'JavaSE标题21?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容21', 1, 0, 1, 21)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (32, N'JavaSE标题22?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容22', 1, 0, 1, 22)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (33, N'JavaSE标题23?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容23', 1, 0, 1, 23)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (34, N'JavaSE标题24?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容24', 1, 0, 1, 24)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (35, N'JavaSE标题25?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容25', 1, 0, 1, 25)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (36, N'JavaSE标题26?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容26', 1, 0, 1, 26)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (37, N'JavaSE标题27?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容27', 1, 0, 1, 27)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (38, N'JavaSE标题28?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容28', 1, 0, 1, 28)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (39, N'JavaSE标题29?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容29', 1, 0, 1, 29)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (40, N'JavaSE标题30?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容30', 1, 0, 1, 30)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (41, N'JavaSE标题31?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容31', 1, 0, 1, 31)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (42, N'JavaSE标题32?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容32', 1, 0, 1, 32)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (43, N'JavaSE标题33?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容33', 1, 0, 1, 33)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (44, N'JavaSE标题34?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容34', 1, 0, 1, 34)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (45, N'JavaSE标题35?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容35', 1, 0, 1, 35)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (46, N'JavaSE标题36?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容36', 1, 0, 1, 36)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (47, N'JavaSE标题37?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容37', 1, 0, 1, 37)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (48, N'JavaSE标题38?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容38', 1, 0, 1, 38)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (49, N'JavaSE标题39?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容39', 1, 0, 1, 39)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (50, N'JavaSE标题40?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容40', 1, 0, 1, 40)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (51, N'JavaSE标题41?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容41', 1, 0, 1, 41)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (52, N'JavaSE标题42?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容42', 0, 0, 1, 42)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (53, N'JavaSE标题43?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容43', 0, 0, 1, 43)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (54, N'JavaSE标题44?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容44', 0, 0, 1, 44)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (55, N'JavaSE标题45?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容45', 0, 0, 1, 45)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (56, N'JavaSE标题46?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容46', 0, 0, 1, 46)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (57, N'JavaSE标题47?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容47', 0, 0, 1, 47)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (58, N'JavaSE标题48?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容48', 0, 0, 1, 48)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (59, N'JavaSE标题49?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容49', 0, 0, 1, 49)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (60, N'JavaSE标题50?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容50', 0, 0, 1, 50)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (61, N'JavaSE标题51?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容51', 0, 0, 1, 51)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (62, N'JavaSE标题52?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容52', 0, 0, 1, 52)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (63, N'JavaSE标题53?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容53', 0, 0, 1, 53)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (64, N'JavaSE标题54?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容54', 0, 0, 1, 54)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (65, N'JavaSE标题55?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容55', 0, 0, 1, 55)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (66, N'JavaSE标题56?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容56', 0, 0, 1, 56)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (67, N'JavaSE标题57?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容57', 0, 0, 1, 57)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (68, N'JavaSE标题58?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容58', 0, 0, 1, 58)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (69, N'JavaSE标题59?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容59', 0, 0, 1, 59)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (70, N'JavaSE标题60?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容60', 0, 0, 1, 60)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (71, N'JavaSE标题61?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容61', 0, 0, 1, 61)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (72, N'JavaSE标题62?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容62', 0, 0, 1, 62)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (73, N'JavaSE标题63?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容63', 0, 0, 1, 63)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (74, N'JavaSE标题64?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容64', 0, 0, 1, 64)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (75, N'JavaSE标题65?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容65', 0, 0, 1, 65)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (76, N'JavaSE标题66?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容66', 0, 0, 1, 66)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (77, N'JavaSE标题67?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容67', 0, 0, 1, 67)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (78, N'JavaSE标题68?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容68', 0, 0, 1, 68)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (79, N'JavaSE标题69?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容69', 0, 0, 1, 69)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (80, N'JavaSE标题70?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容70', 0, 0, 1, 70)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (81, N'JavaSE标题71?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容71', 0, 0, 1, 71)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (82, N'JavaSE标题72?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容72', 0, 0, 1, 72)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (83, N'JavaSE标题73?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容73', 0, 0, 1, 73)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (84, N'JavaSE标题74?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容74', 0, 0, 1, 74)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (85, N'JavaSE标题75?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容75', 0, 0, 1, 75)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (86, N'JavaSE标题76?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容76', 0, 0, 1, 76)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (87, N'JavaSE标题77?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容77', 0, 0, 1, 77)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (88, N'JavaSE标题78?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容78', 0, 0, 1, 78)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (89, N'JavaSE标题79?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容79', 0, 0, 1, 79)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (90, N'JavaSE标题80?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容80', 0, 0, 1, 80)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (91, N'JavaSE标题81?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容81', 0, 0, 1, 81)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (92, N'JavaSE标题82?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容82', 0, 0, 1, 82)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (93, N'JavaSE标题83?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容83', 0, 0, 1, 83)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (94, N'JavaSE标题84?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容84', 0, 0, 1, 84)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (95, N'JavaSE标题85?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容85', 0, 0, 1, 85)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (96, N'JavaSE标题86?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容86', 0, 0, 1, 86)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (97, N'JavaSE标题87?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容87', 0, 0, 1, 87)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (98, N'JavaSE标题88?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容88', 0, 0, 1, 88)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (99, N'JavaSE标题89?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容89', 0, 0, 1, 89)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (100, N'JavaSE标题90?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容90', 0, 0, 1, 90)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (101, N'JavaSE标题91?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容91', 0, 0, 1, 91)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (102, N'JavaSE标题92?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容92', 0, 0, 1, 92)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (103, N'JavaSE标题93?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容93', 0, 0, 1, 93)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (104, N'JavaSE标题94?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容94', 0, 0, 1, 94)
GO
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (105, N'JavaSE标题95?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容95', 0, 0, 1, 95)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (106, N'JavaSE标题96?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容96', 0, 0, 1, 96)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (107, N'JavaSE标题97?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容97', 0, 0, 1, 97)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (108, N'JavaSE标题98?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容98', 0, 0, 1, 98)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (109, N'JavaSE标题99?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容99', 0, 0, 1, 99)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (110, N'JavaSE标题100?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容100', 0, 0, 1, 100)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (111, N'JavaSE标题101?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容101', 0, 0, 1, 101)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (112, N'JavaSE标题102?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容102', 0, 0, 1, 102)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (113, N'JavaSE标题103?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容103', 0, 0, 1, 103)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (114, N'JavaSE标题104?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容104', 0, 0, 1, 104)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (115, N'JavaSE标题105?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容105', 0, 0, 1, 105)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (116, N'JavaSE标题106?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容106', 0, 0, 1, 106)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (117, N'JavaSE标题107?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容107', 0, 0, 1, 107)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (118, N'JavaSE标题108?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容108', 0, 0, 1, 108)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (119, N'JavaSE标题109?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容109', 0, 0, 1, 109)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (120, N'JavaSE标题110?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容110', 0, 0, 1, 110)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (121, N'JavaSE标题111?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容111', 0, 0, 1, 111)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (122, N'JavaSE标题112?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容112', 0, 0, 1, 112)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (123, N'JavaSE标题113?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容113', 0, 0, 1, 113)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (124, N'JavaSE标题114?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容114', 0, 0, 1, 114)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (125, N'JavaSE标题115?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容115', 0, 0, 1, 115)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (126, N'JavaSE标题116?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容116', 0, 0, 1, 116)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (127, N'JavaSE标题117?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容117', 0, 0, 1, 117)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (128, N'JavaSE标题118?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容118', 0, 0, 1, 118)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (129, N'JavaSE标题119?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容119', 0, 0, 1, 119)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (130, N'JavaSE标题120?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容120', 0, 0, 1, 120)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (131, N'JavaSE标题121?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容121', 0, 0, 1, 121)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (132, N'JavaSE标题122?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容122', 0, 0, 1, 122)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (133, N'JavaSE标题123?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容123', 0, 0, 1, 123)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (134, N'JavaSE标题124?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容124', 0, 0, 1, 124)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (135, N'JavaSE标题125?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容125', 0, 0, 1, 125)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (136, N'JavaSE标题126?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容126', 0, 0, 1, 126)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (137, N'JavaSE标题127?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容127', 0, 0, 1, 127)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (138, N'JavaSE标题128?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容128', 0, 0, 1, 128)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (139, N'JavaSE标题129?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容129', 0, 0, 1, 129)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (140, N'JavaSE标题130?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容130', 0, 0, 1, 130)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (141, N'JavaSE标题131?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容131', 0, 0, 1, 131)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (142, N'JavaSE标题132?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容132', 0, 0, 1, 132)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (143, N'JavaSE标题133?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容133', 0, 0, 1, 133)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (144, N'JavaSE标题134?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容134', 0, 0, 1, 134)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (145, N'JavaSE标题135?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容135', 0, 0, 1, 135)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (146, N'JavaSE标题136?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容136', 0, 0, 1, 136)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (147, N'JavaSE标题137?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容137', 0, 0, 1, 137)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (148, N'JavaSE标题138?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容138', 0, 0, 1, 138)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (149, N'JavaSE标题139?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容139', 0, 0, 1, 139)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (150, N'JavaSE标题140?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容140', 0, 0, 1, 140)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (151, N'JavaSE标题141?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容141', 0, 0, 1, 141)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (152, N'JavaSE标题142?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容142', 0, 0, 1, 142)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (153, N'JavaSE标题143?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容143', 0, 0, 1, 143)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (154, N'JavaSE标题144?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容144', 0, 0, 1, 144)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (155, N'JavaSE标题145?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容145', 0, 0, 1, 145)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (156, N'JavaSE标题146?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容146', 0, 0, 1, 146)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (157, N'JavaSE标题147?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容147', 0, 0, 1, 147)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (158, N'JavaSE标题148?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容148', 0, 0, 1, 148)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (159, N'JavaSE标题149?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容149', 0, 0, 1, 149)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (160, N'JavaSE标题150?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容150', 0, 0, 1, 150)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (161, N'JavaSE标题151?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容151', 0, 0, 1, 151)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (162, N'JavaSE标题152?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容152', 0, 0, 1, 152)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (163, N'JavaSE标题153?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容153', 0, 0, 1, 153)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (164, N'JavaSE标题154?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容154', 0, 0, 1, 154)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (165, N'JavaSE标题155?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容155', 0, 0, 1, 155)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (166, N'JavaSE标题156?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容156', 0, 0, 1, 156)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (167, N'JavaSE标题157?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容157', 0, 0, 1, 157)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (168, N'JavaSE标题158?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容158', 0, 0, 1, 158)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (169, N'JavaSE标题159?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容159', 0, 0, 1, 159)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (170, N'JavaSE标题160?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容160', 0, 0, 1, 160)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (171, N'JavaSE标题161?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容161', 0, 0, 1, 161)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (172, N'JavaSE标题162?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容162', 0, 0, 1, 162)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (173, N'JavaSE标题163?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容163', 0, 0, 1, 163)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (174, N'JavaSE标题164?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容164', 0, 0, 1, 164)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (175, N'JavaSE标题165?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容165', 0, 0, 1, 165)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (176, N'JavaSE标题166?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容166', 0, 0, 1, 166)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (177, N'JavaSE标题167?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容167', 0, 0, 1, 167)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (178, N'JavaSE标题168?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容168', 0, 0, 1, 168)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (179, N'JavaSE标题169?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容169', 0, 0, 1, 169)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (180, N'JavaSE标题170?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容170', 0, 0, 1, 170)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (181, N'JavaSE标题171?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容171', 0, 0, 1, 171)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (182, N'JavaSE标题172?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容172', 0, 0, 1, 172)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (183, N'JavaSE标题173?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容173', 0, 0, 1, 173)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (184, N'JavaSE标题174?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容174', 0, 0, 1, 174)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (185, N'JavaSE标题175?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容175', 0, 0, 1, 175)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (186, N'JavaSE标题176?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容176', 0, 0, 1, 176)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (187, N'JavaSE标题177?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容177', 0, 1, 1, 177)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (188, N'JavaSE标题178?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容178', 0, 0, 0, 178)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (189, N'JavaSE标题179?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容179', 1, 0, 1, 179)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (190, N'JavaSE标题180?', 1, 11, 3, CAST(N'2016-12-15 10:02:30.000' AS DateTime), N'JavaSE测试内容180', 0, 0, 1, 180)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (195, N'asdfadf', 1, 11, 4, CAST(N'2016-12-20 14:18:06.857' AS DateTime), N'<p>aasfdasdfxzcvzcv<br/></p>', 1, 0, 1, 0)
INSERT [dbo].[tb_ForumMain] ([ID], [Title], [ForumAreaID], [ForumClassifyID], [CreateUserID], [CreateTime], [Content], [IsRecommend], [Isdelete], [IsExamine], [Zan]) VALUES (196, N'java se停止工作怎么办？', 1, 11, 4, CAST(N'2016-12-20 14:22:08.450' AS DateTime), N'<p>此情况是在软件执行中途出现的，请大神帮忙解决下，谢谢！<br/></p>', 0, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[tb_ForumMain] OFF
SET IDENTITY_INSERT [dbo].[tb_ForumReport] ON 

INSERT [dbo].[tb_ForumReport] ([ID], [ReportForumTypeID], [ForumID], [CreateTime], [CreateUserID], [ReportTypeID], [ReportDetailContent]) VALUES (1, 2, 12, CAST(N'2016-12-22 14:37:31.393' AS DateTime), 4, 1, N'各种赌博内容')
INSERT [dbo].[tb_ForumReport] ([ID], [ReportForumTypeID], [ForumID], [CreateTime], [CreateUserID], [ReportTypeID], [ReportDetailContent]) VALUES (2, 2, 16, CAST(N'2016-12-22 14:59:35.437' AS DateTime), 4, 2, N'测试企业侵权')
SET IDENTITY_INSERT [dbo].[tb_ForumReport] OFF
SET IDENTITY_INSERT [dbo].[tb_ForumSecond] ON 

INSERT [dbo].[tb_ForumSecond] ([ID], [ForumMainID], [Content], [CreateUserID], [CreateTime], [CurSequence], [ReplySequenceID], [IsDelete]) VALUES (1, 190, N'测试回复180', 3, CAST(N'2016-12-16 12:59:05.000' AS DateTime), 1, 190, 0)
INSERT [dbo].[tb_ForumSecond] ([ID], [ForumMainID], [Content], [CreateUserID], [CreateTime], [CurSequence], [ReplySequenceID], [IsDelete]) VALUES (2, 190, N'测试回复180-2', 3, CAST(N'2016-12-16 13:52:56.000' AS DateTime), 2, 190, 0)
INSERT [dbo].[tb_ForumSecond] ([ID], [ForumMainID], [Content], [CreateUserID], [CreateTime], [CurSequence], [ReplySequenceID], [IsDelete]) VALUES (3, 190, N'测试回复180-3', 3, CAST(N'2016-12-16 13:52:56.000' AS DateTime), 3, 190, 0)
INSERT [dbo].[tb_ForumSecond] ([ID], [ForumMainID], [Content], [CreateUserID], [CreateTime], [CurSequence], [ReplySequenceID], [IsDelete]) VALUES (4, 190, N'测试回复180-4', 3, CAST(N'2016-12-16 13:52:56.000' AS DateTime), 4, 190, 0)
INSERT [dbo].[tb_ForumSecond] ([ID], [ForumMainID], [Content], [CreateUserID], [CreateTime], [CurSequence], [ReplySequenceID], [IsDelete]) VALUES (5, 190, N'测试回复180-5', 3, CAST(N'2016-12-16 13:52:56.000' AS DateTime), 5, 190, 0)
INSERT [dbo].[tb_ForumSecond] ([ID], [ForumMainID], [Content], [CreateUserID], [CreateTime], [CurSequence], [ReplySequenceID], [IsDelete]) VALUES (6, 190, N'测试回复180-6', 3, CAST(N'2016-12-16 13:52:56.000' AS DateTime), 6, 190, 0)
INSERT [dbo].[tb_ForumSecond] ([ID], [ForumMainID], [Content], [CreateUserID], [CreateTime], [CurSequence], [ReplySequenceID], [IsDelete]) VALUES (7, 190, N'测试回复180-7', 3, CAST(N'2016-12-16 13:52:56.000' AS DateTime), 7, 190, 0)
INSERT [dbo].[tb_ForumSecond] ([ID], [ForumMainID], [Content], [CreateUserID], [CreateTime], [CurSequence], [ReplySequenceID], [IsDelete]) VALUES (8, 190, N'测试回复180-8', 3, CAST(N'2016-12-16 13:52:56.000' AS DateTime), 8, 190, 0)
INSERT [dbo].[tb_ForumSecond] ([ID], [ForumMainID], [Content], [CreateUserID], [CreateTime], [CurSequence], [ReplySequenceID], [IsDelete]) VALUES (9, 190, N'测试回复180-9', 3, CAST(N'2016-12-16 13:52:56.000' AS DateTime), 9, 190, 0)
INSERT [dbo].[tb_ForumSecond] ([ID], [ForumMainID], [Content], [CreateUserID], [CreateTime], [CurSequence], [ReplySequenceID], [IsDelete]) VALUES (10, 190, N'测试回复180-10', 3, CAST(N'2016-12-16 13:52:56.000' AS DateTime), 10, 190, 0)
INSERT [dbo].[tb_ForumSecond] ([ID], [ForumMainID], [Content], [CreateUserID], [CreateTime], [CurSequence], [ReplySequenceID], [IsDelete]) VALUES (11, 190, N'测试回复180-11', 3, CAST(N'2016-12-16 13:52:56.000' AS DateTime), 11, 190, 0)
INSERT [dbo].[tb_ForumSecond] ([ID], [ForumMainID], [Content], [CreateUserID], [CreateTime], [CurSequence], [ReplySequenceID], [IsDelete]) VALUES (12, 196, N'<p>检查你是否有多个jdk安装目录<br/></p>', 3, CAST(N'2016-12-20 15:50:04.760' AS DateTime), 1, 196, 0)
INSERT [dbo].[tb_ForumSecond] ([ID], [ForumMainID], [Content], [CreateUserID], [CreateTime], [CurSequence], [ReplySequenceID], [IsDelete]) VALUES (13, 196, N'我安装了jdk环境', 4, CAST(N'2016-12-21 13:09:23.560' AS DateTime), 0, 12, 0)
INSERT [dbo].[tb_ForumSecond] ([ID], [ForumMainID], [Content], [CreateUserID], [CreateTime], [CurSequence], [ReplySequenceID], [IsDelete]) VALUES (14, 196, N'请问jdk要安装哪个版本？', 4, CAST(N'2016-12-21 13:53:45.627' AS DateTime), 0, 12, 0)
INSERT [dbo].[tb_ForumSecond] ([ID], [ForumMainID], [Content], [CreateUserID], [CreateTime], [CurSequence], [ReplySequenceID], [IsDelete]) VALUES (15, 196, N'检查你的环境变量是否配置错误', 3, CAST(N'2016-12-21 16:24:06.280' AS DateTime), 0, 13, 0)
INSERT [dbo].[tb_ForumSecond] ([ID], [ForumMainID], [Content], [CreateUserID], [CreateTime], [CurSequence], [ReplySequenceID], [IsDelete]) VALUES (16, 196, N'<p>测试Call楼主<br/></p>', 4, CAST(N'2016-12-21 16:31:53.480' AS DateTime), 2, 196, 0)
INSERT [dbo].[tb_ForumSecond] ([ID], [ForumMainID], [Content], [CreateUserID], [CreateTime], [CurSequence], [ReplySequenceID], [IsDelete]) VALUES (17, 196, N'Call "测试Call楼主"', 4, CAST(N'2016-12-21 16:38:35.313' AS DateTime), 0, 16, 0)
INSERT [dbo].[tb_ForumSecond] ([ID], [ForumMainID], [Content], [CreateUserID], [CreateTime], [CurSequence], [ReplySequenceID], [IsDelete]) VALUES (18, 196, N'Call "测试Call楼主 2016/12/21 16:38:35"', 4, CAST(N'2016-12-22 08:56:26.927' AS DateTime), 0, 17, 0)
INSERT [dbo].[tb_ForumSecond] ([ID], [ForumMainID], [Content], [CreateUserID], [CreateTime], [CurSequence], [ReplySequenceID], [IsDelete]) VALUES (19, 196, N'回复内容 me too', 4, CAST(N'2016-12-22 08:56:57.650' AS DateTime), 0, 16, 0)
INSERT [dbo].[tb_ForumSecond] ([ID], [ForumMainID], [Content], [CreateUserID], [CreateTime], [CurSequence], [ReplySequenceID], [IsDelete]) VALUES (20, 196, N'<p>测试楼层累加<br/></p>', 4, CAST(N'2016-12-22 15:12:45.757' AS DateTime), 3, 196, 0)
SET IDENTITY_INSERT [dbo].[tb_ForumSecond] OFF
SET IDENTITY_INSERT [dbo].[tb_UserByRole] ON 

INSERT [dbo].[tb_UserByRole] ([ID], [RoleName]) VALUES (1, N'管理员')
INSERT [dbo].[tb_UserByRole] ([ID], [RoleName]) VALUES (2, N'dsfadsf1')
SET IDENTITY_INSERT [dbo].[tb_UserByRole] OFF
SET IDENTITY_INSERT [dbo].[tb_UserByRoleJoinColumn] ON 

INSERT [dbo].[tb_UserByRoleJoinColumn] ([ID], [RoleID], [ColumnID]) VALUES (1, 1, 1)
INSERT [dbo].[tb_UserByRoleJoinColumn] ([ID], [RoleID], [ColumnID]) VALUES (2, 1, 2)
INSERT [dbo].[tb_UserByRoleJoinColumn] ([ID], [RoleID], [ColumnID]) VALUES (3, 1, 3)
INSERT [dbo].[tb_UserByRoleJoinColumn] ([ID], [RoleID], [ColumnID]) VALUES (4, 1, 4)
INSERT [dbo].[tb_UserByRoleJoinColumn] ([ID], [RoleID], [ColumnID]) VALUES (5, 1, 5)
INSERT [dbo].[tb_UserByRoleJoinColumn] ([ID], [RoleID], [ColumnID]) VALUES (6, 1, 6)
INSERT [dbo].[tb_UserByRoleJoinColumn] ([ID], [RoleID], [ColumnID]) VALUES (7, 1, 7)
INSERT [dbo].[tb_UserByRoleJoinColumn] ([ID], [RoleID], [ColumnID]) VALUES (8, 1, 8)
INSERT [dbo].[tb_UserByRoleJoinColumn] ([ID], [RoleID], [ColumnID]) VALUES (9, 1, 9)
INSERT [dbo].[tb_UserByRoleJoinColumn] ([ID], [RoleID], [ColumnID]) VALUES (10, 1, 10)
INSERT [dbo].[tb_UserByRoleJoinColumn] ([ID], [RoleID], [ColumnID]) VALUES (11, 1, 11)
INSERT [dbo].[tb_UserByRoleJoinColumn] ([ID], [RoleID], [ColumnID]) VALUES (12, 1, 12)
INSERT [dbo].[tb_UserByRoleJoinColumn] ([ID], [RoleID], [ColumnID]) VALUES (14, 2, 1)
INSERT [dbo].[tb_UserByRoleJoinColumn] ([ID], [RoleID], [ColumnID]) VALUES (15, 2, 2)
INSERT [dbo].[tb_UserByRoleJoinColumn] ([ID], [RoleID], [ColumnID]) VALUES (16, 1, 13)
SET IDENTITY_INSERT [dbo].[tb_UserByRoleJoinColumn] OFF
SET IDENTITY_INSERT [dbo].[tb_UsersByCustomer] ON 

INSERT [dbo].[tb_UsersByCustomer] ([ID], [UserName], [UserPassword], [NickName], [SexID], [Age], [IsModerator], [PhotoUrl], [Email], [Fatieshu], [Huitieshu]) VALUES (1, N'Inner', 0x5573657231, N'固定用户', 1, 18, 1, N'Null', N'email@email.com', 0, 0)
INSERT [dbo].[tb_UsersByCustomer] ([ID], [UserName], [UserPassword], [NickName], [SexID], [Age], [IsModerator], [PhotoUrl], [Email], [Fatieshu], [Huitieshu]) VALUES (3, N'User2', 0x5573657232, N'用户2', 2, 20, 0, N'Koala.jpg', N'220168199612132356', 10, 52)
INSERT [dbo].[tb_UsersByCustomer] ([ID], [UserName], [UserPassword], [NickName], [SexID], [Age], [IsModerator], [PhotoUrl], [Email], [Fatieshu], [Huitieshu]) VALUES (4, N'admini', 0x32003900610063003200350036003600300065003300300037003800650038003700650033003000390037006400330038003200320065003500300064003700, N'测试昵称', 1, 28, 1, N'Penguins.jpg', N'asdf@asdf.com', NULL, NULL)
INSERT [dbo].[tb_UsersByCustomer] ([ID], [UserName], [UserPassword], [NickName], [SexID], [Age], [IsModerator], [PhotoUrl], [Email], [Fatieshu], [Huitieshu]) VALUES (5, N'happy2017', 0x62003600630039003400330066003500340036006500640035003300620033003100640034003300340037003000380030003300350062003100610031003900, N'快乐2017', 1, 27, 1, NULL, N'823824@yahoo.com', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tb_UsersByCustomer] OFF
SET IDENTITY_INSERT [dbo].[tb_UsersBySystem] ON 

INSERT [dbo].[tb_UsersBySystem] ([ID], [RoleID], [UserName], [NickName], [UserPassword], [Email]) VALUES (1, 1, N'administrator', N'管理员1', 0x63006500300062006600640031003500300035003900620036003800640036003700360038003800380038003400640037006100330064003300650038006300, N'sss@qq1.com')
INSERT [dbo].[tb_UsersBySystem] ([ID], [RoleID], [UserName], [NickName], [UserPassword], [Email]) VALUES (2, 2, N'administrator1', N'测试管理员1', 0x63006500300062006600640031003500300035003900620036003800640036003700360038003800380038003400640037006100330064003300650038006300, N'asdf@fgg.com')
SET IDENTITY_INSERT [dbo].[tb_UsersBySystem] OFF
SET IDENTITY_INSERT [dbo].[tb_ZY_ForumReportType] ON 

INSERT [dbo].[tb_ZY_ForumReportType] ([ID], [Content]) VALUES (1, N'主贴')
INSERT [dbo].[tb_ZY_ForumReportType] ([ID], [Content]) VALUES (2, N'回复')
SET IDENTITY_INSERT [dbo].[tb_ZY_ForumReportType] OFF
SET IDENTITY_INSERT [dbo].[tb_ZY_ReportType] ON 

INSERT [dbo].[tb_ZY_ReportType] ([ID], [ReportType], [Content]) VALUES (1, 1, N'个人侵权')
INSERT [dbo].[tb_ZY_ReportType] ([ID], [ReportType], [Content]) VALUES (2, 1, N'企业侵权')
INSERT [dbo].[tb_ZY_ReportType] ([ID], [ReportType], [Content]) VALUES (3, 2, N'广告类')
INSERT [dbo].[tb_ZY_ReportType] ([ID], [ReportType], [Content]) VALUES (4, 2, N'政治有害类')
INSERT [dbo].[tb_ZY_ReportType] ([ID], [ReportType], [Content]) VALUES (5, 2, N'暴恐类')
INSERT [dbo].[tb_ZY_ReportType] ([ID], [ReportType], [Content]) VALUES (6, 2, N'淫秽色情类')
INSERT [dbo].[tb_ZY_ReportType] ([ID], [ReportType], [Content]) VALUES (7, 2, N'头像、签名档')
INSERT [dbo].[tb_ZY_ReportType] ([ID], [ReportType], [Content]) VALUES (9, 2, N'赌博类')
INSERT [dbo].[tb_ZY_ReportType] ([ID], [ReportType], [Content]) VALUES (10, 2, N'私服外挂类')
INSERT [dbo].[tb_ZY_ReportType] ([ID], [ReportType], [Content]) VALUES (11, 2, N'诈骗类')
INSERT [dbo].[tb_ZY_ReportType] ([ID], [ReportType], [Content]) VALUES (12, 2, N'其他有害类')
SET IDENTITY_INSERT [dbo].[tb_ZY_ReportType] OFF
SET IDENTITY_INSERT [dbo].[tb_ZY_Sex] ON 

INSERT [dbo].[tb_ZY_Sex] ([ID], [Content]) VALUES (1, N'男')
INSERT [dbo].[tb_ZY_Sex] ([ID], [Content]) VALUES (2, N'女')
SET IDENTITY_INSERT [dbo].[tb_ZY_Sex] OFF
ALTER TABLE [dbo].[tb_ForumClassify]  WITH CHECK ADD  CONSTRAINT [FK_ForumClassify_ForumArea] FOREIGN KEY([ForumAreaID])
REFERENCES [dbo].[tb_ForumArea] ([ID])
GO
ALTER TABLE [dbo].[tb_ForumClassify] CHECK CONSTRAINT [FK_ForumClassify_ForumArea]
GO
ALTER TABLE [dbo].[tb_ForumClassify]  WITH CHECK ADD  CONSTRAINT [FK_ForumClassify_UsersBySystem] FOREIGN KEY([ForumUserID])
REFERENCES [dbo].[tb_UsersByCustomer] ([ID])
GO
ALTER TABLE [dbo].[tb_ForumClassify] CHECK CONSTRAINT [FK_ForumClassify_UsersBySystem]
GO
ALTER TABLE [dbo].[tb_ForumInfoStatus]  WITH CHECK ADD  CONSTRAINT [FK_ForumInfoStatus_ForumMain] FOREIGN KEY([ForumMainID])
REFERENCES [dbo].[tb_ForumMain] ([ID])
GO
ALTER TABLE [dbo].[tb_ForumInfoStatus] CHECK CONSTRAINT [FK_ForumInfoStatus_ForumMain]
GO
ALTER TABLE [dbo].[tb_ForumInfoStatus]  WITH CHECK ADD  CONSTRAINT [FK_ForumInfoStatus_UsersByCustomer] FOREIGN KEY([LastReplyUserID])
REFERENCES [dbo].[tb_UsersByCustomer] ([ID])
GO
ALTER TABLE [dbo].[tb_ForumInfoStatus] CHECK CONSTRAINT [FK_ForumInfoStatus_UsersByCustomer]
GO
ALTER TABLE [dbo].[tb_ForumMain]  WITH CHECK ADD  CONSTRAINT [FK_ForumMain_ForumArea] FOREIGN KEY([ForumAreaID])
REFERENCES [dbo].[tb_ForumArea] ([ID])
GO
ALTER TABLE [dbo].[tb_ForumMain] CHECK CONSTRAINT [FK_ForumMain_ForumArea]
GO
ALTER TABLE [dbo].[tb_ForumMain]  WITH CHECK ADD  CONSTRAINT [FK_ForumMain_ForumClassify] FOREIGN KEY([ForumClassifyID])
REFERENCES [dbo].[tb_ForumClassify] ([ID])
GO
ALTER TABLE [dbo].[tb_ForumMain] CHECK CONSTRAINT [FK_ForumMain_ForumClassify]
GO
ALTER TABLE [dbo].[tb_ForumMain]  WITH CHECK ADD  CONSTRAINT [FK_ForumMain_UsersByCustomer] FOREIGN KEY([CreateUserID])
REFERENCES [dbo].[tb_UsersByCustomer] ([ID])
GO
ALTER TABLE [dbo].[tb_ForumMain] CHECK CONSTRAINT [FK_ForumMain_UsersByCustomer]
GO
ALTER TABLE [dbo].[tb_ForumReport]  WITH CHECK ADD  CONSTRAINT [FK_tb_ForumReport_tb_UsersByCustomer] FOREIGN KEY([CreateUserID])
REFERENCES [dbo].[tb_UsersByCustomer] ([ID])
GO
ALTER TABLE [dbo].[tb_ForumReport] CHECK CONSTRAINT [FK_tb_ForumReport_tb_UsersByCustomer]
GO
ALTER TABLE [dbo].[tb_ForumReport]  WITH CHECK ADD  CONSTRAINT [FK_tb_ForumReport_tb_ZY_ForumReportType] FOREIGN KEY([ReportForumTypeID])
REFERENCES [dbo].[tb_ZY_ForumReportType] ([ID])
GO
ALTER TABLE [dbo].[tb_ForumReport] CHECK CONSTRAINT [FK_tb_ForumReport_tb_ZY_ForumReportType]
GO
ALTER TABLE [dbo].[tb_ForumReport]  WITH CHECK ADD  CONSTRAINT [FK_tb_ForumReport_tb_ZY_ReportType] FOREIGN KEY([ReportTypeID])
REFERENCES [dbo].[tb_ZY_ReportType] ([ID])
GO
ALTER TABLE [dbo].[tb_ForumReport] CHECK CONSTRAINT [FK_tb_ForumReport_tb_ZY_ReportType]
GO
ALTER TABLE [dbo].[tb_ForumSecond]  WITH CHECK ADD  CONSTRAINT [FK_ForumSecond_ForumMain] FOREIGN KEY([ForumMainID])
REFERENCES [dbo].[tb_ForumMain] ([ID])
GO
ALTER TABLE [dbo].[tb_ForumSecond] CHECK CONSTRAINT [FK_ForumSecond_ForumMain]
GO
ALTER TABLE [dbo].[tb_ForumSecond]  WITH CHECK ADD  CONSTRAINT [FK_ForumSecond_UsersByCustomer] FOREIGN KEY([CreateUserID])
REFERENCES [dbo].[tb_UsersByCustomer] ([ID])
GO
ALTER TABLE [dbo].[tb_ForumSecond] CHECK CONSTRAINT [FK_ForumSecond_UsersByCustomer]
GO
ALTER TABLE [dbo].[tb_UserByRoleJoinColumn]  WITH CHECK ADD  CONSTRAINT [FK_tb_UserByRoleJoinColumn_tb_Column] FOREIGN KEY([ColumnID])
REFERENCES [dbo].[tb_Column] ([ID])
GO
ALTER TABLE [dbo].[tb_UserByRoleJoinColumn] CHECK CONSTRAINT [FK_tb_UserByRoleJoinColumn_tb_Column]
GO
ALTER TABLE [dbo].[tb_UserByRoleJoinColumn]  WITH CHECK ADD  CONSTRAINT [FK_tb_UserByRoleJoinColumn_tb_UserByRole] FOREIGN KEY([RoleID])
REFERENCES [dbo].[tb_UserByRole] ([ID])
GO
ALTER TABLE [dbo].[tb_UserByRoleJoinColumn] CHECK CONSTRAINT [FK_tb_UserByRoleJoinColumn_tb_UserByRole]
GO
ALTER TABLE [dbo].[tb_UsersByCustomer]  WITH CHECK ADD  CONSTRAINT [FK_UsersByCustomer_ZY_Sex] FOREIGN KEY([SexID])
REFERENCES [dbo].[tb_ZY_Sex] ([ID])
GO
ALTER TABLE [dbo].[tb_UsersByCustomer] CHECK CONSTRAINT [FK_UsersByCustomer_ZY_Sex]
GO
ALTER TABLE [dbo].[tb_UsersBySystem]  WITH CHECK ADD  CONSTRAINT [FK_UsersBySystem_UserByRole] FOREIGN KEY([RoleID])
REFERENCES [dbo].[tb_UserByRole] ([ID])
GO
ALTER TABLE [dbo].[tb_UsersBySystem] CHECK CONSTRAINT [FK_UsersBySystem_UserByRole]
GO
/****** Object:  StoredProcedure [dbo].[DBUpdate]    Script Date: 2020-01-08 12:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DBUpdate]
@TableName varchar(128)=null,
@SetField varchar(max)=null,
@WhereField varchar(max)='',
@AndField varchar(max)=''
AS
BEGIN
	if @TableName=null or @SetField=null
	begin
		return 0;
	end
	declare @UpdateSql varchar(max)
	set @UpdateSql='update '+@TableName+@SetField+@WhereField+@AndField;
	exec(@UpdateSql)
	return 1;
END

GO
/****** Object:  StoredProcedure [dbo].[SP_Get_RoleJoinColumn]    Script Date: 2020-01-08 12:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
create Procedure [dbo].[SP_Get_RoleJoinColumn]
@RoleID int=0
as
begin
	SELECT 
			A.ID,
			A.ColumnName,
			isnull(B.ID,0) as JoinID
	FROM [DB_BBS].[dbo].[tb_Column] as A
	left join 
		 [dbo].[tb_UserByRoleJoinColumn] as B on A.ID=B.ColumnID and B.RoleID=@RoleID
end

GO
/****** Object:  StoredProcedure [dbo].[SP_Get_UsersByCustomer_NotTargetForumArea]    Script Date: 2020-01-08 12:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[SP_Get_UsersByCustomer_NotTargetForumArea]
as
begin
	select  
		Customer.ID,
		Customer.UserName,
		Customer.NickName
	from [dbo].[tb_UsersByCustomer] as Customer
	left join
	[dbo].[tb_ForumArea] as Area on Customer.ID=Area.UserID
	where IsModerator=1 and Area.UserID is null
end

GO
/****** Object:  StoredProcedure [dbo].[SP_Get_UsersByCustomer_NotTargetForumClassify]    Script Date: 2020-01-08 12:16:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SP_Get_UsersByCustomer_NotTargetForumClassify]
as
begin
	select  
		Customer.ID,
		Customer.UserName,
		Customer.NickName
	from [dbo].[tb_UsersByCustomer] as Customer
	left join
	[dbo].[tb_ForumClassify] as Classify on Customer.ID=Classify.ForumUserID
	where IsModerator=1 and Classify.ForumUserID is null
end

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理菜单编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Column', @level2type=N'COLUMN',@level2name=N'ColumnCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理菜单名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Column', @level2type=N'COLUMN',@level2name=N'ColumnName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址Url' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Column', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'logo名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_Column', @level2type=N'COLUMN',@level2name=N'LogoClassName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区域编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumArea', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区域名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumArea', @level2type=N'COLUMN',@level2name=N'AreaName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumArea', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumClassify', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属区域编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumClassify', @level2type=N'COLUMN',@level2name=N'ForumAreaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类创建者编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumClassify', @level2type=N'COLUMN',@level2name=N'ForumUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumClassify', @level2type=N'COLUMN',@level2name=N'ClassifyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类logo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumClassify', @level2type=N'COLUMN',@level2name=N'ClassifyLogo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类内部logo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumClassify', @level2type=N'COLUMN',@level2name=N'ClassifyInnerLogo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类顺序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumClassify', @level2type=N'COLUMN',@level2name=N'ClassifyOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类是否为子分类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumClassify', @level2type=N'COLUMN',@level2name=N'ClassifyIsleaf'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自动编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumInfoStatus', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumInfoStatus', @level2type=N'COLUMN',@level2name=N'ForumMainID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumInfoStatus', @level2type=N'COLUMN',@level2name=N'ReplyNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'查看数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumInfoStatus', @level2type=N'COLUMN',@level2name=N'SeeNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后一次回复人编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumInfoStatus', @level2type=N'COLUMN',@level2name=N'LastReplyUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后一次回复时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumInfoStatus', @level2type=N'COLUMN',@level2name=N'LastReplytime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumMain', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumMain', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区域编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumMain', @level2type=N'COLUMN',@level2name=N'ForumAreaID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumMain', @level2type=N'COLUMN',@level2name=N'ForumClassifyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发帖人编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumMain', @level2type=N'COLUMN',@level2name=N'CreateUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发帖时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumMain', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发帖内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumMain', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否推荐' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumMain', @level2type=N'COLUMN',@level2name=N'IsRecommend'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumMain', @level2type=N'COLUMN',@level2name=N'Isdelete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否审查' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumMain', @level2type=N'COLUMN',@level2name=N'IsExamine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'点赞数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumMain', @level2type=N'COLUMN',@level2name=N'Zan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子类型编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumReport', @level2type=N'COLUMN',@level2name=N'ReportForumTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumReport', @level2type=N'COLUMN',@level2name=N'ForumID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审查时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumReport', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审查人编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumReport', @level2type=N'COLUMN',@level2name=N'CreateUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审查类型编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumReport', @level2type=N'COLUMN',@level2name=N'ReportTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审查明细' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumReport', @level2type=N'COLUMN',@level2name=N'ReportDetailContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回帖编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumSecond', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumSecond', @level2type=N'COLUMN',@level2name=N'ForumMainID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回帖内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumSecond', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回帖人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumSecond', @level2type=N'COLUMN',@level2name=N'CreateUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回帖时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumSecond', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大楼层' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumSecond', @level2type=N'COLUMN',@level2name=N'CurSequence'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复楼层' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumSecond', @level2type=N'COLUMN',@level2name=N'ReplySequenceID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ForumSecond', @level2type=N'COLUMN',@level2name=N'IsDelete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UserByRole', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UserByRole', @level2type=N'COLUMN',@level2name=N'RoleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自动编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UserByRoleJoinColumn', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UserByRoleJoinColumn', @level2type=N'COLUMN',@level2name=N'RoleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UserByRoleJoinColumn', @level2type=N'COLUMN',@level2name=N'ColumnID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersByCustomer', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersByCustomer', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersByCustomer', @level2type=N'COLUMN',@level2name=N'UserPassword'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersByCustomer', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersByCustomer', @level2type=N'COLUMN',@level2name=N'SexID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年龄' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersByCustomer', @level2type=N'COLUMN',@level2name=N'Age'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否版主' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersByCustomer', @level2type=N'COLUMN',@level2name=N'IsModerator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersByCustomer', @level2type=N'COLUMN',@level2name=N'PhotoUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersByCustomer', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发帖数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersByCustomer', @level2type=N'COLUMN',@level2name=N'Fatieshu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回帖数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersByCustomer', @level2type=N'COLUMN',@level2name=N'Huitieshu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版主编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersBySystem', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersBySystem', @level2type=N'COLUMN',@level2name=N'RoleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版主用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersBySystem', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版主昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersBySystem', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版主密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersBySystem', @level2type=N'COLUMN',@level2name=N'UserPassword'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版主邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_UsersBySystem', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子分类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ZY_ForumReportType', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'违禁类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ZY_ReportType', @level2type=N'COLUMN',@level2name=N'ReportType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'违禁内容说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ZY_ReportType', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ZY_Sex', @level2type=N'COLUMN',@level2name=N'Content'
GO
USE [master]
GO
ALTER DATABASE [DB_BBS] SET  READ_WRITE 
GO
