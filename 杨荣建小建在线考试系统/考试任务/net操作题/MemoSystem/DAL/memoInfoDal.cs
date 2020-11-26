using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using DAL;

namespace Model.DAL
{
	/// <summary>
	/// 数据访问类:memoInfo
	/// </summary>
	public partial class memoInfoDal
	{

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public void Delete(int memoId)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from memoInfo ");
			strSql.Append(" where memoId=@memoId ");
			SqlParameter[] parameters = {
					new SqlParameter("@memoId", SqlDbType.Int,4)			};
			parameters[0].Value = memoId;

			 SQLHelper.ExecuteNonQuery(strSql.ToString(),parameters);
			 
		}
		 
          

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataTable GetList(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select memoId,memoTitle,memoContent,beginTime,endTime,userId ");
			strSql.Append(" FROM memoInfo ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			return SQLHelper.ExecuteDataTable(strSql.ToString());
		}
 

	

		
		 
	}
}

