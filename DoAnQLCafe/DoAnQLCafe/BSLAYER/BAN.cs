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
    
    public partial class BAN
    {
        public BAN()
        {
            this.PHIEUx = new HashSet<PHIEU>();
        }
    
        public string MABAN { get; set; }
        public string TENBAN { get; set; }
        public Nullable<int> SOCHONGOI { get; set; }
        public string MAKHUVUC { get; set; }
        public string TRANGTHAI { get; set; }
    
        public virtual KHUVUC KHUVUC { get; set; }
        public virtual ICollection<PHIEU> PHIEUx { get; set; }
    }
}
