//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DoAnQLCafe.BSLAYER
{
    using System;
    using System.Collections.Generic;
    
    public partial class TAIKHOAN
    {
        public string MANHANVIEN { get; set; }
        public string TENDANGNHAP { get; set; }
        public string MATKHAU { get; set; }
        public string CAPQUYEN { get; set; }
        public string TRANGTHAI { get; set; }
    
        public virtual NHANVIEN NHANVIEN { get; set; }
    }
}
