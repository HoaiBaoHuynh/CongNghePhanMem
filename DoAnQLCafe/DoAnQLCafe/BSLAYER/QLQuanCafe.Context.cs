﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class CafeEntities : DbContext
    {
        public CafeEntities()
            : base("name=CafeEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<BAN> BANs { get; set; }
        public DbSet<CHAMCONG> CHAMCONGs { get; set; }
        public DbSet<CHITIETPHIEU> CHITIETPHIEUx { get; set; }
        public DbSet<CONGTHUC> CONGTHUCs { get; set; }
        public DbSet<KHUVUC> KHUVUCs { get; set; }
        public DbSet<LOAIMON> LOAIMONs { get; set; }
        public DbSet<NGUYENLIEU> NGUYENLIEUx { get; set; }
        public DbSet<NHANVIEN> NHANVIENs { get; set; }
        public DbSet<PHIEU> PHIEUx { get; set; }
        public DbSet<TAIKHOAN> TAIKHOANs { get; set; }
        public DbSet<THUCDON> THUCDONs { get; set; }
    }
}