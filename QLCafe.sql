USE [master]
GO
/****** Object:  Database [Cafe]    Script Date: 14/12/2019 5:07:56 PM ******/
CREATE DATABASE [Cafe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cafe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Cafe.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Cafe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Cafe_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Cafe] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cafe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cafe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cafe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cafe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cafe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cafe] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cafe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cafe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cafe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cafe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cafe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cafe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cafe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cafe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cafe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cafe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cafe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cafe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cafe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cafe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cafe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cafe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cafe] SET RECOVERY FULL 
GO
ALTER DATABASE [Cafe] SET  MULTI_USER 
GO
ALTER DATABASE [Cafe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cafe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cafe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cafe] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Cafe] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Cafe', N'ON'
GO
USE [Cafe]
GO
/****** Object:  Table [dbo].[BAN]    Script Date: 14/12/2019 5:07:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BAN](
	[MABAN] [varchar](10) NOT NULL,
	[TENBAN] [nvarchar](50) NULL,
	[SOCHONGOI] [int] NULL,
	[MAKHUVUC] [varchar](10) NULL,
	[TRANGTHAI] [nvarchar](50) NULL,
 CONSTRAINT [PK_BAN] PRIMARY KEY CLUSTERED 
(
	[MABAN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHAMCONG]    Script Date: 14/12/2019 5:07:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHAMCONG](
	[MANHANVIEN] [varchar](10) NOT NULL,
	[NGAYLAM] [date] NOT NULL,
	[CA] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_CHAMCONG] PRIMARY KEY CLUSTERED 
(
	[MANHANVIEN] ASC,
	[NGAYLAM] ASC,
	[CA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHITIETPHIEU]    Script Date: 14/12/2019 5:07:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHITIETPHIEU](
	[MAMON] [varchar](10) NOT NULL,
	[MAPHIEU] [varchar](10) NOT NULL,
	[SOLUONG] [int] NULL,
 CONSTRAINT [PK_CHITIETPHIEU] PRIMARY KEY CLUSTERED 
(
	[MAMON] ASC,
	[MAPHIEU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CONGTHUC]    Script Date: 14/12/2019 5:07:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CONGTHUC](
	[MAMON] [varchar](10) NOT NULL,
	[MANGUYENLIEU] [varchar](10) NOT NULL,
	[HAMLUONG] [nvarchar](20) NULL,
 CONSTRAINT [PK_CONGTHUC] PRIMARY KEY CLUSTERED 
(
	[MAMON] ASC,
	[MANGUYENLIEU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KHUVUC]    Script Date: 14/12/2019 5:07:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHUVUC](
	[MAKHUVUC] [varchar](10) NOT NULL,
	[TENKHUVUC] [nvarchar](50) NULL,
 CONSTRAINT [PK_KHUVUC] PRIMARY KEY CLUSTERED 
(
	[MAKHUVUC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOAIMON]    Script Date: 14/12/2019 5:07:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOAIMON](
	[MALOAIMON] [varchar](10) NOT NULL,
	[TENLOAIMON] [nvarchar](50) NULL,
 CONSTRAINT [PK_LOAIMON] PRIMARY KEY CLUSTERED 
(
	[MALOAIMON] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NGUYENLIEU]    Script Date: 14/12/2019 5:07:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NGUYENLIEU](
	[MANGUYENLIEU] [varchar](10) NOT NULL,
	[TENNGUYENLIEU] [nvarchar](50) NULL,
 CONSTRAINT [PK_NGUYENLIEU] PRIMARY KEY CLUSTERED 
(
	[MANGUYENLIEU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 14/12/2019 5:07:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MANHANVIEN] [varchar](10) NOT NULL,
	[HOTEN] [nvarchar](50) NULL,
	[PHAI] [nvarchar](4) NULL,
	[NGAYSINH] [date] NULL,
	[DIACHI] [nvarchar](100) NULL,
	[SDT] [varchar](12) NULL,
	[NGAYVAOLAM] [date] NULL,
	[LUONGCOBAN] [int] NULL,
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[MANHANVIEN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHIEU]    Script Date: 14/12/2019 5:07:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHIEU](
	[MAPHIEU] [varchar](10) NOT NULL,
	[NGAYTAO] [date] NULL,
	[MABAN] [varchar](10) NULL,
	[MANHANVIEN] [varchar](10) NULL,
	[THANHTIEN] [int] NULL CONSTRAINT [SET0]  DEFAULT ((0)),
 CONSTRAINT [PK_PHIEU] PRIMARY KEY CLUSTERED 
(
	[MAPHIEU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 14/12/2019 5:07:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[MANHANVIEN] [varchar](10) NULL,
	[TENDANGNHAP] [varchar](30) NOT NULL,
	[MATKHAU] [varchar](30) NULL,
	[CAPQUYEN] [nvarchar](60) NULL,
	[TRANGTHAI] [nvarchar](60) NULL,
 CONSTRAINT [PK_TAIKHOANG] PRIMARY KEY CLUSTERED 
(
	[TENDANGNHAP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[THUCDON]    Script Date: 14/12/2019 5:07:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[THUCDON](
	[MAMON] [varchar](10) NOT NULL,
	[TENMON] [nvarchar](50) NULL,
	[DVT] [nvarchar](10) NULL,
	[DONGIA] [int] NULL,
	[MALOAIMON] [varchar](10) NULL,
	[HINHANH] [nvarchar](200) NULL,
 CONSTRAINT [PK_THUCDON] PRIMARY KEY CLUSTERED 
(
	[MAMON] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[DOANHTHU]    Script Date: 14/12/2019 5:07:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DOANHTHU]
AS
SELECT        dbo.BAN.TENBAN, dbo.NHANVIEN.HOTEN, dbo.PHIEU.MAPHIEU, dbo.PHIEU.NGAYTAO, dbo.PHIEU.THANHTIEN, MONTH(dbo.PHIEU.NGAYTAO) AS THANG, YEAR(dbo.PHIEU.NGAYTAO) AS NAM
FROM            dbo.BAN INNER JOIN
                         dbo.PHIEU ON dbo.BAN.MABAN = dbo.PHIEU.MABAN INNER JOIN
                         dbo.NHANVIEN ON dbo.PHIEU.MANHANVIEN = dbo.NHANVIEN.MANHANVIEN
GROUP BY dbo.BAN.TENBAN, dbo.NHANVIEN.HOTEN, dbo.PHIEU.MAPHIEU, dbo.PHIEU.NGAYTAO, dbo.PHIEU.THANHTIEN, MONTH(dbo.PHIEU.NGAYTAO), YEAR(dbo.PHIEU.NGAYTAO)


GO
/****** Object:  View [dbo].[HOADON]    Script Date: 14/12/2019 5:07:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[HOADON]
AS
SELECT        dbo.PHIEU.MAPHIEU, dbo.CHITIETPHIEU.SOLUONG, dbo.NHANVIEN.HOTEN, dbo.THUCDON.TENMON, dbo.THUCDON.DONGIA, dbo.BAN.TENBAN, dbo.THUCDON.DONGIA * dbo.CHITIETPHIEU.SOLUONG AS THANHTIEN
FROM            dbo.BAN INNER JOIN
                         dbo.PHIEU ON dbo.BAN.MABAN = dbo.PHIEU.MABAN INNER JOIN
                         dbo.CHITIETPHIEU ON dbo.PHIEU.MAPHIEU = dbo.CHITIETPHIEU.MAPHIEU INNER JOIN
                         dbo.NHANVIEN ON dbo.PHIEU.MANHANVIEN = dbo.NHANVIEN.MANHANVIEN INNER JOIN
                         dbo.THUCDON ON dbo.CHITIETPHIEU.MAMON = dbo.THUCDON.MAMON
GROUP BY dbo.PHIEU.MAPHIEU, dbo.CHITIETPHIEU.SOLUONG, dbo.NHANVIEN.HOTEN, dbo.THUCDON.TENMON, dbo.THUCDON.DONGIA, dbo.BAN.TENBAN


GO
/****** Object:  View [dbo].[RPCHAMCONG]    Script Date: 14/12/2019 5:07:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RPCHAMCONG]
AS
SELECT        dbo.NHANVIEN.HOTEN, dbo.NHANVIEN.NGAYSINH, dbo.NHANVIEN.DIACHI, dbo.NHANVIEN.SDT, dbo.NHANVIEN.LUONGCOBAN, COUNT(dbo.CHAMCONG.MANHANVIEN) AS SOCA, COUNT(dbo.CHAMCONG.MANHANVIEN) 
                         * dbo.NHANVIEN.LUONGCOBAN AS TONGTIEN, MONTH(dbo.CHAMCONG.NGAYLAM) AS THANG, YEAR(dbo.CHAMCONG.NGAYLAM) AS NAM
FROM            dbo.CHAMCONG INNER JOIN
                         dbo.NHANVIEN ON dbo.CHAMCONG.MANHANVIEN = dbo.NHANVIEN.MANHANVIEN
GROUP BY dbo.NHANVIEN.HOTEN, dbo.NHANVIEN.NGAYSINH, dbo.NHANVIEN.DIACHI, dbo.NHANVIEN.SDT, dbo.NHANVIEN.LUONGCOBAN, MONTH(dbo.CHAMCONG.NGAYLAM), YEAR(dbo.CHAMCONG.NGAYLAM)


GO
INSERT [dbo].[BAN] ([MABAN], [TENBAN], [SOCHONGOI], [MAKHUVUC], [TRANGTHAI]) VALUES (N'B001', N'Bàn 01', 10, N'KV01', N'Trống')
INSERT [dbo].[BAN] ([MABAN], [TENBAN], [SOCHONGOI], [MAKHUVUC], [TRANGTHAI]) VALUES (N'B002', N'Bàn 02', 10, N'KV01', N'Trống')
INSERT [dbo].[BAN] ([MABAN], [TENBAN], [SOCHONGOI], [MAKHUVUC], [TRANGTHAI]) VALUES (N'B003', N'Bàn 03', 10, N'KV01', N'Trống')
INSERT [dbo].[BAN] ([MABAN], [TENBAN], [SOCHONGOI], [MAKHUVUC], [TRANGTHAI]) VALUES (N'B004', N'Bàn 04', 10, N'KV01', N'Trống')
INSERT [dbo].[BAN] ([MABAN], [TENBAN], [SOCHONGOI], [MAKHUVUC], [TRANGTHAI]) VALUES (N'B005', N'Bàn 05', 10, N'KV01', N'Trống')
INSERT [dbo].[BAN] ([MABAN], [TENBAN], [SOCHONGOI], [MAKHUVUC], [TRANGTHAI]) VALUES (N'B006', N'Bàn 06', 10, N'KV02', N'Đã Đặt')
INSERT [dbo].[BAN] ([MABAN], [TENBAN], [SOCHONGOI], [MAKHUVUC], [TRANGTHAI]) VALUES (N'B007', N'Bàn 07', 10, N'KV02', N'Trống')
INSERT [dbo].[BAN] ([MABAN], [TENBAN], [SOCHONGOI], [MAKHUVUC], [TRANGTHAI]) VALUES (N'B008', N'Bàn 08', 10, N'KV02', N'Trống')
INSERT [dbo].[BAN] ([MABAN], [TENBAN], [SOCHONGOI], [MAKHUVUC], [TRANGTHAI]) VALUES (N'B009', N'Bàn 09', 10, N'KV02', N'Trống')
INSERT [dbo].[BAN] ([MABAN], [TENBAN], [SOCHONGOI], [MAKHUVUC], [TRANGTHAI]) VALUES (N'B010', N'Bàn 10', 10, N'KV02', N'Trống')
INSERT [dbo].[BAN] ([MABAN], [TENBAN], [SOCHONGOI], [MAKHUVUC], [TRANGTHAI]) VALUES (N'B011', N'Bàn 11', 10, N'KV03', N'Trống')
INSERT [dbo].[BAN] ([MABAN], [TENBAN], [SOCHONGOI], [MAKHUVUC], [TRANGTHAI]) VALUES (N'B012', N'Bàn 12', 10, N'KV03', N'Trống')
INSERT [dbo].[BAN] ([MABAN], [TENBAN], [SOCHONGOI], [MAKHUVUC], [TRANGTHAI]) VALUES (N'B013', N'Bàn 13', 10, N'KV03', N'Trống')
INSERT [dbo].[BAN] ([MABAN], [TENBAN], [SOCHONGOI], [MAKHUVUC], [TRANGTHAI]) VALUES (N'B014', N'Bàn 14', 10, N'KV03', N'Trống')
INSERT [dbo].[BAN] ([MABAN], [TENBAN], [SOCHONGOI], [MAKHUVUC], [TRANGTHAI]) VALUES (N'B015', N'Bàn 15', 10, N'KV03', N'Trống')
INSERT [dbo].[BAN] ([MABAN], [TENBAN], [SOCHONGOI], [MAKHUVUC], [TRANGTHAI]) VALUES (N'B016', N'Bàn 16', 10, N'KV04', N'Trống')
INSERT [dbo].[BAN] ([MABAN], [TENBAN], [SOCHONGOI], [MAKHUVUC], [TRANGTHAI]) VALUES (N'B017', N'Bàn 17', 10, N'KV04', N'Trống')
INSERT [dbo].[BAN] ([MABAN], [TENBAN], [SOCHONGOI], [MAKHUVUC], [TRANGTHAI]) VALUES (N'B018', N'Bàn 18', 10, N'KV04', N'Trống')
INSERT [dbo].[BAN] ([MABAN], [TENBAN], [SOCHONGOI], [MAKHUVUC], [TRANGTHAI]) VALUES (N'B019', N'Bàn 19', 10, N'KV04', N'Trống')
INSERT [dbo].[BAN] ([MABAN], [TENBAN], [SOCHONGOI], [MAKHUVUC], [TRANGTHAI]) VALUES (N'B020', N'Bàn 20', 10, N'KV04', N'Trống')
INSERT [dbo].[CHAMCONG] ([MANHANVIEN], [NGAYLAM], [CA]) VALUES (N'NV001', CAST(N'2019-11-14' AS Date), N'Chiều')
INSERT [dbo].[CHAMCONG] ([MANHANVIEN], [NGAYLAM], [CA]) VALUES (N'NV001', CAST(N'2019-11-14' AS Date), N'Sáng')
INSERT [dbo].[CHAMCONG] ([MANHANVIEN], [NGAYLAM], [CA]) VALUES (N'NV002', CAST(N'2019-11-08' AS Date), N'Chiều')
INSERT [dbo].[CHAMCONG] ([MANHANVIEN], [NGAYLAM], [CA]) VALUES (N'NV002', CAST(N'2019-11-08' AS Date), N'Sáng')
INSERT [dbo].[CHAMCONG] ([MANHANVIEN], [NGAYLAM], [CA]) VALUES (N'NV002', CAST(N'2019-11-09' AS Date), N'Sáng')
INSERT [dbo].[CHAMCONG] ([MANHANVIEN], [NGAYLAM], [CA]) VALUES (N'NV002', CAST(N'2019-11-25' AS Date), N'Sáng')
INSERT [dbo].[CHAMCONG] ([MANHANVIEN], [NGAYLAM], [CA]) VALUES (N'NV003', CAST(N'2019-11-08' AS Date), N'Sáng')
INSERT [dbo].[CHAMCONG] ([MANHANVIEN], [NGAYLAM], [CA]) VALUES (N'NV003', CAST(N'2019-11-15' AS Date), N'Sáng')
INSERT [dbo].[CHAMCONG] ([MANHANVIEN], [NGAYLAM], [CA]) VALUES (N'NV004', CAST(N'2019-11-08' AS Date), N'Tối')
INSERT [dbo].[CHAMCONG] ([MANHANVIEN], [NGAYLAM], [CA]) VALUES (N'NV004', CAST(N'2019-11-25' AS Date), N'Sáng')
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA001', N'10', 1)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA001', N'15', 3)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA001', N'17', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA001', N'18', 5)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA001', N'20', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA001', N'22', 4)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA001', N'23', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA001', N'25', 7)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA001', N'27', 1)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA001', N'29', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA001', N'7', 1)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA002', N'1', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA002', N'11', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA002', N'14', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA002', N'16', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA002', N'18', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA002', N'2', 1)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA002', N'20', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA002', N'21', 4)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA002', N'23', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA002', N'26', 3)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA002', N'27', 1)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA002', N'29', 4)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA002', N'3', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA003', N'1', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA003', N'12', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA003', N'15', 3)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA003', N'17', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA003', N'20', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA003', N'21', 4)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA003', N'22', 4)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA003', N'25', 4)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA003', N'29', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA003', N'4', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA003', N'5', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA003', N'8', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA003', N'9', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA004', N'12', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA004', N'14', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA004', N'16', 2)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA004', N'6', 1)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA006', N'12', 1)
INSERT [dbo].[CHITIETPHIEU] ([MAMON], [MAPHIEU], [SOLUONG]) VALUES (N'MA006', N'14', 1)
INSERT [dbo].[CONGTHUC] ([MAMON], [MANGUYENLIEU], [HAMLUONG]) VALUES (N'MA001', N'NL003', N'150gr')
INSERT [dbo].[CONGTHUC] ([MAMON], [MANGUYENLIEU], [HAMLUONG]) VALUES (N'MA002', N'NL001', N'400ml Mật Ong')
INSERT [dbo].[CONGTHUC] ([MAMON], [MANGUYENLIEU], [HAMLUONG]) VALUES (N'MA003', N'NL005', N'600gr Thịt Bò')
INSERT [dbo].[CONGTHUC] ([MAMON], [MANGUYENLIEU], [HAMLUONG]) VALUES (N'MA004', N'NL005', N'400gr Thịt Bò')
INSERT [dbo].[CONGTHUC] ([MAMON], [MANGUYENLIEU], [HAMLUONG]) VALUES (N'MA005', N'NL002', N'1 Con')
INSERT [dbo].[CONGTHUC] ([MAMON], [MANGUYENLIEU], [HAMLUONG]) VALUES (N'MA006', N'NL004', N'1 Con')
INSERT [dbo].[KHUVUC] ([MAKHUVUC], [TENKHUVUC]) VALUES (N'KV01', N'Tầng Trệt')
INSERT [dbo].[KHUVUC] ([MAKHUVUC], [TENKHUVUC]) VALUES (N'KV02', N'Tầng 2')
INSERT [dbo].[KHUVUC] ([MAKHUVUC], [TENKHUVUC]) VALUES (N'KV03', N'Tầng 3')
INSERT [dbo].[KHUVUC] ([MAKHUVUC], [TENKHUVUC]) VALUES (N'KV04', N'Sân Thượng')
INSERT [dbo].[LOAIMON] ([MALOAIMON], [TENLOAIMON]) VALUES (N'LM001', N'Gà ')
INSERT [dbo].[LOAIMON] ([MALOAIMON], [TENLOAIMON]) VALUES (N'LM002', N'Cá Ngừ')
INSERT [dbo].[LOAIMON] ([MALOAIMON], [TENLOAIMON]) VALUES (N'LM003', N'Bò')
INSERT [dbo].[LOAIMON] ([MALOAIMON], [TENLOAIMON]) VALUES (N'LM004', N'Tôm')
INSERT [dbo].[LOAIMON] ([MALOAIMON], [TENLOAIMON]) VALUES (N'LM005', N'cá')
INSERT [dbo].[NGUYENLIEU] ([MANGUYENLIEU], [TENNGUYENLIEU]) VALUES (N'NL001', N'Gà')
INSERT [dbo].[NGUYENLIEU] ([MANGUYENLIEU], [TENNGUYENLIEU]) VALUES (N'NL002', N'Cá Ngừ')
INSERT [dbo].[NGUYENLIEU] ([MANGUYENLIEU], [TENNGUYENLIEU]) VALUES (N'NL003', N'Cua')
INSERT [dbo].[NGUYENLIEU] ([MANGUYENLIEU], [TENNGUYENLIEU]) VALUES (N'NL004', N'Tôm')
INSERT [dbo].[NGUYENLIEU] ([MANGUYENLIEU], [TENNGUYENLIEU]) VALUES (N'NL005', N'Bò')
INSERT [dbo].[NHANVIEN] ([MANHANVIEN], [HOTEN], [PHAI], [NGAYSINH], [DIACHI], [SDT], [NGAYVAOLAM], [LUONGCOBAN]) VALUES (N'NV001', N'Đào Nguyễn Huy Bằng', N'Nam', CAST(N'1998-02-25' AS Date), N'Bình Định', N'0326685588', CAST(N'2014-05-20' AS Date), 100000)
INSERT [dbo].[NHANVIEN] ([MANHANVIEN], [HOTEN], [PHAI], [NGAYSINH], [DIACHI], [SDT], [NGAYVAOLAM], [LUONGCOBAN]) VALUES (N'NV002', N'Nguyễn Thị Hồng Đức', N'Nữ', CAST(N'1998-05-19' AS Date), N'Kon Tum', N'0374265345', CAST(N'2017-08-25' AS Date), 100000)
INSERT [dbo].[NHANVIEN] ([MANHANVIEN], [HOTEN], [PHAI], [NGAYSINH], [DIACHI], [SDT], [NGAYVAOLAM], [LUONGCOBAN]) VALUES (N'NV003', N'Hoàng Nữ Linh Giang', N'Nữ', CAST(N'1998-07-24' AS Date), N'Đăk Lăk', N'0355466621', CAST(N'2017-10-24' AS Date), 95000)
INSERT [dbo].[NHANVIEN] ([MANHANVIEN], [HOTEN], [PHAI], [NGAYSINH], [DIACHI], [SDT], [NGAYVAOLAM], [LUONGCOBAN]) VALUES (N'NV004', N'Phạm Trung Kiên', N'Nam', CAST(N'1998-07-16' AS Date), N'Đăk Lăk', N'0351566145', CAST(N'2016-06-20' AS Date), 120000)
INSERT [dbo].[NHANVIEN] ([MANHANVIEN], [HOTEN], [PHAI], [NGAYSINH], [DIACHI], [SDT], [NGAYVAOLAM], [LUONGCOBAN]) VALUES (N'NV005', N'Nguyễn Minh Hiếu', N'Nam', CAST(N'1998-09-19' AS Date), N'Quảng Ngãi', N'0375658941', CAST(N'2017-10-10' AS Date), 75000)
INSERT [dbo].[NHANVIEN] ([MANHANVIEN], [HOTEN], [PHAI], [NGAYSINH], [DIACHI], [SDT], [NGAYVAOLAM], [LUONGCOBAN]) VALUES (N'NV006', N'Nguyễn Châu', N'Nữ', CAST(N'1999-02-25' AS Date), N'HCM', N'0326685588', CAST(N'2019-11-25' AS Date), 90000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'1', CAST(N'2019-11-12' AS Date), N'B001', N'NV001', 1672000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'10', CAST(N'2019-11-12' AS Date), N'B001', N'NV001', 330000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'11', CAST(N'2019-11-12' AS Date), N'B001', N'NV001', 792000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'12', CAST(N'2019-11-12' AS Date), N'B003', N'NV001', 5984000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'14', CAST(N'2019-11-12' AS Date), N'B003', N'NV001', 5896000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'15', CAST(N'2019-11-12' AS Date), N'B001', N'NV001', 2310000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'16', CAST(N'2019-11-12' AS Date), N'B001', N'NV005', 1496000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'17', CAST(N'2019-11-12' AS Date), N'B001', N'NV001', 1540000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'18', CAST(N'2019-11-14' AS Date), N'B001', N'NV001', 2442000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'2', CAST(N'2019-11-12' AS Date), N'B001', N'NV001', 396000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'20', CAST(N'2019-11-14' AS Date), N'B002', N'NV001', 2332000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'21', CAST(N'2019-11-14' AS Date), N'B002', N'NV001', 3344000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'22', CAST(N'2019-11-16' AS Date), N'B001', N'NV001', 3080000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'23', CAST(N'2019-11-20' AS Date), N'B001', N'NV001', 1452000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'25', CAST(N'2019-11-23' AS Date), N'B011', N'NV001', 4070000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'26', CAST(N'2019-11-23' AS Date), N'B006', N'NV001', 0)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'27', CAST(N'2019-11-25' AS Date), N'B020', N'NV001', 726000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'29', CAST(N'2019-11-25' AS Date), N'B017', N'NV001', 3124000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'3', CAST(N'2019-11-12' AS Date), N'B001', N'NV001', 792000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'4', CAST(N'2019-11-12' AS Date), N'B001', N'NV001', 880000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'5', CAST(N'2019-11-12' AS Date), N'B001', N'NV001', 880000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'6', CAST(N'2019-11-12' AS Date), N'B002', N'NV001', 352000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'7', CAST(N'2019-11-12' AS Date), N'B001', N'NV001', 330000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'8', CAST(N'2019-11-12' AS Date), N'B002', N'NV001', 880000)
INSERT [dbo].[PHIEU] ([MAPHIEU], [NGAYTAO], [MABAN], [MANHANVIEN], [THANHTIEN]) VALUES (N'9', CAST(N'2019-11-12' AS Date), N'B001', N'NV001', 880000)
INSERT [dbo].[TAIKHOAN] ([MANHANVIEN], [TENDANGNHAP], [MATKHAU], [CAPQUYEN], [TRANGTHAI]) VALUES (N'NV001', N'bangdk', N'196202665616018', N'Quản Lý', N'Hoạt Động')
INSERT [dbo].[TAIKHOAN] ([MANHANVIEN], [TENDANGNHAP], [MATKHAU], [CAPQUYEN], [TRANGTHAI]) VALUES (N'NV006', N'CHAU', N'324418598172897', N'Nhân Viên', N'Hoạt Động')
INSERT [dbo].[TAIKHOAN] ([MANHANVIEN], [TENDANGNHAP], [MATKHAU], [CAPQUYEN], [TRANGTHAI]) VALUES (N'NV002', N'duc', N'225102205773186', N'Nhân Viên', N'Khóa')
INSERT [dbo].[TAIKHOAN] ([MANHANVIEN], [TENDANGNHAP], [MATKHAU], [CAPQUYEN], [TRANGTHAI]) VALUES (N'NV005', N'Hieu', N'225102205773186', N'Nhân Viên', N'Hoạt Động')
INSERT [dbo].[THUCDON] ([MAMON], [TENMON], [DVT], [DONGIA], [MALOAIMON], [HINHANH]) VALUES (N'MA001', N'Cua Rang Muối', N'Đĩa', 300000, N'LM005', N'C:\Users\3quoc\Desktop\DoAnNhaHang\HinhAnhDeMo\CuaRangMuoi.png')
INSERT [dbo].[THUCDON] ([MAMON], [TENMON], [DVT], [DONGIA], [MALOAIMON], [HINHANH]) VALUES (N'MA002', N'Gà Nướng Mật Ong', N'Đĩa', 360000, N'LM001', N'C:\Users\3quoc\Desktop\DoAnNhaHang\HinhAnhDeMo\GaNuongMatOng.png')
INSERT [dbo].[THUCDON] ([MAMON], [TENMON], [DVT], [DONGIA], [MALOAIMON], [HINHANH]) VALUES (N'MA003', N'Bò Sốt Vang', N'Tô', 400000, N'LM003', N'C:\Users\3quoc\Desktop\DoAnNhaHang\HinhAnhDeMo\BoSotVang.png')
INSERT [dbo].[THUCDON] ([MAMON], [TENMON], [DVT], [DONGIA], [MALOAIMON], [HINHANH]) VALUES (N'MA004', N'Bò Cuộn Xả Nướng', N'Đĩa', 320000, N'LM003', N'C:\Users\3quoc\Desktop\DoAnNhaHang\HinhAnhDeMo\BoCuonXaNuong.png')
INSERT [dbo].[THUCDON] ([MAMON], [TENMON], [DVT], [DONGIA], [MALOAIMON], [HINHANH]) VALUES (N'MA005', N'Cá Ngừ Nướng Vẩy Bạc', N'Con', 350000, N'LM002', N'C:\Users\3quoc\Desktop\DoAnNhaHang\HinhAnhDeMo\CaNguNuongVayBac.png')
INSERT [dbo].[THUCDON] ([MAMON], [TENMON], [DVT], [DONGIA], [MALOAIMON], [HINHANH]) VALUES (N'MA006', N'Tôm SaShimi', N'Con', 4000000, N'LM004', N'C:\Users\3quoc\Desktop\DoAnNhaHang\HinhAnhDeMo\TomSaShimi.png')
ALTER TABLE [dbo].[BAN]  WITH CHECK ADD  CONSTRAINT [FK_BAN_KHUVUC] FOREIGN KEY([MAKHUVUC])
REFERENCES [dbo].[KHUVUC] ([MAKHUVUC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BAN] CHECK CONSTRAINT [FK_BAN_KHUVUC]
GO
ALTER TABLE [dbo].[CHAMCONG]  WITH CHECK ADD  CONSTRAINT [FK_CHAMCONG_NHANVIEN] FOREIGN KEY([MANHANVIEN])
REFERENCES [dbo].[NHANVIEN] ([MANHANVIEN])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CHAMCONG] CHECK CONSTRAINT [FK_CHAMCONG_NHANVIEN]
GO
ALTER TABLE [dbo].[CHITIETPHIEU]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETPHIEU_PHIEU] FOREIGN KEY([MAPHIEU])
REFERENCES [dbo].[PHIEU] ([MAPHIEU])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CHITIETPHIEU] CHECK CONSTRAINT [FK_CHITIETPHIEU_PHIEU]
GO
ALTER TABLE [dbo].[CHITIETPHIEU]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETPHIEU_THUCDON] FOREIGN KEY([MAMON])
REFERENCES [dbo].[THUCDON] ([MAMON])
GO
ALTER TABLE [dbo].[CHITIETPHIEU] CHECK CONSTRAINT [FK_CHITIETPHIEU_THUCDON]
GO
ALTER TABLE [dbo].[CONGTHUC]  WITH CHECK ADD  CONSTRAINT [FK_CONGTHUC_NGUYENLIEU] FOREIGN KEY([MANGUYENLIEU])
REFERENCES [dbo].[NGUYENLIEU] ([MANGUYENLIEU])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CONGTHUC] CHECK CONSTRAINT [FK_CONGTHUC_NGUYENLIEU]
GO
ALTER TABLE [dbo].[CONGTHUC]  WITH CHECK ADD  CONSTRAINT [FK_CONGTHUC_THUCDON] FOREIGN KEY([MAMON])
REFERENCES [dbo].[THUCDON] ([MAMON])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CONGTHUC] CHECK CONSTRAINT [FK_CONGTHUC_THUCDON]
GO
ALTER TABLE [dbo].[PHIEU]  WITH CHECK ADD  CONSTRAINT [FK_PHIEU_BAN] FOREIGN KEY([MABAN])
REFERENCES [dbo].[BAN] ([MABAN])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PHIEU] CHECK CONSTRAINT [FK_PHIEU_BAN]
GO
ALTER TABLE [dbo].[PHIEU]  WITH CHECK ADD  CONSTRAINT [FK_PHIEU_NHANVIEN] FOREIGN KEY([MANHANVIEN])
REFERENCES [dbo].[NHANVIEN] ([MANHANVIEN])
GO
ALTER TABLE [dbo].[PHIEU] CHECK CONSTRAINT [FK_PHIEU_NHANVIEN]
GO
ALTER TABLE [dbo].[TAIKHOAN]  WITH CHECK ADD  CONSTRAINT [FK_TAIKHOANG_NHANVIEN] FOREIGN KEY([MANHANVIEN])
REFERENCES [dbo].[NHANVIEN] ([MANHANVIEN])
GO
ALTER TABLE [dbo].[TAIKHOAN] CHECK CONSTRAINT [FK_TAIKHOANG_NHANVIEN]
GO
ALTER TABLE [dbo].[THUCDON]  WITH CHECK ADD  CONSTRAINT [FK_THUCDON_LOAIMON] FOREIGN KEY([MALOAIMON])
REFERENCES [dbo].[LOAIMON] ([MALOAIMON])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[THUCDON] CHECK CONSTRAINT [FK_THUCDON_LOAIMON]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BAN"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "PHIEU"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "NHANVIEN"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DOANHTHU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DOANHTHU'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[43] 4[12] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BAN"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "PHIEU"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CHITIETPHIEU"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "NHANVIEN"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "THUCDON"
            Begin Extent = 
               Top = 120
               Left = 246
               Bottom = 250
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 2685
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Ta' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HOADON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'ble = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HOADON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HOADON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CHAMCONG"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "NHANVIEN"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RPCHAMCONG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RPCHAMCONG'
GO
USE [master]
GO
ALTER DATABASE [Cafe] SET  READ_WRITE 
GO
