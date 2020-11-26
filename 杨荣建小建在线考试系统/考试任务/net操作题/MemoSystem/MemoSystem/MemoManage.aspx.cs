using BLL;
using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MemoSystem
{
    public partial class MemoManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.GridView1.DataSource = new memoInfoBLL().GetList();
                this.GridView1.DataBind();
            }
        }

        protected void del_Click(object sender, EventArgs e)
        {
            bool hasChecked = false;
            foreach (GridViewRow g in GridView1.Rows)
            {
                CheckBox ck = (CheckBox)g.FindControl("CheckBoxId");
                if (ck.Checked == true)
                {
                    hasChecked = true;
                    string id = g.Cells[1].Text.ToString();
                    new memoInfoBLL().Delete(int.Parse(id));
                }
            }
            if (!hasChecked)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "alert('请选择一行数据信息！')", true);
            }
            else
            {
                Response.Redirect("~/MemoManage.aspx");
            }

        }
    }
}