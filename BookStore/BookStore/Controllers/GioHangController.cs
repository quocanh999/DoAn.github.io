using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BookStore.Models;
using BookStore.Utilities;
using ShopManagement.Models;

namespace BookStore.Controllers
{
    public class GioHangController : Controller
    {
        // GET: GioHang
        static BookContext db = new BookContext();
        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")]
        public ActionResult Index()
        {

            var db = new BookContext();
            var tk = Session["KhachHang"] as KhachHang;
            //var hd = db.HoaDon.Where(i => i.DaThanhToan == false && i.MaKH == tk.MaKH).FirstOrDefault();
            //if (hd != null)
            //{
            //    Session["ListCTHD"] = db.ChiTietHoaDon.Where(i => i.MaDonHang == hd.MaDonHang).ToList();
            //}
            return View();
        }
        public ActionResult Remove(long? id)
        {
            List<Item> cart = (List<Item>)Session["cart"];
            int index = isExist(id);
            cart.RemoveAt(index);
            Session["cart"] = cart;

            return RedirectToAction("Index");
        }

        public ActionResult UpdateCart(long? id, int quantity)
        {
            List<Item> cart = (List<Item>)Session["cart"];
            int index = isExist(id);
            cart[index].Quantity = quantity;
            Session["cart"] = cart;

            return RedirectToAction("Index");
        }
        private int isExist(long? id)
        {
            List<Item> cart = (List<Item>)Session["cart"];
            for (int i = 0; i < cart.Count; i++)
            {
                if (cart[i].sach.MaSach == id)
                {
                    return i;
                }
            }
            return -1;
        }
        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")]
        public ActionResult DeleteCTHD(int idCTHD)
        {
            if (Session["KhachHang"] == null)
            {
                return View("../DangNhap/Index");
            }
            else
            {
                var db = new BookContext();
                int maHD = db.ChiTietHoaDon.Find(idCTHD).MaDonHang;
                db.ChiTietHoaDon.Remove(db.ChiTietHoaDon.Find(idCTHD));
                db.SaveChanges();
                if (db.ChiTietHoaDon.Where(i => i.MaDonHang == maHD).Count() == 0)
                {
                    db.HoaDon.Remove(db.HoaDon.Find(maHD));
                    db.SaveChanges();
                }
                Session["ListCTHD"] = db.ChiTietHoaDon.Where(i => i.MaDonHang == maHD).ToList();
                ViewBag.Err = "Delete successfully";
                return View("Index");
            }
        }
        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")]
        [HttpPost]
        public ActionResult CapNhat(int idcthd, int sl)
        {
            if (Session["KhachHang"] == null)
            {
                return View("../DangNhap/Index");
            }
            else
            {
                if (sl <= 0)
                {
                    ViewBag.Err = "Quantity must not be 0";
                    return View("Index");
                }
                else
                {
                    var db = new BookContext();
                    var cthd = db.ChiTietHoaDon.Find(idcthd);
                    if (sl > db.Sach.Find(cthd.MaSach).SoLuongTon)
                    {
                        ViewBag.Err = "In-stock is not enough for your demand";
                        return View("Index");
                    }
                    else
                    {
                        cthd.SoLuong = sl;
                        cthd.ThanhTien = cthd.SoLuong * db.Sach.Find(cthd.MaSach).GiaBan;
                        db.SaveChanges();
                        ViewBag.Err = "Update successfully";
                        return RedirectToAction("Index", "GioHang");
                    }
                }
            }
        }

        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")]
        public ActionResult XoaSach(int id)
        {
            KhachHang kh = new KhachHang();
            kh = Session["KhachHang"] as KhachHang;
            if (kh == null)
            {
                return RedirectToAction("Index", "DangNhap");
            }
            else
            {
                ChiTietHoaDon cthd = db.ChiTietHoaDon.Find(id);
                int mahd = cthd.MaDonHang;
                db.ChiTietHoaDon.Remove(cthd);
                db.SaveChanges();

                HoaDon hd = db.HoaDon.Where(i => i.DaThanhToan == false && i.MaKH == kh.MaKH).FirstOrDefault();
                HoaDon temp = db.HoaDon.Find(mahd);
                temp.TongTien = 0;
                foreach (var item in db.ChiTietHoaDon.Where(i => i.MaDonHang == temp.MaDonHang && i.flag == false).ToList())
                {
                    temp.TongTien += item.ThanhTien;
                }
                db.SaveChanges();

                Dem(kh);
                return RedirectToAction("Index", "GioHang");

            }
        }
        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")]
        public void Dem(KhachHang kh)
        {
            HoaDon hd = db.HoaDon.Where(i => i.DaThanhToan == false && i.MaKH == kh.MaKH).FirstOrDefault();
            int soluong = 0;
            foreach (var item in db.ChiTietHoaDon.Where(i => i.flag == false && i.MaDonHang == hd.MaDonHang).ToList())
            {
                soluong += item.SoLuong;
            }
            Session["SL"] = soluong;
        }
        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")]
        public ActionResult CapNhat(string sl, string name)
        {
            KhachHang kh = new KhachHang();
            kh = Session["KhachHang"] as KhachHang;
            if (kh == null)
            {
                return RedirectToAction("Index", "DangNhap");
            }
            else
            {
                if (string.IsNullOrEmpty(sl) == true || string.IsNullOrWhiteSpace(sl) == true)
                {
                    return RedirectToAction("Index", "GioHang");
                }
                else
                {
                    int soluong = Convert.ToInt32(sl);
                    int macthd = Convert.ToInt32(name);
                    int maSach = db.ChiTietHoaDon.Find(macthd).MaSach;


                    if (soluong == 0)
                    {
                        ChiTietHoaDon cthd = db.ChiTietHoaDon.Find(macthd);
                        int madh = cthd.MaDonHang;
                        db.ChiTietHoaDon.Remove(cthd);
                        db.SaveChanges();

                        HoaDon hd = db.HoaDon.Find(madh);
                        hd.TongTien = 0;
                        foreach (var item in db.ChiTietHoaDon.Where(i => i.flag == false && i.MaDonHang == hd.MaDonHang).ToList())
                        {
                            hd.TongTien += item.ThanhTien;
                        }
                        db.SaveChanges();
                        Dem(kh);
                        return RedirectToAction("Index", "GioHang");
                    }


                    if (soluong > db.Sach.Find(maSach).SoLuongTon)
                    {
                        ViewBag.Err = "In-stock is not enough for your demand";
                        return View("Index");
                    }
                    else
                    {
                        ChiTietHoaDon cthd = db.ChiTietHoaDon.Find(macthd);
                        int madh = cthd.MaDonHang;
                        cthd.SoLuong = soluong;
                        cthd.ThanhTien = cthd.SoLuong * db.Sach.Find(maSach).GiaBan;
                        db.SaveChanges();
                        HoaDon hd = db.HoaDon.Find(madh);
                        hd.TongTien = 0;
                        foreach (var item in db.ChiTietHoaDon.Where(i => i.flag == false && i.MaDonHang == hd.MaDonHang).ToList())
                        {
                            hd.TongTien += item.ThanhTien;
                        }
                        db.SaveChanges();
                        Dem(kh);
                        return RedirectToAction("Index", "GioHang");
                    }
                }
            }

        }
        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")]
        public ActionResult Clear()
        {
            KhachHang kh = Session["KhachHang"] as BookStore.Models.KhachHang;
            HoaDon hd = Session["HDGH"] as HoaDon;
            if (hd != null)
            {
                foreach (var item in db.ChiTietHoaDon.Where(i => i.MaDonHang == hd.MaDonHang && i.flag == false).ToList())
                {
                    db.ChiTietHoaDon.Remove(db.ChiTietHoaDon.Find(item.MaCTDH));
                    db.SaveChanges();
                }
                hd = db.HoaDon.Find(hd.MaDonHang);
                db.HoaDon.Remove(hd);
                db.SaveChanges();
            }
            hd = db.HoaDon.Where(i => i.DaThanhToan == false && i.MaKH == kh.MaKH).FirstOrDefault();
            Session["HDGH"] = hd;
            if (hd != null)
            {
                Session["ListCTHD"] = db.ChiTietHoaDon.Where(i => i.MaDonHang == hd.MaDonHang && i.flag == false).ToList();
            }
            else
            {
                Session["ListCTHD"] = null;
            }
            Session["SL"] = 0;
            return RedirectToAction("Index", "GioHang");
        }
        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")]
        public ActionResult ThanhToanOne(int id)
        {
            KhachHang kh = new KhachHang();
            kh = Session["KhachHang"] as KhachHang;
            if (kh == null)
            {
                return RedirectToAction("Index", "DangNhap");
            }
            else
            {
                Session["HDLe"] = db.ChiTietHoaDon.Find(id);
                Session["HDGH"] = null;
                return RedirectToAction("ThanhToan", "GioHang");
            }
        }
        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")]
        public ActionResult ThanhToan()
        {
            KhachHang kh = new KhachHang();
            kh = Session["KhachHang"] as KhachHang;
            ViewBag.DiaChi = "";
            ViewBag.SDT = "";
            ViewBag.TenNguoiNhan = "";
            if (kh != null)
            {
                HoaDon hoaDon = db.HoaDon.OrderByDescending(a => a.NgayTao).FirstOrDefault();
                if (hoaDon != null)
                {
                    ViewBag.DiaChi = hoaDon.DiaChi;
                    ViewBag.SDT = hoaDon.SDT;
                    ViewBag.TenNguoiNhan = kh.HoTen;
                }
               
            }
        

            return View("ThanhToan");
        }
        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")]
        public ActionResult Success(string diachi, string sdt, string vnp_ResponseCode, int vnp_OrderInfo)
        {
            if (vnp_ResponseCode == "00")
            {
                HoaDon hd = db.HoaDon.Find(vnp_OrderInfo);
                hd.TrangThai = 2;
                db.Entry(hd).State = EntityState.Modified;
                db.SaveChanges();
                ViewBag.Message = "Chức mừng bạn đã đặt hàng và Thanh Toán Thành công";
            }
            else
            {
                ViewBag.Message = "Chức mừng bạn Đã Đặt hàng thành công";
            }
            return View();
        }

        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")]
        [HttpPost]
        public ActionResult ThanhToan(string name, string diachi, string sdt)
        {
            sdt = sdt.Trim();
            var db = new BookContext();
            var kh = Session["KhachHang"] as KhachHang;
            var lstItem = Session["cart"] as List<Item>;
            // insert khach hang
            if (kh == null)
            {

                KhachHang khachHang = db.KhachHang.Where(item => item.TaiKhoan.Equals(sdt)).FirstOrDefault();
                if (khachHang == null)
                {
                    kh = new KhachHang();
                    kh.HoTen = name;
                    kh.NgaySinh = DateTime.Now;
                    kh.TaiKhoan = sdt.Trim();
                    kh.MatKhau = "123456";
                    kh.LoaiKH = "Khách Hàng";
                    kh.flag = false;
                    db.KhachHang.Add(kh);
                    db.SaveChanges();
                }
                else
                {
                    kh = khachHang;
                }

            }

            // insert hoa don
            HoaDon hd = new HoaDon();
            hd.NgayTao = DateTime.Now;
            hd.DaThanhToan = false;
            hd.MaKH = kh.MaKH;
            hd.TongTien = lstItem.Sum(item => item.Quantity * item.sach.GiaBan);
            hd.SDT = sdt;
            hd.DiaChi = diachi;
            hd.flag = false;
            hd.DaGiaoHang = false;
            hd.TrangThai = 1;
            db.HoaDon.Add(hd);
            db.SaveChanges();
            foreach (Item item in lstItem)
            {
                ChiTietHoaDon cthd = new ChiTietHoaDon();
                cthd.MaDonHang = hd.MaDonHang;
                cthd.MaSach = item.sach.MaSach;
                cthd.SoLuong = item.Quantity;
                cthd.ThanhTien = item.sach.GiaBan * item.Quantity;
                cthd.flag = false;
                db.ChiTietHoaDon.Add(cthd);
            }
            // insert log
            Log log = new Log();
            log.flag = false;
            log.ThoiGian = DateTime.Now;
            log.TaiKhoan = kh.TaiKhoan;
            log.TacVu = "Admin";
            log.HanhDong = "Đã mua sách với hóa đơn có mã: " + hd.MaDonHang;
            db.Log.Add(log);

            db.SaveChanges();
            //Get Config Info
            string vnp_Returnurl = ConfigurationManager.AppSettings["vnp_Returnurl"]; //URL nhan ket qua tra ve 
            string vnp_Url = ConfigurationManager.AppSettings["vnp_Url"]; //URL thanh toan cua VNPAY 
            string vnp_TmnCode = ConfigurationManager.AppSettings["vnp_TmnCode"]; //Ma website
            string vnp_HashSecret = ConfigurationManager.AppSettings["vnp_HashSecret"]; //Chuoi bi mat

            //Get payment input
            OrderInfo orderInfo = new OrderInfo();
            //Save order to db
            orderInfo.OrderId = hd.MaDonHang;
            orderInfo.Amount = Convert.ToDecimal(hd.TongTien);
            orderInfo.OrderDescription = hd.DiaChi;
            orderInfo.CreatedDate = DateTime.Now;

            //Build URL for VNPAY
            VnPayLibrary vnpay = new VnPayLibrary();

            vnpay.AddRequestData("vnp_Version", "2.0.0");
            vnpay.AddRequestData("vnp_Command", "pay");
            vnpay.AddRequestData("vnp_TmnCode", vnp_TmnCode);

            string locale = "vn";
            if (!string.IsNullOrEmpty(locale))
            {
                vnpay.AddRequestData("vnp_Locale", locale);
            }
            else
            {
                vnpay.AddRequestData("vnp_Locale", "vn");
            }

            vnpay.AddRequestData("vnp_CurrCode", "VND");
            vnpay.AddRequestData("vnp_TxnRef", orderInfo.OrderId.ToString());
            vnpay.AddRequestData("vnp_OrderId", hd.MaDonHang.ToString());
            vnpay.AddRequestData("vnp_OrderInfo", hd.MaDonHang.ToString());
            vnpay.AddRequestData("vnp_OrderType", "other"); //default value: other
            vnpay.AddRequestData("vnp_Amount", Math.Round(orderInfo.Amount * 100).ToString());
            vnpay.AddRequestData("vnp_ReturnUrl", vnp_Returnurl);
            vnpay.AddRequestData("vnp_IpAddr", Utils.GetIpAddress());
            vnpay.AddRequestData("vnp_CreateDate", orderInfo.CreatedDate.ToString("yyyyMMddHHmmss"));

            //if (bank.SelectedItem != null && !string.IsNullOrEmpty(bank.SelectedItem.Value))
            //{
            vnpay.AddRequestData("vnp_BankCode", "NCB");
            //}

            string paymentUrl = vnpay.CreateRequestUrl(vnp_Url, vnp_HashSecret);
            Debug.WriteLine("VNPAY URL: {0}", paymentUrl);
            Session["cart"] = new List<Item>();
            return Redirect(paymentUrl);
            //return RedirectToAction("Success");

        }

        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")]
        public ActionResult ThanhToanOnline(int maDH)
        {
            HoaDon hd = db.HoaDon.Find(maDH);
            //Get Config Info
            string vnp_Returnurl = ConfigurationManager.AppSettings["vnp_Returnurl"]; //URL nhan ket qua tra ve 
            string vnp_Url = ConfigurationManager.AppSettings["vnp_Url"]; //URL thanh toan cua VNPAY 
            string vnp_TmnCode = ConfigurationManager.AppSettings["vnp_TmnCode"]; //Ma website
            string vnp_HashSecret = ConfigurationManager.AppSettings["vnp_HashSecret"]; //Chuoi bi mat

            //Get payment input
            OrderInfo orderInfo = new OrderInfo();
            //Save order to db
            orderInfo.OrderId = hd.MaDonHang;
            orderInfo.Amount = Convert.ToDecimal(hd.TongTien);
            orderInfo.OrderDescription = hd.DiaChi;
            orderInfo.CreatedDate = DateTime.Now;

            //Build URL for VNPAY
            VnPayLibrary vnpay = new VnPayLibrary();

            vnpay.AddRequestData("vnp_Version", "2.0.0");
            vnpay.AddRequestData("vnp_Command", "pay");
            vnpay.AddRequestData("vnp_TmnCode", vnp_TmnCode);

            string locale = "vn";
            if (!string.IsNullOrEmpty(locale))
            {
                vnpay.AddRequestData("vnp_Locale", locale);
            }
            else
            {
                vnpay.AddRequestData("vnp_Locale", "vn");
            }

            vnpay.AddRequestData("vnp_CurrCode", "VND");
            vnpay.AddRequestData("vnp_TxnRef", orderInfo.OrderId.ToString());
            vnpay.AddRequestData("vnp_OrderId", hd.MaDonHang.ToString());
            vnpay.AddRequestData("vnp_OrderInfo", hd.MaDonHang.ToString());
            vnpay.AddRequestData("vnp_OrderType", "other"); //default value: other
            vnpay.AddRequestData("vnp_Amount", Math.Round(orderInfo.Amount * 100).ToString());
            vnpay.AddRequestData("vnp_ReturnUrl", vnp_Returnurl);
            vnpay.AddRequestData("vnp_IpAddr", Utils.GetIpAddress());
            vnpay.AddRequestData("vnp_CreateDate", orderInfo.CreatedDate.ToString("yyyyMMddHHmmss"));

            //if (bank.SelectedItem != null && !string.IsNullOrEmpty(bank.SelectedItem.Value))
            //{
            vnpay.AddRequestData("vnp_BankCode", "NCB");
            //}

            string paymentUrl = vnpay.CreateRequestUrl(vnp_Url, vnp_HashSecret);
            Debug.WriteLine("VNPAY URL: {0}", paymentUrl);
            Session["cart"] = new List<Item>();
            return Redirect(paymentUrl);
            //return RedirectToAction("Success");

        }
    }
}






































//public ActionResult ThemSach(int id,int soluong)
//{
//    if (Session["KhachHangId"] == null)
//    {
//        return RedirectToAction("Index", "DangNhap");
//    }




//    //Duy Ngô's code
//    Sach sach = db.Sach.Where(i => i.MaSach == id).FirstOrDefault();
//    sach.SoLuongTon = soluong;
//    listCTHD.Add(sach);
//    Session["ListCTHD"] = listCTHD;
//    return Redirect(Request.UrlReferrer.ToString());















//    //if (tmp.Count == 0)
//    //{
//    //    HoaDon newHd = new HoaDon();
//    //    newHd.NgayTao = DateTime.Now;
//    //    newHd.SDT = "0000000000";
//    //    newHd.DiaChi = "..........";
//    //    newHd.MaKH = int.Parse(Session["KhachHangId"].ToString());
//    //    newHd.TongTien = 0;
//    //    newHd.DaThanhToan = false;
//    //    db.HoaDon.Add(newHd);
//    //    db.SaveChanges();
//    //    hd = newHd;

//    //    ChiTietHoaDon ct = new ChiTietHoaDon()
//    //    {
//    //        MaDonHang = hd.MaDonHang,
//    //        MaSach = id,
//    //        SoLuong = 1,
//    //        ThanhTien = db.Sach.Find(id).GiaBan
//    //    };
//    //    db.ChiTietHoaDon.Add(ct);
//    //    db.SaveChanges();
//    //    return Redirect(Request.UrlReferrer.ToString());

//    //}
//    //else
//    //{
//    //    hd = db.HoaDon.Where(x => x.DaThanhToan == false).OrderByDescending(x => x.NgayTao).FirstOrDefault();
//    //    var listHDCT = db.ChiTietHoaDon.Where(x => x.MaDonHang == hd.MaDonHang).ToList();
//    //    if (listHDCT.Count == 0)
//    //    {
//    //        ChiTietHoaDon ct = new ChiTietHoaDon()
//    //        {
//    //            MaDonHang = hd.MaDonHang,
//    //            MaSach = id,
//    //            SoLuong = 1,
//    //            ThanhTien = db.Sach.Find(id).GiaBan
//    //        };
//    //        db.ChiTietHoaDon.Add(ct);
//    //        db.SaveChanges();
//    //        return Redirect(Request.UrlReferrer.ToString());

//    //    }
//    //    else
//    //    {
//    //        bool flag = false;
//    //        foreach (var item in listHDCT)
//    //        {
//    //            if (item.MaSach == id)
//    //            {
//    //                db.ChiTietHoaDon.Find(item.MaCTDH).SoLuong += 1;
//    //                db.ChiTietHoaDon.Find(item.MaCTDH).ThanhTien += db.Sach.Find(id).GiaBan;
//    //                db.SaveChanges();
//    //                flag = true;
//    //                break;
//    //            }
//    //        }
//    //        if (flag == false)
//    //        {
//    //            ChiTietHoaDon ct = new ChiTietHoaDon()
//    //            {
//    //                MaDonHang = hd.MaDonHang,
//    //                MaSach = id,
//    //                SoLuong = 1,
//    //                ThanhTien = db.Sach.Find(id).GiaBan
//    //            };
//    //            db.ChiTietHoaDon.Add(ct);
//    //            db.SaveChanges();
//    //        }
//    //        return Redirect(Request.UrlReferrer.ToString());

//    //    }
//    //}
//}

//[HttpPost]
//public ActionResult ThemSach(int id, int soluong)
//{
//    if (Session["KhachHangId"] == null)
//    {
//        return RedirectToAction("Index", "DangNhap");
//    }
//    if (tmp.Count == 0)
//    {
//        HoaDon newHd = new HoaDon();
//        newHd.NgayTao = DateTime.Now;
//        newHd.SDT = "0000000000";
//        newHd.DiaChi = "..........";
//        newHd.MaKH = int.Parse(Session["KhachHangId"].ToString());
//        newHd.TongTien = 0;
//        newHd.DaThanhToan = false;
//        db.HoaDon.Add(newHd);
//        db.SaveChanges();
//        hd = newHd;

//        ChiTietHoaDon ct = new ChiTietHoaDon()
//        {
//            MaDonHang = hd.MaDonHang,
//            MaSach = id,
//            SoLuong = soluong,
//            ThanhTien = db.Sach.Find(id).GiaBan
//        };
//        db.ChiTietHoaDon.Add(ct);
//        db.SaveChanges();
//        return Redirect(Request.UrlReferrer.ToString());

//    }
//    else
//    {
//        hd = db.HoaDon.Where(x => x.DaThanhToan == false).OrderByDescending(x => x.NgayTao).FirstOrDefault();
//        var listHDCT = db.ChiTietHoaDon.Where(x => x.MaDonHang == hd.MaDonHang).ToList();
//        if (listHDCT.Count == 0)
//        {
//            ChiTietHoaDon ct = new ChiTietHoaDon()
//            {
//                MaDonHang = hd.MaDonHang,
//                MaSach = id,
//                SoLuong = soluong,
//                ThanhTien = db.Sach.Find(id).GiaBan
//            };
//            db.ChiTietHoaDon.Add(ct);
//            db.SaveChanges();
//            return Redirect(Request.UrlReferrer.ToString());

//        }
//        else
//        {
//            bool flag = false;
//            foreach (var item in listHDCT)
//            {
//                if (item.MaSach == id)
//                {
//                    db.ChiTietHoaDon.Find(item.MaCTDH).SoLuong += soluong;
//                    db.ChiTietHoaDon.Find(item.MaCTDH).ThanhTien += db.Sach.Find(id).GiaBan;
//                    db.SaveChanges();
//                    flag = true;
//                    break;
//                }
//            }
//            if (flag == false)
//            {
//                ChiTietHoaDon ct = new ChiTietHoaDon()
//                {
//                    MaDonHang = hd.MaDonHang,
//                    MaSach = id,
//                    SoLuong = 1,
//                    ThanhTien = db.Sach.Find(id).GiaBan
//                };
//                db.ChiTietHoaDon.Add(ct);
//                db.SaveChanges();
//            }
//            return Redirect(Request.UrlReferrer.ToString());

//        }
//    }
//}
//public ActionResult XoaSach(int id)
//{
//    db.ChiTietHoaDon.Remove(db.ChiTietHoaDon.Find(id));
//    db.SaveChanges();
//    return Redirect(Request.UrlReferrer.ToString());
//}
//public ActionResult Clear()
//{
//    foreach (var item in db.ChiTietHoaDon.Where(x => x.MaDonHang == hd.MaDonHang))
//    {
//        db.ChiTietHoaDon.Remove(item);
//    }
//    db.SaveChanges();
//    db.Dispose();
//    return Redirect(Request.UrlReferrer.ToString());
//}

//public ActionResult ThanhToan()
//{
//    return View();
//}
//[HttpPost]
//public ActionResult ThanhToan(string sdt, string diachi)
//{
//    double tongtien = new double();
//    foreach (var item in db.ChiTietHoaDon.Where(x => x.MaDonHang == hd.MaDonHang).ToList())
//    {
//        tongtien += item.ThanhTien;
//    }

//    hd.DiaChi = diachi;
//    hd.SDT = sdt;
//    hd.DaThanhToan = true;
//    hd.TongTien = tongtien;
//    db.SaveChanges();
//    hd = null;
//    return RedirectToAction("Index", "Home");
//}
