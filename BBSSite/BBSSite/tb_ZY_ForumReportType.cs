//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace BBSSite
{
    using System;
    using System.Collections.Generic;
    
    public partial class tb_ZY_ForumReportType
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tb_ZY_ForumReportType()
        {
            this.tb_ForumReport = new HashSet<tb_ForumReport>();
        }
    
        /// <summary>
    	/// 
    	/// </summary>
        public int ID { get; set; }
        /// <summary>
    	/// 帖子分类
    	/// </summary>
        public string Content { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tb_ForumReport> tb_ForumReport { get; set; }
    }
}
