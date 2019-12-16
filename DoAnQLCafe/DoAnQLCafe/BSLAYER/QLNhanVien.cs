using DevExpress.XtraEditors;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnQLCafe.BSLAYER
{
    public class QLNhanVien
    {
        CafeEntities cf = new CafeEntities();
        public DataTable LayNhanVien()
        {
            var nv = from p in cf.NHANVIENs
                     select p;
            DataTable dt = new DataTable();
            dt.Columns.Add("Mã NV");
            dt.Columns.Add("Họ Tên");
            dt.Columns.Add("Phái");
            dt.Columns.Add("Ngày Sinh");
            dt.Columns.Add("Địa Chỉ");
            dt.Columns.Add("SĐT");
            dt.Columns.Add("Ngày Vào Làm");
            dt.Columns.Add("Lương CB");
            foreach (var nv1 in nv)
            {
                dt.Rows.Add(nv1.MANHANVIEN.Trim(), nv1.HOTEN.Trim(), nv1.PHAI.Trim(), nv1.NGAYSINH.ToString().Substring(0, 10), nv1.DIACHI.Trim(), nv1.SDT.Trim(), nv1.NGAYVAOLAM.ToString().Substring(0, 10), nv1.LUONGCOBAN.ToString());
            }
            return dt;
        }
        public void XoaNV(string Manv)
        {
            CafeEntities cafe = new CafeEntities();
            NHANVIEN nv = new NHANVIEN();
            nv.MANHANVIEN = Manv;
            cafe.NHANVIENs.Attach(nv);
            cafe.NHANVIENs.Remove(nv);
            cafe.SaveChanges();
        }
        public void ThemNV(string MNV, string HT, string PH, DateTime NS, string DC, string SDT, DateTime NVL, string LCB)
        {
            CafeEntities cf = new CafeEntities();
            NHANVIEN nv = new NHANVIEN();
            nv.MANHANVIEN = MNV;
            nv.HOTEN = HT;
            nv.PHAI = PH;
            nv.NGAYSINH = NS;
            nv.DIACHI = DC;
            nv.SDT = SDT;
            nv.NGAYVAOLAM = NVL;
            nv.LUONGCOBAN = int.Parse(LCB);
            cf.NHANVIENs.Add(nv);
            cf.SaveChanges();
        }
        public void SuaNV(string MNV, string HT, string PH, DateTime NS, string DC, string SDT, DateTime NVL, string LCB)
        {
            CafeEntities snv = new CafeEntities();
            //var nv = (from a in snv.NHANVIENs where a.MANHANVIEN == MNV select a).SingleOrDefault();
            var nv1 = cf.NHANVIENs.Where(p => p.MANHANVIEN.Equals(MNV)).SingleOrDefault();
            if (nv1 != null)
            {
                nv1.HOTEN = HT;
                nv1.PHAI = PH;
                nv1.NGAYSINH = NS;
                nv1.DIACHI = DC;
                nv1.SDT = SDT;
                nv1.NGAYVAOLAM = NVL;
                nv1.LUONGCOBAN = int.Parse(LCB);
                snv.SaveChanges();
            }
        }
        public void LayLuong(LabelControl lbCa, LabelControl lbLuong, string manv, int Luongcb)
        {
            DateTime day = System.DateTime.Now;
            int tien = 0;
            CafeEntities nh = new CafeEntities();
            var ds = (from p in nh.NHANVIENs
                      join q in nh.CHAMCONGs on p.MANHANVIEN equals q.MANHANVIEN
                      where p.MANHANVIEN == manv && q.NGAYLAM.Month == day.Month && q.NGAYLAM.Year == day.Year
                      select new
                      {
                          p.MANHANVIEN
                      }).ToList();
            lbCa.Text = "Tổng Ca Tháng " + day.Month + ": " + ds.Count().ToString() + " Ca";
            tien = ds.Count() * Luongcb;
            lbLuong.Text = "Tổng Lương: " + string.Format(new CultureInfo("vi-VN"), "{0:#,##0} VNĐ", tien);
        }
    }
}
