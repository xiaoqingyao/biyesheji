using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using DAL;
namespace Model.DAL
{
	/// <summary>
	/// 数据访问类:userInfo
	/// </summary>
	public partial class userInfoDal
	{

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public Model.userInfo GetModel(string userName, string pwd)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 userId,userName,userSex,userPwd,phone,mail from userInfo ");
			strSql.Append(" where userName=@userId and userpwd=@pwd");
			SqlParameter[] parameters = {
					new SqlParameter("@userId", SqlDbType.NVarChar,20)
                    ,new SqlParameter("@pwd", SqlDbType.NVarChar,20)
            };
			parameters[0].Value = userName;
            parameters[1].Value = pwd;

            Model.userInfo model=new Model.userInfo();
			DataTable ds=SQLHelper.ExecuteDataTable(strSql.ToString(),parameters);
			if(ds.Rows.Count>0)
			{
				return DataRowToModel(ds.Rows[0]);
			}
			else
			{
				return null;
			}
		}


		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public Model.userInfo DataRowToModel(DataRow row)
		{
			Model.userInfo model=new Model.userInfo();
			if (row != null)
			{
				if(row["userId"]!=null && row["userId"].ToString()!="")
				{
					model.userId=int.Parse(row["userId"].ToString());
				}
				if(row["userName"]!=null)
				{
					model.userName=row["userName"].ToString();
				}
				if(row["userSex"]!=null && row["userSex"].ToString()!="")
				{
					model.userSex=int.Parse(row["userSex"].ToString());
				}
				if(row["userPwd"]!=null)
				{
					model.userPwd=row["userPwd"].ToString();
				}
				if(row["phone"]!=null)
				{
					model.phone=row["phone"].ToString();
				}
				if(row["mail"]!=null)
				{
					model.mail=row["mail"].ToString();
				}
			}
			return model;
		}
		
	}
}

