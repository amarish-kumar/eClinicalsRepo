USE [master]
GO
/****** Object:  Database [CS6232-g5]    Script Date: 4/4/2017 12:22:39 AM ******/
CREATE DATABASE [CS6232-g5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CS6232-g5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CS6232-g5.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CS6232-g5_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CS6232-g5_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CS6232-g5] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CS6232-g5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CS6232-g5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CS6232-g5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CS6232-g5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CS6232-g5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CS6232-g5] SET ARITHABORT OFF 
GO
ALTER DATABASE [CS6232-g5] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CS6232-g5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CS6232-g5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CS6232-g5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CS6232-g5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CS6232-g5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CS6232-g5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CS6232-g5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CS6232-g5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CS6232-g5] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CS6232-g5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CS6232-g5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CS6232-g5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CS6232-g5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CS6232-g5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CS6232-g5] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CS6232-g5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CS6232-g5] SET RECOVERY FULL 
GO
ALTER DATABASE [CS6232-g5] SET  MULTI_USER 
GO
ALTER DATABASE [CS6232-g5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CS6232-g5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CS6232-g5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CS6232-g5] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CS6232-g5] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CS6232-g5]
GO
/****** Object:  Table [dbo].[appointment]    Script Date: 4/4/2017 12:22:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appointment](
	[appointmentID] [int] IDENTITY(1,1) NOT NULL,
	[appointmentDate] [datetime] NOT NULL,
	[patientID] [int] NOT NULL,
	[doctorID] [int] NOT NULL,
	[appointmentReasonID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[appointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[appointment_reason]    Script Date: 4/4/2017 12:22:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[appointment_reason](
	[appointmentReasonID] [int] IDENTITY(1,1) NOT NULL,
	[appointmentReason] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[appointmentReasonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[clinic_administrator]    Script Date: 4/4/2017 12:22:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clinic_administrator](
	[administratorID] [int] IDENTITY(1,1) NOT NULL,
	[contactID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[administratorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[contact]    Script Date: 4/4/2017 12:22:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contact](
	[contactID] [int] IDENTITY(1,1) NOT NULL,
	[lName] [varchar](45) NOT NULL,
	[fName] [varchar](45) NOT NULL,
	[dob] [date] NOT NULL,
	[mailingAddressStreet] [varchar](100) NOT NULL,
	[mailingAddressCity] [varchar](100) NOT NULL,
	[mailingAddressState] [char](2) NOT NULL,
	[mailingAddressZip] [char](5) NOT NULL,
	[phoneNumber] [varchar](20) NOT NULL,
	[gender] [char](1) NULL,
	[SSN] [char](9) NOT NULL,
	[userType] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[contactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[diagnosis]    Script Date: 4/4/2017 12:22:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[diagnosis](
	[diagnosisID] [int] IDENTITY(1,1) NOT NULL,
	[diagnosisType] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[diagnosisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[doctor]    Script Date: 4/4/2017 12:22:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctor](
	[doctorID] [int] IDENTITY(1,1) NOT NULL,
	[contactID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[doctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[doctor_specialty]    Script Date: 4/4/2017 12:22:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctor_specialty](
	[doctorID] [int] NOT NULL,
	[specialtyID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[doctorID] ASC,
	[specialtyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lab_test]    Script Date: 4/4/2017 12:22:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lab_test](
	[testCode] [int] IDENTITY(1,1) NOT NULL,
	[testType] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[testCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[logins]    Script Date: 4/4/2017 12:22:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[logins](
	[contactID] [int] NOT NULL,
	[userName] [varchar](45) NOT NULL,
	[password] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nurse]    Script Date: 4/4/2017 12:22:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nurse](
	[nurseID] [int] IDENTITY(1,1) NOT NULL,
	[contactID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nurseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[patient]    Script Date: 4/4/2017 12:22:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient](
	[patientID] [int] IDENTITY(1,1) NOT NULL,
	[contactID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[patientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[specialty]    Script Date: 4/4/2017 12:22:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[specialty](
	[specialtyID] [int] IDENTITY(1,1) NOT NULL,
	[specialtyType] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[specialtyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[symptom]    Script Date: 4/4/2017 12:22:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[symptom](
	[symptomID] [int] IDENTITY(1,1) NOT NULL,
	[symptomType] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[symptomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[visit]    Script Date: 4/4/2017 12:22:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visit](
	[visitID] [int] IDENTITY(1,1) NOT NULL,
	[appointmentID] [int] NOT NULL,
	[nurseID] [int] NOT NULL,
	[visitTime] [datetime] NOT NULL,
	[systolicBP] [int] NOT NULL,
	[diastolicBP] [int] NOT NULL,
	[bodyTemperature] [decimal](4, 1) NOT NULL,
	[pulse] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[visitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[visit_has_diagnosis]    Script Date: 4/4/2017 12:22:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visit_has_diagnosis](
	[visitID] [int] NOT NULL,
	[diagnosisID] [int] NOT NULL,
	[initialDiagnosis] [bit] NOT NULL,
	[finalDiagnosis] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[visitID] ASC,
	[diagnosisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[visit_lab_test]    Script Date: 4/4/2017 12:22:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visit_lab_test](
	[testID] [int] IDENTITY(1,1) NOT NULL,
	[testCode] [int] NOT NULL,
	[visitID] [int] NOT NULL,
	[result] [bit] NULL,
	[testDateCompleted] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[testID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[visit_symptom]    Script Date: 4/4/2017 12:22:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visit_symptom](
	[visitID] [int] NOT NULL,
	[symptomID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[visitID] ASC,
	[symptomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[appointment] ON 

INSERT [dbo].[appointment] ([appointmentID], [appointmentDate], [patientID], [doctorID], [appointmentReasonID]) VALUES (1, CAST(N'2016-11-28 08:30:00.000' AS DateTime), 1, 1, 2)
INSERT [dbo].[appointment] ([appointmentID], [appointmentDate], [patientID], [doctorID], [appointmentReasonID]) VALUES (2, CAST(N'2016-11-28 08:45:00.000' AS DateTime), 2, 1, 1)
INSERT [dbo].[appointment] ([appointmentID], [appointmentDate], [patientID], [doctorID], [appointmentReasonID]) VALUES (3, CAST(N'2016-12-01 12:00:00.000' AS DateTime), 3, 2, 3)
INSERT [dbo].[appointment] ([appointmentID], [appointmentDate], [patientID], [doctorID], [appointmentReasonID]) VALUES (4, CAST(N'2016-12-01 12:15:00.000' AS DateTime), 4, 2, 4)
INSERT [dbo].[appointment] ([appointmentID], [appointmentDate], [patientID], [doctorID], [appointmentReasonID]) VALUES (5, CAST(N'2016-12-01 12:30:00.000' AS DateTime), 5, 2, 2)
INSERT [dbo].[appointment] ([appointmentID], [appointmentDate], [patientID], [doctorID], [appointmentReasonID]) VALUES (6, CAST(N'2016-12-02 10:30:00.000' AS DateTime), 6, 3, 1)
INSERT [dbo].[appointment] ([appointmentID], [appointmentDate], [patientID], [doctorID], [appointmentReasonID]) VALUES (7, CAST(N'2016-12-02 10:45:00.000' AS DateTime), 3, 3, 3)
INSERT [dbo].[appointment] ([appointmentID], [appointmentDate], [patientID], [doctorID], [appointmentReasonID]) VALUES (8, CAST(N'2016-12-03 11:00:00.000' AS DateTime), 1, 1, 3)
INSERT [dbo].[appointment] ([appointmentID], [appointmentDate], [patientID], [doctorID], [appointmentReasonID]) VALUES (9, CAST(N'2016-12-03 11:15:00.000' AS DateTime), 5, 2, 3)
SET IDENTITY_INSERT [dbo].[appointment] OFF
SET IDENTITY_INSERT [dbo].[appointment_reason] ON 

INSERT [dbo].[appointment_reason] ([appointmentReasonID], [appointmentReason]) VALUES (1, N'New Patient')
INSERT [dbo].[appointment_reason] ([appointmentReasonID], [appointmentReason]) VALUES (2, N'Annual Visit')
INSERT [dbo].[appointment_reason] ([appointmentReasonID], [appointmentReason]) VALUES (3, N'Follow-Up')
INSERT [dbo].[appointment_reason] ([appointmentReasonID], [appointmentReason]) VALUES (4, N'Sick Visit')
SET IDENTITY_INSERT [dbo].[appointment_reason] OFF
SET IDENTITY_INSERT [dbo].[clinic_administrator] ON 

INSERT [dbo].[clinic_administrator] ([administratorID], [contactID]) VALUES (1, 4)
SET IDENTITY_INSERT [dbo].[clinic_administrator] OFF
SET IDENTITY_INSERT [dbo].[contact] ON 

INSERT [dbo].[contact] ([contactID], [lName], [fName], [dob], [mailingAddressStreet], [mailingAddressCity], [mailingAddressState], [mailingAddressZip], [phoneNumber], [gender], [SSN], [userType]) VALUES (1, N'Syed', N'Amber', CAST(N'1979-01-16' AS Date), N'123 Main Street', N'Atlanta', N'GA', N'30308', N'678-770-1234', N'F', N'123456789', 1)
INSERT [dbo].[contact] ([contactID], [lName], [fName], [dob], [mailingAddressStreet], [mailingAddressCity], [mailingAddressState], [mailingAddressZip], [phoneNumber], [gender], [SSN], [userType]) VALUES (2, N'Carter', N'Maya', CAST(N'1977-10-10' AS Date), N'500 Self Street', N'Marietta', N'GA', N'30068', N'770-679-9900', N'F', N'234567891', 1)
INSERT [dbo].[contact] ([contactID], [lName], [fName], [dob], [mailingAddressStreet], [mailingAddressCity], [mailingAddressState], [mailingAddressZip], [phoneNumber], [gender], [SSN], [userType]) VALUES (3, N'Simon', N'Timothy', CAST(N'1965-07-29' AS Date), N'15 Maine Lane', N'Atlanta', N'GA', N'30909', N'470-674-6759', N'M', N'345678912', 1)
INSERT [dbo].[contact] ([contactID], [lName], [fName], [dob], [mailingAddressStreet], [mailingAddressCity], [mailingAddressState], [mailingAddressZip], [phoneNumber], [gender], [SSN], [userType]) VALUES (4, N'Wynn', N'Jasmine', CAST(N'1990-10-19' AS Date), N'15 Antler Dr', N'Norcross', N'GA', N'30092', N'770-404-0076', N'F', N'456789123', 2)
INSERT [dbo].[contact] ([contactID], [lName], [fName], [dob], [mailingAddressStreet], [mailingAddressCity], [mailingAddressState], [mailingAddressZip], [phoneNumber], [gender], [SSN], [userType]) VALUES (5, N'Woods', N'Courtney', CAST(N'1990-11-28' AS Date), N'25 Ashley  Circle', N'Norcross', N'GA', N'30092', N'404-388-3729', N'F', N'567891234', 3)
INSERT [dbo].[contact] ([contactID], [lName], [fName], [dob], [mailingAddressStreet], [mailingAddressCity], [mailingAddressState], [mailingAddressZip], [phoneNumber], [gender], [SSN], [userType]) VALUES (6, N'DeWalt', N'DeAndra', CAST(N'1990-02-02' AS Date), N'50 Graves Road', N'Doraville', N'GA', N'30096', N'404-470-6789', N'F', N'678912345', 3)
INSERT [dbo].[contact] ([contactID], [lName], [fName], [dob], [mailingAddressStreet], [mailingAddressCity], [mailingAddressState], [mailingAddressZip], [phoneNumber], [gender], [SSN], [userType]) VALUES (7, N'Robinson', N'Bianca', CAST(N'1990-12-09' AS Date), N'2309 Ashley Club Circle', N'Norcross', N'GA', N'30092', N'678-895-5648', N'F', N'789123456', 4)
INSERT [dbo].[contact] ([contactID], [lName], [fName], [dob], [mailingAddressStreet], [mailingAddressCity], [mailingAddressState], [mailingAddressZip], [phoneNumber], [gender], [SSN], [userType]) VALUES (8, N'Williams', N'Jeffrey', CAST(N'1970-09-18' AS Date), N'50 Bellwood Circle', N'Morrow', N'GA', N'30260', N'678-895-9846', N'M', N'891234567', 4)
INSERT [dbo].[contact] ([contactID], [lName], [fName], [dob], [mailingAddressStreet], [mailingAddressCity], [mailingAddressState], [mailingAddressZip], [phoneNumber], [gender], [SSN], [userType]) VALUES (9, N'Williams', N'Nicki', CAST(N'1960-05-18' AS Date), N'50 Bellwood Circle', N'Morrow', N'GA', N'30260', N'678-895-9846', N'F', N'912345678', 4)
INSERT [dbo].[contact] ([contactID], [lName], [fName], [dob], [mailingAddressStreet], [mailingAddressCity], [mailingAddressState], [mailingAddressZip], [phoneNumber], [gender], [SSN], [userType]) VALUES (10, N'Graham', N'Lamar', CAST(N'1983-02-15' AS Date), N'123 Main Circle', N'Norcross', N'GA', N'30092', N'770-678-4040', N'M', N'012345678', 4)
INSERT [dbo].[contact] ([contactID], [lName], [fName], [dob], [mailingAddressStreet], [mailingAddressCity], [mailingAddressState], [mailingAddressZip], [phoneNumber], [gender], [SSN], [userType]) VALUES (11, N'Gasque', N'Xzavia', CAST(N'1991-10-09' AS Date), N'123 Story Circle', N'Atlanta', N'GA', N'30308', N'404-678-3030', N'F', N'147258369', 4)
INSERT [dbo].[contact] ([contactID], [lName], [fName], [dob], [mailingAddressStreet], [mailingAddressCity], [mailingAddressState], [mailingAddressZip], [phoneNumber], [gender], [SSN], [userType]) VALUES (12, N'Mitchell', N'Marvin', CAST(N'1981-09-04' AS Date), N'123 Story Circle', N'Atlanta', N'GA', N'30308', N'470-678-3456', N'M', N'369258147', 4)
SET IDENTITY_INSERT [dbo].[contact] OFF
SET IDENTITY_INSERT [dbo].[diagnosis] ON 

INSERT [dbo].[diagnosis] ([diagnosisID], [diagnosisType]) VALUES (1, N'Wellness Exam')
INSERT [dbo].[diagnosis] ([diagnosisID], [diagnosisType]) VALUES (2, N'Diabetes')
INSERT [dbo].[diagnosis] ([diagnosisID], [diagnosisType]) VALUES (3, N'Back pain')
INSERT [dbo].[diagnosis] ([diagnosisID], [diagnosisType]) VALUES (4, N'Pain in joint')
INSERT [dbo].[diagnosis] ([diagnosisID], [diagnosisType]) VALUES (5, N'Asthma')
INSERT [dbo].[diagnosis] ([diagnosisID], [diagnosisType]) VALUES (6, N'Vaginal Discharge')
INSERT [dbo].[diagnosis] ([diagnosisID], [diagnosisType]) VALUES (7, N'Pharyngitis')
SET IDENTITY_INSERT [dbo].[diagnosis] OFF
SET IDENTITY_INSERT [dbo].[doctor] ON 

INSERT [dbo].[doctor] ([doctorID], [contactID]) VALUES (1, 1)
INSERT [dbo].[doctor] ([doctorID], [contactID]) VALUES (2, 2)
INSERT [dbo].[doctor] ([doctorID], [contactID]) VALUES (3, 3)
SET IDENTITY_INSERT [dbo].[doctor] OFF
INSERT [dbo].[doctor_specialty] ([doctorID], [specialtyID]) VALUES (1, 1)
INSERT [dbo].[doctor_specialty] ([doctorID], [specialtyID]) VALUES (2, 3)
INSERT [dbo].[doctor_specialty] ([doctorID], [specialtyID]) VALUES (3, 2)
SET IDENTITY_INSERT [dbo].[lab_test] ON 

INSERT [dbo].[lab_test] ([testCode], [testType]) VALUES (1, N'WBC')
INSERT [dbo].[lab_test] ([testCode], [testType]) VALUES (2, N'LDL')
INSERT [dbo].[lab_test] ([testCode], [testType]) VALUES (3, N'Flu test')
INSERT [dbo].[lab_test] ([testCode], [testType]) VALUES (4, N'Hepatitis A')
INSERT [dbo].[lab_test] ([testCode], [testType]) VALUES (5, N'Hepatitis B')
INSERT [dbo].[lab_test] ([testCode], [testType]) VALUES (6, N'Hepatitis C')
SET IDENTITY_INSERT [dbo].[lab_test] OFF
INSERT [dbo].[logins] ([contactID], [userName], [password]) VALUES (1, N'asyed1', N'testpassword123')
INSERT [dbo].[logins] ([contactID], [userName], [password]) VALUES (5, N'cwoods6', N'testpassword123')
INSERT [dbo].[logins] ([contactID], [userName], [password]) VALUES (6, N'ddewalt', N'testpassword123')
INSERT [dbo].[logins] ([contactID], [userName], [password]) VALUES (4, N'jwynn1', N'testpassword123')
INSERT [dbo].[logins] ([contactID], [userName], [password]) VALUES (2, N'mcarter2', N'testpassword123')
INSERT [dbo].[logins] ([contactID], [userName], [password]) VALUES (3, N'tsimon', N'testpassword123')
SET IDENTITY_INSERT [dbo].[nurse] ON 

INSERT [dbo].[nurse] ([nurseID], [contactID]) VALUES (1, 5)
INSERT [dbo].[nurse] ([nurseID], [contactID]) VALUES (2, 6)
SET IDENTITY_INSERT [dbo].[nurse] OFF
SET IDENTITY_INSERT [dbo].[patient] ON 

INSERT [dbo].[patient] ([patientID], [contactID]) VALUES (1, 7)
INSERT [dbo].[patient] ([patientID], [contactID]) VALUES (2, 8)
INSERT [dbo].[patient] ([patientID], [contactID]) VALUES (3, 9)
INSERT [dbo].[patient] ([patientID], [contactID]) VALUES (4, 10)
INSERT [dbo].[patient] ([patientID], [contactID]) VALUES (5, 11)
INSERT [dbo].[patient] ([patientID], [contactID]) VALUES (6, 12)
SET IDENTITY_INSERT [dbo].[patient] OFF
SET IDENTITY_INSERT [dbo].[specialty] ON 

INSERT [dbo].[specialty] ([specialtyID], [specialtyType]) VALUES (1, N'Internal Medicine')
INSERT [dbo].[specialty] ([specialtyID], [specialtyType]) VALUES (2, N'Pediatric Medicine')
INSERT [dbo].[specialty] ([specialtyID], [specialtyType]) VALUES (3, N'Family Medicine')
INSERT [dbo].[specialty] ([specialtyID], [specialtyType]) VALUES (4, N'Gastroenterology')
SET IDENTITY_INSERT [dbo].[specialty] OFF
SET IDENTITY_INSERT [dbo].[symptom] ON 

INSERT [dbo].[symptom] ([symptomID], [symptomType]) VALUES (1, N'Headache')
INSERT [dbo].[symptom] ([symptomID], [symptomType]) VALUES (2, N'Discharge')
INSERT [dbo].[symptom] ([symptomID], [symptomType]) VALUES (3, N'Back Pain')
INSERT [dbo].[symptom] ([symptomID], [symptomType]) VALUES (4, N'Cough')
INSERT [dbo].[symptom] ([symptomID], [symptomType]) VALUES (5, N'Fatigue')
INSERT [dbo].[symptom] ([symptomID], [symptomType]) VALUES (6, N'Night Sweats')
INSERT [dbo].[symptom] ([symptomID], [symptomType]) VALUES (7, N'No symptoms')
SET IDENTITY_INSERT [dbo].[symptom] OFF
SET IDENTITY_INSERT [dbo].[visit] ON 

INSERT [dbo].[visit] ([visitID], [appointmentID], [nurseID], [visitTime], [systolicBP], [diastolicBP], [bodyTemperature], [pulse]) VALUES (1, 1, 1, CAST(N'2016-11-28 08:30:00.000' AS DateTime), 120, 80, CAST(99.0 AS Decimal(4, 1)), 75)
INSERT [dbo].[visit] ([visitID], [appointmentID], [nurseID], [visitTime], [systolicBP], [diastolicBP], [bodyTemperature], [pulse]) VALUES (2, 2, 1, CAST(N'2016-11-28 08:45:00.000' AS DateTime), 110, 70, CAST(97.1 AS Decimal(4, 1)), 65)
INSERT [dbo].[visit] ([visitID], [appointmentID], [nurseID], [visitTime], [systolicBP], [diastolicBP], [bodyTemperature], [pulse]) VALUES (3, 3, 2, CAST(N'2016-12-01 12:00:00.000' AS DateTime), 91, 65, CAST(98.2 AS Decimal(4, 1)), 70)
INSERT [dbo].[visit] ([visitID], [appointmentID], [nurseID], [visitTime], [systolicBP], [diastolicBP], [bodyTemperature], [pulse]) VALUES (4, 4, 2, CAST(N'2016-12-01 12:15:00.000' AS DateTime), 100, 80, CAST(99.3 AS Decimal(4, 1)), 74)
INSERT [dbo].[visit] ([visitID], [appointmentID], [nurseID], [visitTime], [systolicBP], [diastolicBP], [bodyTemperature], [pulse]) VALUES (5, 5, 2, CAST(N'2016-12-01 12:30:00.000' AS DateTime), 96, 70, CAST(100.4 AS Decimal(4, 1)), 73)
INSERT [dbo].[visit] ([visitID], [appointmentID], [nurseID], [visitTime], [systolicBP], [diastolicBP], [bodyTemperature], [pulse]) VALUES (6, 6, 1, CAST(N'2016-12-02 10:30:00.000' AS DateTime), 125, 87, CAST(97.5 AS Decimal(4, 1)), 67)
INSERT [dbo].[visit] ([visitID], [appointmentID], [nurseID], [visitTime], [systolicBP], [diastolicBP], [bodyTemperature], [pulse]) VALUES (7, 7, 2, CAST(N'2016-12-02 10:45:00.000' AS DateTime), 130, 85, CAST(98.6 AS Decimal(4, 1)), 69)
INSERT [dbo].[visit] ([visitID], [appointmentID], [nurseID], [visitTime], [systolicBP], [diastolicBP], [bodyTemperature], [pulse]) VALUES (8, 8, 1, CAST(N'2016-12-03 11:00:00.000' AS DateTime), 140, 90, CAST(98.7 AS Decimal(4, 1)), 70)
INSERT [dbo].[visit] ([visitID], [appointmentID], [nurseID], [visitTime], [systolicBP], [diastolicBP], [bodyTemperature], [pulse]) VALUES (9, 9, 2, CAST(N'2016-12-03 11:15:00.000' AS DateTime), 121, 82, CAST(99.8 AS Decimal(4, 1)), 60)
SET IDENTITY_INSERT [dbo].[visit] OFF
INSERT [dbo].[visit_has_diagnosis] ([visitID], [diagnosisID], [initialDiagnosis], [finalDiagnosis]) VALUES (1, 1, 1, 1)
INSERT [dbo].[visit_has_diagnosis] ([visitID], [diagnosisID], [initialDiagnosis], [finalDiagnosis]) VALUES (1, 7, 0, 0)
INSERT [dbo].[visit_has_diagnosis] ([visitID], [diagnosisID], [initialDiagnosis], [finalDiagnosis]) VALUES (2, 2, 1, 1)
INSERT [dbo].[visit_has_diagnosis] ([visitID], [diagnosisID], [initialDiagnosis], [finalDiagnosis]) VALUES (3, 3, 1, 1)
INSERT [dbo].[visit_has_diagnosis] ([visitID], [diagnosisID], [initialDiagnosis], [finalDiagnosis]) VALUES (4, 5, 1, 1)
INSERT [dbo].[visit_has_diagnosis] ([visitID], [diagnosisID], [initialDiagnosis], [finalDiagnosis]) VALUES (4, 7, 0, 1)
INSERT [dbo].[visit_has_diagnosis] ([visitID], [diagnosisID], [initialDiagnosis], [finalDiagnosis]) VALUES (5, 4, 1, 0)
INSERT [dbo].[visit_has_diagnosis] ([visitID], [diagnosisID], [initialDiagnosis], [finalDiagnosis]) VALUES (6, 6, 1, 1)
INSERT [dbo].[visit_has_diagnosis] ([visitID], [diagnosisID], [initialDiagnosis], [finalDiagnosis]) VALUES (7, 1, 1, 1)
INSERT [dbo].[visit_has_diagnosis] ([visitID], [diagnosisID], [initialDiagnosis], [finalDiagnosis]) VALUES (7, 7, 0, 0)
INSERT [dbo].[visit_has_diagnosis] ([visitID], [diagnosisID], [initialDiagnosis], [finalDiagnosis]) VALUES (8, 5, 1, 1)
INSERT [dbo].[visit_has_diagnosis] ([visitID], [diagnosisID], [initialDiagnosis], [finalDiagnosis]) VALUES (9, 2, 0, 0)
INSERT [dbo].[visit_has_diagnosis] ([visitID], [diagnosisID], [initialDiagnosis], [finalDiagnosis]) VALUES (9, 3, 1, 1)
SET IDENTITY_INSERT [dbo].[visit_lab_test] ON 

INSERT [dbo].[visit_lab_test] ([testID], [testCode], [visitID], [result], [testDateCompleted]) VALUES (1, 1, 1, 0, CAST(N'2016-11-30' AS Date))
INSERT [dbo].[visit_lab_test] ([testID], [testCode], [visitID], [result], [testDateCompleted]) VALUES (2, 1, 2, 0, CAST(N'2016-11-30' AS Date))
INSERT [dbo].[visit_lab_test] ([testID], [testCode], [visitID], [result], [testDateCompleted]) VALUES (3, 1, 3, 0, CAST(N'2016-12-03' AS Date))
INSERT [dbo].[visit_lab_test] ([testID], [testCode], [visitID], [result], [testDateCompleted]) VALUES (4, 2, 4, 0, CAST(N'2016-12-03' AS Date))
INSERT [dbo].[visit_lab_test] ([testID], [testCode], [visitID], [result], [testDateCompleted]) VALUES (5, 2, 5, 0, CAST(N'2016-12-03' AS Date))
INSERT [dbo].[visit_lab_test] ([testID], [testCode], [visitID], [result], [testDateCompleted]) VALUES (6, 2, 6, 0, CAST(N'2016-12-03' AS Date))
INSERT [dbo].[visit_lab_test] ([testID], [testCode], [visitID], [result], [testDateCompleted]) VALUES (7, 3, 7, 1, CAST(N'2016-12-03' AS Date))
INSERT [dbo].[visit_lab_test] ([testID], [testCode], [visitID], [result], [testDateCompleted]) VALUES (8, 3, 8, 1, CAST(N'2016-12-04' AS Date))
INSERT [dbo].[visit_lab_test] ([testID], [testCode], [visitID], [result], [testDateCompleted]) VALUES (9, 3, 9, 1, CAST(N'2016-12-04' AS Date))
INSERT [dbo].[visit_lab_test] ([testID], [testCode], [visitID], [result], [testDateCompleted]) VALUES (10, 4, 1, 1, CAST(N'2016-11-30' AS Date))
INSERT [dbo].[visit_lab_test] ([testID], [testCode], [visitID], [result], [testDateCompleted]) VALUES (11, 5, 2, 0, CAST(N'2016-11-30' AS Date))
INSERT [dbo].[visit_lab_test] ([testID], [testCode], [visitID], [result], [testDateCompleted]) VALUES (12, 5, 3, 0, CAST(N'2016-12-03' AS Date))
INSERT [dbo].[visit_lab_test] ([testID], [testCode], [visitID], [result], [testDateCompleted]) VALUES (13, 6, 4, 0, CAST(N'2016-12-03' AS Date))
INSERT [dbo].[visit_lab_test] ([testID], [testCode], [visitID], [result], [testDateCompleted]) VALUES (14, 6, 5, 0, CAST(N'2016-12-03' AS Date))
SET IDENTITY_INSERT [dbo].[visit_lab_test] OFF
INSERT [dbo].[visit_symptom] ([visitID], [symptomID]) VALUES (1, 7)
INSERT [dbo].[visit_symptom] ([visitID], [symptomID]) VALUES (2, 3)
INSERT [dbo].[visit_symptom] ([visitID], [symptomID]) VALUES (2, 5)
INSERT [dbo].[visit_symptom] ([visitID], [symptomID]) VALUES (3, 1)
INSERT [dbo].[visit_symptom] ([visitID], [symptomID]) VALUES (4, 6)
INSERT [dbo].[visit_symptom] ([visitID], [symptomID]) VALUES (5, 2)
INSERT [dbo].[visit_symptom] ([visitID], [symptomID]) VALUES (5, 4)
INSERT [dbo].[visit_symptom] ([visitID], [symptomID]) VALUES (5, 5)
INSERT [dbo].[visit_symptom] ([visitID], [symptomID]) VALUES (6, 7)
INSERT [dbo].[visit_symptom] ([visitID], [symptomID]) VALUES (7, 5)
INSERT [dbo].[visit_symptom] ([visitID], [symptomID]) VALUES (8, 1)
INSERT [dbo].[visit_symptom] ([visitID], [symptomID]) VALUES (8, 2)
INSERT [dbo].[visit_symptom] ([visitID], [symptomID]) VALUES (9, 5)
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__contact__CA1E8E3C3AE69ABB]    Script Date: 4/4/2017 12:22:39 AM ******/
ALTER TABLE [dbo].[contact] ADD UNIQUE NONCLUSTERED 
(
	[SSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[appointment]  WITH CHECK ADD FOREIGN KEY([appointmentReasonID])
REFERENCES [dbo].[appointment_reason] ([appointmentReasonID])
GO
ALTER TABLE [dbo].[appointment]  WITH CHECK ADD FOREIGN KEY([doctorID])
REFERENCES [dbo].[doctor] ([doctorID])
GO
ALTER TABLE [dbo].[appointment]  WITH CHECK ADD FOREIGN KEY([patientID])
REFERENCES [dbo].[patient] ([patientID])
GO
ALTER TABLE [dbo].[clinic_administrator]  WITH CHECK ADD FOREIGN KEY([contactID])
REFERENCES [dbo].[contact] ([contactID])
GO
ALTER TABLE [dbo].[doctor]  WITH CHECK ADD FOREIGN KEY([contactID])
REFERENCES [dbo].[contact] ([contactID])
GO
ALTER TABLE [dbo].[doctor_specialty]  WITH CHECK ADD FOREIGN KEY([doctorID])
REFERENCES [dbo].[doctor] ([doctorID])
GO
ALTER TABLE [dbo].[doctor_specialty]  WITH CHECK ADD FOREIGN KEY([specialtyID])
REFERENCES [dbo].[specialty] ([specialtyID])
GO
ALTER TABLE [dbo].[logins]  WITH CHECK ADD FOREIGN KEY([contactID])
REFERENCES [dbo].[contact] ([contactID])
GO
ALTER TABLE [dbo].[nurse]  WITH CHECK ADD FOREIGN KEY([contactID])
REFERENCES [dbo].[contact] ([contactID])
GO
ALTER TABLE [dbo].[patient]  WITH CHECK ADD FOREIGN KEY([contactID])
REFERENCES [dbo].[contact] ([contactID])
GO
ALTER TABLE [dbo].[visit]  WITH CHECK ADD FOREIGN KEY([appointmentID])
REFERENCES [dbo].[appointment] ([appointmentID])
GO
ALTER TABLE [dbo].[visit]  WITH CHECK ADD FOREIGN KEY([nurseID])
REFERENCES [dbo].[nurse] ([nurseID])
GO
ALTER TABLE [dbo].[visit_has_diagnosis]  WITH CHECK ADD FOREIGN KEY([diagnosisID])
REFERENCES [dbo].[diagnosis] ([diagnosisID])
GO
ALTER TABLE [dbo].[visit_has_diagnosis]  WITH CHECK ADD FOREIGN KEY([visitID])
REFERENCES [dbo].[visit] ([visitID])
GO
ALTER TABLE [dbo].[visit_lab_test]  WITH CHECK ADD FOREIGN KEY([testCode])
REFERENCES [dbo].[lab_test] ([testCode])
GO
ALTER TABLE [dbo].[visit_lab_test]  WITH CHECK ADD FOREIGN KEY([visitID])
REFERENCES [dbo].[visit] ([visitID])
GO
ALTER TABLE [dbo].[visit_symptom]  WITH CHECK ADD FOREIGN KEY([symptomID])
REFERENCES [dbo].[symptom] ([symptomID])
GO
ALTER TABLE [dbo].[visit_symptom]  WITH CHECK ADD FOREIGN KEY([visitID])
REFERENCES [dbo].[visit] ([visitID])
GO
USE [master]
GO
ALTER DATABASE [CS6232-g5] SET  READ_WRITE 
GO
