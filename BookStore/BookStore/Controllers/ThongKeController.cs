using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BookStore.Models;

namespace BookStore.Controllers
{
    public class ThongKeController : Controller
    {
        // GET: ThongKe
        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")]
        public ActionResult Index()
        {
            using (var db = new BookContext())
            {
                KhachHang kh = new KhachHang();
                kh = Session["KhachHang"] as KhachHang;
                if (kh == null)
                {
                    return RedirectToAction("Index", "DangNhap");
                }
                else if (kh.LoaiKH == "Khách Hàng")
                {
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    string sql = "SELECT CAST(YEAR(NgayTao) AS VARCHAR(4)) as Year,CAST(MONTH(NgayTao) AS VARCHAR(2)) AS Month, COUNT(*) SoLuongBill, SUM(TongTien) TongTien ";
                    sql += "FROM HoaDons ";
                    sql += "WHERE TrangThai = 4 ";
                    sql += "GROUP BY CAST(YEAR(NgayTao) AS VARCHAR(4)) ,CAST(MONTH(NgayTao) AS VARCHAR(2)) ";
                    var thongKeHDs = db.Database.SqlQuery<ThongKeHD>(sql).ToList();
                    return View(thongKeHDs);
                }
            }
        }

        // GET: ThongKe
        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")]
        public ActionResult Detail(string year, string month)
        {
            using (var db = new BookContext())
            {
                int y = Int32.Parse(year);
                int m = Int32.Parse(month);
                Session["ListHD"] = db.HoaDon.Where(cond => cond.NgayTao.Year == y && cond.NgayTao.Month == m && cond.TrangThai == 4)
                    .OrderByDescending(i => i.NgayTao).ToList();
                return View("../HoaDon/Index");
            }
        }
        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")]
        [HttpPost]
        public ActionResult Xem(ThongKeHD tk)
        {
            using (var db = new BookContext())
            {
                return null;
                //List<HoaDon> listHD = new List<HoaDon>();
                //listHD = db.HoaDon.Where(i => i.NgayTao.Year == tk.Year).ToList();
                //if (listHD.Count() == 0)
                //{
                    
                //    return RedirectToAction("Index", "ThongKe");
                //}
                //else
                //{
                //    double Tong = 0;
                //    List<ThongKeHD> listTK = new List<ThongKeHD>();
                //    int month = 1;
                //    while (month <= 12)
                //    {
                //        ThongKeHD hd = new ThongKeHD();
                //        hd.Year = tk.Year;
                //        hd.Month = month;
                //        hd.SoLuongBill = listHD.Where(i => i.NgayTao.Month == month).Count();
                //        foreach (var item in listHD.Where(i => i.NgayTao.Month == month).ToList())
                //        {
                //            hd.TongTien += item.TongTien;
                //        }
                //        Tong = Tong + hd.TongTien;
                //        listTK.Add(hd);
                //        month++;
                //    }
                //    ViewBag.Tong = Tong;
                //    Session["ThongKe"] = listTK;
                //    return View("Index");
                //}
            }
        }
    }
}