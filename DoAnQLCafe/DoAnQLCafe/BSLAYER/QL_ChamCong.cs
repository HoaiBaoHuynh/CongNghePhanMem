using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoAnQLCafe.BSLAYER
{
    public class QL_ChamCong
    {
        CafeEntities cf = new CafeEntities();
        public List<NHANVIEN> LayNhanVien()
        {
            return cf.NHANVIENs.Select(p => p).ToList<NHANVIEN>();
            //var nvs =
            //from p in cf.NHANVIENs
            //select p;
            //DataTable dt = new DataTable();
            //foreach (var p in nvs)
            //{
            //    dt.Rows.Add(p.MANHANVIEN.Trim(), p.HOTEN.Trim(), p.NGAYSINH.ToString().Substring(0, 10));
            //}
            //return dt;
        }
        public DataTable LayTTChamCong()
        {
            var nvs = (from p in cf.CHAMCONGs
                       join q in cf.NHANVIENs on p.MANHANVIEN equals q.MANHANVIEN
                       select new
                       {
                           q.MANHANVIEN,
                           q.HOTEN,
                           p.NGAYLAM,
                           p.CA,
                           q.LUONGCOBAN
                       }).ToList();
            DataTable dt = new DataTable();
            dt.Columns.Add("Mã");
            dt.Columns.Add("Họ Tên");
            dt.Columns.Add("Ngày Làm");
            dt.Columns.Add("Ca");
            dt.Columns.Add("Lương Cơ Bản");
            foreach (var p in nvs)
            {
                dt.Rows.Add(p.MANHANVIEN.Trim(), p.HOTEN.Trim(), p.NGAYLAM.ToString().Substring(0,10), p.CA,p.LUONGCOBAN.ToString());
            }
            return dt;
        }
        //Lay thong tin cham cong theo manv và ngay
        public DataTable LayTTChamCongNV(string manv, DateTime ngaybd, DateTime ngaykt)
        {
            var nvs = (from p in cf.CHAMCONGs
                       join q in cf.NHANVIENs on p.MANHANVIEN equals q.MANHANVIEN
                       where p.NGAYLAM >= ngaybd && p.NGAYLAM <= ngaykt && p.MANHANVIEN == manv 
                       select new
                       {
                           q.MANHANVIEN,
                           q.HOTEN,
                           p.NGAYLAM,
                           p.CA,
                           q.LUONGCOBAN
                       }).ToList();
            DataTable dt = new DataTable();
            dt.Columns.Add("Mã");
            dt.Columns.Add("Họ Tên");
            dt.Columns.Add("Ngày Làm");
            dt.Columns.Add("Ca");
            dt.Columns.Add("Lương Cơ Bản");
            foreach (var p in nvs)
            {
                dt.Rows.Add(p.MANHANVIEN.Trim(), p.HOTEN.Trim(), p.NGAYLAM.ToString().Substring(0, 10), p.CA, p.LUONGCOBAN.ToString());
            }
            return dt;
        }
        public void XoaChamCong(string MaNV, DateTime NgayLam, string Ca)
        {
            CHAMCONG cc = new CHAMCONG();
            cc.MANHANVIEN = MaNV;
            cc.NGAYLAM = NgayLam;
            cc.CA = Ca;
            cf.CHAMCONGs.Attach(cc);
            cf.CHAMCONGs.Remove(cc);
            cf.SaveChanges();
        }
        public void ThemChamCong(string MaNV, string NgayLam, string Ca)
        {
            CHAMCONG cc = new CHAMCONG();
            cc.MANHANVIEN = MaNV;
            cc.NGAYLAM = DateTime.Parse(NgayLam);
            cc.CA = Ca;
            cf.CHAMCONGs.Add(cc);
            cf.SaveChanges();
        }
    }
}
