using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace DAL
{
    public class SQLHelper
    {

        /// <summary>
        /// 获取数据连接字符串
        /// </summary>
        /// <returns>连接字符串</returns>
        public static SqlConnection GetConnectionString()
        {
            return new SqlConnection("server=.;database=MyMemoDB;uid=sa;pwd=123456");
        }

         

        /// <summary>
        /// 执行查询并将结果返回至DataTable中
        /// </summary>
        /// <param name="strSql">查询语句</param>
        /// <param name="parameters">可能带的参数</param>
        /// <returns>返回一张查询结果表</returns>
        public static DataTable ExecuteDataTable(string strSql, params SqlParameter[] parameters)
        {
            //throw new Exception(strSql);
            using (SqlConnection conn = GetConnectionString())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = strSql;
                    foreach (SqlParameter p in parameters)
                    {
                        cmd.Parameters.Add(p);
                    }
                    DataSet ds = new DataSet();
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(ds);
                    }
                    cmd.Parameters.Clear();
                    return ds.Tables[0];
                }
            }
        }

        /// <summary>
        /// (重载)执行查询并将结果返回至DataTable中
        /// </summary>
        /// <param name="strSql">查询语句</param>
        /// <returns>返回一张查询结果表</returns>
        public static DataTable ExecuteDataTable(string strSql)
        {
            using (SqlConnection conn = GetConnectionString())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = strSql;
                    DataSet ds = new DataSet();
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(ds);
                        return ds.Tables[0];
                    }
                }
            }
        }


        /// <summary>
        /// 执行对数据的增删改操作
        /// </summary>
        /// <param name="strSql"></param>
        /// <param name="parameters"></param>
        public static void ExecuteNonQuery(string strSql, params SqlParameter[] parameters)
        {
            using (SqlConnection conn = GetConnectionString())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = strSql;
                    if (parameters != null)
                    {
                        foreach (SqlParameter p in parameters)
                        {
                            cmd.Parameters.Add(p);
                        }
                    }
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                }
            }
        }
 

        /// <summary>
        /// 执行查询并返回结果集中第一行第一列的值
        /// </summary>
        /// <param name="strSql"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public static object ExecuteScalar(string strSql, params SqlParameter[] parameters)
        {
            //throw new Exception(strSql);
            using (SqlConnection conn = GetConnectionString())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = strSql;
                    foreach (SqlParameter p in parameters)
                    {
                        cmd.Parameters.Add(p);
                    }
                    object obj = cmd.ExecuteScalar();
                    cmd.Parameters.Clear();
                    return obj;
                }
            }
        }

        public static int ExecuteNonQuery(CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {

            SqlCommand cmd = new SqlCommand();
            using (SqlConnection conn = GetConnectionString())
            {
                PrepareCommand(cmd, conn, null, cmdType, cmdText, commandParameters);
                int val = 0;
                try
                {
                    val = cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                }
                catch (Exception ex)
                {
                    val = 1;
                }
                return val;
            }
        }

        private static void PrepareCommand(SqlCommand cmd, SqlConnection conn, SqlTransaction trans, CommandType cmdType, string cmdText, SqlParameter[] cmdParms)
        {
            if (conn.State != ConnectionState.Open)
                conn.Open();

            cmd.Connection = conn;
            cmd.CommandText = cmdText;

            if (trans != null)
                cmd.Transaction = trans;

            cmd.CommandType = cmdType;

            if (cmdParms != null)
            {
                foreach (SqlParameter parm in cmdParms)
                {
                    if (parm.Value == null)
                    {
                        parm.Value = DBNull.Value;
                    }
                    cmd.Parameters.Add(parm);
                }
            }
        }

        /// <summary>
        /// (重载)执行查询并返回结果集中第一行第一列的值
        /// </summary>
        /// <param name="strSql">查询语句</param>
        /// <returns></returns>
        public static object ExecuteScalar(string strSql)
        {
            using (SqlConnection conn = GetConnectionString())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = strSql;
                    return cmd.ExecuteScalar();
                }
            }
        }       
    }
}
