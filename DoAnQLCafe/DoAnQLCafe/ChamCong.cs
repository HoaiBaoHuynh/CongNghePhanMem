using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using DoAnQLCafe.BSLAYER;
namespace DoAnQLCafe
{
    public partial class ChamCong : DevExpress.XtraEditors.XtraForm
    {
        QL_ChamCong cc = new QL_ChamCong();
        public ChamCong()
        {
            InitializeComponent();
        }

        private void ChamCong_Load(object sender, EventArgs e)
        {
            Loaddata();
        }

        private void Loaddata()
        {
            try
            {
                cbo_NV.DataSource = cc.LayNhanVien();
                cbo_NV.DisplayMember = "HOTEN";
                cbo_NV.ValueMember = "MANHANVIEN";
                gdvChamCong.DataSource = cc.LayTTChamCong();
                btnLuu.Enabled = false;
                btnXoa.Enabled = false;
                cbo_NV.Enabled = false;
                cboCa.Enabled = false;
            }
            catch
            { }
        }

        private void btnThoat_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (XtraMessageBox.Show("Bạn có muốn thoát?", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                this.Close();
            }
        }

        private void btnRefesh_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Loaddata();
        }

        private void btnThem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            btnLuu.Enabled = true;
            cbo_NV.Enabled = true;
            cboCa.Enabled = true;
        }

        private void gdvChamCong_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            btnXoa.Enabled = true;
        }

        private void btnXoa_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (XtraMessageBox.Show("Bạn chắc chắn chứ?", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {
                try
                {
                    int r = gdvChamCong.CurrentCell.RowIndex;
                    string manv = gdvChamCong.Rows[r].Cells[0].Value.ToString();
                    DateTime Ngaylam = DateTime.Parse(gdvChamCong.Rows[r].Cells[2].Value.ToString());
                    string ca = gdvChamCong.Rows[r].Cells[3].Value.ToString();
                    cc.XoaChamCong(manv,Ngaylam,ca);
                    XtraMessageBox.Show("Xóa Thành Công.");
                    gdvChamCong.DataSource = cc.LayTTChamCong();
                }
                catch
                {
                    XtraMessageBox.Show("Xóa thất bại.");
                }
            }
        }

        private void btnLuu_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            try
            {
                string manv = cbo_NV.SelectedValue.ToString();
                string ngaylam = DateTime.Now.ToString().Substring(0, 10);
                string ca = cboCa.Text;
                cc.ThemChamCong(manv, ngaylam, ca);
                XtraMessageBox.Show("Đã thêm thành công " + cbo_NV.Text + ".Vào ngày " + ngaylam + " Ca " + cboCa.Text);
                gdvChamCong.DataSource = cc.LayTTChamCong();
            }
            catch
            {
                XtraMessageBox.Show("Nhân viên này đã được thêm hôm nay vào ca " + cboCa.Text);
            }
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string manv = cbo_NV.SelectedValue.ToString();
                DateTime ngaybd = dateNgayBD.DateTime;
                DateTime ngaykt = dateNgayKT.DateTime;
                gdvChamCong.DataSource = cc.LayTTChamCongNV(manv, ngaybd, ngaykt);
            }
            catch
            { }
        }

        //in bang cong
        private void XuatExcelbangcong(string file)
        {
            try
            {
                // creating Excel Application  
                Microsoft.Office.Interop.Excel._Application app = new Microsoft.Office.Interop.Excel.Application();
                // creating new WorkBook within Excel application  
                Microsoft.Office.Interop.Excel._Workbook workbook = app.Workbooks.Add(Type.Missing);
                // creating new Excelsheet in workbook  
                Microsoft.Office.Interop.Excel._Worksheet worksheet = null;
                // get the reference of first sheet. By default its name is Sheet1.  
                // store its reference to worksheet  
                worksheet = workbook.Sheets["Sheet1"];
                worksheet = workbook.ActiveSheet;
                // changing the name of active sheet  
                worksheet.Name = "Bảng Công";
                Microsoft.Office.Interop.Excel.Range head = worksheet.Range["A1", "E1"];
                head.MergeCells = true;
                head.Value2 = "BẢNG CHẤM CÔNG NHÂN VIÊN";
                head.Font.Bold = true;
                head.Font.Size = 20;
                head.HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignCenter;
                //Tên Nhân Viên
                Microsoft.Office.Interop.Excel.Range tennv = worksheet.Range["A4", "A4"];
                tennv.MergeCells = true;
                tennv.Value2 = "Họ Tên:";
                tennv.HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignCenter;
                //-------------------------------------------------------------------------------------
                Microsoft.Office.Interop.Excel.Range tennv1 = worksheet.Range["B4", "B4"];
                tennv1.MergeCells = true;
                tennv1.Value2 = cbo_NV.Text;
                tennv1.HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignCenter;
                //from
                Microsoft.Office.Interop.Excel.Range fromDate = worksheet.Range["A3", "A3"];
                fromDate.MergeCells = true;
                fromDate.Value2 = "Từ ngày: ";
                fromDate.HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignCenter;
                //-------------------------------------------------------------------------------------
                Microsoft.Office.Interop.Excel.Range fromDate1 = worksheet.Range["B3", "B3"];
                fromDate1.MergeCells = true;
                fromDate1.Value2 = dateNgayBD.Text;
                fromDate1.HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignCenter;
                //to
                Microsoft.Office.Interop.Excel.Range toDate = worksheet.Range["D3", "D3"];
                toDate.MergeCells = true;
                toDate.Value2 = "Đến ngày: ";
                toDate.HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignCenter;
                //-------------------------------------------------------------------------------------
                Microsoft.Office.Interop.Excel.Range toDate1 = worksheet.Range["E3", "E3"];
                toDate1.MergeCells = true;
                toDate1.Value2 = dateNgayKT.Text;
                toDate1.HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignCenter;
                //--------------TOTAL----------------------
                int r = gdvChamCong.Rows.Count + 6;
                Microsoft.Office.Interop.Excel.Range total = worksheet.Range["D" + r.ToString(), "D" + r.ToString()];
                total.MergeCells = true;
                total.Value2 = "Tổng lương:";
                total.HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignCenter;
                //-----------------------------------------------------------------------------------------------------
                double tt = tinhtongluong();
                Microsoft.Office.Interop.Excel.Range total1 = worksheet.Range["E" + r.ToString(), "E" + r.ToString()];
                total1.MergeCells = true;
                total1.Value2 = tt;
                total1.HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignCenter;
                // storing header part in Excel  
                for (int i = 1; i <= gdvChamCong.Columns.Count; i++)
                {
                    worksheet.Cells[5, i] = gdvChamCong.Columns[i - 1].HeaderText;
                }
                worksheet.Range["A5", "E5"].Borders.LineStyle = Microsoft.Office.Interop.Excel.Constants.xlSolid;

                // storing Each row and column value to excel sheet  
                for (int i = 0; i < gdvChamCong.Rows.Count; i++)
                {
                    for (int j = 0; j < gdvChamCong.Columns.Count; j++)
                    {
                        worksheet.Cells[i + 6, j + 1] = gdvChamCong.Rows[i].Cells[j].Value.ToString();
                    }
                }
                // save the application  
                workbook.SaveAs(file);

                // see the excel sheet behind the program  
                if (MessageBox.Show("Xuất tệp excel thành công!") == DialogResult.OK)
                    app.Visible = true;
            }
            catch
            {
                MessageBox.Show("Xuất tệp excel thất bại!");
            }
        }
        private double tinhtongluong()
        {
            double tong = 0;
            for (int i = 0; i < gdvChamCong.Rows.Count; i++)
            {
                double t = double.Parse(gdvChamCong.Rows[i].Cells[4].Value.ToString());
                tong = tong + t;
            }
            return tong;
        }

        private void btnPrint_Click(object sender, EventArgs e)
        {
            SaveFileDialog sfd = new SaveFileDialog();
            sfd.Filter = "Excel files (*.xlsx)|*.xlsx";
            sfd.RestoreDirectory = true;

            if (sfd.ShowDialog() == DialogResult.OK)
            {
                XuatExcelbangcong(sfd.FileName);
            }
        }
    }
}