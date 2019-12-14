using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DoAnQLCafe.BSLAYER;
using DevExpress.XtraEditors;
namespace DoAnQLCafe
{
    public partial class QLLoaiMon : Form
    {
        public QLLoaiMon()
        {
            InitializeComponent();
        }
        BLLoaiMon blLoaiMon = new BLLoaiMon();
        public string KT { get; set; }
        bool them = false;
        public void Loaddata()
        {
            blLoaiMon.LayLoaiMon(dtgvDSLM);
            //blLoaiMon.TaoTenMon(cbbTenLoaiMon);
            grctlTT.Enabled = false;
            btnHuy.Enabled = false;
            btnLuu.Enabled = false;
            txtMaLoaiMon.ResetText();
            txtTenLoaiMon.ResetText();

            btnThem.Enabled = true;
            btnXoa.Enabled = true;
            btnSua.Enabled = true;
        }
        private void QLLoaiMon_Load(object sender, EventArgs e)
        {
            Loaddata();
        }

        private void btnThem_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            them = true;
            this.grctlTT.Enabled = true;
            this.btnHuy.Enabled = true;
            this.btnLuu.Enabled = true;

            this.txtMaLoaiMon.ResetText();
            this.txtTenLoaiMon.ResetText();

            this.btnThem.Enabled = false;
            this.btnXoa.Enabled = false;
            this.btnSua.Enabled = false;

            this.txtMaLoaiMon.Enabled = true;
        }

        private void btnXoa_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            
            if (XtraMessageBox.Show("Bạn có muốn xóa sản phẩm?","Thông báo",MessageBoxButtons.YesNo)==DialogResult.Yes)
            {
                try
                {
                    int r = dtgvDSLM.CurrentCell.RowIndex;
                    string ma = dtgvDSLM.Rows[r].Cells[0].Value.ToString();
                    blLoaiMon.XoaLM(ma);
                    Loaddata();
                    blLoaiMon.LayLoaiMon(dtgvDSLM);
                    XtraMessageBox.Show("Đã Xóa Xong");
                }
                catch
                {
                    XtraMessageBox.Show("Lỗi");
                }
            }
        }

        private void btnSua_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            them = false;
            this.grctlTT.Enabled = true;
            this.btnHuy.Enabled = true;
            this.btnLuu.Enabled = true;

            txtMaLoaiMon.ResetText();
            txtTenLoaiMon.ResetText();

            this.txtMaLoaiMon.Enabled = false;
            this.btnThem.Enabled = false;
            this.btnXoa.Enabled = false;
            this.btnSua.Enabled = false;
        }

        private void btnLamMoi_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Loaddata();   
        }

        private void btnHuy_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Loaddata();
        }

        private void btnLuu_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (them)
            {
                try
                {
                    blLoaiMon.ThemLM(txtMaLoaiMon.Text, txtTenLoaiMon.Text);
                    Loaddata();
                    blLoaiMon.LayLoaiMon(dtgvDSLM);
                    XtraMessageBox.Show("Thêm Xong");
                }
                catch
                {
                    XtraMessageBox.Show("Lỗi");
                }

            }
            else
            {
                try
                {
                    blLoaiMon.SuaLM(txtMaLoaiMon.Text, txtTenLoaiMon.Text);
                    Loaddata();
                    blLoaiMon.LayLoaiMon(dtgvDSLM);
                    XtraMessageBox.Show("Sửa Xong");
                }
                catch
                {
                    XtraMessageBox.Show("Lỗi");
                }
            }
        }

        private void dtgvDSLM_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                int r = dtgvDSLM.CurrentCell.RowIndex;
                txtMaLoaiMon.Text = dtgvDSLM.Rows[r].Cells[0].Value.ToString();
                txtTenLoaiMon.Text = dtgvDSLM.Rows[r].Cells[1].Value.ToString();
            }
            catch
            {

            }
        }
    }
}
