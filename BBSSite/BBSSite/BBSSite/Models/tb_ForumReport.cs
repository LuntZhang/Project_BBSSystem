//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace BBSSite.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tb_ForumReport
    {
        /// <summary>
    	/// 
    	/// </summary>
        public int ID { get; set; }
        /// <summary>
    	/// 帖子类型编号
    	/// </summary>
        public int ReportForumTypeID { get; set; }
        /// <summary>
    	/// 帖子编号
    	/// </summary>
        public int ForumID { get; set; }
        /// <summary>
    	/// 审查时间
    	/// </summary>
        public System.DateTime CreateTime { get; set; }
        /// <summary>
    	/// 审查人编号
    	/// </summary>
        public int CreateUserID { get; set; }
        /// <summary>
    	/// 审查类型编号
    	/// </summary>
        public int ReportTypeID { get; set; }
        /// <summary>
    	/// 审查明细
    	/// </summary>
        public string ReportDetailContent { get; set; }
    
        public virtual tb_UsersByCustomer tb_UsersByCustomer { get; set; }
        public virtual tb_ZY_ForumReportType tb_ZY_ForumReportType { get; set; }
        public virtual tb_ZY_ReportType tb_ZY_ReportType { get; set; }
    }
}