
using System;
namespace Model.Model
{
	public partial class memoInfo
	{
		public memoInfo()
		{}
		#region Model
		private int _memoid;
		private string _memotitle;
		private string _memocontent;
		private DateTime? _begintime;
		private DateTime? _endtime;
		private int? _userid;
		/// <summary>
		/// 
		/// </summary>
		public int memoId
		{
			set{ _memoid=value;}
			get{return _memoid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string memoTitle
		{
			set{ _memotitle=value;}
			get{return _memotitle;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string memoContent
		{
			set{ _memocontent=value;}
			get{return _memocontent;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? beginTime
		{
			set{ _begintime=value;}
			get{return _begintime;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? endTime
		{
			set{ _endtime=value;}
			get{return _endtime;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? userId
		{
			set{ _userid=value;}
			get{return _userid;}
		}
		#endregion Model

	}
}

