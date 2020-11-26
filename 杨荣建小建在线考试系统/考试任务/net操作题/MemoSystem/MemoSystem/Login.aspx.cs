using BLL;
using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MemoSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_Click(object sender, EventArgs e)
        {
            string name = this.txtName.Text.Trim();
            string pwd = this.txtPwd.Text.Trim();
            bool boExit = new userInfoBLL().IsExit(name, pwd);
            if (boExit)
            {
                Response.Redirect("~/MemoManage.aspx");
            }
            else
            {
                msg.Text = "登录姓名或密码错误！";
                //Response.Redirect("~/Login.aspx");
            }
        }
    }
}