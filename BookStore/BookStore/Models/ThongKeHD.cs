using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BookStore.Models
{
    public class ThongKeHD
    {
        public String Month { get; set; }
        public String Year { get; set; }
        public double TongTien { get; set; }
        public int SoLuongBill { get; set; }
    }
}