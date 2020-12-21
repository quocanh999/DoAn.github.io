USE [BookStore]
GO
/****** Object:  Table [dbo].[ChiTietHoaDons]    Script Date: 12/21/2020 9:29:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDons](
	[MaCTDH] [int] IDENTITY(1,1) NOT NULL,
	[MaSach] [int] NOT NULL,
	[MaDonHang] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[ThanhTien] [float] NOT NULL,
	[flag] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.ChiTietHoaDons] PRIMARY KEY CLUSTERED 
(
	[MaCTDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuDes]    Script Date: 12/21/2020 9:29:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDes](
	[MaChuDe] [int] IDENTITY(1,1) NOT NULL,
	[TenChuDe] [nvarchar](max) NOT NULL,
	[flag] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.ChuDes] PRIMARY KEY CLUSTERED 
(
	[MaChuDe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDons]    Script Date: 12/21/2020 9:29:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDons](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[NgayTao] [datetime] NOT NULL,
	[DaThanhToan] [bit] NOT NULL,
	[MaKH] [int] NOT NULL,
	[TongTien] [float] NOT NULL,
	[SDT] [nvarchar](max) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[flag] [bit] NOT NULL,
	[DaGiaoHang] [bit] NOT NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_dbo.HoaDons] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHangs]    Script Date: 12/21/2020 9:29:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHangs](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](max) NOT NULL,
	[NgaySinh] [datetime] NOT NULL,
	[GioiTinh] [nvarchar](max) NULL,
	[TaiKhoan] [nvarchar](max) NOT NULL,
	[MatKhau] [nvarchar](max) NOT NULL,
	[LoaiKH] [nvarchar](max) NULL,
	[flag] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.KhachHangs] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 12/21/2020 9:29:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[MaLog] [int] IDENTITY(1,1) NOT NULL,
	[ThoiGian] [datetime] NOT NULL,
	[HanhDong] [nvarchar](max) NULL,
	[TaiKhoan] [nvarchar](max) NULL,
	[TacVu] [nvarchar](max) NULL,
	[flag] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Logs] PRIMARY KEY CLUSTERED 
(
	[MaLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaXuatBans]    Script Date: 12/21/2020 9:29:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaXuatBans](
	[MaNXB] [int] IDENTITY(1,1) NOT NULL,
	[TenNXB] [nvarchar](max) NOT NULL,
	[flag] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.NhaXuatBans] PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Saches]    Script Date: 12/21/2020 9:29:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Saches](
	[MaSach] [int] IDENTITY(1,1) NOT NULL,
	[TenSach] [nvarchar](max) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[NgayCapNhat] [datetime] NOT NULL,
	[AnhBia] [nvarchar](max) NULL,
	[SoLuongTon] [int] NOT NULL,
	[MaChuDe] [int] NOT NULL,
	[MaNXB] [int] NOT NULL,
	[GiaBan] [float] NOT NULL,
	[MaTacGia] [int] NOT NULL,
	[flag] [bit] NOT NULL,
	[LuotXem] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Saches] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TacGias]    Script Date: 12/21/2020 9:29:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGias](
	[MaTacGia] [int] IDENTITY(1,1) NOT NULL,
	[TenTacGia] [nvarchar](max) NOT NULL,
	[flag] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.TacGias] PRIMARY KEY CLUSTERED 
(
	[MaTacGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDons] ON 

INSERT [dbo].[ChiTietHoaDons] ([MaCTDH], [MaSach], [MaDonHang], [SoLuong], [ThanhTien], [flag]) VALUES (1, 2, 1, 1, 67000, 1)
INSERT [dbo].[ChiTietHoaDons] ([MaCTDH], [MaSach], [MaDonHang], [SoLuong], [ThanhTien], [flag]) VALUES (2, 1, 1, 1, 112500, 1)
INSERT [dbo].[ChiTietHoaDons] ([MaCTDH], [MaSach], [MaDonHang], [SoLuong], [ThanhTien], [flag]) VALUES (3, 4, 2, 1, 85000, 0)
INSERT [dbo].[ChiTietHoaDons] ([MaCTDH], [MaSach], [MaDonHang], [SoLuong], [ThanhTien], [flag]) VALUES (4, 3, 3, 1, 109000, 0)
INSERT [dbo].[ChiTietHoaDons] ([MaCTDH], [MaSach], [MaDonHang], [SoLuong], [ThanhTien], [flag]) VALUES (5, 1, 4, 1, 112500, 0)
INSERT [dbo].[ChiTietHoaDons] ([MaCTDH], [MaSach], [MaDonHang], [SoLuong], [ThanhTien], [flag]) VALUES (6, 3, 5, 1, 109000, 0)
INSERT [dbo].[ChiTietHoaDons] ([MaCTDH], [MaSach], [MaDonHang], [SoLuong], [ThanhTien], [flag]) VALUES (7, 4, 6, 2, 170000, 0)
INSERT [dbo].[ChiTietHoaDons] ([MaCTDH], [MaSach], [MaDonHang], [SoLuong], [ThanhTien], [flag]) VALUES (8, 3, 6, 3, 327000, 0)
INSERT [dbo].[ChiTietHoaDons] ([MaCTDH], [MaSach], [MaDonHang], [SoLuong], [ThanhTien], [flag]) VALUES (9, 1, 7, 2, 225000, 0)
INSERT [dbo].[ChiTietHoaDons] ([MaCTDH], [MaSach], [MaDonHang], [SoLuong], [ThanhTien], [flag]) VALUES (10, 3, 8, 1, 109000, 0)
INSERT [dbo].[ChiTietHoaDons] ([MaCTDH], [MaSach], [MaDonHang], [SoLuong], [ThanhTien], [flag]) VALUES (11, 3, 9, 1, 109000, 0)
INSERT [dbo].[ChiTietHoaDons] ([MaCTDH], [MaSach], [MaDonHang], [SoLuong], [ThanhTien], [flag]) VALUES (12, 1, 10, 1, 112500, 0)
INSERT [dbo].[ChiTietHoaDons] ([MaCTDH], [MaSach], [MaDonHang], [SoLuong], [ThanhTien], [flag]) VALUES (13, 1, 11, 1, 112500, 0)
INSERT [dbo].[ChiTietHoaDons] ([MaCTDH], [MaSach], [MaDonHang], [SoLuong], [ThanhTien], [flag]) VALUES (14, 1, 12, 3, 337500, 0)
INSERT [dbo].[ChiTietHoaDons] ([MaCTDH], [MaSach], [MaDonHang], [SoLuong], [ThanhTien], [flag]) VALUES (15, 3, 13, 2, 218000, 0)
INSERT [dbo].[ChiTietHoaDons] ([MaCTDH], [MaSach], [MaDonHang], [SoLuong], [ThanhTien], [flag]) VALUES (16, 3, 14, 1, 109000, 0)
INSERT [dbo].[ChiTietHoaDons] ([MaCTDH], [MaSach], [MaDonHang], [SoLuong], [ThanhTien], [flag]) VALUES (17, 2, 15, 3, 201000, 0)
INSERT [dbo].[ChiTietHoaDons] ([MaCTDH], [MaSach], [MaDonHang], [SoLuong], [ThanhTien], [flag]) VALUES (18, 2, 16, 5, 335000, 0)
INSERT [dbo].[ChiTietHoaDons] ([MaCTDH], [MaSach], [MaDonHang], [SoLuong], [ThanhTien], [flag]) VALUES (19, 2, 17, 3, 201000, 0)
INSERT [dbo].[ChiTietHoaDons] ([MaCTDH], [MaSach], [MaDonHang], [SoLuong], [ThanhTien], [flag]) VALUES (20, 1, 18, 1, 112500, 0)
INSERT [dbo].[ChiTietHoaDons] ([MaCTDH], [MaSach], [MaDonHang], [SoLuong], [ThanhTien], [flag]) VALUES (1002, 3, 1002, 1, 109000, 0)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDons] OFF
GO
SET IDENTITY_INSERT [dbo].[ChuDes] ON 

INSERT [dbo].[ChuDes] ([MaChuDe], [TenChuDe], [flag]) VALUES (1, N'Văn Học', 0)
INSERT [dbo].[ChuDes] ([MaChuDe], [TenChuDe], [flag]) VALUES (2, N'Kinh Tế ', 0)
INSERT [dbo].[ChuDes] ([MaChuDe], [TenChuDe], [flag]) VALUES (3, N'Nuôi Dạy Con', 0)
INSERT [dbo].[ChuDes] ([MaChuDe], [TenChuDe], [flag]) VALUES (4, N'Tâm Lý - Kĩ Năng Sống', 0)
INSERT [dbo].[ChuDes] ([MaChuDe], [TenChuDe], [flag]) VALUES (5, N'Sách Thiếu Nhi', 0)
INSERT [dbo].[ChuDes] ([MaChuDe], [TenChuDe], [flag]) VALUES (6, N'Sách Ngoại Ngữ', 0)
SET IDENTITY_INSERT [dbo].[ChuDes] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDons] ON 

INSERT [dbo].[HoaDons] ([MaDonHang], [NgayTao], [DaThanhToan], [MaKH], [TongTien], [SDT], [DiaChi], [flag], [DaGiaoHang], [TrangThai]) VALUES (1, CAST(N'2020-12-18T00:00:00.000' AS DateTime), 0, 2, 0, N'', N'', 1, 0, 1)
INSERT [dbo].[HoaDons] ([MaDonHang], [NgayTao], [DaThanhToan], [MaKH], [TongTien], [SDT], [DiaChi], [flag], [DaGiaoHang], [TrangThai]) VALUES (2, CAST(N'2020-12-18T14:17:48.673' AS DateTime), 0, 3, 85000, N'2312312', N'ddddddddddddddddd', 0, 0, 1)
INSERT [dbo].[HoaDons] ([MaDonHang], [NgayTao], [DaThanhToan], [MaKH], [TongTien], [SDT], [DiaChi], [flag], [DaGiaoHang], [TrangThai]) VALUES (3, CAST(N'2020-12-18T14:18:44.117' AS DateTime), 0, 4, 109000, N'2312312', N'3asdasdsa', 0, 0, 1)
INSERT [dbo].[HoaDons] ([MaDonHang], [NgayTao], [DaThanhToan], [MaKH], [TongTien], [SDT], [DiaChi], [flag], [DaGiaoHang], [TrangThai]) VALUES (4, CAST(N'2020-12-18T14:19:34.903' AS DateTime), 0, 5, 112500, N'21312312', N'dasdasdas', 0, 0, 1)
INSERT [dbo].[HoaDons] ([MaDonHang], [NgayTao], [DaThanhToan], [MaKH], [TongTien], [SDT], [DiaChi], [flag], [DaGiaoHang], [TrangThai]) VALUES (5, CAST(N'2020-12-18T14:23:07.123' AS DateTime), 0, 6, 109000, N'2312312', N'3asdasdsa', 0, 0, 1)
INSERT [dbo].[HoaDons] ([MaDonHang], [NgayTao], [DaThanhToan], [MaKH], [TongTien], [SDT], [DiaChi], [flag], [DaGiaoHang], [TrangThai]) VALUES (6, CAST(N'2020-12-18T14:30:32.277' AS DateTime), 0, 7, 497000, N'0377524660', N'Bắc Ninh', 0, 0, 1)
INSERT [dbo].[HoaDons] ([MaDonHang], [NgayTao], [DaThanhToan], [MaKH], [TongTien], [SDT], [DiaChi], [flag], [DaGiaoHang], [TrangThai]) VALUES (7, CAST(N'2020-12-18T14:47:44.093' AS DateTime), 0, 7, 225000, N'0377524660', N'gggggggggggggggggggggggg', 0, 0, 1)
INSERT [dbo].[HoaDons] ([MaDonHang], [NgayTao], [DaThanhToan], [MaKH], [TongTien], [SDT], [DiaChi], [flag], [DaGiaoHang], [TrangThai]) VALUES (8, CAST(N'2020-12-18T14:51:24.150' AS DateTime), 0, 7, 109000, N'0377524660', N'Bắc Ninh', 0, 0, 1)
INSERT [dbo].[HoaDons] ([MaDonHang], [NgayTao], [DaThanhToan], [MaKH], [TongTien], [SDT], [DiaChi], [flag], [DaGiaoHang], [TrangThai]) VALUES (9, CAST(N'2020-12-18T14:53:21.107' AS DateTime), 0, 7, 109000, N'0377524660', N'321312', 0, 0, 1)
INSERT [dbo].[HoaDons] ([MaDonHang], [NgayTao], [DaThanhToan], [MaKH], [TongTien], [SDT], [DiaChi], [flag], [DaGiaoHang], [TrangThai]) VALUES (10, CAST(N'2020-12-18T14:58:27.140' AS DateTime), 0, 7, 112500, N'0377524660', N'451412312321', 0, 0, 1)
INSERT [dbo].[HoaDons] ([MaDonHang], [NgayTao], [DaThanhToan], [MaKH], [TongTien], [SDT], [DiaChi], [flag], [DaGiaoHang], [TrangThai]) VALUES (11, CAST(N'2020-12-18T15:01:23.307' AS DateTime), 0, 7, 112500, N'0377524660', N'3131231', 0, 0, 1)
INSERT [dbo].[HoaDons] ([MaDonHang], [NgayTao], [DaThanhToan], [MaKH], [TongTien], [SDT], [DiaChi], [flag], [DaGiaoHang], [TrangThai]) VALUES (12, CAST(N'2020-12-18T15:09:22.927' AS DateTime), 0, 7, 337500, N'0377524660', N'dadfasdasdasdas', 0, 0, 1)
INSERT [dbo].[HoaDons] ([MaDonHang], [NgayTao], [DaThanhToan], [MaKH], [TongTien], [SDT], [DiaChi], [flag], [DaGiaoHang], [TrangThai]) VALUES (13, CAST(N'2020-12-18T15:11:32.510' AS DateTime), 0, 7, 218000, N'0377524660', N'dasdsa', 0, 0, 1)
INSERT [dbo].[HoaDons] ([MaDonHang], [NgayTao], [DaThanhToan], [MaKH], [TongTien], [SDT], [DiaChi], [flag], [DaGiaoHang], [TrangThai]) VALUES (14, CAST(N'2020-12-18T15:13:29.727' AS DateTime), 0, 7, 109000, N'0377524660', N'dasdasdasdas', 0, 0, 1)
INSERT [dbo].[HoaDons] ([MaDonHang], [NgayTao], [DaThanhToan], [MaKH], [TongTien], [SDT], [DiaChi], [flag], [DaGiaoHang], [TrangThai]) VALUES (15, CAST(N'2020-12-18T15:17:49.003' AS DateTime), 0, 7, 201000, N'0377524660', N'sdadas', 0, 0, 1)
INSERT [dbo].[HoaDons] ([MaDonHang], [NgayTao], [DaThanhToan], [MaKH], [TongTien], [SDT], [DiaChi], [flag], [DaGiaoHang], [TrangThai]) VALUES (16, CAST(N'2020-12-18T15:19:56.260' AS DateTime), 0, 7, 335000, N'0377524660', N'sadasdasdsa', 0, 0, 2)
INSERT [dbo].[HoaDons] ([MaDonHang], [NgayTao], [DaThanhToan], [MaKH], [TongTien], [SDT], [DiaChi], [flag], [DaGiaoHang], [TrangThai]) VALUES (17, CAST(N'2020-12-18T15:36:46.677' AS DateTime), 0, 2, 201000, N'0377524660', N'asddasdsadsa', 0, 0, 3)
INSERT [dbo].[HoaDons] ([MaDonHang], [NgayTao], [DaThanhToan], [MaKH], [TongTien], [SDT], [DiaChi], [flag], [DaGiaoHang], [TrangThai]) VALUES (18, CAST(N'2020-12-18T15:40:09.053' AS DateTime), 0, 2, 112500, N'0377524660', N'dsada', 0, 0, 4)
INSERT [dbo].[HoaDons] ([MaDonHang], [NgayTao], [DaThanhToan], [MaKH], [TongTien], [SDT], [DiaChi], [flag], [DaGiaoHang], [TrangThai]) VALUES (1002, CAST(N'2020-12-21T08:17:20.847' AS DateTime), 0, 7, 109000, N'0377524660', N'dasdasdas', 0, 0, 4)
SET IDENTITY_INSERT [dbo].[HoaDons] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHangs] ON 

INSERT [dbo].[KhachHangs] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [TaiKhoan], [MatKhau], [LoaiKH], [flag]) VALUES (1, N'Admin', CAST(N'2020-12-18T00:00:00.000' AS DateTime), N'Nam', N'admin', N'admin', N'Admin', 0)
INSERT [dbo].[KhachHangs] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [TaiKhoan], [MatKhau], [LoaiKH], [flag]) VALUES (2, N'Nguyễn Đức Âu ', CAST(N'1992-01-12T00:00:00.000' AS DateTime), N'Nam', N'user01', N'user01', N'Khách Hàng', 0)
INSERT [dbo].[KhachHangs] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [TaiKhoan], [MatKhau], [LoaiKH], [flag]) VALUES (3, N'Nguyễn Đức Âu 222', CAST(N'2020-12-18T14:17:48.633' AS DateTime), NULL, N'2312312', N'123456', NULL, 1)
INSERT [dbo].[KhachHangs] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [TaiKhoan], [MatKhau], [LoaiKH], [flag]) VALUES (4, N'Nguyễn Đức Âu', CAST(N'2020-12-18T14:18:44.050' AS DateTime), NULL, N'2312312', N'123456', NULL, 1)
INSERT [dbo].[KhachHangs] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [TaiKhoan], [MatKhau], [LoaiKH], [flag]) VALUES (5, N'Nguyễn Đức Âu 3', CAST(N'2020-12-18T14:19:26.830' AS DateTime), NULL, N'21312312', N'123456', NULL, 1)
INSERT [dbo].[KhachHangs] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [TaiKhoan], [MatKhau], [LoaiKH], [flag]) VALUES (6, N'Nguyễn Đức Âu', CAST(N'2020-12-18T14:23:07.087' AS DateTime), NULL, N'2312312', N'123456', NULL, 0)
INSERT [dbo].[KhachHangs] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [TaiKhoan], [MatKhau], [LoaiKH], [flag]) VALUES (7, N'Nguyễn Đức Âu', CAST(N'2020-12-18T14:30:32.240' AS DateTime), NULL, N'0377524660', N'123456', N'Khách Hàng', 0)
SET IDENTITY_INSERT [dbo].[KhachHangs] OFF
GO
SET IDENTITY_INSERT [dbo].[Logs] ON 

INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (1, CAST(N'2020-12-18T10:21:17.867' AS DateTime), N'Admin đã được đăng kí ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (2, CAST(N'2020-12-18T10:21:25.083' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (3, CAST(N'2020-12-18T10:22:29.080' AS DateTime), N'Đã thêm chủ đề có tên là Văn Học', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (4, CAST(N'2020-12-18T10:22:31.750' AS DateTime), N'Đã thêm chủ đề có tên là Kinh Tế ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (5, CAST(N'2020-12-18T10:22:40.247' AS DateTime), N'Đã thêm chủ đề có tên là Nuôi Dạy Con', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (6, CAST(N'2020-12-18T10:22:45.177' AS DateTime), N'Đã thêm chủ đề có tên là Tâm Lý - Kĩ Năng Sống', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (7, CAST(N'2020-12-18T10:22:55.423' AS DateTime), N'Đã thêm chủ đề có tên là Sách Thiếu Nhi', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (8, CAST(N'2020-12-18T10:22:59.287' AS DateTime), N'Đã thêm chủ đề có tên là Sách Ngoại Ngữ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (9, CAST(N'2020-12-18T10:23:24.060' AS DateTime), N'Đã thêm nhà xuất bản NXB Kim Đồng', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (10, CAST(N'2020-12-18T10:23:28.470' AS DateTime), N'Đã thêm nhà xuất bản Nhà xuất bản Trẻ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (11, CAST(N'2020-12-18T10:23:34.030' AS DateTime), N'Đã thêm nhà xuất bản Nhà xuất bản Tổng hợp thành phố Hồ Chí Minh', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (12, CAST(N'2020-12-18T10:23:37.783' AS DateTime), N'Đã thêm nhà xuất bản Nhà xuất bản chính trị quốc gia sự thật', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (13, CAST(N'2020-12-18T10:23:41.680' AS DateTime), N'Đã thêm nhà xuất bản Nhà xuất bản giáo dục', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (14, CAST(N'2020-12-18T10:23:46.253' AS DateTime), N'Đã thêm nhà xuất bản Nhà xuất bản Hội Nhà văn', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (15, CAST(N'2020-12-18T10:23:51.333' AS DateTime), N'Đã thêm nhà xuất bản Nhà xuất bản Tư pháp', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (16, CAST(N'2020-12-18T10:24:23.737' AS DateTime), N'Đã thêm tác giả có tên Nguyễn Nhật Ánh', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (17, CAST(N'2020-12-18T10:24:29.133' AS DateTime), N'Đã thêm tác giả có tên Trang Hạ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (18, CAST(N'2020-12-18T10:24:33.420' AS DateTime), N'Đã thêm tác giả có tên Nguyễn Phong Việt', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (19, CAST(N'2020-12-18T10:24:37.117' AS DateTime), N'Đã thêm tác giả có tên Anh Khang', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (20, CAST(N'2020-12-18T10:24:41.133' AS DateTime), N'Đã thêm tác giả có tên Nguyễn Ngọc Thạch', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (21, CAST(N'2020-12-18T10:25:59.503' AS DateTime), N'Đã thêm sách có tên Con Chim Xanh Biếc Bay Về - Tặng Kèm 6 Postcard có NXB: NXB Kim Đồng, Thể loại: Văn Học, Tác giả: Nguyễn Nhật Ánh, Giá: 112500', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (22, CAST(N'2020-12-18T10:25:59.543' AS DateTime), N'0', N'1', N'Log', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (23, CAST(N'2020-12-18T10:26:43.980' AS DateTime), N'Đã thêm sách có tên Nhà Giả Kim (Tái Bản 2020) có NXB: NXB Kim Đồng, Thể loại: Văn Học, Tác giả: Nguyễn Nhật Ánh, Giá: 67000', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (24, CAST(N'2020-12-18T10:26:43.993' AS DateTime), N'0', N'2', N'Log', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (25, CAST(N'2020-12-18T10:27:08.910' AS DateTime), N'Đã log out ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (26, CAST(N'2020-12-18T10:34:26.517' AS DateTime), N'Nguyễn Đức Âu  đã được đăng kí ', N'user01', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (27, CAST(N'2020-12-18T10:34:29.753' AS DateTime), N'Đã đăng nhập ', N'user01', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (28, CAST(N'2020-12-18T10:42:23.013' AS DateTime), N'Đã log out ', N'user01', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (29, CAST(N'2020-12-18T10:42:26.273' AS DateTime), N'Đã đăng nhập ', N'user01', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (30, CAST(N'2020-12-18T13:11:33.290' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (31, CAST(N'2020-12-18T13:13:08.603' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (32, CAST(N'2020-12-18T13:13:17.397' AS DateTime), N'Đã log out ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (33, CAST(N'2020-12-18T13:34:59.067' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (34, CAST(N'2020-12-18T13:35:46.810' AS DateTime), N'Đã thêm sách có tên Những Kẻ Xuất Chúng (Tái Bản 2019) có NXB: NXB Kim Đồng, Thể loại: Kinh Tế , Tác giả: Nguyễn Nhật Ánh, Giá: 109000', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (35, CAST(N'2020-12-18T13:35:46.837' AS DateTime), N'0', N'3', N'Log', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (36, CAST(N'2020-12-18T13:36:18.597' AS DateTime), N'Đã thêm sách có tên Nghĩ Giàu & Làm Giàu (Tái Bản 2020) có NXB: NXB Kim Đồng, Thể loại: Tâm Lý - Kĩ Năng Sống, Tác giả: Nguyễn Nhật Ánh, Giá: 85000', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (37, CAST(N'2020-12-18T13:36:18.603' AS DateTime), N'0', N'4', N'Log', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (38, CAST(N'2020-12-18T13:36:20.750' AS DateTime), N'Đã log out ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (39, CAST(N'2020-12-18T14:17:48.707' AS DateTime), N'Đã mua sách với hóa đơn có mã: 2', N'2312312', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (40, CAST(N'2020-12-18T14:18:03.840' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (41, CAST(N'2020-12-18T14:18:44.187' AS DateTime), N'Đã mua sách với hóa đơn có mã: 3', N'2312312', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (42, CAST(N'2020-12-18T14:18:49.253' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (43, CAST(N'2020-12-18T14:19:05.887' AS DateTime), N'Đã log out ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (44, CAST(N'2020-12-18T14:19:40.467' AS DateTime), N'Đã mua sách với hóa đơn có mã: 4', N'21312312', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (45, CAST(N'2020-12-18T14:19:54.460' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (46, CAST(N'2020-12-18T14:23:07.153' AS DateTime), N'Đã mua sách với hóa đơn có mã: 5', N'2312312', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (47, CAST(N'2020-12-18T14:23:16.470' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (48, CAST(N'2020-12-18T14:30:32.307' AS DateTime), N'Đã mua sách với hóa đơn có mã: 6', N'0377524660', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (49, CAST(N'2020-12-18T14:30:37.937' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (50, CAST(N'2020-12-18T14:47:44.153' AS DateTime), N'Đã mua sách với hóa đơn có mã: 7', N'0377524660', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (51, CAST(N'2020-12-18T14:51:24.220' AS DateTime), N'Đã mua sách với hóa đơn có mã: 8', N'0377524660', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (52, CAST(N'2020-12-18T14:53:21.163' AS DateTime), N'Đã mua sách với hóa đơn có mã: 9', N'0377524660', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (53, CAST(N'2020-12-18T14:58:27.283' AS DateTime), N'Đã mua sách với hóa đơn có mã: 10', N'0377524660', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (54, CAST(N'2020-12-18T15:01:23.383' AS DateTime), N'Đã mua sách với hóa đơn có mã: 11', N'0377524660', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (55, CAST(N'2020-12-18T15:09:22.987' AS DateTime), N'Đã mua sách với hóa đơn có mã: 12', N'0377524660', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (56, CAST(N'2020-12-18T15:11:32.517' AS DateTime), N'Đã mua sách với hóa đơn có mã: 13', N'0377524660', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (57, CAST(N'2020-12-18T15:13:29.783' AS DateTime), N'Đã mua sách với hóa đơn có mã: 14', N'0377524660', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (58, CAST(N'2020-12-18T15:17:23.460' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (59, CAST(N'2020-12-18T15:17:49.037' AS DateTime), N'Đã mua sách với hóa đơn có mã: 15', N'0377524660', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (60, CAST(N'2020-12-18T15:19:33.000' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (61, CAST(N'2020-12-18T15:19:56.290' AS DateTime), N'Đã mua sách với hóa đơn có mã: 16', N'0377524660', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (62, CAST(N'2020-12-18T15:36:12.173' AS DateTime), N'Đã đăng nhập ', N'user01', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (63, CAST(N'2020-12-18T15:36:46.693' AS DateTime), N'Đã mua sách với hóa đơn có mã: 17', N'user01', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (64, CAST(N'2020-12-18T15:39:03.900' AS DateTime), N'Đã đăng nhập ', N'user01', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (65, CAST(N'2020-12-18T15:40:09.100' AS DateTime), N'Đã mua sách với hóa đơn có mã: 18', N'user01', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (66, CAST(N'2020-12-18T15:52:38.947' AS DateTime), N'Đã đăng nhập ', N'user01', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (67, CAST(N'2020-12-18T15:55:48.720' AS DateTime), N'Đã đăng nhập ', N'user01', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (68, CAST(N'2020-12-18T15:56:28.797' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (69, CAST(N'2020-12-18T16:04:11.777' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (70, CAST(N'2020-12-18T16:43:46.733' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (71, CAST(N'2020-12-18T17:08:15.893' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (72, CAST(N'2020-12-18T17:12:31.967' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (73, CAST(N'2020-12-18T17:23:26.457' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (1002, CAST(N'2020-12-21T07:56:01.310' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (1003, CAST(N'2020-12-21T08:01:55.740' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (1004, CAST(N'2020-12-21T08:10:11.333' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (1005, CAST(N'2020-12-21T08:11:03.803' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (1006, CAST(N'2020-12-21T08:12:39.690' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (1007, CAST(N'2020-12-21T08:14:07.503' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (1008, CAST(N'2020-12-21T08:16:31.117' AS DateTime), N'Đã log out ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (1009, CAST(N'2020-12-21T08:17:20.877' AS DateTime), N'Đã mua sách với hóa đơn có mã: 1002', N'0377524660', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (1010, CAST(N'2020-12-21T08:18:19.410' AS DateTime), N'Đã đăng nhập ', N'admin', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (1011, CAST(N'2020-12-21T08:44:54.173' AS DateTime), N'Đã đăng nhập ', N'user01', N'Admin', 0)
INSERT [dbo].[Logs] ([MaLog], [ThoiGian], [HanhDong], [TaiKhoan], [TacVu], [flag]) VALUES (1012, CAST(N'2020-12-21T08:52:13.507' AS DateTime), N'Đã đăng nhập ', N'user01', N'Admin', 0)
SET IDENTITY_INSERT [dbo].[Logs] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaXuatBans] ON 

INSERT [dbo].[NhaXuatBans] ([MaNXB], [TenNXB], [flag]) VALUES (1, N'NXB Kim Đồng', 0)
INSERT [dbo].[NhaXuatBans] ([MaNXB], [TenNXB], [flag]) VALUES (2, N'Nhà xuất bản Trẻ', 0)
INSERT [dbo].[NhaXuatBans] ([MaNXB], [TenNXB], [flag]) VALUES (3, N'Nhà xuất bản Tổng hợp thành phố Hồ Chí Minh', 0)
INSERT [dbo].[NhaXuatBans] ([MaNXB], [TenNXB], [flag]) VALUES (4, N'Nhà xuất bản chính trị quốc gia sự thật', 0)
INSERT [dbo].[NhaXuatBans] ([MaNXB], [TenNXB], [flag]) VALUES (5, N'Nhà xuất bản giáo dục', 0)
INSERT [dbo].[NhaXuatBans] ([MaNXB], [TenNXB], [flag]) VALUES (6, N'Nhà xuất bản Hội Nhà văn', 0)
INSERT [dbo].[NhaXuatBans] ([MaNXB], [TenNXB], [flag]) VALUES (7, N'Nhà xuất bản Tư pháp', 0)
SET IDENTITY_INSERT [dbo].[NhaXuatBans] OFF
GO
SET IDENTITY_INSERT [dbo].[Saches] ON 

INSERT [dbo].[Saches] ([MaSach], [TenSach], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe], [MaNXB], [GiaBan], [MaTacGia], [flag], [LuotXem]) VALUES (1, N'Con Chim Xanh Biếc Bay Về - Tặng Kèm 6 Postcard', N'dsadsadasdas', CAST(N'2020-12-18T10:25:59.523' AS DateTime), N'ahamove_logo.png', 5, 1, 1, 112500, 1, 0, 22)
INSERT [dbo].[Saches] ([MaSach], [TenSach], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe], [MaNXB], [GiaBan], [MaTacGia], [flag], [LuotXem]) VALUES (2, N'Nhà Giả Kim (Tái Bản 2020)', N'dffdsfdfsd', CAST(N'2020-12-18T00:00:00.000' AS DateTime), N'biatruoc_daomongmotb23-web.jpg', 7, 1, 1, 67000, 1, 0, 12)
INSERT [dbo].[Saches] ([MaSach], [TenSach], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe], [MaNXB], [GiaBan], [MaTacGia], [flag], [LuotXem]) VALUES (3, N'Những Kẻ Xuất Chúng (Tái Bản 2019)', N'dsadasdas', CAST(N'2020-12-18T13:35:46.817' AS DateTime), N'cam_on_nguoi_lon_bia_mem_xp.jpg', 10, 2, 1, 109000, 1, 0, 11)
INSERT [dbo].[Saches] ([MaSach], [TenSach], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe], [MaNXB], [GiaBan], [MaTacGia], [flag], [LuotXem]) VALUES (4, N'Nghĩ Giàu & Làm Giàu (Tái Bản 2020)', N'dsadasdsa', CAST(N'2020-12-18T13:36:18.600' AS DateTime), N'do-choi-giao-duc-huong-nghiep-cho-tre-em-240x330.jpg', 20, 4, 1, 85000, 1, 0, 6)
SET IDENTITY_INSERT [dbo].[Saches] OFF
GO
SET IDENTITY_INSERT [dbo].[TacGias] ON 

INSERT [dbo].[TacGias] ([MaTacGia], [TenTacGia], [flag]) VALUES (1, N'Nguyễn Nhật Ánh', 0)
INSERT [dbo].[TacGias] ([MaTacGia], [TenTacGia], [flag]) VALUES (2, N'Trang Hạ', 0)
INSERT [dbo].[TacGias] ([MaTacGia], [TenTacGia], [flag]) VALUES (3, N'Nguyễn Phong Việt', 0)
INSERT [dbo].[TacGias] ([MaTacGia], [TenTacGia], [flag]) VALUES (4, N'Anh Khang', 0)
INSERT [dbo].[TacGias] ([MaTacGia], [TenTacGia], [flag]) VALUES (5, N'Nguyễn Ngọc Thạch', 0)
SET IDENTITY_INSERT [dbo].[TacGias] OFF
GO
ALTER TABLE [dbo].[ChiTietHoaDons]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ChiTietHoaDons_dbo.HoaDons_MaDonHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[HoaDons] ([MaDonHang])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDons] CHECK CONSTRAINT [FK_dbo.ChiTietHoaDons_dbo.HoaDons_MaDonHang]
GO
ALTER TABLE [dbo].[ChiTietHoaDons]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ChiTietHoaDons_dbo.Saches_MaSach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[Saches] ([MaSach])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDons] CHECK CONSTRAINT [FK_dbo.ChiTietHoaDons_dbo.Saches_MaSach]
GO
ALTER TABLE [dbo].[HoaDons]  WITH CHECK ADD  CONSTRAINT [FK_dbo.HoaDons_dbo.KhachHangs_MaKH] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHangs] ([MaKH])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDons] CHECK CONSTRAINT [FK_dbo.HoaDons_dbo.KhachHangs_MaKH]
GO
ALTER TABLE [dbo].[Saches]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Saches_dbo.ChuDes_MaChuDe] FOREIGN KEY([MaChuDe])
REFERENCES [dbo].[ChuDes] ([MaChuDe])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Saches] CHECK CONSTRAINT [FK_dbo.Saches_dbo.ChuDes_MaChuDe]
GO
ALTER TABLE [dbo].[Saches]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Saches_dbo.NhaXuatBans_MaNXB] FOREIGN KEY([MaNXB])
REFERENCES [dbo].[NhaXuatBans] ([MaNXB])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Saches] CHECK CONSTRAINT [FK_dbo.Saches_dbo.NhaXuatBans_MaNXB]
GO
ALTER TABLE [dbo].[Saches]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Saches_dbo.TacGias_MaTacGia] FOREIGN KEY([MaTacGia])
REFERENCES [dbo].[TacGias] ([MaTacGia])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Saches] CHECK CONSTRAINT [FK_dbo.Saches_dbo.TacGias_MaTacGia]
GO
