USE [master]
GO
/****** Object:  Database [RoadsOfRussia]    Script Date: 03.06.2024 11:57:03 ******/
CREATE DATABASE [RoadsOfRussia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RoadsofRussia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RoadsofRussia.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RoadsofRussia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RoadsofRussia_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RoadsOfRussia] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RoadsOfRussia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RoadsOfRussia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RoadsOfRussia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RoadsOfRussia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RoadsOfRussia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RoadsOfRussia] SET ARITHABORT OFF 
GO
ALTER DATABASE [RoadsOfRussia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RoadsOfRussia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RoadsOfRussia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RoadsOfRussia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RoadsOfRussia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RoadsOfRussia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RoadsOfRussia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RoadsOfRussia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RoadsOfRussia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RoadsOfRussia] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RoadsOfRussia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RoadsOfRussia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RoadsOfRussia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RoadsOfRussia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RoadsOfRussia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RoadsOfRussia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RoadsOfRussia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RoadsOfRussia] SET RECOVERY FULL 
GO
ALTER DATABASE [RoadsOfRussia] SET  MULTI_USER 
GO
ALTER DATABASE [RoadsOfRussia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RoadsOfRussia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RoadsOfRussia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RoadsOfRussia] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RoadsOfRussia] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RoadsOfRussia] SET QUERY_STORE = OFF
GO
USE [RoadsOfRussia]
GO
/****** Object:  Table [dbo].[CategoryFiles]    Script Date: 03.06.2024 11:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryFiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 03.06.2024 11:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NULL,
	[IdRole] [int] NOT NULL,
	[Workphone] [nvarchar](50) NULL,
	[Office] [nvarchar](50) NULL,
	[Photo] [varbinary](max) NULL,
	[IdTerritory] [int] NOT NULL,
	[Manager] [nvarchar](50) NULL,
	[Assistant] [nvarchar](50) NULL,
	[Telephone] [nvarchar](50) NULL,
	[E-mail] [nvarchar](50) NULL,
	[Other] [nvarchar](max) NULL,
	[Birthday] [date] NOT NULL,
	[NewsSubscription] [bit] NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 03.06.2024 11:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IdType] [int] NULL,
	[IdStatus] [int] NULL,
	[DateTime] [datetime] NOT NULL,
	[IdEmployee] [int] NULL,
	[Other] [nvarchar](max) NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Files]    Script Date: 03.06.2024 11:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Storage] [int] NOT NULL,
	[Comment] [nvarchar](50) NULL,
	[IdCategory] [int] NULL,
	[IdSatus] [int] NULL,
 CONSTRAINT [PK_File] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Librarys]    Script Date: 03.06.2024 11:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Librarys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdFile] [int] NOT NULL,
	[IdSection] [int] NULL,
 CONSTRAINT [PK_Library_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 03.06.2024 11:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Autor] [nvarchar](max) NULL,
	[Text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_New] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 03.06.2024 11:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sections]    Script Date: 03.06.2024 11:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sections](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Library] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusEvents]    Script Date: 03.06.2024 11:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusEvents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status Event] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusFiles]    Script Date: 03.06.2024 11:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusFiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status File] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusMaterials]    Script Date: 03.06.2024 11:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusMaterials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status Material] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Territorys]    Script Date: 03.06.2024 11:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Territorys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NameTerritory] [nvarchar](225) NOT NULL,
	[NameBranch] [nvarchar](225) NOT NULL,
	[NameDivision] [nvarchar](225) NOT NULL,
 CONSTRAINT [PK_Territory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeEvents]    Script Date: 03.06.2024 11:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeEvents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeMaterials]    Script Date: 03.06.2024 11:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeMaterials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Type Material] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сalendars]    Script Date: 03.06.2024 11:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сalendars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Strart Day] [date] NOT NULL,
	[End Day] [date] NOT NULL,
	[Reason] [nvarchar](50) NULL,
	[Id Employee] [int] NOT NULL,
 CONSTRAINT [PK_Day Off] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[СardofMaterials]    Script Date: 03.06.2024 11:57:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[СardofMaterials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[DateAssent] [datetime] NOT NULL,
	[DateUpdate] [datetime] NULL,
	[IdStatus] [int] NULL,
	[IdType] [int] NULL,
	[Area] [nvarchar](max) NULL,
	[IdEmloyee] [int] NOT NULL,
	[IdFile] [int] NULL,
 CONSTRAINT [PK_Сard of Material] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CategoryFiles] ON 

INSERT [dbo].[CategoryFiles] ([Id], [Name]) VALUES (1, N'Видеофайл')
INSERT [dbo].[CategoryFiles] ([Id], [Name]) VALUES (2, N'Графический файл')
INSERT [dbo].[CategoryFiles] ([Id], [Name]) VALUES (3, N'Текстовый файл')
INSERT [dbo].[CategoryFiles] ([Id], [Name]) VALUES (4, N'Звуковой файл')
INSERT [dbo].[CategoryFiles] ([Id], [Name]) VALUES (5, N'Файл базы данных')
SET IDENTITY_INSERT [dbo].[CategoryFiles] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([id], [Lastname], [Name], [Surname], [IdRole], [Workphone], [Office], [Photo], [IdTerritory], [Manager], [Assistant], [Telephone], [E-mail], [Other], [Birthday], [NewsSubscription], [Login], [Password]) VALUES (1, N'Иванов', N'Иван', N'Петрович', 1, N'', N'1', NULL, 1, N'', N'', N'', N'', N'', CAST(N'2000-12-12' AS Date), 0, N'1', N'11')
INSERT [dbo].[Employees] ([id], [Lastname], [Name], [Surname], [IdRole], [Workphone], [Office], [Photo], [IdTerritory], [Manager], [Assistant], [Telephone], [E-mail], [Other], [Birthday], [NewsSubscription], [Login], [Password]) VALUES (2, N'Сидоров', N'Петр', N'Иванович', 2, N'', N'48А', NULL, 2, N'', N'', N'', N'', N'', CAST(N'2000-11-12' AS Date), 1, N'2', N'22')
INSERT [dbo].[Employees] ([id], [Lastname], [Name], [Surname], [IdRole], [Workphone], [Office], [Photo], [IdTerritory], [Manager], [Assistant], [Telephone], [E-mail], [Other], [Birthday], [NewsSubscription], [Login], [Password]) VALUES (3, N'Петров', N'Никата', N'Максимович', 3, N'', N'48А', NULL, 2, N'', N'', N'', N'', N'', CAST(N'1990-02-13' AS Date), 0, N'3', N'33')
INSERT [dbo].[Employees] ([id], [Lastname], [Name], [Surname], [IdRole], [Workphone], [Office], [Photo], [IdTerritory], [Manager], [Assistant], [Telephone], [E-mail], [Other], [Birthday], [NewsSubscription], [Login], [Password]) VALUES (4, N'Петров', N'Антон', N'Сергеевич', 3, N'', N'50Т', NULL, 4, N'', N'', N'', N'', N'', CAST(N'1994-02-13' AS Date), 0, N'4', N'44')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([Id], [Name], [IdType], [IdStatus], [DateTime], [IdEmployee], [Other]) VALUES (1, N'Событие 1', 1, 1, CAST(N'2024-05-22T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Events] ([Id], [Name], [IdType], [IdStatus], [DateTime], [IdEmployee], [Other]) VALUES (3, N'Событие 2', 1, 1, CAST(N'2024-05-22T08:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Events] ([Id], [Name], [IdType], [IdStatus], [DateTime], [IdEmployee], [Other]) VALUES (4, N'Событие 3', 2, 3, CAST(N'2024-05-23T12:00:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Events] ([Id], [Name], [IdType], [IdStatus], [DateTime], [IdEmployee], [Other]) VALUES (6, N'Событие 4', 3, 3, CAST(N'2024-05-23T09:00:00.000' AS DateTime), 2, NULL)
SET IDENTITY_INSERT [dbo].[Events] OFF
GO
SET IDENTITY_INSERT [dbo].[Files] ON 

INSERT [dbo].[Files] ([Id], [Name], [Storage], [Comment], [IdCategory], [IdSatus]) VALUES (1, N'Файл1.avi', 100, N'Первый файл', 1, 1)
INSERT [dbo].[Files] ([Id], [Name], [Storage], [Comment], [IdCategory], [IdSatus]) VALUES (3, N'Файл2.png', 200, NULL, 2, 1)
INSERT [dbo].[Files] ([Id], [Name], [Storage], [Comment], [IdCategory], [IdSatus]) VALUES (4, N'Файл3.avi', 150, NULL, 1, 2)
INSERT [dbo].[Files] ([Id], [Name], [Storage], [Comment], [IdCategory], [IdSatus]) VALUES (5, N'Файл4.doc', 300, NULL, 3, 2)
INSERT [dbo].[Files] ([Id], [Name], [Storage], [Comment], [IdCategory], [IdSatus]) VALUES (7, N'Файл5.dbf', 250, NULL, 5, 1)
INSERT [dbo].[Files] ([Id], [Name], [Storage], [Comment], [IdCategory], [IdSatus]) VALUES (10, N'Файл6.doc', 180, NULL, 3, 1)
SET IDENTITY_INSERT [dbo].[Files] OFF
GO
SET IDENTITY_INSERT [dbo].[Librarys] ON 

INSERT [dbo].[Librarys] ([Id], [IdFile], [IdSection]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [dbo].[Librarys] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([Id], [Name], [Date], [Autor], [Text]) VALUES (1, N'Новость 1', CAST(N'2042-05-22T00:00:00.000' AS DateTime), N'Иванов И.И', N'Текст новости 1')
INSERT [dbo].[News] ([Id], [Name], [Date], [Autor], [Text]) VALUES (2, N'Новость 2', CAST(N'2024-05-22T00:00:00.000' AS DateTime), N'Петров П.П', N'Текст новости 2')
INSERT [dbo].[News] ([Id], [Name], [Date], [Autor], [Text]) VALUES (3, N'Новость 3', CAST(N'2024-05-22T00:00:00.000' AS DateTime), N'Сидоров С.И', N'Текст новости 3')
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([id], [Name]) VALUES (1, N'Контент-менеджер аппарата управления')
INSERT [dbo].[Roles] ([id], [Name]) VALUES (2, N'Системный администратор')
INSERT [dbo].[Roles] ([id], [Name]) VALUES (3, N'Администратор системы')
INSERT [dbo].[Roles] ([id], [Name]) VALUES (4, N'Редактор')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Sections] ON 

INSERT [dbo].[Sections] ([Id], [Name]) VALUES (1, N'Инвестиционный')
INSERT [dbo].[Sections] ([Id], [Name]) VALUES (2, N'Проектный')
SET IDENTITY_INSERT [dbo].[Sections] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusEvents] ON 

INSERT [dbo].[StatusEvents] ([Id], [Name]) VALUES (1, N'Проведено')
INSERT [dbo].[StatusEvents] ([Id], [Name]) VALUES (2, N'В процессе')
INSERT [dbo].[StatusEvents] ([Id], [Name]) VALUES (3, N'Начато')
INSERT [dbo].[StatusEvents] ([Id], [Name]) VALUES (4, N'Утверждено')
SET IDENTITY_INSERT [dbo].[StatusEvents] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusFiles] ON 

INSERT [dbo].[StatusFiles] ([Id], [Name]) VALUES (1, N'Неизменённый')
INSERT [dbo].[StatusFiles] ([Id], [Name]) VALUES (2, N'Изменённый')
INSERT [dbo].[StatusFiles] ([Id], [Name]) VALUES (3, N'Подготовленный к коммиту')
INSERT [dbo].[StatusFiles] ([Id], [Name]) VALUES (4, N'Неотслеживаемый')
SET IDENTITY_INSERT [dbo].[StatusFiles] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusMaterials] ON 

INSERT [dbo].[StatusMaterials] ([Id], [Name]) VALUES (1, N'Ободрен')
INSERT [dbo].[StatusMaterials] ([Id], [Name]) VALUES (2, N'Списан')
INSERT [dbo].[StatusMaterials] ([Id], [Name]) VALUES (3, N'В активном состоянии')
SET IDENTITY_INSERT [dbo].[StatusMaterials] OFF
GO
SET IDENTITY_INSERT [dbo].[Territorys] ON 

INSERT [dbo].[Territorys] ([Id], [NameTerritory], [NameBranch], [NameDivision]) VALUES (1, N'Кировская область', N'Кировский филиал №1', N'Администрация')
INSERT [dbo].[Territorys] ([Id], [NameTerritory], [NameBranch], [NameDivision]) VALUES (2, N'Кировская область', N'Кировский филиал №2', N'Администрация')
INSERT [dbo].[Territorys] ([Id], [NameTerritory], [NameBranch], [NameDivision]) VALUES (3, N'Кировская область', N'Кировский филиал №2', N'IT-отдел')
INSERT [dbo].[Territorys] ([Id], [NameTerritory], [NameBranch], [NameDivision]) VALUES (4, N'Московская область', N'Московский филиал №1', N'Администрация')
SET IDENTITY_INSERT [dbo].[Territorys] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeEvents] ON 

INSERT [dbo].[TypeEvents] ([Id], [Name]) VALUES (1, N'Общекорпоративные собрания')
INSERT [dbo].[TypeEvents] ([Id], [Name]) VALUES (2, N'Выездные проверки (контроль автомобильных дорог)')
INSERT [dbo].[TypeEvents] ([Id], [Name]) VALUES (3, N'Общекорпоративные культурные мероприятия')
INSERT [dbo].[TypeEvents] ([Id], [Name]) VALUES (4, N'Корпоративные PR-мероприятия')
INSERT [dbo].[TypeEvents] ([Id], [Name]) VALUES (5, N'Командировки сотрудников')
SET IDENTITY_INSERT [dbo].[TypeEvents] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeMaterials] ON 

INSERT [dbo].[TypeMaterials] ([Id], [Name]) VALUES (1, N'Библиографический указатель')
INSERT [dbo].[TypeMaterials] ([Id], [Name]) VALUES (2, N'Библиографический список')
INSERT [dbo].[TypeMaterials] ([Id], [Name]) VALUES (3, N'Библиографический обзор')
SET IDENTITY_INSERT [dbo].[TypeMaterials] OFF
GO
SET IDENTITY_INSERT [dbo].[Сalendars] ON 

INSERT [dbo].[Сalendars] ([Id], [Strart Day], [End Day], [Reason], [Id Employee]) VALUES (1, CAST(N'2024-05-10' AS Date), CAST(N'2024-05-15' AS Date), N'Обучение', 1)
INSERT [dbo].[Сalendars] ([Id], [Strart Day], [End Day], [Reason], [Id Employee]) VALUES (2, CAST(N'2024-05-12' AS Date), CAST(N'2024-05-24' AS Date), N'Обучение', 2)
INSERT [dbo].[Сalendars] ([Id], [Strart Day], [End Day], [Reason], [Id Employee]) VALUES (3, CAST(N'2024-05-22' AS Date), CAST(N'2024-05-23' AS Date), N'Невыход', 3)
INSERT [dbo].[Сalendars] ([Id], [Strart Day], [End Day], [Reason], [Id Employee]) VALUES (4, CAST(N'2024-05-10' AS Date), CAST(N'2024-05-24' AS Date), N'Невыход', 3)
SET IDENTITY_INSERT [dbo].[Сalendars] OFF
GO
SET IDENTITY_INSERT [dbo].[СardofMaterials] ON 

INSERT [dbo].[СardofMaterials] ([Id], [Name], [DateAssent], [DateUpdate], [IdStatus], [IdType], [Area], [IdEmloyee], [IdFile]) VALUES (1, N'Материал 1', CAST(N'2022-10-10T00:00:00.000' AS DateTime), NULL, 1, 1, NULL, 1, 1)
INSERT [dbo].[СardofMaterials] ([Id], [Name], [DateAssent], [DateUpdate], [IdStatus], [IdType], [Area], [IdEmloyee], [IdFile]) VALUES (2, N'Материал 2', CAST(N'2022-10-10T00:00:00.000' AS DateTime), NULL, 1, 2, NULL, 2, 1)
INSERT [dbo].[СardofMaterials] ([Id], [Name], [DateAssent], [DateUpdate], [IdStatus], [IdType], [Area], [IdEmloyee], [IdFile]) VALUES (3, N'Материал 3', CAST(N'2022-10-10T00:00:00.000' AS DateTime), NULL, 2, 2, NULL, 4, 1)
SET IDENTITY_INSERT [dbo].[СardofMaterials] OFF
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employee_Role]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Territory] FOREIGN KEY([IdTerritory])
REFERENCES [dbo].[Territorys] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employee_Territory]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Event_Employee] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employees] ([id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Event_Employee]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Event_Status Event] FOREIGN KEY([IdStatus])
REFERENCES [dbo].[StatusEvents] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Event_Status Event]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Event_Type Event] FOREIGN KEY([IdType])
REFERENCES [dbo].[TypeEvents] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Event_Type Event]
GO
ALTER TABLE [dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK_File_Category File] FOREIGN KEY([IdCategory])
REFERENCES [dbo].[CategoryFiles] ([Id])
GO
ALTER TABLE [dbo].[Files] CHECK CONSTRAINT [FK_File_Category File]
GO
ALTER TABLE [dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK_File_Status File] FOREIGN KEY([IdSatus])
REFERENCES [dbo].[StatusFiles] ([Id])
GO
ALTER TABLE [dbo].[Files] CHECK CONSTRAINT [FK_File_Status File]
GO
ALTER TABLE [dbo].[Librarys]  WITH CHECK ADD  CONSTRAINT [FK_Library_File] FOREIGN KEY([IdFile])
REFERENCES [dbo].[Files] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Librarys] CHECK CONSTRAINT [FK_Library_File]
GO
ALTER TABLE [dbo].[Librarys]  WITH CHECK ADD  CONSTRAINT [FK_Library_Section] FOREIGN KEY([IdSection])
REFERENCES [dbo].[Sections] ([Id])
GO
ALTER TABLE [dbo].[Librarys] CHECK CONSTRAINT [FK_Library_Section]
GO
ALTER TABLE [dbo].[Сalendars]  WITH CHECK ADD  CONSTRAINT [FK_Сalendar_Employee] FOREIGN KEY([Id Employee])
REFERENCES [dbo].[Employees] ([id])
GO
ALTER TABLE [dbo].[Сalendars] CHECK CONSTRAINT [FK_Сalendar_Employee]
GO
ALTER TABLE [dbo].[СardofMaterials]  WITH CHECK ADD  CONSTRAINT [FK_Сard of Material_Employee] FOREIGN KEY([IdEmloyee])
REFERENCES [dbo].[Employees] ([id])
GO
ALTER TABLE [dbo].[СardofMaterials] CHECK CONSTRAINT [FK_Сard of Material_Employee]
GO
ALTER TABLE [dbo].[СardofMaterials]  WITH CHECK ADD  CONSTRAINT [FK_Сard of Material_Status Material] FOREIGN KEY([IdStatus])
REFERENCES [dbo].[StatusMaterials] ([Id])
GO
ALTER TABLE [dbo].[СardofMaterials] CHECK CONSTRAINT [FK_Сard of Material_Status Material]
GO
ALTER TABLE [dbo].[СardofMaterials]  WITH CHECK ADD  CONSTRAINT [FK_Сard of Material_Type Material] FOREIGN KEY([IdType])
REFERENCES [dbo].[TypeMaterials] ([Id])
GO
ALTER TABLE [dbo].[СardofMaterials] CHECK CONSTRAINT [FK_Сard of Material_Type Material]
GO
ALTER TABLE [dbo].[СardofMaterials]  WITH CHECK ADD  CONSTRAINT [FK_СardofMaterial_File] FOREIGN KEY([IdFile])
REFERENCES [dbo].[Files] ([Id])
GO
ALTER TABLE [dbo].[СardofMaterials] CHECK CONSTRAINT [FK_СardofMaterial_File]
GO
USE [master]
GO
ALTER DATABASE [RoadsOfRussia] SET  READ_WRITE 
GO
