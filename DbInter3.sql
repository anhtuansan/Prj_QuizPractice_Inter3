USE [master]
GO
/****** Object:  Database [SWP391_G6]    Script Date: 7/9/2024 9:14:07 PM ******/
CREATE DATABASE [SWP391_G6]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP391_G6', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SWP391_G6.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP391_G6_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SWP391_G6_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SWP391_G6] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP391_G6].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP391_G6] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP391_G6] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP391_G6] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP391_G6] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP391_G6] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP391_G6] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWP391_G6] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP391_G6] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP391_G6] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP391_G6] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP391_G6] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP391_G6] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP391_G6] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP391_G6] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP391_G6] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP391_G6] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP391_G6] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP391_G6] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP391_G6] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP391_G6] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP391_G6] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP391_G6] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP391_G6] SET RECOVERY FULL 
GO
ALTER DATABASE [SWP391_G6] SET  MULTI_USER 
GO
ALTER DATABASE [SWP391_G6] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP391_G6] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP391_G6] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP391_G6] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP391_G6] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SWP391_G6', N'ON'
GO
ALTER DATABASE [SWP391_G6] SET QUERY_STORE = OFF
GO
USE [SWP391_G6]
GO
/****** Object:  Table [dbo].[answers]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[answers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[answer_detail] [varchar](max) NULL,
	[created_at] [date] NULL,
	[update_at] [date] NULL,
	[creator_id] [int] NULL,
	[is_correct] [int] NULL,
 CONSTRAINT [PK_answers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blogs]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blogs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](max) NULL,
	[author_id] [int] NULL,
	[created_at] [date] NULL,
	[updated_at] [date] NULL,
	[content] [ntext] NULL,
	[status] [int] NULL,
	[thumbnail] [varchar](max) NULL,
	[briefinfo] [varchar](max) NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_blogs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[created_at] [date] NULL,
	[updated_at] [date] NULL,
	[created_by] [int] NOT NULL,
	[updated_by] [int] NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dimension]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimension](
	[DimensionId] [int] IDENTITY(1,1) NOT NULL,
	[DimensionName] [nvarchar](max) NULL,
	[Type] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[DimensionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson_Has_Question]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson_Has_Question](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LessonId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson_Has_Quiz]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson_Has_Quiz](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LessonId] [int] NOT NULL,
	[QuizId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lessons]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lessons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NULL,
	[creator_id] [int] NULL,
	[update_at] [date] NULL,
	[created_at] [date] NULL,
	[status] [int] NULL,
	[content] [text] NULL,
	[media] [nvarchar](255) NULL,
	[LessonIndex] [int] NULL,
	[Type] [nvarchar](255) NULL,
	[QuizId] [int] NULL,
 CONSTRAINT [PK_lessons] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[package_price]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[package_price](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[duration] [int] NULL,
	[sale_price] [decimal](18, 2) NULL,
	[price] [decimal](18, 2) NULL,
	[original_price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_package_price] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payments]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[method] [varchar](max) NULL,
	[payment_date] [date] NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_payments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Practice_Question]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Practice_Question](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PracticeId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[YourAnswer] [int] NULL,
	[IsMarked] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Practices]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Practices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
	[LessonName] [nvarchar](255) NULL,
	[NumberQuestion] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[NumberCorrect] [int] NULL,
	[Duration] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question_has_answer]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question_has_answer](
	[question_id] [int] NULL,
	[answer_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[questions]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[questions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[detail] [varchar](max) NULL,
	[Suggestion] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[Media] [nvarchar](max) NULL,
 CONSTRAINT [PK_questions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz_Has_Question]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz_Has_Question](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuizId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quizs]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quizs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Level] [nvarchar](50) NULL,
	[NumberQuestion] [int] NULL,
	[Duration] [int] NULL,
	[Type] [nvarchar](50) NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[SubjectId] [int] NULL,
	[LessonId] [int] NULL,
	[DeleteFlag] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[SubTitle] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[LinkUrl] [nvarchar](max) NULL,
	[CreatedAt] [date] NULL,
	[CreatedBy] [int] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[id] [int] NOT NULL,
	[name] [varchar](max) NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Quiz_Question]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Quiz_Question](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentQuizId] [int] NULL,
	[QuestionId] [int] NULL,
	[YourAnswer] [int] NULL,
	[IsMarked] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Take_Quiz]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Take_Quiz](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuizId] [int] NULL,
	[UserId] [int] NULL,
	[Status] [nvarchar](10) NULL,
	[NumberCorrect] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subject_has_lesson]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject_has_lesson](
	[subject_id] [int] NULL,
	[lesson_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subject_has_price_package]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject_has_price_package](
	[subject_id] [int] NOT NULL,
	[price_package_id] [int] NOT NULL,
 CONSTRAINT [PK_subject_has_price_package] PRIMARY KEY CLUSTERED 
(
	[subject_id] ASC,
	[price_package_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject_Has_Quiz]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject_Has_Quiz](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectId] [int] NOT NULL,
	[QuizId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subject_has_tag]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject_has_tag](
	[subject_id] [int] NOT NULL,
	[tag_id] [int] NOT NULL,
 CONSTRAINT [PK_subject_has_tag] PRIMARY KEY CLUSTERED 
(
	[subject_id] ASC,
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject_Register]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject_Register](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[PackageId] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[Status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subjects]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subjects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NULL,
	[creator_id] [int] NULL,
	[creater_at] [date] NULL,
	[update_at] [date] NULL,
	[status] [int] NULL,
	[img] [varchar](max) NULL,
	[description] [text] NULL,
	[dimensionId] [int] NULL,
 CONSTRAINT [PK_subjects] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tags]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tags](
	[id] [int] NOT NULL,
	[tag] [varchar](50) NULL,
 CONSTRAINT [PK_tags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_has_subject]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_has_subject](
	[user_id] [int] NULL,
	[subject_id] [int] NULL,
	[start_date] [nchar](10) NULL,
	[end_date] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Quiz]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Quiz](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[QuizId] [int] NOT NULL,
	[NumberCorrect] [int] NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Quiz_Answer]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Quiz_Answer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Quiz_Id] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[YourAnswer] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 7/9/2024 9:14:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [varchar](max) NULL,
	[email] [varchar](max) NULL,
	[phone_number] [varchar](max) NULL,
	[gender] [int] NULL,
	[profile_img] [varchar](max) NULL,
	[password] [varchar](max) NULL,
	[created_at] [date] NULL,
	[updated_at] [date] NULL,
	[role_id] [int] NULL,
	[status_id] [int] NULL,
	[token] [varchar](30) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[answers] ON 

INSERT [dbo].[answers] ([id], [answer_detail], [created_at], [update_at], [creator_id], [is_correct]) VALUES (1, N'Gà.....', CAST(N'2024-06-26' AS Date), NULL, 1028, 0)
INSERT [dbo].[answers] ([id], [answer_detail], [created_at], [update_at], [creator_id], [is_correct]) VALUES (2, N'Chó.....', CAST(N'2024-06-26' AS Date), NULL, 1028, 1)
INSERT [dbo].[answers] ([id], [answer_detail], [created_at], [update_at], [creator_id], [is_correct]) VALUES (3, N'Mèo.....', CAST(N'2024-06-26' AS Date), NULL, 1028, 0)
INSERT [dbo].[answers] ([id], [answer_detail], [created_at], [update_at], [creator_id], [is_correct]) VALUES (4, N'L?n.....', CAST(N'2024-06-26' AS Date), NULL, 1028, 0)
INSERT [dbo].[answers] ([id], [answer_detail], [created_at], [update_at], [creator_id], [is_correct]) VALUES (1002, N'Paris.....', CAST(N'2024-07-04' AS Date), NULL, 1028, 0)
INSERT [dbo].[answers] ([id], [answer_detail], [created_at], [update_at], [creator_id], [is_correct]) VALUES (1003, N'London.....', CAST(N'2024-07-04' AS Date), NULL, 1028, 1)
INSERT [dbo].[answers] ([id], [answer_detail], [created_at], [update_at], [creator_id], [is_correct]) VALUES (1004, N'Beclin.....', CAST(N'2024-07-04' AS Date), NULL, 1028, 0)
INSERT [dbo].[answers] ([id], [answer_detail], [created_at], [update_at], [creator_id], [is_correct]) VALUES (1005, N'Bangkok.....', CAST(N'2024-07-04' AS Date), NULL, 1028, 0)
INSERT [dbo].[answers] ([id], [answer_detail], [created_at], [update_at], [creator_id], [is_correct]) VALUES (1006, N'1.....', CAST(N'2024-07-04' AS Date), NULL, 1028, 0)
INSERT [dbo].[answers] ([id], [answer_detail], [created_at], [update_at], [creator_id], [is_correct]) VALUES (1007, N'2.....', CAST(N'2024-07-04' AS Date), NULL, 1028, 1)
INSERT [dbo].[answers] ([id], [answer_detail], [created_at], [update_at], [creator_id], [is_correct]) VALUES (1008, N'3.....', CAST(N'2024-07-04' AS Date), NULL, 1028, 0)
INSERT [dbo].[answers] ([id], [answer_detail], [created_at], [update_at], [creator_id], [is_correct]) VALUES (1009, N'9.....', CAST(N'2024-07-04' AS Date), NULL, 1028, 0)
INSERT [dbo].[answers] ([id], [answer_detail], [created_at], [update_at], [creator_id], [is_correct]) VALUES (1010, N'bang 1', CAST(N'2024-07-06' AS Date), NULL, 1028, 0)
INSERT [dbo].[answers] ([id], [answer_detail], [created_at], [update_at], [creator_id], [is_correct]) VALUES (1011, N'bang 6', CAST(N'2024-07-06' AS Date), NULL, 1028, 1)
INSERT [dbo].[answers] ([id], [answer_detail], [created_at], [update_at], [creator_id], [is_correct]) VALUES (1012, N'bang 3', CAST(N'2024-07-06' AS Date), NULL, 1028, 0)
INSERT [dbo].[answers] ([id], [answer_detail], [created_at], [update_at], [creator_id], [is_correct]) VALUES (1013, N'bang 0', CAST(N'2024-07-06' AS Date), NULL, 1028, 0)
INSERT [dbo].[answers] ([id], [answer_detail], [created_at], [update_at], [creator_id], [is_correct]) VALUES (1014, N'b?ng 1', CAST(N'2024-07-06' AS Date), NULL, 1028, 0)
INSERT [dbo].[answers] ([id], [answer_detail], [created_at], [update_at], [creator_id], [is_correct]) VALUES (1015, N'b?ng 1', CAST(N'2024-07-06' AS Date), NULL, 1028, 0)
INSERT [dbo].[answers] ([id], [answer_detail], [created_at], [update_at], [creator_id], [is_correct]) VALUES (1016, N'b?ng 1', CAST(N'2024-07-06' AS Date), NULL, 1028, 0)
INSERT [dbo].[answers] ([id], [answer_detail], [created_at], [update_at], [creator_id], [is_correct]) VALUES (1017, N'kkkk', CAST(N'2024-07-06' AS Date), NULL, 1028, 0)
INSERT [dbo].[answers] ([id], [answer_detail], [created_at], [update_at], [creator_id], [is_correct]) VALUES (1018, N'p', CAST(N'2024-07-06' AS Date), NULL, 1028, 1)
INSERT [dbo].[answers] ([id], [answer_detail], [created_at], [update_at], [creator_id], [is_correct]) VALUES (1019, N'p', CAST(N'2024-07-06' AS Date), NULL, 1028, 0)
SET IDENTITY_INSERT [dbo].[answers] OFF
GO
SET IDENTITY_INSERT [dbo].[blogs] ON 

INSERT [dbo].[blogs] ([id], [title], [author_id], [created_at], [updated_at], [content], [status], [thumbnail], [briefinfo], [CategoryId]) VALUES (18, N'Exploring the Beauty of Mathematics2222222', 3, CAST(N'2024-01-01' AS Date), CAST(N'2024-01-01' AS Date), N'Numbers and Operations: The foundations of mathematics include natural numbers, integers, fractions, decimals and real numbers. Basic calculations such as addition, subtraction, multiplication and division are essential tools.
Algebra: This branch is concerned with the study of symbols and rules for manipulating those symbols. It involves solving equations and understanding functions.
Geometry: Focuses on the properties and relationships of points, lines, surfaces, and solids. Key concepts include angle, shape, area, and volume.
Calculus: Explores changes and motions, dealing with derivatives and integration. It is fundamental in physics and engineering.
Statistics and Probability: Involves the analysis and interpretation of data and the likelihood of events occurring.
', 0, N'images/2.png', N'Mathematics is a field of study that explores numbers, quantities, ', 9)
INSERT [dbo].[blogs] ([id], [title], [author_id], [created_at], [updated_at], [content], [status], [thumbnail], [briefinfo], [CategoryId]) VALUES (19, N'Unveiling the World of Chemistry: Principles, Branches', 4, CAST(N'2022-01-03' AS Date), CAST(N'2022-01-03' AS Date), N'Numbers and Operations: The foundations of mathematics include natural numbers, integers, fractions, decimals and real numbers. Basic calculations such as addition, subtraction, multiplication and division are essential tools.
Algebra: This branch is concerned with the study of symbols and rules for manipulating those symbols. It involves solving equations and understanding functions.
Geometry: Focuses on the properties and relationships of points, lines, surfaces, and solids. Key concepts include angle, shape, area, and volume.
Calculus: Explores changes and motions, dealing with derivatives and integration. It is fundamental in physics and engineering.
Statistics and Probability: Involves the analysis and interpretation of data and the likelihood of events occurring.
', 1, N'images/math.jpg', N'Mathematics is a field of study that explores numbers, quantities, ', 8)
INSERT [dbo].[blogs] ([id], [title], [author_id], [created_at], [updated_at], [content], [status], [thumbnail], [briefinfo], [CategoryId]) VALUES (20, N'Exploring the Beauty of Mathematics', 5, CAST(N'2020-01-05' AS Date), CAST(N'2020-01-05' AS Date), N'Numbers and Operations: The foundations of mathematics include natural numbers, integers, fractions, decimals and real numbers. Basic calculations such as addition, subtraction, multiplication and division are essential tools.
Algebra: This branch is concerned with the study of symbols and rules for manipulating those symbols. It involves solving equations and understanding functions.
Geometry: Focuses on the properties and relationships of points, lines, surfaces, and solids. Key concepts include angle, shape, area, and volume.
Calculus: Explores changes and motions, dealing with derivatives and integration. It is fundamental in physics and engineering.
Statistics and Probability: Involves the analysis and interpretation of data and the likelihood of events occurring.
', 1, N'images/che.jpg', N'Mathematics is a field of study that explores numbers, quantities, ', 8)
INSERT [dbo].[blogs] ([id], [title], [author_id], [created_at], [updated_at], [content], [status], [thumbnail], [briefinfo], [CategoryId]) VALUES (21, N'Unveiling the World of Chemistry: Principles, Branches', 4, CAST(N'2021-08-07' AS Date), CAST(N'2021-08-07' AS Date), N'Numbers and Operations: The foundations of mathematics include natural numbers, integers, fractions, decimals and real numbers. Basic calculations such as addition, subtraction, multiplication and division are essential tools.
Algebra: This branch is concerned with the study of symbols and rules for manipulating those symbols. It involves solving equations and understanding functions.
Geometry: Focuses on the properties and relationships of points, lines, surfaces, and solids. Key concepts include angle, shape, area, and volume.
Calculus: Explores changes and motions, dealing with derivatives and integration. It is fundamental in physics and engineering.
Statistics and Probability: Involves the analysis and interpretation of data and the likelihood of events occurring.
', 1, N'images/che_2.jpg', N'Chemistry is the science of matter, its properties, and the changes it .', 8)
INSERT [dbo].[blogs] ([id], [title], [author_id], [created_at], [updated_at], [content], [status], [thumbnail], [briefinfo], [CategoryId]) VALUES (23, N'The Wonders of Biology: Life, Evolution, and Diversity', 8, CAST(N'2022-01-01' AS Date), CAST(N'2022-01-01' AS Date), N'Numbers and Operations: The foundations of mathematics include natural numbers, integers, fractions, decimals and real numbers. Basic calculations such as addition, subtraction, multiplication and division are essential tools.
Algebra: This branch is concerned with the study of symbols and rules for manipulating those symbols. It involves solving equations and understanding functions.
Geometry: Focuses on the properties and relationships of points, lines, surfaces, and solids. Key concepts include angle, shape, area, and volume.
Calculus: Explores changes and motions, dealing with derivatives and integration. It is fundamental in physics and engineering.
Statistics and Probability: Involves the analysis and interpretation of data and the likelihood of events occurring.
', 1, N'images/his.jpg', N'Chemistry is the science of matter, its properties, and the changes it .', 8)
INSERT [dbo].[blogs] ([id], [title], [author_id], [created_at], [updated_at], [content], [status], [thumbnail], [briefinfo], [CategoryId]) VALUES (26, N'The Beauty of English: Language, Literature...', 5, CAST(N'2023-04-17' AS Date), CAST(N'2023-04-17' AS Date), N'Numbers and Operations: The foundations of mathematics include natural numbers, integers, fractions, decimals and real numbers. Basic calculations such as addition, subtraction, multiplication and division are essential tools.
Algebra: This branch is concerned with the study of symbols and rules for manipulating those symbols. It involves solving equations and understanding functions.
Geometry: Focuses on the properties and relationships of points, lines, surfaces, and solids. Key concepts include angle, shape, area, and volume.
Calculus: Explores changes and motions, dealing with derivatives and integration. It is fundamental in physics and engineering.
Statistics and Probability: Involves the analysis and interpretation of data and the likelihood of events occurring.
', 1, N'images/eng_2.jpg', N'Chemistry is the science of matter, its properties, and the changes it .', 8)
INSERT [dbo].[blogs] ([id], [title], [author_id], [created_at], [updated_at], [content], [status], [thumbnail], [briefinfo], [CategoryId]) VALUES (28, N'Biology research topics on the environment are in great demand too. For example, climate change is becoming a more significant threat every day...', 8, CAST(N'2021-01-21' AS Date), CAST(N'2021-01-21' AS Date), N'Numbers and Operations: The foundations of mathematics include natural numbers, integers, fractions, decimals and real numbers. Basic calculations such as addition, subtraction, multiplication and division are essential tools.
Algebra: This branch is concerned with the study of symbols and rules for manipulating those symbols. It involves solving equations and understanding functions.
Geometry: Focuses on the properties and relationships of points, lines, surfaces, and solids. Key concepts include angle, shape, area, and volume.
Calculus: Explores changes and motions, dealing with derivatives and integration. It is fundamental in physics and engineering.
Statistics and Probability: Involves the analysis and interpretation of data and the likelihood of events occurring.
', 1, N'images/bio_2.jpg', N'History is the study of past events, particularly in human affairs', 8)
INSERT [dbo].[blogs] ([id], [title], [author_id], [created_at], [updated_at], [content], [status], [thumbnail], [briefinfo], [CategoryId]) VALUES (29, N'The Wonders of Biology: Life, Evolution, and Diversity', 4, CAST(N'2022-08-20' AS Date), CAST(N'2022-08-20' AS Date), N'Numbers and Operations: The foundations of mathematics include natural numbers, integers, fractions, decimals and real numbers. Basic calculations such as addition, subtraction, multiplication and division are essential tools.
Algebra: This branch is concerned with the study of symbols and rules for manipulating those symbols. It involves solving equations and understanding functions.
Geometry: Focuses on the properties and relationships of points, lines, surfaces, and solids. Key concepts include angle, shape, area, and volume.
Calculus: Explores changes and motions, dealing with derivatives and integration. It is fundamental in physics and engineering.
Statistics and Probability: Involves the analysis and interpretation of data and the likelihood of events occurring.
', 1, N'images/bio.jpg', N'History is the study of past events, particularly in human affairs', 8)
INSERT [dbo].[blogs] ([id], [title], [author_id], [created_at], [updated_at], [content], [status], [thumbnail], [briefinfo], [CategoryId]) VALUES (30, N'''The Beauty of English: Language, Literature...', 4, CAST(N'2022-08-20' AS Date), CAST(N'2022-08-20' AS Date), N'Numbers and Operations: The foundations of mathematics include natural numbers, integers, fractions, decimals and real numbers. Basic calculations such as addition, subtraction, multiplication and division are essential tools.
Algebra: This branch is concerned with the study of symbols and rules for manipulating those symbols. It involves solving equations and understanding functions.
Geometry: Focuses on the properties and relationships of points, lines, surfaces, and solids. Key concepts include angle, shape, area, and volume.
Calculus: Explores changes and motions, dealing with derivatives and integration. It is fundamental in physics and engineering.
Statistics and Probability: Involves the analysis and interpretation of data and the likelihood of events occurring.
', 1, N'images/bio.jpg', N'Chemistry is the science of matter, its properties, and the changes it .', 8)
SET IDENTITY_INSERT [dbo].[blogs] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [name], [created_at], [updated_at], [created_by], [updated_by]) VALUES (8, N'Technology', CAST(N'2024-05-01' AS Date), CAST(N'2024-05-01' AS Date), 3, 3)
INSERT [dbo].[categories] ([id], [name], [created_at], [updated_at], [created_by], [updated_by]) VALUES (9, N'Health', CAST(N'2024-05-02' AS Date), CAST(N'2024-05-02' AS Date), 4, 5)
INSERT [dbo].[categories] ([id], [name], [created_at], [updated_at], [created_by], [updated_by]) VALUES (15, N'Sciences', CAST(N'2024-05-30' AS Date), CAST(N'2024-05-30' AS Date), 5, 4)
INSERT [dbo].[categories] ([id], [name], [created_at], [updated_at], [created_by], [updated_by]) VALUES (16, N'Humanities', CAST(N'2024-05-30' AS Date), CAST(N'2024-05-30' AS Date), 6, 7)
INSERT [dbo].[categories] ([id], [name], [created_at], [updated_at], [created_by], [updated_by]) VALUES (17, N'Language', CAST(N'2024-05-30' AS Date), CAST(N'2024-05-30' AS Date), 7, 6)
INSERT [dbo].[categories] ([id], [name], [created_at], [updated_at], [created_by], [updated_by]) VALUES (23, N'Programming', CAST(N'2024-05-30' AS Date), CAST(N'2024-06-20' AS Date), 8, 8)
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Dimension] ON 

INSERT [dbo].[Dimension] ([DimensionId], [DimensionName], [Type], [Description], [Status]) VALUES (1, N'FontEnd', N'IT', N'Include html, css, js, ...', 1)
INSERT [dbo].[Dimension] ([DimensionId], [DimensionName], [Type], [Description], [Status]) VALUES (2, N'BackEnd', N'IT', NULL, 1)
INSERT [dbo].[Dimension] ([DimensionId], [DimensionName], [Type], [Description], [Status]) VALUES (3, N'Hosting', N'IT', N'Include networking, tracking ...', 1)
INSERT [dbo].[Dimension] ([DimensionId], [DimensionName], [Type], [Description], [Status]) VALUES (4, N'Finance', N'Economy', N'Include accounting, analysis, ...', 1)
INSERT [dbo].[Dimension] ([DimensionId], [DimensionName], [Type], [Description], [Status]) VALUES (1002, N'Networking', N'IT2', N'Include html, css, js, ...', NULL)
INSERT [dbo].[Dimension] ([DimensionId], [DimensionName], [Type], [Description], [Status]) VALUES (1003, N'Networking', N'IT2', N'Include html, css, js, ...', 0)
INSERT [dbo].[Dimension] ([DimensionId], [DimensionName], [Type], [Description], [Status]) VALUES (1004, N'Networking', N'IT2', N'Include html, css, js, ...', 0)
INSERT [dbo].[Dimension] ([DimensionId], [DimensionName], [Type], [Description], [Status]) VALUES (1005, N'Networking', N'IT2', N'Include html, css, js, ...', 0)
INSERT [dbo].[Dimension] ([DimensionId], [DimensionName], [Type], [Description], [Status]) VALUES (1006, N'Networking', N'IT2', N'Include html, css, js, ...', 0)
INSERT [dbo].[Dimension] ([DimensionId], [DimensionName], [Type], [Description], [Status]) VALUES (1007, N'Networking', N'IT2', N'Include html, css, js, ...', 0)
SET IDENTITY_INSERT [dbo].[Dimension] OFF
GO
SET IDENTITY_INSERT [dbo].[Lesson_Has_Question] ON 

INSERT [dbo].[Lesson_Has_Question] ([Id], [LessonId], [QuestionId]) VALUES (1, 1, 1)
INSERT [dbo].[Lesson_Has_Question] ([Id], [LessonId], [QuestionId]) VALUES (2, 1, 3)
INSERT [dbo].[Lesson_Has_Question] ([Id], [LessonId], [QuestionId]) VALUES (3, 1, 4)
INSERT [dbo].[Lesson_Has_Question] ([Id], [LessonId], [QuestionId]) VALUES (4, 2, 26)
INSERT [dbo].[Lesson_Has_Question] ([Id], [LessonId], [QuestionId]) VALUES (5, 2, 27)
INSERT [dbo].[Lesson_Has_Question] ([Id], [LessonId], [QuestionId]) VALUES (6, 2, 28)
INSERT [dbo].[Lesson_Has_Question] ([Id], [LessonId], [QuestionId]) VALUES (7, 2, 29)
SET IDENTITY_INSERT [dbo].[Lesson_Has_Question] OFF
GO
SET IDENTITY_INSERT [dbo].[lessons] ON 

INSERT [dbo].[lessons] ([id], [name], [creator_id], [update_at], [created_at], [status], [content], [media], [LessonIndex], [Type], [QuizId]) VALUES (1, N'Lam quen voi OOP java part 1', NULL, NULL, NULL, 1, N'<div class="course">
    <h3>Introduction to Programming</h3>
    <p>Instructor: John Doe</p>
    <p>Duration: 10 weeks</p>
    <p>Description: This course provides an introduction to programming concepts using Python.</p>
</div>', N'k co', 1, N'content', NULL)
INSERT [dbo].[lessons] ([id], [name], [creator_id], [update_at], [created_at], [status], [content], [media], [LessonIndex], [Type], [QuizId]) VALUES (2, N'Lam quen voi OOP java part 2', NULL, NULL, NULL, 0, N'<div class="course">
    <h3>Introduction to Programming</h3>
    <p>Instructor: John Doe</p>
    <p>Duration: 10 weeks</p>
    <p>Description: This course provides an introduction to programming concepts using Python.</p>
</div>', N'', 1, N'content', NULL)
INSERT [dbo].[lessons] ([id], [name], [creator_id], [update_at], [created_at], [status], [content], [media], [LessonIndex], [Type], [QuizId]) VALUES (1002, N'Lam quen voi String', 1028, NULL, CAST(N'2024-06-18' AS Date), 1, N'<div class="course">     <h3>Introduction to Programming</h3>     <p>Instructor: John Doe</p>     <p>Duration: 10 weeks</p>     <p>Description: This course provides an introduction to programming concepts using Python.</p> </div>', NULL, 2, N'content', NULL)
INSERT [dbo].[lessons] ([id], [name], [creator_id], [update_at], [created_at], [status], [content], [media], [LessonIndex], [Type], [QuizId]) VALUES (1003, N'fdsafsda', 1028, NULL, CAST(N'2024-06-18' AS Date), 1, N'fdsafdas', N'fdasf', 3, N'content', NULL)
INSERT [dbo].[lessons] ([id], [name], [creator_id], [update_at], [created_at], [status], [content], [media], [LessonIndex], [Type], [QuizId]) VALUES (1004, N'Lam quen File', 1028, NULL, CAST(N'2024-06-18' AS Date), 1, N'<h1>File handle</h1>', N'no', 3, N'content', NULL)
INSERT [dbo].[lessons] ([id], [name], [creator_id], [update_at], [created_at], [status], [content], [media], [LessonIndex], [Type], [QuizId]) VALUES (1005, N'Làm quen Builder', 1028, NULL, CAST(N'2024-06-18' AS Date), 0, N'<h1>Builder</h1>', N'no', 4, N'content', NULL)
INSERT [dbo].[lessons] ([id], [name], [creator_id], [update_at], [created_at], [status], [content], [media], [LessonIndex], [Type], [QuizId]) VALUES (2003, N'Honda22222', 1028, NULL, CAST(N'2024-06-21' AS Date), 1, N'fdsa', N'k co', 4, N'content', NULL)
INSERT [dbo].[lessons] ([id], [name], [creator_id], [update_at], [created_at], [status], [content], [media], [LessonIndex], [Type], [QuizId]) VALUES (2004, N'Product 11', 1028, NULL, CAST(N'2024-06-21' AS Date), 1, N'fdas', N'fdsa', 6, N'content', NULL)
INSERT [dbo].[lessons] ([id], [name], [creator_id], [update_at], [created_at], [status], [content], [media], [LessonIndex], [Type], [QuizId]) VALUES (2005, N'tuan', 1028, NULL, CAST(N'2024-06-21' AS Date), 1, N'fdsa', N'k co', 5, N'content', NULL)
INSERT [dbo].[lessons] ([id], [name], [creator_id], [update_at], [created_at], [status], [content], [media], [LessonIndex], [Type], [QuizId]) VALUES (2006, N'fdsa', 1028, NULL, CAST(N'2024-06-21' AS Date), 1, N'fdsa', N'fdsa', 8, N'content', NULL)
INSERT [dbo].[lessons] ([id], [name], [creator_id], [update_at], [created_at], [status], [content], [media], [LessonIndex], [Type], [QuizId]) VALUES (2007, N'fdas', 1028, NULL, CAST(N'2024-06-21' AS Date), 1, N'fdsa', N'fdsa', 7, N'quiz', 22)
SET IDENTITY_INSERT [dbo].[lessons] OFF
GO
SET IDENTITY_INSERT [dbo].[package_price] ON 

INSERT [dbo].[package_price] ([id], [name], [duration], [sale_price], [price], [original_price]) VALUES (1, N'3 months package', 3, CAST(800000.00 AS Decimal(18, 2)), CAST(1000000.00 AS Decimal(18, 2)), CAST(800000.00 AS Decimal(18, 2)))
INSERT [dbo].[package_price] ([id], [name], [duration], [sale_price], [price], [original_price]) VALUES (2, N'6 months package', 6, CAST(1000000.00 AS Decimal(18, 2)), CAST(1500000.00 AS Decimal(18, 2)), CAST(1000000.00 AS Decimal(18, 2)))
INSERT [dbo].[package_price] ([id], [name], [duration], [sale_price], [price], [original_price]) VALUES (3, N'Forever package', 1000000000, CAST(1900000.00 AS Decimal(18, 2)), CAST(2200000.00 AS Decimal(18, 2)), CAST(1900000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[package_price] OFF
GO
SET IDENTITY_INSERT [dbo].[Practice_Question] ON 

INSERT [dbo].[Practice_Question] ([Id], [PracticeId], [QuestionId], [YourAnswer], [IsMarked]) VALUES (1, 1002, 1, 1, NULL)
INSERT [dbo].[Practice_Question] ([Id], [PracticeId], [QuestionId], [YourAnswer], [IsMarked]) VALUES (3, 1002, 3, 1002, 1)
INSERT [dbo].[Practice_Question] ([Id], [PracticeId], [QuestionId], [YourAnswer], [IsMarked]) VALUES (4, 1002, 4, 1007, NULL)
SET IDENTITY_INSERT [dbo].[Practice_Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Practices] ON 

INSERT [dbo].[Practices] ([Id], [UserId], [SubjectId], [LessonName], [NumberQuestion], [CreatedAt], [NumberCorrect], [Duration]) VALUES (1, 27, 2, N'All', 20, CAST(N'2024-06-11T01:13:47.210' AS DateTime), 10, 30)
INSERT [dbo].[Practices] ([Id], [UserId], [SubjectId], [LessonName], [NumberQuestion], [CreatedAt], [NumberCorrect], [Duration]) VALUES (2, 27, 6, N'All', 20, CAST(N'2024-06-11T01:14:47.367' AS DateTime), 10, 20)
INSERT [dbo].[Practices] ([Id], [UserId], [SubjectId], [LessonName], [NumberQuestion], [CreatedAt], [NumberCorrect], [Duration]) VALUES (3, 27, 6, N'All', 20, CAST(N'2024-06-11T01:15:07.023' AS DateTime), 10, 20)
INSERT [dbo].[Practices] ([Id], [UserId], [SubjectId], [LessonName], [NumberQuestion], [CreatedAt], [NumberCorrect], [Duration]) VALUES (4, 27, 6, N'All', 20, CAST(N'2024-06-11T01:15:17.957' AS DateTime), 10, 20)
INSERT [dbo].[Practices] ([Id], [UserId], [SubjectId], [LessonName], [NumberQuestion], [CreatedAt], [NumberCorrect], [Duration]) VALUES (5, 27, 6, N'All', 20, CAST(N'2024-06-11T01:15:18.753' AS DateTime), 10, 20)
INSERT [dbo].[Practices] ([Id], [UserId], [SubjectId], [LessonName], [NumberQuestion], [CreatedAt], [NumberCorrect], [Duration]) VALUES (6, 27, 6, N'All', 20, CAST(N'2024-06-11T01:15:19.407' AS DateTime), 10, 20)
INSERT [dbo].[Practices] ([Id], [UserId], [SubjectId], [LessonName], [NumberQuestion], [CreatedAt], [NumberCorrect], [Duration]) VALUES (1002, 27, 6, N'All', 3, CAST(N'2024-07-05T01:42:14.890' AS DateTime), 1, 30)
SET IDENTITY_INSERT [dbo].[Practices] OFF
GO
INSERT [dbo].[question_has_answer] ([question_id], [answer_id]) VALUES (1, 1)
INSERT [dbo].[question_has_answer] ([question_id], [answer_id]) VALUES (1, 2)
INSERT [dbo].[question_has_answer] ([question_id], [answer_id]) VALUES (1, 3)
INSERT [dbo].[question_has_answer] ([question_id], [answer_id]) VALUES (1, 4)
INSERT [dbo].[question_has_answer] ([question_id], [answer_id]) VALUES (3, 1002)
INSERT [dbo].[question_has_answer] ([question_id], [answer_id]) VALUES (3, 1003)
INSERT [dbo].[question_has_answer] ([question_id], [answer_id]) VALUES (3, 1004)
INSERT [dbo].[question_has_answer] ([question_id], [answer_id]) VALUES (3, 1005)
INSERT [dbo].[question_has_answer] ([question_id], [answer_id]) VALUES (4, 1006)
INSERT [dbo].[question_has_answer] ([question_id], [answer_id]) VALUES (4, 1007)
INSERT [dbo].[question_has_answer] ([question_id], [answer_id]) VALUES (4, 1008)
INSERT [dbo].[question_has_answer] ([question_id], [answer_id]) VALUES (4, 1009)
INSERT [dbo].[question_has_answer] ([question_id], [answer_id]) VALUES (7, 1015)
INSERT [dbo].[question_has_answer] ([question_id], [answer_id]) VALUES (20, 1017)
INSERT [dbo].[question_has_answer] ([question_id], [answer_id]) VALUES (23, 1018)
INSERT [dbo].[question_has_answer] ([question_id], [answer_id]) VALUES (22, 1019)
INSERT [dbo].[question_has_answer] ([question_id], [answer_id]) VALUES (5, 1010)
INSERT [dbo].[question_has_answer] ([question_id], [answer_id]) VALUES (5, 1011)
INSERT [dbo].[question_has_answer] ([question_id], [answer_id]) VALUES (5, 1012)
INSERT [dbo].[question_has_answer] ([question_id], [answer_id]) VALUES (5, 1013)
INSERT [dbo].[question_has_answer] ([question_id], [answer_id]) VALUES (8, 1016)
GO
SET IDENTITY_INSERT [dbo].[questions] ON 

INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (1, N'Con gi keu gau gau2', N'4 chan', 1, N'')
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (2, N'1+2 b?ng m?y', N'b? c?a b?n', 1, NULL)
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (3, N'Thu do cua phap la gi', N'Mbape', 1, NULL)
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (4, N'1+2 bang may', N'bo cua ban', 1, NULL)
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (5, N'3+3 bang may', N'1 ban tay', 1, NULL)
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (6, N'3+3 b?ng m?y', N'1 bàn tay', 1, NULL)
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (7, N'3+3 b?ng m?y', N'1 bàn tay', 1, NULL)
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (8, N'3+3 b?ng m?y', N'1 bàn tay', 1, NULL)
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (9, N'3+3 b?ng m?y', N'1 bàn tay', 1, NULL)
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (10, N'qua gi to the', N'an duoc', 1, NULL)
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (11, N'qua gi to the', N'an duoc', 1, NULL)
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (12, N'ahihi', N'doan xem', 1, NULL)
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (13, N'ahihi', N'doan xem', 1, NULL)
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (14, N'ahihi', N'doan xem', 1, NULL)
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (15, N'kkkk', N'uuuuu', 1, NULL)
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (16, N'kkkk', N'uuuuu', 1, NULL)
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (17, N'kkkk', N'uuuuu', 1, NULL)
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (18, N'iiiii', N'oooo', 1, NULL)
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (19, N'hihi', N'cuoi', 1, NULL)
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (20, N'yyy', N'yyyy', 1, NULL)
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (21, N'fdsafasf', N'fdsafasdf', 1, NULL)
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (22, N'p', N'p', 1, NULL)
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (23, N'ahihi', N'fdsa', 1, NULL)
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (24, N'What is the capital of France?', N'Think about the Eiffel Tower', 1, N'https://example.com/image1.jpg')
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (25, N'What is the capital of France?', N'Think about the Eiffel Tower', 1, N'https://example.com/image1.jpg')
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (26, N'What is the capital of France?', N'Think about the Eiffel Tower', 1, N'https://example.com/image1.jpg')
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (27, N'What is the largest planet?', N'It is known as a gas giant', 1, N'')
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (28, N'Who wrote "To Kill a Mockingbird"?', N'Author is Harper Lee', 1, N'')
INSERT [dbo].[questions] ([id], [detail], [Suggestion], [Status], [Media]) VALUES (29, N'What is the boiling point of water?', N'100 degrees Celsius', 1, NULL)
SET IDENTITY_INSERT [dbo].[questions] OFF
GO
SET IDENTITY_INSERT [dbo].[Quiz_Has_Question] ON 

INSERT [dbo].[Quiz_Has_Question] ([Id], [QuizId], [QuestionId]) VALUES (3, 10, 5)
INSERT [dbo].[Quiz_Has_Question] ([Id], [QuizId], [QuestionId]) VALUES (5, 12, 5)
INSERT [dbo].[Quiz_Has_Question] ([Id], [QuizId], [QuestionId]) VALUES (8, 16, 3)
INSERT [dbo].[Quiz_Has_Question] ([Id], [QuizId], [QuestionId]) VALUES (9, 16, 4)
INSERT [dbo].[Quiz_Has_Question] ([Id], [QuizId], [QuestionId]) VALUES (10, 17, 12)
INSERT [dbo].[Quiz_Has_Question] ([Id], [QuizId], [QuestionId]) VALUES (11, 17, 13)
INSERT [dbo].[Quiz_Has_Question] ([Id], [QuizId], [QuestionId]) VALUES (12, 17, 14)
INSERT [dbo].[Quiz_Has_Question] ([Id], [QuizId], [QuestionId]) VALUES (13, 17, 15)
INSERT [dbo].[Quiz_Has_Question] ([Id], [QuizId], [QuestionId]) VALUES (14, 17, 16)
INSERT [dbo].[Quiz_Has_Question] ([Id], [QuizId], [QuestionId]) VALUES (15, 17, 17)
INSERT [dbo].[Quiz_Has_Question] ([Id], [QuizId], [QuestionId]) VALUES (16, 17, 18)
INSERT [dbo].[Quiz_Has_Question] ([Id], [QuizId], [QuestionId]) VALUES (17, 18, 19)
INSERT [dbo].[Quiz_Has_Question] ([Id], [QuizId], [QuestionId]) VALUES (18, 19, 20)
INSERT [dbo].[Quiz_Has_Question] ([Id], [QuizId], [QuestionId]) VALUES (19, 20, 21)
INSERT [dbo].[Quiz_Has_Question] ([Id], [QuizId], [QuestionId]) VALUES (21, 22, 23)
SET IDENTITY_INSERT [dbo].[Quiz_Has_Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Quizs] ON 

INSERT [dbo].[Quizs] ([Id], [Name], [Level], [NumberQuestion], [Duration], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [SubjectId], [LessonId], [DeleteFlag]) VALUES (1, N'Quiz dau ki', N'Medium', 5, 30, NULL, CAST(N'2024-07-06T06:36:15.907' AS DateTime), 1028, NULL, NULL, 2, 2007, 1)
INSERT [dbo].[Quizs] ([Id], [Name], [Level], [NumberQuestion], [Duration], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [SubjectId], [LessonId], [DeleteFlag]) VALUES (5, N'Quiz dau ki', N'Medium', 5, 30, NULL, CAST(N'2024-07-06T08:49:48.470' AS DateTime), 1028, NULL, NULL, 2, 2007, 1)
INSERT [dbo].[Quizs] ([Id], [Name], [Level], [NumberQuestion], [Duration], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [SubjectId], [LessonId], [DeleteFlag]) VALUES (6, N'Quiz dau ki', N'Medium', 5, 30, NULL, CAST(N'2024-07-06T09:19:03.183' AS DateTime), 1028, NULL, NULL, 2, 2007, 1)
INSERT [dbo].[Quizs] ([Id], [Name], [Level], [NumberQuestion], [Duration], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [SubjectId], [LessonId], [DeleteFlag]) VALUES (7, N'Test dau ky', N'Easy', 5, 15, NULL, CAST(N'2024-07-06T10:09:33.910' AS DateTime), 1028, NULL, NULL, 2, 2007, 0)
INSERT [dbo].[Quizs] ([Id], [Name], [Level], [NumberQuestion], [Duration], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [SubjectId], [LessonId], [DeleteFlag]) VALUES (8, N'Nnnnn', N'Easy', 5, 15, NULL, CAST(N'2024-07-06T10:56:41.623' AS DateTime), 1028, NULL, NULL, 2, 2007, 1)
INSERT [dbo].[Quizs] ([Id], [Name], [Level], [NumberQuestion], [Duration], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [SubjectId], [LessonId], [DeleteFlag]) VALUES (9, N'aaaa', N'Easy', 5, 15, NULL, CAST(N'2024-07-06T10:57:49.733' AS DateTime), 1028, NULL, NULL, 2, 2007, 1)
INSERT [dbo].[Quizs] ([Id], [Name], [Level], [NumberQuestion], [Duration], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [SubjectId], [LessonId], [DeleteFlag]) VALUES (10, N'bbb', N'Easy', 5, 15, NULL, CAST(N'2024-07-06T10:59:20.073' AS DateTime), 1028, NULL, NULL, 2, 2007, 1)
INSERT [dbo].[Quizs] ([Id], [Name], [Level], [NumberQuestion], [Duration], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [SubjectId], [LessonId], [DeleteFlag]) VALUES (11, N'eee', N'Easy', 5, 15, NULL, CAST(N'2024-07-06T11:06:04.987' AS DateTime), 1028, NULL, NULL, 2, 2007, 1)
INSERT [dbo].[Quizs] ([Id], [Name], [Level], [NumberQuestion], [Duration], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [SubjectId], [LessonId], [DeleteFlag]) VALUES (12, N'rrrr', N'Easy', 3, 15, NULL, CAST(N'2024-07-06T11:10:40.263' AS DateTime), 1028, NULL, NULL, 2, 2007, 1)
INSERT [dbo].[Quizs] ([Id], [Name], [Level], [NumberQuestion], [Duration], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [SubjectId], [LessonId], [DeleteFlag]) VALUES (13, N'TTT', N'Easy', 3, 13, NULL, CAST(N'2024-07-06T11:13:08.520' AS DateTime), 1028, NULL, NULL, 2, 2007, 1)
INSERT [dbo].[Quizs] ([Id], [Name], [Level], [NumberQuestion], [Duration], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [SubjectId], [LessonId], [DeleteFlag]) VALUES (14, N'yyyy', N'Easy', 4, 12, NULL, CAST(N'2024-07-06T11:15:28.813' AS DateTime), 1028, NULL, NULL, 2, 2007, 1)
INSERT [dbo].[Quizs] ([Id], [Name], [Level], [NumberQuestion], [Duration], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [SubjectId], [LessonId], [DeleteFlag]) VALUES (15, N'yuuu', N'Medium', 3, 12, NULL, CAST(N'2024-07-06T11:39:28.873' AS DateTime), 1028, NULL, NULL, 2, 2007, 1)
INSERT [dbo].[Quizs] ([Id], [Name], [Level], [NumberQuestion], [Duration], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [SubjectId], [LessonId], [DeleteFlag]) VALUES (16, N'gggg', N'Medium', 3, 12, NULL, CAST(N'2024-07-06T12:03:41.603' AS DateTime), 1028, NULL, NULL, 2, 2007, 1)
INSERT [dbo].[Quizs] ([Id], [Name], [Level], [NumberQuestion], [Duration], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [SubjectId], [LessonId], [DeleteFlag]) VALUES (17, N'bbb', N'Medium', 3, 6, NULL, CAST(N'2024-07-06T12:09:34.897' AS DateTime), 1028, NULL, NULL, 2, 2007, 1)
INSERT [dbo].[Quizs] ([Id], [Name], [Level], [NumberQuestion], [Duration], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [SubjectId], [LessonId], [DeleteFlag]) VALUES (18, N'bb', N'Hard', 4, 12, NULL, CAST(N'2024-07-06T12:35:35.310' AS DateTime), 1028, NULL, NULL, 2, 2007, 1)
INSERT [dbo].[Quizs] ([Id], [Name], [Level], [NumberQuestion], [Duration], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [SubjectId], [LessonId], [DeleteFlag]) VALUES (19, N'mmmmm', N'Hard', 3, 4, NULL, CAST(N'2024-07-06T12:42:09.750' AS DateTime), 1028, NULL, NULL, 2, 2007, 1)
INSERT [dbo].[Quizs] ([Id], [Name], [Level], [NumberQuestion], [Duration], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [SubjectId], [LessonId], [DeleteFlag]) VALUES (20, N'ttttt', N'Hard', 12, 2, NULL, CAST(N'2024-07-06T13:01:17.153' AS DateTime), 1028, NULL, NULL, 2, 2007, 1)
INSERT [dbo].[Quizs] ([Id], [Name], [Level], [NumberQuestion], [Duration], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [SubjectId], [LessonId], [DeleteFlag]) VALUES (21, N'gt', N'Hard', 12, 12, NULL, CAST(N'2024-07-06T13:03:02.183' AS DateTime), 1028, NULL, NULL, 2, 2007, 1)
INSERT [dbo].[Quizs] ([Id], [Name], [Level], [NumberQuestion], [Duration], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [SubjectId], [LessonId], [DeleteFlag]) VALUES (22, N'fdsa', N'Medium', 1, 12, NULL, CAST(N'2024-07-06T13:17:11.617' AS DateTime), 1028, NULL, NULL, 2, 2007, 1)
INSERT [dbo].[Quizs] ([Id], [Name], [Level], [NumberQuestion], [Duration], [Type], [CreatedAt], [CreatedBy], [UpdatedAt], [UpdatedBy], [SubjectId], [LessonId], [DeleteFlag]) VALUES (23, N'ytyty', N'Hard', 7, 23, NULL, CAST(N'2024-07-09T20:38:27.850' AS DateTime), NULL, CAST(N'2024-07-09T20:38:27.850' AS DateTime), NULL, 2, NULL, 1)
SET IDENTITY_INSERT [dbo].[Quizs] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id], [name]) VALUES (1, N'User')
INSERT [dbo].[roles] ([id], [name]) VALUES (2, N'Admin')
INSERT [dbo].[roles] ([id], [name]) VALUES (3, N'Expert')
INSERT [dbo].[roles] ([id], [name]) VALUES (4, N'Sale')
INSERT [dbo].[roles] ([id], [name]) VALUES (5, N'Marketing')
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([ID], [Title], [SubTitle], [Content], [Image], [LinkUrl], [CreatedAt], [CreatedBy], [Status]) VALUES (1, N'English', N'Learn Enlishggggg', N'content', N'images/english.jpg', N'http://localhost:8080/QuizPractice/subject/details?id=10', NULL, NULL, 1)
INSERT [dbo].[Slider] ([ID], [Title], [SubTitle], [Content], [Image], [LinkUrl], [CreatedAt], [CreatedBy], [Status]) VALUES (2, N'History', N'Learn History', N'content', N'images/history.jpg', N'http://localhost:8080/QuizPractice/subject/details?id=9', NULL, NULL, 0)
INSERT [dbo].[Slider] ([ID], [Title], [SubTitle], [Content], [Image], [LinkUrl], [CreatedAt], [CreatedBy], [Status]) VALUES (3, N'Math', N'Learn Math', N'content', N'images/math.jpg', N'http://localhost:8080/QuizPractice/subject/details?id=2', NULL, NULL, 0)
INSERT [dbo].[Slider] ([ID], [Title], [SubTitle], [Content], [Image], [LinkUrl], [CreatedAt], [CreatedBy], [Status]) VALUES (4, N'Biology', N'Learn Biology', N'content', N'images/bio.jpg', N'http://localhost:8080/QuizPractice/subject/details?id=8', NULL, NULL, 0)
INSERT [dbo].[Slider] ([ID], [Title], [SubTitle], [Content], [Image], [LinkUrl], [CreatedAt], [CreatedBy], [Status]) VALUES (5, N'Physics', N'Learn Physics', N'content', N'images/physics.jpeg', N'http://localhost:8080/QuizPractice/subject/details?id=6', NULL, NULL, 0)
INSERT [dbo].[Slider] ([ID], [Title], [SubTitle], [Content], [Image], [LinkUrl], [CreatedAt], [CreatedBy], [Status]) VALUES (6, N't2222222222222222222', N't', N't', N'dfsa', N't', CAST(N'2024-06-16' AS Date), 1028, 1)
INSERT [dbo].[Slider] ([ID], [Title], [SubTitle], [Content], [Image], [LinkUrl], [CreatedAt], [CreatedBy], [Status]) VALUES (7, N'e', N'e', N'e', N'e', N'e', CAST(N'2024-06-16' AS Date), 1028, 1)
INSERT [dbo].[Slider] ([ID], [Title], [SubTitle], [Content], [Image], [LinkUrl], [CreatedAt], [CreatedBy], [Status]) VALUES (1006, N'oooo', N'oooo', N'ooooo', NULL, N'oooo', CAST(N'2024-06-21' AS Date), 3032, 1)
INSERT [dbo].[Slider] ([ID], [Title], [SubTitle], [Content], [Image], [LinkUrl], [CreatedAt], [CreatedBy], [Status]) VALUES (1007, N'yyy', N'yyy', N'yyy', N'images/reiview.png', N'yyy', CAST(N'2024-06-21' AS Date), 3032, 1)
INSERT [dbo].[Slider] ([ID], [Title], [SubTitle], [Content], [Image], [LinkUrl], [CreatedAt], [CreatedBy], [Status]) VALUES (1008, N'rr', N'rr', N'rr', N'images/detail1.png', N'rr', CAST(N'2024-06-21' AS Date), 3032, 1)
SET IDENTITY_INSERT [dbo].[Slider] OFF
GO
INSERT [dbo].[status] ([id], [name]) VALUES (1, N'Unactive')
INSERT [dbo].[status] ([id], [name]) VALUES (2, N'Active')
INSERT [dbo].[status] ([id], [name]) VALUES (3, N'Block')
GO
SET IDENTITY_INSERT [dbo].[Student_Quiz_Question] ON 

INSERT [dbo].[Student_Quiz_Question] ([Id], [StudentQuizId], [QuestionId], [YourAnswer], [IsMarked]) VALUES (3, 1, 23, 1018, 1)
INSERT [dbo].[Student_Quiz_Question] ([Id], [StudentQuizId], [QuestionId], [YourAnswer], [IsMarked]) VALUES (4, 2, 3, 1003, 1)
INSERT [dbo].[Student_Quiz_Question] ([Id], [StudentQuizId], [QuestionId], [YourAnswer], [IsMarked]) VALUES (5, 2, 4, 1007, 1)
SET IDENTITY_INSERT [dbo].[Student_Quiz_Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Student_Take_Quiz] ON 

INSERT [dbo].[Student_Take_Quiz] ([Id], [QuizId], [UserId], [Status], [NumberCorrect]) VALUES (1, 22, 27, N'done', 1)
INSERT [dbo].[Student_Take_Quiz] ([Id], [QuizId], [UserId], [Status], [NumberCorrect]) VALUES (2, 16, 27, N'done', 1)
SET IDENTITY_INSERT [dbo].[Student_Take_Quiz] OFF
GO
INSERT [dbo].[subject_has_lesson] ([subject_id], [lesson_id]) VALUES (2, 2)
INSERT [dbo].[subject_has_lesson] ([subject_id], [lesson_id]) VALUES (2, 1)
INSERT [dbo].[subject_has_lesson] ([subject_id], [lesson_id]) VALUES (2, 1002)
INSERT [dbo].[subject_has_lesson] ([subject_id], [lesson_id]) VALUES (2, 1004)
INSERT [dbo].[subject_has_lesson] ([subject_id], [lesson_id]) VALUES (2, 1005)
INSERT [dbo].[subject_has_lesson] ([subject_id], [lesson_id]) VALUES (2, 2003)
INSERT [dbo].[subject_has_lesson] ([subject_id], [lesson_id]) VALUES (2, 2004)
INSERT [dbo].[subject_has_lesson] ([subject_id], [lesson_id]) VALUES (2, 2005)
INSERT [dbo].[subject_has_lesson] ([subject_id], [lesson_id]) VALUES (2, 2006)
INSERT [dbo].[subject_has_lesson] ([subject_id], [lesson_id]) VALUES (2, 2007)
GO
INSERT [dbo].[subject_has_price_package] ([subject_id], [price_package_id]) VALUES (2, 1)
INSERT [dbo].[subject_has_price_package] ([subject_id], [price_package_id]) VALUES (2, 2)
INSERT [dbo].[subject_has_price_package] ([subject_id], [price_package_id]) VALUES (2, 3)
INSERT [dbo].[subject_has_price_package] ([subject_id], [price_package_id]) VALUES (6, 1)
INSERT [dbo].[subject_has_price_package] ([subject_id], [price_package_id]) VALUES (6, 3)
INSERT [dbo].[subject_has_price_package] ([subject_id], [price_package_id]) VALUES (7, 1)
INSERT [dbo].[subject_has_price_package] ([subject_id], [price_package_id]) VALUES (7, 2)
INSERT [dbo].[subject_has_price_package] ([subject_id], [price_package_id]) VALUES (8, 1)
INSERT [dbo].[subject_has_price_package] ([subject_id], [price_package_id]) VALUES (8, 3)
INSERT [dbo].[subject_has_price_package] ([subject_id], [price_package_id]) VALUES (9, 3)
INSERT [dbo].[subject_has_price_package] ([subject_id], [price_package_id]) VALUES (10, 1)
INSERT [dbo].[subject_has_price_package] ([subject_id], [price_package_id]) VALUES (14, 1)
INSERT [dbo].[subject_has_price_package] ([subject_id], [price_package_id]) VALUES (14, 2)
INSERT [dbo].[subject_has_price_package] ([subject_id], [price_package_id]) VALUES (14, 3)
INSERT [dbo].[subject_has_price_package] ([subject_id], [price_package_id]) VALUES (15, 1)
INSERT [dbo].[subject_has_price_package] ([subject_id], [price_package_id]) VALUES (15, 2)
INSERT [dbo].[subject_has_price_package] ([subject_id], [price_package_id]) VALUES (15, 3)
GO
INSERT [dbo].[subject_has_tag] ([subject_id], [tag_id]) VALUES (2, 1)
INSERT [dbo].[subject_has_tag] ([subject_id], [tag_id]) VALUES (2, 3)
INSERT [dbo].[subject_has_tag] ([subject_id], [tag_id]) VALUES (2, 4)
INSERT [dbo].[subject_has_tag] ([subject_id], [tag_id]) VALUES (6, 1)
INSERT [dbo].[subject_has_tag] ([subject_id], [tag_id]) VALUES (6, 2)
INSERT [dbo].[subject_has_tag] ([subject_id], [tag_id]) VALUES (6, 5)
INSERT [dbo].[subject_has_tag] ([subject_id], [tag_id]) VALUES (7, 8)
INSERT [dbo].[subject_has_tag] ([subject_id], [tag_id]) VALUES (7, 9)
INSERT [dbo].[subject_has_tag] ([subject_id], [tag_id]) VALUES (8, 12)
INSERT [dbo].[subject_has_tag] ([subject_id], [tag_id]) VALUES (9, 14)
INSERT [dbo].[subject_has_tag] ([subject_id], [tag_id]) VALUES (10, 12)
INSERT [dbo].[subject_has_tag] ([subject_id], [tag_id]) VALUES (14, 13)
INSERT [dbo].[subject_has_tag] ([subject_id], [tag_id]) VALUES (14, 15)
INSERT [dbo].[subject_has_tag] ([subject_id], [tag_id]) VALUES (15, 15)
INSERT [dbo].[subject_has_tag] ([subject_id], [tag_id]) VALUES (15, 16)
GO
SET IDENTITY_INSERT [dbo].[Subject_Register] ON 

INSERT [dbo].[Subject_Register] ([Id], [SubjectId], [UserId], [PackageId], [CreatedAt], [UpdatedAt], [UpdatedBy], [Status]) VALUES (1, 2, 27, 1, NULL, NULL, NULL, N'pending')
INSERT [dbo].[Subject_Register] ([Id], [SubjectId], [UserId], [PackageId], [CreatedAt], [UpdatedAt], [UpdatedBy], [Status]) VALUES (3, 2, 38, 1, CAST(N'2024-06-09T00:00:00.000' AS DateTime), NULL, NULL, N'pending')
INSERT [dbo].[Subject_Register] ([Id], [SubjectId], [UserId], [PackageId], [CreatedAt], [UpdatedAt], [UpdatedBy], [Status]) VALUES (4, 2, 39, 2, CAST(N'2024-06-09T00:00:00.000' AS DateTime), NULL, NULL, N'pending')
INSERT [dbo].[Subject_Register] ([Id], [SubjectId], [UserId], [PackageId], [CreatedAt], [UpdatedAt], [UpdatedBy], [Status]) VALUES (5, 2, 40, 2, CAST(N'2024-06-09T00:00:00.000' AS DateTime), NULL, NULL, N'pending')
INSERT [dbo].[Subject_Register] ([Id], [SubjectId], [UserId], [PackageId], [CreatedAt], [UpdatedAt], [UpdatedBy], [Status]) VALUES (11, 10, 27, 1, CAST(N'2024-06-10T21:23:38.983' AS DateTime), NULL, NULL, N'done')
INSERT [dbo].[Subject_Register] ([Id], [SubjectId], [UserId], [PackageId], [CreatedAt], [UpdatedAt], [UpdatedBy], [Status]) VALUES (13, 14, 27, 1, CAST(N'2024-06-10T21:39:30.263' AS DateTime), NULL, NULL, N'done')
INSERT [dbo].[Subject_Register] ([Id], [SubjectId], [UserId], [PackageId], [CreatedAt], [UpdatedAt], [UpdatedBy], [Status]) VALUES (2005, 2, 3031, 1, CAST(N'2024-06-19T00:00:00.000' AS DateTime), NULL, NULL, N'pending')
SET IDENTITY_INSERT [dbo].[Subject_Register] OFF
GO
SET IDENTITY_INSERT [dbo].[subjects] ON 

INSERT [dbo].[subjects] ([id], [name], [creator_id], [creater_at], [update_at], [status], [img], [description], [dimensionId]) VALUES (2, N'PRO192', 1028, CAST(N'2024-04-10' AS Date), CAST(N'2024-04-15' AS Date), 1, N'images/pro192.webp', N'This course provides the knowledge and skills of Object Oriented Programming using the Java Programming Language.', 2)
INSERT [dbo].[subjects] ([id], [name], [creator_id], [creater_at], [update_at], [status], [img], [description], [dimensionId]) VALUES (6, N'PRJ301', 1028, CAST(N'2024-05-25' AS Date), CAST(N'2024-06-14' AS Date), 1, N'images/prj301.webp', N'By the end of this course Students will be able to:
a) Knowledge: (what will students know?)
• Understand the core technologies of Java web programming:
- Servlet and JSP
- Scope of sharing state (session, application, request,page)
- JSP Tags, JSTL, Customtags
- Filtering
• Know how to develop and deploy your own websites using Java
• Understand and be able to apply MVC architecture for the web
b) Skills: (what will students be able to do?)
• Basic Web application development applying MVC Design Pattern using Servlet/Filter as Controller', 2)
INSERT [dbo].[subjects] ([id], [name], [creator_id], [creater_at], [update_at], [status], [img], [description], [dimensionId]) VALUES (7, N'DBI202', 1028, CAST(N'2024-05-25' AS Date), CAST(N'2024-05-25' AS Date), 1, N'images/dbi202.webp', N'- Knowledge about database systems has become an essential part of an education in computer science because database management has evolved from a specialized computer application to a central component of a modern computing environment.
- The content of this course includes aspects of database management basic concepts, database design, database languages, and database-system implementation. Basing on these contents, the course emphasizes on how to organize, maintain and retrieve efficiently data and information from a DBMS.', 2)
INSERT [dbo].[subjects] ([id], [name], [creator_id], [creater_at], [update_at], [status], [img], [description], [dimensionId]) VALUES (8, N'MAE101', 1028, CAST(N'2024-05-25' AS Date), CAST(N'2024-05-25' AS Date), 1, N'images/mae101.webp', N'• The basic concepts of single variable calculus: limit, derivative, integral.
• Concepts of linear system of equations, matrix and their applications
• The concepts of vector spaces, basis and dimension, linear transformations and their applications.', 2)
INSERT [dbo].[subjects] ([id], [name], [creator_id], [creater_at], [update_at], [status], [img], [description], [dimensionId]) VALUES (9, N'JPD113', 1028, CAST(N'2024-05-25' AS Date), CAST(N'2024-05-25' AS Date), 1, N'images/jpd113.jpg', N'Can understand and use familiar expressions used in daily life to meet specific communication needs such as being able to introduce oneself (introducing name, nationality, occupation, interests, etc.). .); can ask for locations, can communicate with staff to ask prices, order food, etc.; Can talk about your daily activities and ask about the working hours of organizations.', 2)
INSERT [dbo].[subjects] ([id], [name], [creator_id], [creater_at], [update_at], [status], [img], [description], [dimensionId]) VALUES (10, N'MAS291', 1028, CAST(N'2024-05-25' AS Date), CAST(N'2024-05-25' AS Date), 1, N'images/mas291.webp', N'The fundamental principles of probability and their applications', 2)
INSERT [dbo].[subjects] ([id], [name], [creator_id], [creater_at], [update_at], [status], [img], [description], [dimensionId]) VALUES (14, N'ENM492c', 3, CAST(N'2024-05-29' AS Date), CAST(N'2024-05-29' AS Date), 1, N'images/english.jpg', N'The skills taught in this Specialization will empower you to succeed in any college-level course or professional field. You’ll learn to conduct rigorous academic research and to express your ideas clearly in an academic format. In the final Capstone Project, all the knowledge that you’ve gained over the span of these courses will culminate into an academic research paper on an issue of your choice.', 2)
INSERT [dbo].[subjects] ([id], [name], [creator_id], [creater_at], [update_at], [status], [img], [description], [dimensionId]) VALUES (15, N'MNL111', 5, CAST(N'2024-05-29' AS Date), CAST(N'2024-05-29' AS Date), 1, N'images/mln111.jpg', N'Marxist-Leninist philosophy studies dialectical materialist perspectives on nature, society, and thought, and thereby proves that the materialist worldview becomes comprehensive and radical. Applying and expanding the materialist perspective on social research, Marx introduced the materialist concept of history, pointing out the path to studying the laws of social development, as well as the discovery of natural development. However, there is no need for subjective will, but objective rules make decisions. The birth of Marxist-Leninist Philosophy laid the basis for truly scientific research into history and social life.', 2)
SET IDENTITY_INSERT [dbo].[subjects] OFF
GO
INSERT [dbo].[tags] ([id], [tag]) VALUES (1, N'#java')
INSERT [dbo].[tags] ([id], [tag]) VALUES (2, N'#javaweb')
INSERT [dbo].[tags] ([id], [tag]) VALUES (3, N'#javacore')
INSERT [dbo].[tags] ([id], [tag]) VALUES (4, N'#oop')
INSERT [dbo].[tags] ([id], [tag]) VALUES (5, N'#web')
INSERT [dbo].[tags] ([id], [tag]) VALUES (6, N'#csharp')
INSERT [dbo].[tags] ([id], [tag]) VALUES (7, N'#wpf')
INSERT [dbo].[tags] ([id], [tag]) VALUES (8, N'#database')
INSERT [dbo].[tags] ([id], [tag]) VALUES (9, N'#sqlserver')
INSERT [dbo].[tags] ([id], [tag]) VALUES (10, N'#testing')
INSERT [dbo].[tags] ([id], [tag]) VALUES (11, N'#require')
INSERT [dbo].[tags] ([id], [tag]) VALUES (12, N'#math')
INSERT [dbo].[tags] ([id], [tag]) VALUES (13, N'#english')
INSERT [dbo].[tags] ([id], [tag]) VALUES (14, N'#japanese')
INSERT [dbo].[tags] ([id], [tag]) VALUES (15, N'#softskill')
INSERT [dbo].[tags] ([id], [tag]) VALUES (16, N'#politics')
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (3, N'John', N'john.doe@example.com', N'1234567890', 1, N'images/pic-1.jpg', N'password123', CAST(N'2024-05-01' AS Date), CAST(N'2024-05-01' AS Date), 1, 2, N'token123')
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (4, N'Jane', N'jane.smith@example.com', N'0987654321', 2, N'images/pic-1.jpg', N'password456', CAST(N'2024-05-02' AS Date), CAST(N'2024-05-02' AS Date), 2, 2, N'token456')
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (5, N'John', N'john.doe@example.com', N'1234567890', 1, N'images/pic-1.jpg', N'password123', CAST(N'2024-05-01' AS Date), CAST(N'2024-05-01' AS Date), 1, 2, N'token123')
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (6, N'Jane', N'jane.smith@example.com', N'0987654321', 2, N'images/pic-1.jpg', N'password456', CAST(N'2024-05-02' AS Date), CAST(N'2024-05-02' AS Date), 2, 2, N'token456')
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (7, N'John', N'john.doe@example.com', N'1234567890', 1, N'images/pic-1.jpg', N'password123', CAST(N'2024-05-01' AS Date), CAST(N'2024-05-01' AS Date), 1, 2, N'token123')
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (8, N'Jane', N'jane.smith@example.com', N'0987654321', 2, N'images/pic-1.jpg', N'password456', CAST(N'2024-05-02' AS Date), CAST(N'2024-05-02' AS Date), 2, 2, N'token456')
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (22, N'     ', N'NghiNVHE176303@fpt.edu.vn', N'', 1, N'images/pic-1.jpg', N'6361614211bff9a6d7d432cc7c29a15b63f18e519aa846f6262e6771bb3fcf9a35bcece7ad325dc0d84bf6ab2781e37cbfc2bc1c2fcd27e4c8e62beecbf133b0', CAST(N'2024-06-01' AS Date), CAST(N'2024-06-01' AS Date), 1, 2, N'XiHcwx9wvIcOIYZPWTN8RBQB579ErU')
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (26, N'Teddy Smith', N'vannghibg03@gmail.com', N'0364920299', 1, N'images/pic-1.jpg', N'6361614211bff9a6d7d432cc7c29a15b63f18e519aa846f6262e6771bb3fcf9a35bcece7ad325dc0d84bf6ab2781e37cbfc2bc1c2fcd27e4c8e62beecbf133b0', CAST(N'2024-06-03' AS Date), CAST(N'2024-06-03' AS Date), 1, 2, N'sv9aVa7bUCCTTMqyBCzE56cOh56a5S')
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (27, N'tuan tuan', N'tuanvahe140809@fpt.edu.vn', N'0337708048', 1, N'images/pic-1.jpg', N'676a43d3cc7523528866e390856480370c7a687654067e1f79043b104e353c1d3a6d0d8e1152376a23ee9a30fec751259be388654c2e692a62fc72c66ad048d5', CAST(N'2024-06-06' AS Date), CAST(N'2024-06-06' AS Date), 1, 2, N'4L6T8NFy4XcwfRvipjtV1KXxzmPZKT')
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (28, N'yentyen', N'yen@gmail.com', N'12312', 1, NULL, N'123', NULL, NULL, NULL, 2, NULL)
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (29, N'yentyen', N'yen@gmail.com', N'12312', 1, NULL, N'123', CAST(N'2024-06-06' AS Date), NULL, 1, 2, NULL)
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (30, N'hihi', N'hihi@gmail.com', N'1231231', 1, NULL, N'123', CAST(N'2024-06-09' AS Date), NULL, 1, 2, NULL)
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (31, N'hihi', N'hihi@gmail.com', N'1231231', 1, NULL, N'123', CAST(N'2024-06-09' AS Date), NULL, 1, 2, NULL)
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (32, N'hihi', N'hihi@gmail.com', N'1231231', 1, NULL, N'123', CAST(N'2024-06-09' AS Date), NULL, 1, 2, NULL)
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (33, N'hihi', N'hihi@gmail.com', N'1231231', 1, NULL, N'123', CAST(N'2024-06-09' AS Date), NULL, 1, 2, NULL)
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (34, N'hihi', N'hihi@gmail.com', N'1231231', 1, NULL, N'123', CAST(N'2024-06-09' AS Date), NULL, 1, 2, NULL)
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (35, N'hihi', N'hihi@gmail.com', N'1231231', 1, NULL, N'123', CAST(N'2024-06-09' AS Date), NULL, 1, 2, NULL)
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (36, N'hihi', N'hihi@gmail.com', N'1231231', 1, NULL, N'123', CAST(N'2024-06-09' AS Date), NULL, 1, 2, NULL)
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (37, N'tfff', N'tuanvahe140809@fpt.edu.vn', N'0337708048', 1, NULL, N'123', CAST(N'2024-06-09' AS Date), NULL, 1, 2, N'4L6T8NFy4XcwfRvipjtV1KXxzmPZKT')
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (38, N'tfff', N'tuanvahe140809@fpt.edu.vn', N'0337708048', 1, NULL, N'123', CAST(N'2024-06-09' AS Date), NULL, 1, 2, N'4L6T8NFy4XcwfRvipjtV1KXxzmPZKT')
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (39, N'vat2ksan8', N'tuanvahe140809@fpt.edu.vn', N'0337708048', 1, NULL, N'123', CAST(N'2024-06-09' AS Date), NULL, 1, 2, N'4L6T8NFy4XcwfRvipjtV1KXxzmPZKT')
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (40, N'vat2ksan8', N'tuanvahe140809@fpt.edu.vn', N'0337708048', 1, NULL, N'123', CAST(N'2024-06-09' AS Date), NULL, 1, 2, N'4L6T8NFy4XcwfRvipjtV1KXxzmPZKT')
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (1028, N'tuan tuan', N'tuan@gmail.com', N'0337708048', 0, N'images/pic-5.jpg', N'4b49c22092ec288a86823c7b20448339f2d356e58370ffd077db5ce35a20ecf75039b43f8b9d242f06254d613f06765b17024b7ab8d45ffe179452a4da41a885', CAST(N'2024-06-14' AS Date), CAST(N'2024-06-14' AS Date), 3, 2, N'FBO99gByxTDZvQAHGIwL1XWLxcEZHX')
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (3031, N'aaaaa', N'tuanvahe140809@fpt.edu.vn', N'0337708048', 0, N'images/pic-5.jpg', N'3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', CAST(N'2024-06-19' AS Date), CAST(N'2024-06-19' AS Date), 1, 2, N'vMVe428vzSQmlh1I1EcW2qus1O8Y7v')
INSERT [dbo].[users] ([id], [full_name], [email], [phone_number], [gender], [profile_img], [password], [created_at], [updated_at], [role_id], [status_id], [token]) VALUES (3032, N'fdsa', N'marketing@gmail.com', N'0337708048', 1, N'images/pic-1.jpg', N'676a43d3cc7523528866e390856480370c7a687654067e1f79043b104e353c1d3a6d0d8e1152376a23ee9a30fec751259be388654c2e692a62fc72c66ad048d5', CAST(N'2024-06-19' AS Date), CAST(N'2024-06-19' AS Date), 5, 2, N'y1RJ12HEM0M3g6zOEIsXC7eze4YPQ0')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[Practice_Question] ADD  DEFAULT ((0)) FOR [IsMarked]
GO
ALTER TABLE [dbo].[Practices] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Quizs] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Quizs] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Subject_Register] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Subject_Register] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[User_Quiz] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[blogs]  WITH CHECK ADD  CONSTRAINT [FK_blog_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[blogs] CHECK CONSTRAINT [FK_blog_Categories]
GO
ALTER TABLE [dbo].[blogs]  WITH CHECK ADD  CONSTRAINT [FK_blogs_users] FOREIGN KEY([author_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[blogs] CHECK CONSTRAINT [FK_blogs_users]
GO
ALTER TABLE [dbo].[categories]  WITH CHECK ADD  CONSTRAINT [FK_categories_users] FOREIGN KEY([created_by])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[categories] CHECK CONSTRAINT [FK_categories_users]
GO
ALTER TABLE [dbo].[categories]  WITH CHECK ADD  CONSTRAINT [FK_categories_users1] FOREIGN KEY([updated_by])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[categories] CHECK CONSTRAINT [FK_categories_users1]
GO
ALTER TABLE [dbo].[Lesson_Has_Question]  WITH CHECK ADD FOREIGN KEY([LessonId])
REFERENCES [dbo].[lessons] ([id])
GO
ALTER TABLE [dbo].[Lesson_Has_Question]  WITH CHECK ADD FOREIGN KEY([QuestionId])
REFERENCES [dbo].[questions] ([id])
GO
ALTER TABLE [dbo].[Lesson_Has_Quiz]  WITH CHECK ADD FOREIGN KEY([LessonId])
REFERENCES [dbo].[lessons] ([id])
GO
ALTER TABLE [dbo].[Lesson_Has_Quiz]  WITH CHECK ADD FOREIGN KEY([QuizId])
REFERENCES [dbo].[Quizs] ([Id])
GO
ALTER TABLE [dbo].[lessons]  WITH CHECK ADD  CONSTRAINT [FK_Lessons_Quizs] FOREIGN KEY([QuizId])
REFERENCES [dbo].[Quizs] ([Id])
GO
ALTER TABLE [dbo].[lessons] CHECK CONSTRAINT [FK_Lessons_Quizs]
GO
ALTER TABLE [dbo].[payments]  WITH CHECK ADD  CONSTRAINT [FK_payments_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[payments] CHECK CONSTRAINT [FK_payments_users]
GO
ALTER TABLE [dbo].[Practice_Question]  WITH CHECK ADD FOREIGN KEY([PracticeId])
REFERENCES [dbo].[Practices] ([Id])
GO
ALTER TABLE [dbo].[Practice_Question]  WITH CHECK ADD FOREIGN KEY([QuestionId])
REFERENCES [dbo].[questions] ([id])
GO
ALTER TABLE [dbo].[Practice_Question]  WITH CHECK ADD FOREIGN KEY([YourAnswer])
REFERENCES [dbo].[answers] ([id])
GO
ALTER TABLE [dbo].[Practices]  WITH CHECK ADD FOREIGN KEY([SubjectId])
REFERENCES [dbo].[subjects] ([id])
GO
ALTER TABLE [dbo].[Practices]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[question_has_answer]  WITH CHECK ADD  CONSTRAINT [FK_question_has_answer_answers] FOREIGN KEY([answer_id])
REFERENCES [dbo].[answers] ([id])
GO
ALTER TABLE [dbo].[question_has_answer] CHECK CONSTRAINT [FK_question_has_answer_answers]
GO
ALTER TABLE [dbo].[question_has_answer]  WITH CHECK ADD  CONSTRAINT [FK_question_has_answer_questions] FOREIGN KEY([question_id])
REFERENCES [dbo].[questions] ([id])
GO
ALTER TABLE [dbo].[question_has_answer] CHECK CONSTRAINT [FK_question_has_answer_questions]
GO
ALTER TABLE [dbo].[Quiz_Has_Question]  WITH CHECK ADD FOREIGN KEY([QuestionId])
REFERENCES [dbo].[questions] ([id])
GO
ALTER TABLE [dbo].[Quiz_Has_Question]  WITH CHECK ADD FOREIGN KEY([QuizId])
REFERENCES [dbo].[Quizs] ([Id])
GO
ALTER TABLE [dbo].[Quizs]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[Quizs]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[Quizs]  WITH CHECK ADD  CONSTRAINT [FK_Quizs_Lessons] FOREIGN KEY([LessonId])
REFERENCES [dbo].[lessons] ([id])
GO
ALTER TABLE [dbo].[Quizs] CHECK CONSTRAINT [FK_Quizs_Lessons]
GO
ALTER TABLE [dbo].[Quizs]  WITH CHECK ADD  CONSTRAINT [FK_Quizs_Subjects] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[subjects] ([id])
GO
ALTER TABLE [dbo].[Quizs] CHECK CONSTRAINT [FK_Quizs_Subjects]
GO
ALTER TABLE [dbo].[Slider]  WITH CHECK ADD  CONSTRAINT [FK_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[Slider] CHECK CONSTRAINT [FK_CreatedBy]
GO
ALTER TABLE [dbo].[Student_Quiz_Question]  WITH CHECK ADD FOREIGN KEY([QuestionId])
REFERENCES [dbo].[questions] ([id])
GO
ALTER TABLE [dbo].[Student_Quiz_Question]  WITH CHECK ADD FOREIGN KEY([StudentQuizId])
REFERENCES [dbo].[Student_Take_Quiz] ([Id])
GO
ALTER TABLE [dbo].[Student_Quiz_Question]  WITH CHECK ADD FOREIGN KEY([YourAnswer])
REFERENCES [dbo].[answers] ([id])
GO
ALTER TABLE [dbo].[Student_Take_Quiz]  WITH CHECK ADD FOREIGN KEY([QuizId])
REFERENCES [dbo].[Quizs] ([Id])
GO
ALTER TABLE [dbo].[Student_Take_Quiz]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[subject_has_lesson]  WITH CHECK ADD  CONSTRAINT [FK_subject_has_lesson_lessons] FOREIGN KEY([lesson_id])
REFERENCES [dbo].[lessons] ([id])
GO
ALTER TABLE [dbo].[subject_has_lesson] CHECK CONSTRAINT [FK_subject_has_lesson_lessons]
GO
ALTER TABLE [dbo].[subject_has_lesson]  WITH CHECK ADD  CONSTRAINT [FK_subject_has_lesson_subjects] FOREIGN KEY([subject_id])
REFERENCES [dbo].[subjects] ([id])
GO
ALTER TABLE [dbo].[subject_has_lesson] CHECK CONSTRAINT [FK_subject_has_lesson_subjects]
GO
ALTER TABLE [dbo].[subject_has_price_package]  WITH CHECK ADD  CONSTRAINT [FK_subject_has_price_package_package_price] FOREIGN KEY([price_package_id])
REFERENCES [dbo].[package_price] ([id])
GO
ALTER TABLE [dbo].[subject_has_price_package] CHECK CONSTRAINT [FK_subject_has_price_package_package_price]
GO
ALTER TABLE [dbo].[subject_has_price_package]  WITH CHECK ADD  CONSTRAINT [FK_subject_has_price_package_subjects] FOREIGN KEY([subject_id])
REFERENCES [dbo].[subjects] ([id])
GO
ALTER TABLE [dbo].[subject_has_price_package] CHECK CONSTRAINT [FK_subject_has_price_package_subjects]
GO
ALTER TABLE [dbo].[Subject_Has_Quiz]  WITH CHECK ADD FOREIGN KEY([QuizId])
REFERENCES [dbo].[Quizs] ([Id])
GO
ALTER TABLE [dbo].[Subject_Has_Quiz]  WITH CHECK ADD FOREIGN KEY([SubjectId])
REFERENCES [dbo].[subjects] ([id])
GO
ALTER TABLE [dbo].[subject_has_tag]  WITH CHECK ADD  CONSTRAINT [FK_subject_has_tag_subjects] FOREIGN KEY([subject_id])
REFERENCES [dbo].[subjects] ([id])
GO
ALTER TABLE [dbo].[subject_has_tag] CHECK CONSTRAINT [FK_subject_has_tag_subjects]
GO
ALTER TABLE [dbo].[subject_has_tag]  WITH CHECK ADD  CONSTRAINT [FK_subject_has_tag_tags] FOREIGN KEY([tag_id])
REFERENCES [dbo].[tags] ([id])
GO
ALTER TABLE [dbo].[subject_has_tag] CHECK CONSTRAINT [FK_subject_has_tag_tags]
GO
ALTER TABLE [dbo].[Subject_Register]  WITH CHECK ADD FOREIGN KEY([PackageId])
REFERENCES [dbo].[package_price] ([id])
GO
ALTER TABLE [dbo].[Subject_Register]  WITH CHECK ADD FOREIGN KEY([SubjectId])
REFERENCES [dbo].[subjects] ([id])
GO
ALTER TABLE [dbo].[Subject_Register]  WITH CHECK ADD FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[Subject_Register]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[subjects]  WITH CHECK ADD  CONSTRAINT [FK_Subjects_Dimension] FOREIGN KEY([dimensionId])
REFERENCES [dbo].[Dimension] ([DimensionId])
GO
ALTER TABLE [dbo].[subjects] CHECK CONSTRAINT [FK_Subjects_Dimension]
GO
ALTER TABLE [dbo].[subjects]  WITH CHECK ADD  CONSTRAINT [fk_user] FOREIGN KEY([creator_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[subjects] CHECK CONSTRAINT [fk_user]
GO
ALTER TABLE [dbo].[user_has_subject]  WITH CHECK ADD  CONSTRAINT [FK_user_has_subject_subjects] FOREIGN KEY([subject_id])
REFERENCES [dbo].[subjects] ([id])
GO
ALTER TABLE [dbo].[user_has_subject] CHECK CONSTRAINT [FK_user_has_subject_subjects]
GO
ALTER TABLE [dbo].[user_has_subject]  WITH CHECK ADD  CONSTRAINT [FK_user_has_subject_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[user_has_subject] CHECK CONSTRAINT [FK_user_has_subject_users]
GO
ALTER TABLE [dbo].[User_Quiz]  WITH CHECK ADD FOREIGN KEY([QuizId])
REFERENCES [dbo].[Quizs] ([Id])
GO
ALTER TABLE [dbo].[User_Quiz]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[User_Quiz_Answer]  WITH CHECK ADD FOREIGN KEY([QuestionId])
REFERENCES [dbo].[questions] ([id])
GO
ALTER TABLE [dbo].[User_Quiz_Answer]  WITH CHECK ADD FOREIGN KEY([User_Quiz_Id])
REFERENCES [dbo].[User_Quiz] ([Id])
GO
ALTER TABLE [dbo].[User_Quiz_Answer]  WITH CHECK ADD FOREIGN KEY([YourAnswer])
REFERENCES [dbo].[answers] ([id])
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_roles]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_status] FOREIGN KEY([status_id])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_status]
GO
ALTER TABLE [dbo].[Student_Take_Quiz]  WITH CHECK ADD CHECK  (([Status]='pending' OR [Status]='done'))
GO
USE [master]
GO
ALTER DATABASE [SWP391_G6] SET  READ_WRITE 
GO
