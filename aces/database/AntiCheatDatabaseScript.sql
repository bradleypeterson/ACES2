USE [master]
GO
/****** Object:  Database [AntiCheat]    Script Date: 8/12/2021 9:33:52 AM ******/
CREATE DATABASE [AntiCheat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AntiCheat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2\MSSQL\DATA\AntiCheat.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AntiCheat_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2\MSSQL\DATA\AntiCheat_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AntiCheat] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AntiCheat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AntiCheat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AntiCheat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AntiCheat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AntiCheat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AntiCheat] SET ARITHABORT OFF 
GO
ALTER DATABASE [AntiCheat] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AntiCheat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AntiCheat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AntiCheat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AntiCheat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AntiCheat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AntiCheat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AntiCheat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AntiCheat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AntiCheat] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AntiCheat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AntiCheat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AntiCheat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AntiCheat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AntiCheat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AntiCheat] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AntiCheat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AntiCheat] SET RECOVERY FULL 
GO
ALTER DATABASE [AntiCheat] SET  MULTI_USER 
GO
ALTER DATABASE [AntiCheat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AntiCheat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AntiCheat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AntiCheat] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AntiCheat] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AntiCheat', N'ON'
GO
ALTER DATABASE [AntiCheat] SET QUERY_STORE = OFF
GO
USE [AntiCheat]
GO
/****** Object:  User [AntiCheat]    Script Date: 8/12/2021 9:33:52 AM ******
CREATE USER [AntiCheat] FOR LOGIN [AntiCheat] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [AntiCheat]
GO */
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/12/2021 9:33:52 AM ******/
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
/****** Object:  Table [dbo].[Assignment]    Script Date: 8/12/2021 9:33:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[RepositoryUrl] [nvarchar](max) NULL,
	[JSONCode] [nvarchar](max) NULL,
	[CourseId] [int] NOT NULL,
	[CanvasLink] [nvarchar](max) NULL,
	[DueDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Assignment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 8/12/2021 9:33:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](max) NULL,
	[InstructorId] [int] NOT NULL,
	[IsCourseActive] [bit] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 8/12/2021 9:33:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_Enrollment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 8/12/2021 9:33:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Salt] [nvarchar](max) NULL,
	[IsLoggedIn] [bit] NOT NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Results]    Script Date: 8/12/2021 9:33:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Results](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentAssignmentId] [int] NOT NULL,
	[DateCommitted] [datetime2](7) NOT NULL,
	[JSONCode] [nvarchar](max) NULL,
 CONSTRAINT [PK_Commit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 8/12/2021 9:33:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Salt] [nvarchar](max) NULL,
	[IsLoggedIn] [bit] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentAssignment]    Script Date: 8/12/2021 9:33:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAssignment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[AssignmentId] [int] NOT NULL,
	[RepositoryUrl] [nvarchar](max) NULL,
	[JSONCode] [nvarchar](max) NULL,
 CONSTRAINT [PK_StudentAssignment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Watermarks]    Script Date: 8/12/2021 9:33:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Watermarks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Watermark] [nvarchar](255) NOT NULL,
	[StudentID] [int] NOT NULL,
	[AssignmentID] [int] NOT NULL,
	[FileName] [nvarchar](255) NOT NULL,
	[StudentRepoName] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210613020300_UpdateWithJSON', N'3.1.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210613022422_UpdateCommit', N'3.1.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210613023207_UpdateStudentAssignments', N'3.1.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210613162754_removedCodeAndPoints', N'3.1.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210621233142_UpdatingCourseTable', N'3.1.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210624143121_AssignmentModelUpdate', N'3.1.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210704161231_updateCommit2', N'3.1.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210704170232_moveActiveFromEnrollment2Course', N'3.1.6')
SET IDENTITY_INSERT [dbo].[Assignment] ON 

INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (1, N'Stacks and Queues', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "comment": "Assignment 1: Stacks and Queues", "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 25, N'http://localhost:61946/?aID=1', CAST(N'2021-07-28T18:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (2, N'Linked Lists Intro', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "replaceInsteadOfInsert": 1, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 25, N'http://localhost:61946/?aID=2', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (3, N'Linked List Generalized Methods', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 25, N'http://localhost:61946/?aID=3', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (4, N'Linked List Iterators', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "comment": "Assignment 4: Linked List Iterators", "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "comment": "Assignment 4: Linked List Iterators", "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 25, N'http://localhost:61946/?aID=4', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (5, N'Hash Tables with Iterators', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 25, N'http://localhost:61946/?aID=5', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (6, N'Single Threaded Bucket Sort', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 25, N'http://localhost:61946/?aID=6', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (7, N'Multithreaded Bucket Sort', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 25, N'http://localhost:61946/?aID=7', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (8, N'Binary Tree Recursion', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 25, N'http://localhost:61946/?aID=8', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (9, N'Binary Tree Calculator', N'https://github.com/AntiCheatSummer2021/Template1', N'{
  "files": [
    {
      "name": "add.c",
      "lines": 14,
      "whitespaces": [
        6,
        9
      ],
      "randomstring": [
        2,
        13
      ]
    },
    {
      "name": "b.c",
      "lines": 7,
      "whitespaces": [
        2
      ],
      "randomstring": [
        6
      ]
    },
    {
      "name": "e.c",
      "lines": 2,
      "whitespaces": [],
      "randomstring": [
        1
      ]
    }
  ]
}', 25, N'http://localhost:61946/?aID=9', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (10, N'Single Threaded Bucket Sort', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 25, N'http://localhost:61946/?aID=10', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (11, N'Number Guessing Game', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "comment": "this is a test comment", "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "comment": "another test", "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 2, N'http://localhost:61946/?aID=11', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (12, N'SignalR Project', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "comment": "signal project", "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 2, N'http://localhost:61946/?aID=12', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (13, N'Introduction to C and Pointers', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 3, N'http://localhost:61946/?aID=13', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (14, N'XV6 Introduction', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 3, N'http://localhost:61946/?aID=14', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (15, N'Forks', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 3, N'http://localhost:61946/?aID=15', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (16, N'System Calls', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 3, N'http://localhost:61946/?aID=16', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (17, N'XV6 Scheduler', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 3, N'http://localhost:61946/?aID=17', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (18, N'PThreads introduction', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 3, N'http://localhost:61946/?aID=18', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (19, N'PThreads and Sloppy Counter', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 3, N'http://localhost:61946/?aID=19', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (20, N'Hello World', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 4, N'http://localhost:61946/?aID=20', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (21, N'Search and Report', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 4, N'http://localhost:61946/?aID=21', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (22, N'Failed Login Report', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 4, N'http://localhost:61946/?aID=22', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (23, N'Temperature Converter', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 4, N'http://localhost:61946/?aID=23', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (24, N'Database Loader', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 4, N'http://localhost:61946/?aID=24', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (25, N'Filemaker', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 4, N'http://localhost:61946/?aID=25', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (26, N'Flashlight', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 5, N'http://localhost:61946/?aID=26', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (27, N'Bowling Scores', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 5, N'http://localhost:61946/?aID=27', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (28, N'Course Catalog', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 5, N'http://localhost:61946/?aID=28', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (29, N'Inventory', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 5, N'http://localhost:61946/?aID=29', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (30, N'Inventory with Data', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 5, N'http://localhost:61946/?aID=30', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (31, N'Final Project', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 5, N'http://localhost:61946/?aID=31', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (32, N'Testing', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 6, N'http://localhost:61946/?aID=32', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (35, N'ACES2 test assignment', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 25, N'http://localhost:61946/?aID=35', CAST(N'2021-06-24T09:49:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (37, N'ACES Test Assignment 2', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 2, N'http://localhost:61946/?aID=37', CAST(N'2021-07-04T10:41:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (38, N'4110 test assignment', N'https://github.com/AntiCheatSummer2021/Template1', N'{
  "files": [
    {
      "name": "add.c",
      "lines": 14,
      "whitespaces": [
        6,
        9,
        11
      ],
      "randomstring": [
        2,
        13
      ]
    },
    {
      "name": "b.c",
      "lines": 7,
      "whitespaces": [
        2
      ],
      "randomstring": [
        6
      ]
    },
    {
      "name": "e.c",
      "lines": 2,
      "whitespaces": [],
      "randomstring": [
        1
      ]
    }
  ]
}', 15, N'http://localhost:61946/?aID=38', CAST(N'2021-07-04T18:07:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (39, N'4110 test assignment2', N'github', N'{ "files": [ { "name":"add.c", "lines": 14, "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 15, N'http://localhost:61946/?aID=39', CAST(N'2021-07-04T18:19:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (46, N'4110 Formal Language Assignment 1', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "comment": "Assignment 1: Stacks and Queues", "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 21, N'http://localhost:61946/?aID=46', CAST(N'2021-08-19T23:59:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (47, N'CS 3750 Test Assignment 99', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "comment": "Assignment 1: Stacks and Queues", "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 2, N'http://localhost:61946/?aID=47', CAST(N'2021-08-20T23:59:00.0000000' AS DateTime2))
INSERT [dbo].[Assignment] ([Id], [Name], [RepositoryUrl], [JSONCode], [CourseId], [CanvasLink], [DueDate]) VALUES (48, N'CS 4450 Assignment 01', N'https://github.com/AntiCheatSummer2021/Template1', N'{ "files": [ { "name":"add.c", "lines": 14, "comment": "Assignment 1: Stacks and Queues", "whitespaces": [6,9,11], "randomstring": [2,13] }, { "name":"b.c", "lines": 7, "whitespaces": [2], "randomstring": [6]}, { "name":"e.c", "lines": 2, "whitespaces": [], "randomstring": [1] } ] }', 1037, N'http://localhost:61946/?aID=48', CAST(N'2021-08-20T23:59:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Assignment] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (2, N'CS 3750', 1, 1)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (3, N'CS 3100', 2, 1)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (4, N'CS 3030', 3, 1)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (5, N'CS 3260', 3, 1)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (6, N'CS 8378', 6, 1)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (7, N'CS 4269', 4, 1)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (8, N'CS 4269', 4, 1)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (15, N'CS 4110', 1, 1)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (20, N'CS 4110 Online', 1, 0)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (21, N'CS 4110 MTW 7:30', 1, 1)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (22, N'CS 2420a', 1, 1)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (25, N'CS 2420', 1, 1)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (1023, N'CS 4790', 5, 0)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (1024, N'Demo Course', 1, 0)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (1025, N'CS123456', 1, 0)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (1026, N'New Course', 1, 0)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (1027, N'bleh', 1, 0)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (1028, N'CS 1111 New Course', 1, 0)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (1029, N'New Course2', 1, 0)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (1030, N'New Course22', 1, 0)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (1031, N'New Course222', 1, 0)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (1032, N'New Course2222', 1, 0)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (1033, N'test', 1, 0)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (1034, N'bleh', 1, 0)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (1035, N'bleh', 1, 0)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (1036, N'TestCourse ACES2 Brad', 1, 0)
INSERT [dbo].[Course] ([Id], [CourseName], [InstructorId], [IsCourseActive]) VALUES (1037, N'CS 4450', 1, 1)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Enrollment] ON 

INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (1, 1, 25)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (2, 1, 2)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (3, 1, 3)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (4, 1, 4)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (5, 1, 5)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (6, 2, 25)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (7, 2, 2)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (8, 2, 3)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (9, 2, 4)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (10, 2, 5)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (11, 3, 25)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (12, 3, 2)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (13, 3, 3)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (14, 3, 4)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (15, 3, 5)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (16, 4, 25)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (17, 4, 2)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (18, 4, 3)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (19, 4, 4)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (20, 4, 5)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (21, 7, 6)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (24, 8, 25)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (25, 9, 25)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (26, 6, 2)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (28, 10, 25)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (29, 7, 25)
INSERT [dbo].[Enrollment] ([Id], [StudentId], [CourseId]) VALUES (30, 6, 25)
SET IDENTITY_INSERT [dbo].[Enrollment] OFF
SET IDENTITY_INSERT [dbo].[Instructor] ON 

INSERT [dbo].[Instructor] ([Id], [FirstName], [LastName], [Email], [Password], [Salt], [IsLoggedIn]) VALUES (1, N'Brad', N'Peterson', N'bradleypeterson@weber.edu', N'A00BD61B115B108033CBC507F0CEF15D3039E255E0BF48BB726E28DF98FF65CF', N'EADB5746-D556-4635-B379-ED5A56A1CE26', 1)
INSERT [dbo].[Instructor] ([Id], [FirstName], [LastName], [Email], [Password], [Salt], [IsLoggedIn]) VALUES (2, N'Mark', N'Huson', N'markhuson@weber.edu', N'31594BFBE50E5AC948AAA900D038818BD4324E6FE936B13D6648D9AEC7F4C832', N'13F2D33D-6645-47EA-891B-A8B342BCD664', 0)
INSERT [dbo].[Instructor] ([Id], [FirstName], [LastName], [Email], [Password], [Salt], [IsLoggedIn]) VALUES (3, N'Ted', N'Cowan', N'tedcowan@weber.edu', N'7EE350D479133C4FD632FFA3E94695AD737A3A35AACDB959C7277D6FFEDEA14B', N'06CE52C9-B457-4D45-BD27-0736E9FC0691', 0)
INSERT [dbo].[Instructor] ([Id], [FirstName], [LastName], [Email], [Password], [Salt], [IsLoggedIn]) VALUES (4, N'Prof', N'Esor', N'professor@gmail.com', N'a559facb1f847507a5f0d4426964eea8c59256f64eb133710d9adf03f170acd3', N'1851gfgg902cmqxdlu7vmx7l-vk6mt6lz4gq', 1)
INSERT [dbo].[Instructor] ([Id], [FirstName], [LastName], [Email], [Password], [Salt], [IsLoggedIn]) VALUES (5, N'Bat', N'Man', N'batman@weber.edu', N'eea9512263bb99ce2e1c1d4e92532b62769ebb2f493105f25c1ba5bf6721686e', N'je1dissdwklh50prv62y3ufxxceahbrvtzx8', 1)
SET IDENTITY_INSERT [dbo].[Instructor] OFF
SET IDENTITY_INSERT [dbo].[Results] ON 

INSERT [dbo].[Results] ([Id], [StudentAssignmentId], [DateCommitted], [JSONCode]) VALUES (1, 1, CAST(N'2019-09-01T07:50:46.0000000' AS DateTime2), NULL)
INSERT [dbo].[Results] ([Id], [StudentAssignmentId], [DateCommitted], [JSONCode]) VALUES (2, 1, CAST(N'2019-12-25T17:39:22.0000000' AS DateTime2), NULL)
INSERT [dbo].[Results] ([Id], [StudentAssignmentId], [DateCommitted], [JSONCode]) VALUES (3, 3, CAST(N'2020-02-06T10:19:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Results] ([Id], [StudentAssignmentId], [DateCommitted], [JSONCode]) VALUES (4, 2, CAST(N'2019-08-28T14:59:05.0000000' AS DateTime2), NULL)
INSERT [dbo].[Results] ([Id], [StudentAssignmentId], [DateCommitted], [JSONCode]) VALUES (5, 5, CAST(N'2019-09-13T12:30:52.0000000' AS DateTime2), NULL)
INSERT [dbo].[Results] ([Id], [StudentAssignmentId], [DateCommitted], [JSONCode]) VALUES (6, 8, CAST(N'2020-04-22T06:43:45.0000000' AS DateTime2), NULL)
INSERT [dbo].[Results] ([Id], [StudentAssignmentId], [DateCommitted], [JSONCode]) VALUES (7, 9, CAST(N'2020-12-01T19:22:29.0000000' AS DateTime2), NULL)
INSERT [dbo].[Results] ([Id], [StudentAssignmentId], [DateCommitted], [JSONCode]) VALUES (8, 4, CAST(N'2020-10-05T18:55:58.0000000' AS DateTime2), NULL)
INSERT [dbo].[Results] ([Id], [StudentAssignmentId], [DateCommitted], [JSONCode]) VALUES (9, 5, CAST(N'2020-12-23T13:20:07.0000000' AS DateTime2), NULL)
INSERT [dbo].[Results] ([Id], [StudentAssignmentId], [DateCommitted], [JSONCode]) VALUES (10, 5, CAST(N'2021-01-08T14:17:34.0000000' AS DateTime2), NULL)
INSERT [dbo].[Results] ([Id], [StudentAssignmentId], [DateCommitted], [JSONCode]) VALUES (11, 6, CAST(N'2020-01-03T08:20:47.0000000' AS DateTime2), NULL)
INSERT [dbo].[Results] ([Id], [StudentAssignmentId], [DateCommitted], [JSONCode]) VALUES (12, 7, CAST(N'2020-12-05T04:53:03.0000000' AS DateTime2), NULL)
INSERT [dbo].[Results] ([Id], [StudentAssignmentId], [DateCommitted], [JSONCode]) VALUES (52, 1027, CAST(N'2021-07-28T17:43:06.0000000' AS DateTime2), N'{"watermarks":3,"ogWatermarks":3,"whitespaces":2,"ogWhitespaces":2,"NumberOfCommits":5,"LinesAdded":23,"LinesDeleted":15,"AverageTimespanTicks":4356175000000,"OtherWatermark":"none","WatermarkMatchID":0}')
INSERT [dbo].[Results] ([Id], [StudentAssignmentId], [DateCommitted], [JSONCode]) VALUES (53, 1029, CAST(N'2021-08-11T19:01:35.0000000' AS DateTime2), N'{"watermarks":4,"ogWatermarks":4,"whitespaces":4,"ogWhitespaces":4,"NumberOfCommits":40,"LinesAdded":137,"LinesDeleted":134,"AverageTimespanTicks":23511025641,"OtherWatermark":"none","WatermarkMatchID":0}')
INSERT [dbo].[Results] ([Id], [StudentAssignmentId], [DateCommitted], [JSONCode]) VALUES (54, 1030, CAST(N'2021-08-09T17:49:24.0000000' AS DateTime2), N'{"watermarks":3,"ogWatermarks":4,"whitespaces":4,"ogWhitespaces":4,"NumberOfCommits":40,"LinesAdded":131,"LinesDeleted":121,"AverageTimespanTicks":154955641026,"OtherWatermark":"5f8ef3a9f28a139708445d6bed4220a7519b29c284e2d6f825a02169210d646d","WatermarkMatchID":7}')
INSERT [dbo].[Results] ([Id], [StudentAssignmentId], [DateCommitted], [JSONCode]) VALUES (55, 1031, CAST(N'2021-07-28T18:04:07.0000000' AS DateTime2), N'{"watermarks":4,"ogWatermarks":4,"whitespaces":4,"ogWhitespaces":4,"NumberOfCommits":23,"LinesAdded":89,"LinesDeleted":46,"AverageTimespanTicks":15346363636,"OtherWatermark":"none","WatermarkMatchID":0}')
INSERT [dbo].[Results] ([Id], [StudentAssignmentId], [DateCommitted], [JSONCode]) VALUES (56, 1026, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'{"watermarks":0,"ogWatermarks":0,"whitespaces":0,"ogWhitespaces":0,"NumberOfCommits":0,"LinesAdded":0,"LinesDeleted":0,"AverageTimespanTicks":0,"OtherWatermark":"none","WatermarkMatchID":0}')
INSERT [dbo].[Results] ([Id], [StudentAssignmentId], [DateCommitted], [JSONCode]) VALUES (57, 15, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'{"watermarks":0,"ogWatermarks":0,"whitespaces":0,"ogWhitespaces":0,"NumberOfCommits":0,"LinesAdded":0,"LinesDeleted":0,"AverageTimespanTicks":0,"OtherWatermark":"none","WatermarkMatchID":0}')
SET IDENTITY_INSERT [dbo].[Results] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [FirstName], [LastName], [Email], [Password], [Salt], [IsLoggedIn]) VALUES (1, N'Joshua', N'Abbott', N'joshuaabbott@mail.weber.edu', N'E159F2A3C0911B96E162F4D54EA91E627D33C62EB65333577A5A31622D3C2429', N'8ddf7a3f-3a4f-456f-8f4d-dd616920837b', 1)
INSERT [dbo].[Student] ([Id], [FirstName], [LastName], [Email], [Password], [Salt], [IsLoggedIn]) VALUES (2, N'Logan', N'Rios', N'loganrios@mail.weber.edu', N'0A52F4C6B3C27C72660849CFBD351D6E0BE4EB0BB2BC9BB78DF4F1BB1D430774', N'46837f64-b58c-4570-aa88-1394009e4c84', 0)
INSERT [dbo].[Student] ([Id], [FirstName], [LastName], [Email], [Password], [Salt], [IsLoggedIn]) VALUES (3, N'Morgan', N'Jensen', N'morganjensen@mail.weber.edu', N'FCD2955C5F398055CAB83DA192C9DC6DB57CA5A54F26B1EEF4D3078A66178CA6', N'47141bac-68d2-48a3-8bc6-385a6a4680ab', 0)
INSERT [dbo].[Student] ([Id], [FirstName], [LastName], [Email], [Password], [Salt], [IsLoggedIn]) VALUES (4, N'Tanner', N'Law', N'tannerlaw@mail.weber.edu', N'68EBA8EED3669998B6D1E755E2B003BECD4E947236880A33D220615511C61887', N'5cf65683-df41-4d2f-a178-12625f451380', 1)
INSERT [dbo].[Student] ([Id], [FirstName], [LastName], [Email], [Password], [Salt], [IsLoggedIn]) VALUES (6, N'Tucker', N'Garner', N'tuckergarner@mail.weber.edu', N'2e863cac603bb070ce06247e73a986723f7b86f825eef526137fdaa82faa1f47', N't4o0esivnv9hs1pe0m13065z398vlz78jdqx', 1)
INSERT [dbo].[Student] ([Id], [FirstName], [LastName], [Email], [Password], [Salt], [IsLoggedIn]) VALUES (7, N'Dylan', N'Thomas', N'dylanthomas1@mail.weber.edu', N'cf511ff03b5840c0a3e14000a310c99e0597ccec388529660980ebdcca14c740', N'svg4emnbjvetb-c738y698-i2kuvw2hwwkfb', 1)
INSERT [dbo].[Student] ([Id], [FirstName], [LastName], [Email], [Password], [Salt], [IsLoggedIn]) VALUES (8, N'Jeff', N'Bridges', N'jBridges', N'24980fcf9d83616b8a56bc10cbfa95f0a4e060bdcfd73b93cc377d95dbe22488', N'hzmaefdee8up-u57l2874d51zow3wq97bpdq', 0)
INSERT [dbo].[Student] ([Id], [FirstName], [LastName], [Email], [Password], [Salt], [IsLoggedIn]) VALUES (9, N'Eric', N'Peterson', N'ericpeterson@mail.weber.edu', N'6f481c3d8a4a0bec4ce417184257ea8e816ecad887afc335047fd0e157a25ff8', N'hgcm7vg89g3i56n35sga503q7d37yv3ypm85', 1)
INSERT [dbo].[Student] ([Id], [FirstName], [LastName], [Email], [Password], [Salt], [IsLoggedIn]) VALUES (10, N'Jesse', N'Taylor', N'jessetaylor2@mail.weber.edu', N'70480a61ad0982b0b5b73ae6fd74aacd760d26ed7f0e5dde5940b906e9633718', N'z0lh076zqn-y3elcl6qr6mzfeuev9r4pd7ln', 1)
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[StudentAssignment] ON 

INSERT [dbo].[StudentAssignment] ([Id], [StudentId], [AssignmentId], [RepositoryUrl], [JSONCode]) VALUES (15, 1, 2, N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh', N'{"files":[{"fileName":"add.c","numberOfLinesInFile":14,"watermark":"58b4989f3cd9fdf09f9a58b1d09d0ec7e3002d57296013229c6786a76f3c9104","numberOfWhitespaceCharacters":12,"whitespacesLineNumbers":[6,9,11],"randomStringLineNumbers":[2,13]},{"fileName":"b.c","numberOfLinesInFile":7,"watermark":"8880f48132cd3c5def2239977b14d825b64bf22a5bc0631e313f48517771adb5","numberOfWhitespaceCharacters":29,"whitespacesLineNumbers":[2],"randomStringLineNumbers":[6]},{"fileName":"e.c","numberOfLinesInFile":2,"watermark":"b1d0835d4e998a59ae2d72afa198c43c876abb2a2f9126961b270c41d256e623","numberOfWhitespaceCharacters":28,"whitespacesLineNumbers":[],"randomStringLineNumbers":[1]}]}')
INSERT [dbo].[StudentAssignment] ([Id], [StudentId], [AssignmentId], [RepositoryUrl], [JSONCode]) VALUES (1013, 1, 10, N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh', N'{"files":[{"fileName":"add.c","numberOfLinesInFile":14,"watermark":"28c372547ac8c604158c7bf4c8f56bb56fee1a26b8cce3af41cc79cff40f6344","numberOfWhitespaceCharacters":20,"whitespacesLineNumbers":[6,9,11],"randomStringLineNumbers":[2,13]},{"fileName":"b.c","numberOfLinesInFile":7,"watermark":"a8db935d3ecdbb29a8fd0da262065f73b374f6bd8a64f2f30e28af0e0ce67a4a","numberOfWhitespaceCharacters":0,"whitespacesLineNumbers":[2],"randomStringLineNumbers":[6]},{"fileName":"e.c","numberOfLinesInFile":2,"watermark":"6a22dd985af6eeeb801594ad2cfa663ebbeba79f909b7f9da4126b0c1092bb97","numberOfWhitespaceCharacters":17,"whitespacesLineNumbers":[],"randomStringLineNumbers":[1]}]}')
INSERT [dbo].[StudentAssignment] ([Id], [StudentId], [AssignmentId], [RepositoryUrl], [JSONCode]) VALUES (1014, 1, 3, N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh', N'{"files":[{"fileName":"add.c","numberOfLinesInFile":14,"watermark":"a693a07d76d41210f13959f4971532574f739ffbb66a600190d9cda50e568347","numberOfWhitespaceCharacters":4,"whitespacesLineNumbers":[6,9,11],"randomStringLineNumbers":[2,13]},{"fileName":"b.c","numberOfLinesInFile":7,"watermark":"c9f6b4d4e35d9861e05643d4b2863133a4bcbc7cc5a41041fd68c12cbdbe2986","numberOfWhitespaceCharacters":24,"whitespacesLineNumbers":[2],"randomStringLineNumbers":[6]},{"fileName":"e.c","numberOfLinesInFile":2,"watermark":"1d423129a222a76a2374b67a1ee81df5f3606b4a64f36dc56ad3a0c69f3b9287","numberOfWhitespaceCharacters":17,"whitespacesLineNumbers":[],"randomStringLineNumbers":[1]}]}')
INSERT [dbo].[StudentAssignment] ([Id], [StudentId], [AssignmentId], [RepositoryUrl], [JSONCode]) VALUES (1021, 1, 13, N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh', N'{"files":[{"fileName":"add.c","numberOfLinesInFile":14,"watermark":"c9531c5e7697d205f1f187ea3c91e104c63e8a9b6c13ed774f65e6c0d6b64136","numberOfWhitespaceCharacters":24,"whitespacesLineNumbers":[6,9,11],"randomStringLineNumbers":[2,13]},{"fileName":"b.c","numberOfLinesInFile":7,"watermark":"75a7270e94169b59906dc57fd71b508babed741ffe15df5404723eb9a7b39ffa","numberOfWhitespaceCharacters":24,"whitespacesLineNumbers":[2],"randomStringLineNumbers":[6]},{"fileName":"e.c","numberOfLinesInFile":2,"watermark":"b80e36d669ed48767400018321d36fc9360cd80094ef65d17054d14f16a08f70","numberOfWhitespaceCharacters":11,"whitespacesLineNumbers":[],"randomStringLineNumbers":[1]}]}')
INSERT [dbo].[StudentAssignment] ([Id], [StudentId], [AssignmentId], [RepositoryUrl], [JSONCode]) VALUES (1022, 1, 25, N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh', N'{"files":[{"fileName":"add.c","numberOfLinesInFile":14,"watermark":"b20baaa93efc760fab254015b59f38f14b84308ad7226aac75141bfc773c5d5f","numberOfWhitespaceCharacters":13,"whitespacesLineNumbers":[6,9,11],"randomStringLineNumbers":[2,13]},{"fileName":"b.c","numberOfLinesInFile":7,"watermark":"c42dbfac0ec21b23434acf228d1ff71c3b07c94f227bf664235c867a9e12d0ef","numberOfWhitespaceCharacters":12,"whitespacesLineNumbers":[2],"randomStringLineNumbers":[6]},{"fileName":"e.c","numberOfLinesInFile":2,"watermark":"d84e8334ed373e47d996f5030e2d3efed1d763f983e425b2cc71cacaaab539c0","numberOfWhitespaceCharacters":11,"whitespacesLineNumbers":[],"randomStringLineNumbers":[1]}]}')
INSERT [dbo].[StudentAssignment] ([Id], [StudentId], [AssignmentId], [RepositoryUrl], [JSONCode]) VALUES (1023, 2, 26, N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh', N'{"files":[{"fileName":"add.c","numberOfLinesInFile":14,"watermark":"d14239414bcb8a05873def837858343d01c933b86f4f6db7b961c976f7ac597b","numberOfWhitespaceCharacters":2,"whitespacesLineNumbers":[6,9,11],"randomStringLineNumbers":[2,13]},{"fileName":"b.c","numberOfLinesInFile":7,"watermark":"0e493ceced2795626929a5391dbda1dc6da42515d11d778e241b74ca398cf5bf","numberOfWhitespaceCharacters":0,"whitespacesLineNumbers":[2],"randomStringLineNumbers":[6]},{"fileName":"e.c","numberOfLinesInFile":2,"watermark":"731e8086ef26dc7528f1d5bf1a02400959d4f80a00e507f1340e0f81577e610e","numberOfWhitespaceCharacters":4,"whitespacesLineNumbers":[],"randomStringLineNumbers":[1]}]}')
INSERT [dbo].[StudentAssignment] ([Id], [StudentId], [AssignmentId], [RepositoryUrl], [JSONCode]) VALUES (1024, 2, 15, N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh', N'{"files":[{"fileName":"add.c","numberOfLinesInFile":14,"watermark":"c2e06603ef6d7f524fabac8f868cc04f63c6f5ed2a5eb8e380cdc86a996d259c","numberOfWhitespaceCharacters":4,"whitespacesLineNumbers":[6,9,11],"randomStringLineNumbers":[2,13]},{"fileName":"b.c","numberOfLinesInFile":7,"watermark":"b5cd8a7290087be5f8c478e59806b95effecd7d15dd244f4dc65b852b4445426","numberOfWhitespaceCharacters":22,"whitespacesLineNumbers":[2],"randomStringLineNumbers":[6]},{"fileName":"e.c","numberOfLinesInFile":2,"watermark":"9a3b6e758b950901dc8b3d5dd634529a81a4a80335b9f1e5b313186b35a1968e","numberOfWhitespaceCharacters":0,"whitespacesLineNumbers":[],"randomStringLineNumbers":[1]}]}')
INSERT [dbo].[StudentAssignment] ([Id], [StudentId], [AssignmentId], [RepositoryUrl], [JSONCode]) VALUES (1026, 1, 37, N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh', N'{"files":[{"fileName":"add.c","numberOfLinesInFile":14,"watermark":"14b348f7cf492927d969ce831a1e7b7d8abe008c6bcc548adaaa73185e815835","numberOfWhitespaceCharacters":20,"whitespacesLineNumbers":[6,9,11],"randomStringLineNumbers":[2,13]},{"fileName":"b.c","numberOfLinesInFile":7,"watermark":"283a6979d3725f68aebca2babda3f01e86a4ab4f7acb7dfbeba96322d3b46f1b","numberOfWhitespaceCharacters":20,"whitespacesLineNumbers":[2],"randomStringLineNumbers":[6]},{"fileName":"e.c","numberOfLinesInFile":2,"watermark":"991a123a6a47632516dcc18b513bc1aefe087216488427631ab76b0327e1e1df","numberOfWhitespaceCharacters":3,"whitespacesLineNumbers":[],"randomStringLineNumbers":[1]}]}')
INSERT [dbo].[StudentAssignment] ([Id], [StudentId], [AssignmentId], [RepositoryUrl], [JSONCode]) VALUES (1028, 2, 31, N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh', N'{"files":[{"fileName":"add.c","numberOfLinesInFile":14,"watermark":"0769f0240e2dd748ed532b0e3597bed5d9ee14d0c65dee40139ece98f93c7af3","numberOfWhitespaceCharacters":15,"whitespacesLineNumbers":[6,9,11],"randomStringLineNumbers":[2,13]},{"fileName":"b.c","numberOfLinesInFile":7,"watermark":"da91a7ebbe028175477a71f81abbcd544727c5c363bc923a4a79d94e24560d12","numberOfWhitespaceCharacters":23,"whitespacesLineNumbers":[2],"randomStringLineNumbers":[6]},{"fileName":"e.c","numberOfLinesInFile":2,"watermark":"9b1ec51259d86233619a3349f0675f2a339f08e41f55ff5601f51721d5b639fe","numberOfWhitespaceCharacters":17,"whitespacesLineNumbers":[],"randomStringLineNumbers":[1]}]}')
INSERT [dbo].[StudentAssignment] ([Id], [StudentId], [AssignmentId], [RepositoryUrl], [JSONCode]) VALUES (1029, 1, 1, N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh', N'{"files":[{"fileName":"add.c","numberOfLinesInFile":14,"watermark":"e823c1c1e767374b2fcac74305cc4d370d442110d11838eab1d97e8e05286460","comment":"Assignment 1: Stacks and Queues","numberOfWhitespaceCharacters":21,"whitespacesLineNumbers":[6,9,11],"randomStringLineNumbers":[2,13]},{"fileName":"b.c","numberOfLinesInFile":7,"watermark":"99733a8da89088ccf153be2b9cc3f8eeb5debed0c5d20c4dbceee9f39c2c7e57","comment":"DO NOT DELETE THIS LINE","numberOfWhitespaceCharacters":10,"whitespacesLineNumbers":[2],"randomStringLineNumbers":[6]},{"fileName":"e.c","numberOfLinesInFile":2,"watermark":"1f5eda5c35072bae56e90d58452549b8f3dbabf3262aec779d7e858a6ede79bc","comment":"DO NOT DELETE THIS LINE","numberOfWhitespaceCharacters":29,"whitespacesLineNumbers":[],"randomStringLineNumbers":[1]}]}')
INSERT [dbo].[StudentAssignment] ([Id], [StudentId], [AssignmentId], [RepositoryUrl], [JSONCode]) VALUES (1030, 2, 1, N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh', N'{"files":[{"fileName":"add.c","numberOfLinesInFile":14,"watermark":"aeb17ad5083955f3b0ea66763ee8de6a6071871037cc32eee7b9565953b0d422","comment":"Assignment 1: Stacks and Queues","numberOfWhitespaceCharacters":27,"whitespacesLineNumbers":[6,9,11],"randomStringLineNumbers":[2,13]},{"fileName":"b.c","numberOfLinesInFile":7,"watermark":"2f13e7e81933fa635c52052d731b46cb54af5513d2b30a5da683922631f5bab1","comment":"DO NOT DELETE THIS LINE","numberOfWhitespaceCharacters":16,"whitespacesLineNumbers":[2],"randomStringLineNumbers":[6]},{"fileName":"e.c","numberOfLinesInFile":2,"watermark":"5377e5c379d3ecddc701908bf3422dd811e56d4e39beb7e6ad5e66fa5a04e902","comment":"DO NOT DELETE THIS LINE","numberOfWhitespaceCharacters":21,"whitespacesLineNumbers":[],"randomStringLineNumbers":[1]}]}')
INSERT [dbo].[StudentAssignment] ([Id], [StudentId], [AssignmentId], [RepositoryUrl], [JSONCode]) VALUES (1031, 9, 1, N'https://github.com/AntiCheatSummer2021/brad-assignment-EricPeterson4665-2', N'{"files":[{"fileName":"add.c","numberOfLinesInFile":14,"watermark":"c9aa3800c31c521f1f29d5ec9e883261de2da9bccbcdd8b8aac3fec450e8ae78","comment":"DO NOT REMOVE THIS LINE","numberOfWhitespaceCharacters":22,"whitespacesLineNumbers":[6,9,11],"randomStringLineNumbers":[2,13]},{"fileName":"b.c","numberOfLinesInFile":7,"watermark":"43f5c3ec1efe6bdfd4d890d1d0e6f03070059bbe4fd08847801a4771f2e33daf","comment":"DO NOT REMOVE THIS LINE","numberOfWhitespaceCharacters":12,"whitespacesLineNumbers":[2],"randomStringLineNumbers":[6]},{"fileName":"e.c","numberOfLinesInFile":2,"watermark":"5354fadc653e99c463f4bece44c187aa4a1aa5d35c27836ca8e1753daf200c51","comment":"DO NOT REMOVE THIS LINE","numberOfWhitespaceCharacters":18,"whitespacesLineNumbers":[],"randomStringLineNumbers":[1]}]}')
INSERT [dbo].[StudentAssignment] ([Id], [StudentId], [AssignmentId], [RepositoryUrl], [JSONCode]) VALUES (1032, 2, 20, N'https://github.com/AntiCheatSummer2021/assignment-7-jessetaylor2', N'{"files":[{"fileName":"add.c","numberOfLinesInFile":14,"watermark":"3320ac45b592aca3545ba10c06b8db86f277aecaf4e8f79ad519c255bcc18f4f","comment":"DO NOT DELETE THIS LINE","numberOfWhitespaceCharacters":17,"whitespacesLineNumbers":[6,9,11],"randomStringLineNumbers":[2,13]},{"fileName":"b.c","numberOfLinesInFile":7,"watermark":"dd309dcbc0c10c36ee077b5c81e5dd1330821220729964a13517ce01d955f942","comment":"DO NOT DELETE THIS LINE","numberOfWhitespaceCharacters":19,"whitespacesLineNumbers":[2],"randomStringLineNumbers":[6]},{"fileName":"e.c","numberOfLinesInFile":2,"watermark":"d01136e9ff4f0594a94c0ca5a5e3f2d0d63d197d451cf5c9181f7acceecbfdd6","comment":"DO NOT DELETE THIS LINE","numberOfWhitespaceCharacters":17,"whitespacesLineNumbers":[],"randomStringLineNumbers":[1]}]}')
INSERT [dbo].[StudentAssignment] ([Id], [StudentId], [AssignmentId], [RepositoryUrl], [JSONCode]) VALUES (1033, 2, 25, N'https://github.com/AntiCheatSummer2021/assignment-71-jessetaylor2', N'{"files":[{"fileName":"add.c","numberOfLinesInFile":14,"watermark":"62e98eba2fb4204526e960f0b65f9666a32cdd19f3f461afe6bd86dfdd016a57","comment":"DO NOT DELETE THIS LINE","numberOfWhitespaceCharacters":19,"whitespacesLineNumbers":[6,9,11],"randomStringLineNumbers":[2,13]},{"fileName":"b.c","numberOfLinesInFile":7,"watermark":"7dc6139950ffcf9a5c0ee615a4fdab5bd6d6236c7e91f1b2a19ab8ea9583c965","comment":"DO NOT DELETE THIS LINE","numberOfWhitespaceCharacters":19,"whitespacesLineNumbers":[2],"randomStringLineNumbers":[6]},{"fileName":"e.c","numberOfLinesInFile":2,"watermark":"87fdfe9e404f902436806138bf6e7761d54aaeb5ed42fe14d8c9efb1178a6b64","comment":"DO NOT DELETE THIS LINE","numberOfWhitespaceCharacters":26,"whitespacesLineNumbers":[],"randomStringLineNumbers":[1]}]}')
INSERT [dbo].[StudentAssignment] ([Id], [StudentId], [AssignmentId], [RepositoryUrl], [JSONCode]) VALUES (1034, 2, 18, N'https://github.com/AntiCheatSummer2021/assignment9-jessetaylor2', N'{"files":[{"fileName":"add.c","numberOfLinesInFile":14,"watermark":"874bd9200031e65aa67e562de1b67e3e006f72fae11698172cdf7c4e36ca516c","comment":"DO NOT DELETE THIS LINE","numberOfWhitespaceCharacters":23,"whitespacesLineNumbers":[6,9,11],"randomStringLineNumbers":[2,13]},{"fileName":"b.c","numberOfLinesInFile":7,"watermark":"6d023dc9c4c04acbdf6911b58c21d47f23b3c2db6f7c039d4e474f90a6a5ce4b","comment":"DO NOT DELETE THIS LINE","numberOfWhitespaceCharacters":13,"whitespacesLineNumbers":[2],"randomStringLineNumbers":[6]},{"fileName":"e.c","numberOfLinesInFile":2,"watermark":"0c3c70e6111b7cb992b1b15ea68ac5e74f2ea4a00a024c6e9cb19ded1939708a","comment":"DO NOT DELETE THIS LINE","numberOfWhitespaceCharacters":14,"whitespacesLineNumbers":[],"randomStringLineNumbers":[1]}]}')
SET IDENTITY_INSERT [dbo].[StudentAssignment] OFF
SET IDENTITY_INSERT [dbo].[Watermarks] ON 

INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (4, N'f009b5ab7f15820c085b64e3769b01641cbccef8c16fcfad66690f269f15d977', 2, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (5, N'3219cbf5ea6521ac5253ab9c06e4a0607a6d51d9a23190887eb63f8b7dd7edef', 2, 1, N'b.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (6, N'57caf3a9a6280c4993d057527948d6918e8c9ef79df5fb78a68d5b6f78e92f00', 2, 1, N'e.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (7, N'5f8ef3a9f28a139708445d6bed4220a7519b29c284e2d6f825a02169210d646d', 1, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (8, N'ce02423a22b7c271aea47e745f2dad1072222924b8a989f82e6d7c35b7abace5', 1, 1, N'b.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (9, N'cbb2c66b241df82c1dce669f3f7e0d7e2e79738d4b632d599c0809e01ba3672d', 1, 1, N'e.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (13, N'ae8f4e5bebad0535b85302641219a44726a3bf0acca61e7febbead4edcce7765', 1, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (14, N'421e321fba385f44e065b027ac23716a04892b7fc06e9fed0c9c22866d27633d', 1, 1, N'b.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (15, N'05050bf6aa4455ec5268e31201a9e47540c4c856db67141691ce194de8401e16', 1, 1, N'e.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (28, N'1ec5293373b06bea3b0ed2f48356884a252cd9d7b2eb4cc7293b0a89ad5379f9', 1, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (29, N'f3defd6ddb53bb6dec3ddb39c3fb8fa65be50692e08f42032d9bb6ca3a1bad2d', 1, 1, N'b.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (30, N'ea61cc90810747daf0a9851b1a658c61d1dec07e25b37c8d43a446981b97ffa2', 1, 1, N'e.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (35, N'c9aa3800c31c521f1f29d5ec9e883261de2da9bccbcdd8b8aac3fec450e8ae78', 9, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-EricPeterson4665-2')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (36, N'43f5c3ec1efe6bdfd4d890d1d0e6f03070059bbe4fd08847801a4771f2e33daf', 9, 1, N'b.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-EricPeterson4665-2')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (37, N'5354fadc653e99c463f4bece44c187aa4a1aa5d35c27836ca8e1753daf200c51', 9, 1, N'e.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-EricPeterson4665-2')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (38, N'a04ad1fb34b4d5046be5ec6bc773b99e409d3e217402c13c0bd70a99a00f335b', 1, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (39, N'98f96698b48b5e222673075c1c9aa601c8da4eb2eb2c8859d072e47add29ba40', 1, 1, N'b.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (40, N'864dcd5474dc44ea382e8c5e0457f57d65cb5be904a26c78996a4393ce171425', 1, 1, N'e.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (41, N'58b4989f3cd9fdf09f9a58b1d09d0ec7e3002d57296013229c6786a76f3c9104', 1, 2, N'add.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (42, N'8880f48132cd3c5def2239977b14d825b64bf22a5bc0631e313f48517771adb5', 1, 2, N'b.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (43, N'b1d0835d4e998a59ae2d72afa198c43c876abb2a2f9126961b270c41d256e623', 1, 2, N'e.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (44, N'fc3fde364e53631db2f2f2c00a02be9e9adedf30952a81a8efb7372760863e9c', 1, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (45, N'd07bcbdb0d932b1a044ece8df518ea70add6a225ab3489b1cfb067b90c9fa008', 1, 1, N'b.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (46, N'bbdc602c896e37201fd63fd103ae7064407a9e63d469554226ffc16833656a4b', 1, 1, N'e.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (47, N'3a41c9d3153e701f5d40a145bf9cd6abc015dac8ecaaeaf90f12124367a431fc', 1, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (48, N'9a129020035cbaa9670554684df93d4a76c7d7042f7fae2216d4daded28688ba', 1, 1, N'b.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (49, N'e5b7517f486ba2e6635771594bd4c21e543caef3a8b71d89ae1901e3e1613072', 1, 1, N'e.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (10, N'810eb4c9f57e6bbd67cad82a4cc77159bbfe28a476033e5df4b7e0f3893bd09f', 1, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (11, N'03cddf552b0ab5f9a09c96464279aaaa60963535d7fa478e726f2e7b8cc9d0a5', 1, 1, N'b.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (12, N'169897fc811ddcf9bcc6e647d7904049ec999ff187d9dc766dc77b3d8f001462', 1, 1, N'e.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (16, N'aff44925c4ed4d5dc47956a098183df7ce849fdb41eeef756763cd4f254c420f', 1, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (17, N'1f91f0063e0946b8ee3dc18773d6904ae48f82802726de9966f4cf89b0071a3d', 1, 1, N'b.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (18, N'7b242291a4f6eefee21a8c40046f27a39517067eddf17f6fd3318fbe12cc9365', 1, 1, N'e.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (19, N'ae9afb27f06fe1d0aa8e7b1aef75e89c7d3a9281788b70e3d4007ef25f98b3b9', 1, 2, N'add.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (20, N'c3c89062fb07c6d71582abbefeba179df508e3b04e619d5ba565b570d7b36bb0', 1, 2, N'b.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (21, N'e04ebe6470d4675d430a0862e2ecbde935169833936aa00a463a9040e569d692', 1, 2, N'e.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (22, N'940f5cc37f488d91e6c10e23eecc03a8271ca25510f58a21c6a64a9822728c94', 1, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (23, N'cf42cad059441da1b7e0ee6a4b630fbaa361e05ea6baba88823c0b620ac8964e', 1, 1, N'b.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (24, N'f809fae29f4fe57b7e1e12b4d6315540612dd70070d2a0dc4df3a02a220fd1e0', 1, 1, N'e.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (25, N'ddac09b4e4eca6925fc9c784bf944856fa6de4d6127f86a8bf9dde9f2a013543', 1, 2, N'add.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (26, N'138ada3a5e98ce2072aaf9c01b8edf496e0cb26e198e44d57fb827151857a895', 1, 2, N'b.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (27, N'023d121ff4ec3a9b60f1dcc85e91e412e2b3ec1db7b9a4270362cbe96f442177', 1, 2, N'e.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (31, N'c9e0822ef36453c00a8c000e36010492f83fbfb6fd3f9c4852e32876b79320a4', 9, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-EricPeterson4665-2')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (32, N'3b1f1010c7221d46a5b3e38095820eb01bfa927bea593663e7e609b5fcddb41b', 9, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-EricPeterson4665-2')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (33, N'89351c19a1333afa10c906c26a80b30c140e6c2485d1ca8b6a5b8a48beb08aef', 9, 1, N'b.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-EricPeterson4665-2')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (34, N'65038a8239bdb2cf8b59595259aa5a621d5d5b84852ac02634258ef6439d6861', 9, 1, N'e.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-EricPeterson4665-2')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (50, N'64bcb45bda10c8fb68a2e2a0ccbb53345ed2f47be592c6c9bc1e892638826c51', 1, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (51, N'8667b8372e028bf834f534db6b707260af2f8449218281505a255c80c1e3accd', 1, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (53, N'1546afac7026854a84e817a052fc1f7f6bc887cd3b3df09b406a9783e9dd3d48', 1, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (54, N'32a5d51ca2a784bdb704003a8797b84a3ee58e0103afcbddcf04123500b3d64a', 1, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (61, N'7252f7d8face3251a86247b9addf6484488b69fdde8e9c72392142a513388e19', 1, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (62, N'954edad0e40086acd413425a61f72982c0ccc72b333a91c984037a2bae1c693b', 1, 1, N'b.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (63, N'b17031fb4a9931cb0432cfd53e8f9b40a77a84b3877875c233569f37f76972f5', 1, 1, N'e.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (52, N'ecb5eea0749ff0d97a6ec5fb1e2530e74398713496802d01010d066c11f6d86f', 1, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (77, N'08402b7ddf3055648091ce2c72fc3410354dc06b4c945777ad6c4134d8b0a097', 1, 4, N'add.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (78, N'776a2f79a550b8cb69ba2c29170a8802e33c53ed6cc7835063addd11047f9805', 1, 4, N'add.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (96, N'c33b51ec251c9aefda735498327d62436bb2eab32cf91b2129d79378e9ae07ec', 2, 7, N'add.c', N'https://github.com/AntiCheatSummer2021/assignment9-jessetaylor2')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (97, N'aeb17ad5083955f3b0ea66763ee8de6a6071871037cc32eee7b9565953b0d422', 2, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (98, N'2f13e7e81933fa635c52052d731b46cb54af5513d2b30a5da683922631f5bab1', 2, 1, N'b.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (99, N'5377e5c379d3ecddc701908bf3422dd811e56d4e39beb7e6ad5e66fa5a04e902', 2, 1, N'e.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (103, N'7845fb91efc36bc30def49da7c2178e6ab76f22b8447b64e3438b3ac751bdb9a', 1, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (104, N'46179bc85d8ad2e186ecf7399762c15f2f73d00b5d67e12e4bb1e2b1db4cb0d4', 1, 1, N'b.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (105, N'e93acab78cff552165e2413687ed1596063f4db3c1e2af7ae7dbe1e7d67560cb', 1, 1, N'e.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (55, N'fc6ce2ee2b79c6a2f63bd9cab3b4821780bdb9e453bcbbe3849d6b8d9c36b237', 1, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (56, N'05d56dba6e0f7ed18ca4fa68d747ebdb27d6d9109af335c12396f4739c6a26be', 1, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (57, N'c6d071d3997fcdb2f66e23967dd6cfcab56de8ff287286aa892ba5fc04b00f77', 1, 7, N'add.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (58, N'bb32a1fc81065af0bd0ee47a6c7531df1af6f8a3f44afb596ac6b39de2775894', 1, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (59, N'09c55789c6d5dc1167bc49c282edc49a404d7eb347f797d7fd475b2bdcd6d6c0', 1, 1, N'b.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (60, N'740d0f0738409e04bd87f8afa696fdc989fd294bd91f614fe8b6d37b55a9a0b6', 1, 1, N'e.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (64, N'660d1661f82459280722808a98abcd12894835de33e4c384b735c1144efbfb5a', 2, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (65, N'a688d3d636869dd5f918e127f742526f92ab0dca6ff2aaa8054225f7ef22df86', 2, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (66, N'728218f7d06e3e40dd090ecfb546042f60bdffb3ffaf9b34f391f8f0c6c5bb94', 2, 1, N'b.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (67, N'15b8c025bc1e0283bcf37ac3a9424a9656804e8bc4a62799165f57954f8e8d32', 2, 1, N'e.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (68, N'7adf09b10574546f2ac6ed3f6a60e2819a40f4f68f2a2be99f66859a2e91b0e1', 1, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (69, N'5daadb7833b6ea33ceadbfd5f37a679157191e2a716be8eb2bdaad856e4c3711', 1, 1, N'b.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (70, N'bb5af98bfcd431c48f694582f22b895f294ce2009f6e8af113b1660379cec37a', 1, 1, N'e.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (71, N'4917b29ee3ca2804a3b1622b2e950df082e6e9ccebeadd4835c102da3997035d', 1, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (72, N'7d8c40cfa9e1c5eb18056738dd268b2ae088ffc671cb530e38a6f53e077fc7c7', 1, 1, N'b.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (73, N'3beeed73cfcfe8a22661996251c35200c082863fef29aa81d8d1fdce78aab913', 1, 1, N'e.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (74, N'2f8bb61a46cffb1875be20882dc87eefed253a6cc5a25ff0961273f32c13b34c', 2, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (75, N'43e1732b08fb70ac085d6503038d5f17cf56b63fb52a554ee3bc6e597cb0cc38', 2, 1, N'b.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (76, N'e7fc8654f574ecc48e4552f9bbbe5dfffc084eb525df6e1167d226edcb759464', 2, 1, N'e.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (79, N'71a80e3b876bc62c1c3bf4f8b5ed2c8d4c182c42b8f8d523e5807379aee9d66b', 2, 8, N'add.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (80, N'a419f24c655e24fa5684cf8f497112ab1c95ccac86316b103d8d89cf7fca5740', 2, 20, N'add.c', N'https://github.com/AntiCheatSummer2021/assignment-7-jessetaylor2')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (81, N'218854b9f0d864ef002a18404e019d3159664960346a3c49e92a18cdbf0585b2', 2, 20, N'b.c', N'https://github.com/AntiCheatSummer2021/assignment-7-jessetaylor2')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (82, N'511c63212549b477993d09477bc9c5d4a28e27caebc00c52b4e1e9d2aad0cb5f', 2, 20, N'e.c', N'https://github.com/AntiCheatSummer2021/assignment-7-jessetaylor2')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (83, N'3320ac45b592aca3545ba10c06b8db86f277aecaf4e8f79ad519c255bcc18f4f', 2, 20, N'add.c', N'https://github.com/AntiCheatSummer2021/assignment-7-jessetaylor2')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (84, N'dd309dcbc0c10c36ee077b5c81e5dd1330821220729964a13517ce01d955f942', 2, 20, N'b.c', N'https://github.com/AntiCheatSummer2021/assignment-7-jessetaylor2')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (85, N'd01136e9ff4f0594a94c0ca5a5e3f2d0d63d197d451cf5c9181f7acceecbfdd6', 2, 20, N'e.c', N'https://github.com/AntiCheatSummer2021/assignment-7-jessetaylor2')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (86, N'62e98eba2fb4204526e960f0b65f9666a32cdd19f3f461afe6bd86dfdd016a57', 2, 25, N'add.c', N'https://github.com/AntiCheatSummer2021/assignment-71-jessetaylor2')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (87, N'7dc6139950ffcf9a5c0ee615a4fdab5bd6d6236c7e91f1b2a19ab8ea9583c965', 2, 25, N'b.c', N'https://github.com/AntiCheatSummer2021/assignment-71-jessetaylor2')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (88, N'87fdfe9e404f902436806138bf6e7761d54aaeb5ed42fe14d8c9efb1178a6b64', 2, 25, N'e.c', N'https://github.com/AntiCheatSummer2021/assignment-71-jessetaylor2')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (89, N'48b67aa7d21eabb41bbfdf9724e25bcc913acd2e914529ce6b84dd68b75afbf3', 2, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (90, N'550549041186deae47f9b5680efb9dcb183cc5a751f356a7b63e4cef7d2a0435', 2, 1, N'b.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (91, N'23d48c72932c01b37f8e63c64b4120f406ef0d2f0d79adb16bb3cad9304c95e9', 2, 1, N'e.c', N'https://github.com/AntiCheatSummer2021/assignment4-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (92, N'874bd9200031e65aa67e562de1b67e3e006f72fae11698172cdf7c4e36ca516c', 2, 18, N'add.c', N'https://github.com/AntiCheatSummer2021/assignment9-jessetaylor2')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (93, N'6d023dc9c4c04acbdf6911b58c21d47f23b3c2db6f7c039d4e474f90a6a5ce4b', 2, 18, N'b.c', N'https://github.com/AntiCheatSummer2021/assignment9-jessetaylor2')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (94, N'0c3c70e6111b7cb992b1b15ea68ac5e74f2ea4a00a024c6e9cb19ded1939708a', 2, 18, N'e.c', N'https://github.com/AntiCheatSummer2021/assignment9-jessetaylor2')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (95, N'b4a4a3072e3368081c71f6c8ac7886df836df8ffd37cdcc0262fbf924ff2b6bf', 2, 8, N'add.c', N'https://github.com/AntiCheatSummer2021/assignment-71-jessetaylor2')
GO
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (100, N'ba43f6303f4e454b85e8c2829a3fea5b6c11b8fb7d3854a29bcb9c97875548b9', 1, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (101, N'89f7bfeb451fc7ceda0c8784f15a2efb5b73581ee7a725991714452deadd43e1', 1, 1, N'b.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (102, N'a0c2fefbfaf0904d3a9effa73ee34b06392e9e76d40046f7b14fe19272bf0387', 1, 1, N'e.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (106, N'e823c1c1e767374b2fcac74305cc4d370d442110d11838eab1d97e8e05286460', 1, 1, N'add.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (107, N'99733a8da89088ccf153be2b9cc3f8eeb5debed0c5d20c4dbceee9f39c2c7e57', 1, 1, N'b.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
INSERT [dbo].[Watermarks] ([Id], [Watermark], [StudentID], [AssignmentID], [FileName], [StudentRepoName]) VALUES (108, N'1f5eda5c35072bae56e90d58452549b8f3dbabf3262aec779d7e858a6ede79bc', 1, 1, N'e.c', N'https://github.com/AntiCheatSummer2021/brad-assignment-ShaneyPooh')
SET IDENTITY_INSERT [dbo].[Watermarks] OFF
ALTER TABLE [dbo].[Assignment] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [DueDate]
GO
ALTER TABLE [dbo].[Course] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsCourseActive]
GO
USE [master]
GO
ALTER DATABASE [AntiCheat] SET  READ_WRITE 
GO
