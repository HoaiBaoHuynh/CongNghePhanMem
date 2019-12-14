using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data;
using DevExpress.XtraEditors;

namespace DoAnQLCafe.BSLAYER
{
    class BLLoaiMon
    {
        
        public void LayLoaiMon(DataGridView dtgvLM)
        {
            CafeEntities nh = new CafeEntities();
            var LM = (from p in nh.LOAIMONs
                      select new
                      {
                          p.MALOAIMON,
                          p.TENLOAIMON
                      }).ToList();

            DataTable dt = new DataTable();
            dt.Columns.Add("Mã Loại Món");
            dt.Columns.Add("Tên Loại Món");
            foreach (var m in LM)
            {
                dt.Rows.Add(m.MALOAIMON.Trim(), m.TENLOAIMON.Trim());
            }
            dtgvLM.DataSource = dt;
        }
        public void ThemLM(string MLM, string TLM)
        {
            CafeEntities cf = new CafeEntities();
            LOAIMON lm = new LOAIMON();
            lm.MALOAIMON = MLM;
            lm.TENLOAIMON = TLM;
            cf.LOAIMONs.Add(lm);
            cf.SaveChanges();
        }
        public void XoaLM(string MLM)
        {
            CafeEntities cf = new CafeEntities();
            LOAIMON lm = new LOAIMON();
            lm.MALOAIMON = MLM;
            cf.LOAIMONs.Attach(lm);
            cf.LOAIMONs.Remove(lm);
            cf.SaveChanges();
        }
        public void SuaLM(string MLM, string TLM)
        {
            CafeEntities cf = new CafeEntities();
            var lm = (from a in cf.LOAIMONs where a.MALOAIMON == MLM select a).SingleOrDefault();
            if (lm != null)
            {
                lm.TENLOAIMON = TLM;
                cf.SaveChanges();
            }
        }
        public void TaoTenMon(ComboBoxEdit cbb)
        {
            for (int i = cbb.Properties.Items.Count - 1; i >= 0; i--)
            {
                cbb.Properties.Items.RemoveAt(i);
            }
            CafeEntities nh = new CafeEntities();
            var tenmon = from a in nh.LOAIMONs
                         group a by a.TENLOAIMON into g
                         select new
                         {
                             tenloai = g.Key
                         };
            foreach (var x in tenmon)
            {
                cbb.Properties.Items.Add(x.tenloai.Trim());
            }
        }
        //public string LayMa()
        //{
        //    CafeEntities cf = new CafeEntities();
            
        //    int max1 = 0;
        //    int max2 = 0;
        //    var ma1 = from p in cf.LOAIMONs
        //              select new
        //              {
        //                  p.MALOAIMON
        //              };

        //    foreach (var i in ma1)
        //    {
        //        if (max2 < i.MALOAIMON)
        //        {
        //            max2 = i.MALOAIMON;
        //        }
        //    }
        //    if (max1 == max2 || max1 > max2)
        //        return (max1).ToString();
        //    return (max2).ToString();
        //}
        //public void Timkiem(DataGridView dtgv, ComboBoxEdit cbb)
        //{
        //    CafeEntities nh = new CafeEntities();
        //    var timkiem = (from p in nh.LOAIMONs
        //                   join q in nh.THUCDON on p.MALOAIMON equals q.MALOAIMON
        //                   where p.TENLOAIMON == cbb.Text
        //                   select new
        //                   {
        //                       q.MAMON,
        //                       q.TENMON,
        //                       q.DVT,
        //                       q.DONGIA
        //                   }).ToList();
        //    DataTable dt = new DataTable();
        //    dt.Columns.Add("Mã Món");
        //    dt.Columns.Add("Tên Món");
        //    dt.Columns.Add("Đơn vị Tính");
        //    dt.Columns.Add("Đơn Giá");

        //    foreach (var a in timkiem)
        //    {
        //        dt.Rows.Add(a.MAMON.Trim(), a.TENMON.Trim(), a.DVT.Trim(), a.DONGIA);
        //    }
        //    dtgv.DataSource = dt;
        //}
    }
}
