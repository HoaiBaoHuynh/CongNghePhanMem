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
    public partial class QL_NhanVien : DevExpress.XtraEditors.XtraForm
    {
        private bool t = true;
        QLNhanVien nv = new QLNhanVien();
        public QL_NhanVien()
        {
            InitializeComponent();
        }

        private void QL_NhanVien_Load(object sender, EventArgs e)
        {
            Loaddata();
        }

        private void Loaddata()
        {
            khoatxt(t);
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            gdvTTNV.DataSource = nv.LayNhanVien();
        }
        private void khoatxt(bool e)
        {
            btnLuu.Enabled = !e;
            txtMNV.Enabled = !e;
            txtHoTen.Enabled = !e;
            txtDiaChi.Enabled = !e;
            txtLCB.Enabled = !e;
            txtSDT.Enabled = !e;
            cboPhai.Enabled = !e;
            dateNgaySinh.Enabled = !e;
            dateNgayLam.Enabled = !e;
        }

        private void btnThem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            khoatxt(!t);
        }

        private void btnThoat_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (XtraMessageBox.Show("Bạn có muốn thoát?", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                this.Close();
            }
        }

        private void btnRefresh_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Loaddata();
        }
        private void gdvTTNV_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            btnXoa.Enabled = true;
            btnSua.Enabled = true;
            khoatxt(!t);
            try
            {
                int r = gdvTTNV.CurrentCell.RowIndex;
                txtMNV.Text = gdvTTNV.Rows[r].Cells[0].Value.ToString();
                txtHoTen.Text = gdvTTNV.Rows[r].Cells[1].Value.ToString();
                cboPhai.Text = gdvTTNV.Rows[r].Cells[2].Value.ToString();
                dateNgaySinh.Text = gdvTTNV.Rows[r].Cells[3].Value.ToString();
                txtDiaChi.Text = gdvTTNV.Rows[r].Cells[4].Value.ToString();
                txtSDT.Text = gdvTTNV.Rows[r].Cells[5].Value.ToString();
                dateNgayLam.Text = gdvTTNV.Rows[r].Cells[6].Value.ToString();
                txtLCB.Text = gdvTTNV.Rows[r].Cells[7].Value.ToString();
                nv.LayLuong(lblTongCa, lblTongTien, txtMNV.Text, int.Parse(txtLCB.Text));
            }
            catch
            { }
        }

        private void btnXoa_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if(XtraMessageBox.Show("Bạn có muốn xóa nhân viên này?", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                try
                {
                    string manv = txtMNV.Text;
                    nv.XoaNV(manv);
                    XtraMessageBox.Show("Xóa thành công.");
                    gdvTTNV.DataSource = nv.LayNhanVien();
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
                nv.ThemNV(txtMNV.Text, txtHoTen.Text, cboPhai.Text, dateNgaySinh.DateTime,txtDiaChi.Text, txtSDT.Text,dateNgayLam.DateTime,txtLCB.Text);
                XtraMessageBox.Show("Thêm thành công.");
                gdvTTNV.DataSource = nv.LayNhanVien();
            }
            catch
            {
                XtraMessageBox.Show("Thêm thất bại.");
            }
        }

        private void btnSua_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            try
            {
                nv.SuaNV(txtMNV.Text, txtHoTen.Text, cboPhai.Text, dateNgaySinh.DateTime, txtDiaChi.Text, txtSDT.Text, dateNgayLam.DateTime, txtLCB.Text);
                XtraMessageBox.Show("Sửa thành công.");
                gdvTTNV.DataSource = nv.LayNhanVien();
            }
            catch
            {
                XtraMessageBox.Show("Sửa thất bại.");
            }
        }
    }
}