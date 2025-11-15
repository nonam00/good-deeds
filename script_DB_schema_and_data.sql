USE [master]
GO
/****** Object:  Database [dbhakaton]    Script Date: 15.11.2025 16:04:59 ******/
CREATE DATABASE [dbhakaton]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbhakaton', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\dbhakaton.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbhakaton_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\dbhakaton_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [dbhakaton] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbhakaton].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbhakaton] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbhakaton] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbhakaton] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbhakaton] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbhakaton] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbhakaton] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbhakaton] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbhakaton] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbhakaton] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbhakaton] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbhakaton] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbhakaton] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbhakaton] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbhakaton] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbhakaton] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbhakaton] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbhakaton] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbhakaton] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbhakaton] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbhakaton] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbhakaton] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbhakaton] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbhakaton] SET RECOVERY FULL 
GO
ALTER DATABASE [dbhakaton] SET  MULTI_USER 
GO
ALTER DATABASE [dbhakaton] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbhakaton] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbhakaton] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbhakaton] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbhakaton] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbhakaton] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbhakaton', N'ON'
GO
ALTER DATABASE [dbhakaton] SET QUERY_STORE = ON
GO
ALTER DATABASE [dbhakaton] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dbhakaton]
GO
/****** Object:  Table [dbo].[account]    Script Date: 15.11.2025 16:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[account_id] [int] NOT NULL,
	[account_email] [nvarchar](40) NOT NULL,
	[acccount_name] [nvarchar](30) NOT NULL,
	[account_surname] [nvarchar](30) NOT NULL,
	[account_password] [nvarchar](30) NOT NULL,
	[NKO_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 15.11.2025 16:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[categoty_id] [int] NOT NULL,
	[category_name] [nvarchar](55) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoty_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[functional]    Script Date: 15.11.2025 16:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[functional](
	[functional_id] [int] NOT NULL,
	[functional_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[functional_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[measure]    Script Date: 15.11.2025 16:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[measure](
	[measure_id] [int] NOT NULL,
	[measure_name] [nvarchar](40) NOT NULL,
	[measure_description] [nvarchar](200) NOT NULL,
	[NKO_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[measure_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NKO]    Script Date: 15.11.2025 16:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NKO](
	[NKO_id] [int] NOT NULL,
	[NKO_name] [nvarchar](150) NOT NULL,
	[category_id] [int] NULL,
	[NKO_description] [text] NULL,
	[NKO_contact_number] [nchar](18) NULL,
	[NKO_address] [nvarchar](200) NULL,
	[NKO_logo] [varbinary](max) NULL,
	[NKO_link] [nvarchar](150) NULL,
	[NKO_lng] [decimal](9, 6) NULL,
	[NKO_lat] [decimal](9, 6) NULL,
PRIMARY KEY CLUSTERED 
(
	[NKO_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[volunteer]    Script Date: 15.11.2025 16:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[volunteer](
	[volunteer_id] [int] NOT NULL,
	[volunteer_name] [nvarchar](40) NOT NULL,
	[volunteer_surname] [nvarchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[volunteer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[volunteer_measure]    Script Date: 15.11.2025 16:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[volunteer_measure](
	[volunteer_measure_id] [int] NOT NULL,
	[volunteer_id] [int] NOT NULL,
	[measure_id] [int] NOT NULL,
	[functional_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[volunteer_measure_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[category] ([categoty_id], [category_name]) VALUES (1, N'Местное сообщество и развитие территорий')
GO
INSERT [dbo].[category] ([categoty_id], [category_name]) VALUES (2, N'Социальная защита (помощь людям в трудной ситуации)')
GO
INSERT [dbo].[category] ([categoty_id], [category_name]) VALUES (3, N'Экология и устойчивое развитие')
GO
INSERT [dbo].[category] ([categoty_id], [category_name]) VALUES (4, N'Здоровье и спорт')
GO
INSERT [dbo].[category] ([categoty_id], [category_name]) VALUES (5, N'Культура и образование')
GO
INSERT [dbo].[category] ([categoty_id], [category_name]) VALUES (6, N'Защита животных')
GO
INSERT [dbo].[category] ([categoty_id], [category_name]) VALUES (7, N'Другое')
GO
INSERT [dbo].[NKO] ([NKO_id], [NKO_name], [category_id], [NKO_description], [NKO_contact_number], [NKO_address], [NKO_logo], [NKO_link], [NKO_lng], [NKO_lat]) VALUES (1, N'Муниципальный ресурсный центр "СОдействие"', 7, N'Муниципальный ресурсный центр "СОдействие" оказывает поддержку общественным инициативам и некоммерческим общественным организациям г.Железногорска. Если вы активный гражданин г.Железногорска и хотите реализовывать проекты, у вас есть своя некомерческая общественная организация или вы хотите её создать, но не знаете как, мы рады оказать Вам любой вид поддержки: информационную, консультационную, образовательную, финансовую, имущественную. Кроме того, вы можете просто попить чай и обсудить новые проекты, посетив нас по адресу г. Железногорск, ул. Свердлова, 47.', N'+7 (391) 974-55-55', N'Россия, Железногорск , Свердлова, 47', NULL, N'resursny-centr-26.orgs.biz', NULL, NULL)
GO
INSERT [dbo].[NKO] ([NKO_id], [NKO_name], [category_id], [NKO_description], [NKO_contact_number], [NKO_address], [NKO_logo], [NKO_link], [NKO_lng], [NKO_lat]) VALUES (2, N'Димитровградская местная общественная организация инвалидов-опорников «Преодоление»', 2, NULL, N'+7 (927) 823-63-51', N'433513, Ульяновская область, г.Димитровград, ул. Дрогобычская, дом 30', NULL, N'https://opuo.ru/list_nko/dimitrovgradskaya-mestnaya-obshchestvennaya-organizaciya-invalidov-opornikov-preodolenie/', NULL, NULL)
GO
INSERT [dbo].[NKO] ([NKO_id], [NKO_name], [category_id], [NKO_description], [NKO_contact_number], [NKO_address], [NKO_logo], [NKO_link], [NKO_lng], [NKO_lat]) VALUES (3, N'Ассоциация «Территориального общественного самоуправления города Димитровграда»', 1, N'Одним из важных направлений деятельности Ассоциация « ТОС г. Димитровграда» является содействие гражданам и некоммерческим организациям при решении вопросов, возникающих у них в процессе реализации социальных функций.

Целью деятельности Ассоциация « ТОС г. Димитровграда» является оказание услуг по поддержке правового, социального, организационно-технического и методического содействия гражданам и некоммерческим организациям при решении вопросов, возникающих у них в процессе реализации своих социальных функций.', N'+7 (953) 985-77-62', N'Ульяновская область , 433508 г. Димитровград, ул. Хмельницкого, д. 112, офис 2.', NULL, N'https://opuo.ru/list_nko/associaciya-territorialnogo-obshhestvennogo-samoupravleniya-goroda-dimitrovgrada/', NULL, NULL)
GO
INSERT [dbo].[NKO] ([NKO_id], [NKO_name], [category_id], [NKO_description], [NKO_contact_number], [NKO_address], [NKO_logo], [NKO_link], [NKO_lng], [NKO_lat]) VALUES (4, N'ОО ТОС АГО "12а микрорайон"', 1, N'Повышение качества жизни жителей 12а микрорайона г.Ангарска Иркутской области ( Благоустройство и содержании территории, организация культурных, спортивных и социально значимых мероприятий, взаимодействие с органами власти для учёта мнения жителей, , экологии и социальной помощи.', NULL, N'Иркутская областьб город Ангарск, микрорайон 12а', NULL, N'https://vk.com/id746471055', NULL, NULL)
GO
INSERT [dbo].[NKO] ([NKO_id], [NKO_name], [category_id], [NKO_description], [NKO_contact_number], [NKO_address], [NKO_logo], [NKO_link], [NKO_lng], [NKO_lat]) VALUES (5, N'Благотворительный общественно полезный фонд помощи социально незащищенным слоям населения "Платформа добрых дел"', 2, N'Благотворительный общественно полезный фонд помощи социально незащищенным слоям населения «Платформа добрых дел»
Основной вид деятельности (ОКВЭД) 64.99', NULL, N'Ростовская область, город Волгодонск', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[NKO] ([NKO_id], [NKO_name], [category_id], [NKO_description], [NKO_contact_number], [NKO_address], [NKO_logo], [NKO_link], [NKO_lng], [NKO_lat]) VALUES (6, N'МБУ "Молодежный центр"', 1, N'Основная деятельность:
-Консультирование и регистрация на площадке «Добро.РФ»
-Проведение ""Школы волонтеров"" 
-Формирование и сопровождение волонтерских корпусов (например, на общегородских мероприятиях, федеральных проектах (Формирование комфортной городской среды)
-Информирование граждан и организаторов о развитии добровольчества, благотворительности и гражданских инициатив (индивидуально)', N'+7 (341) 416-61-46', N'Удмуртская Республика, город Глазов, ул. Пряженникова, 51 а', NULL, N'https://vk.com/mcglazov', NULL, NULL)
GO
INSERT [dbo].[NKO] ([NKO_id], [NKO_name], [category_id], [NKO_description], [NKO_contact_number], [NKO_address], [NKO_logo], [NKO_link], [NKO_lng], [NKO_lat]) VALUES (7, N'Культурная база "Короленко 8" (МБУ "ЦМиТО УКСиМП")', 7, N'Ресурсный центр помощи НКО и сообществам, учреждениям культуры, образования', N'+7 (341) 416-63-55', N'Удмуртская республика, город Глазовб улица Короленко, 8', NULL, N'https://m.vk.com/korolenko8?from=groups', NULL, NULL)
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD FOREIGN KEY([NKO_id])
REFERENCES [dbo].[NKO] ([NKO_id])
GO
ALTER TABLE [dbo].[measure]  WITH CHECK ADD FOREIGN KEY([NKO_id])
REFERENCES [dbo].[NKO] ([NKO_id])
GO
ALTER TABLE [dbo].[NKO]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([categoty_id])
GO
ALTER TABLE [dbo].[volunteer_measure]  WITH CHECK ADD FOREIGN KEY([functional_id])
REFERENCES [dbo].[functional] ([functional_id])
GO
ALTER TABLE [dbo].[volunteer_measure]  WITH CHECK ADD FOREIGN KEY([measure_id])
REFERENCES [dbo].[measure] ([measure_id])
GO
ALTER TABLE [dbo].[volunteer_measure]  WITH CHECK ADD FOREIGN KEY([volunteer_id])
REFERENCES [dbo].[volunteer] ([volunteer_id])
GO
USE [master]
GO
ALTER DATABASE [dbhakaton] SET  READ_WRITE 
GO
