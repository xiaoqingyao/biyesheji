using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class AddMoney : System.Web.UI.Page
{
    Alert alert = new Alert();
    SqlHelper data = new SqlHelper();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserId"] == null)
            {
                Alert.AlertAndRedirect("对不起您没有登录！", "Login.aspx");

            }
            else
            {
                //设置收支类别
                string type = Request["type"];
                string kmtype = "收入";
                if (type == "1")
                {
                    this.drpSubItem.SelectedValue = "收入";
                }
                else
                {
                    this.drpSubItem.SelectedValue = "支出";
                    this.title.Text = "新增支出";
                    xiangmu.Text = "支出科目：";
                    fsr.Text = "支出人：";
                    fsrq.Text = "支出日期：";
                 
                    je.Text = "支出金额：";
                    kmtype = "支出";
                }
                if (!string.IsNullOrEmpty(type))
                {
                    this.trSubItem.Visible = false;
                }
                drpParentItem.DataSource = data.GetDataReader("select * from  MoenyClass where  Type='" + kmtype + "'");
                drpParentItem.DataTextField = "name";
                drpParentItem.DataValueField = "id";
                drpParentItem.DataBind();

               

                txtUser.Text = Session["Name"].ToString();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql;
        sql = "insert into F_Money(name,Type,UserName,AddMoney,Ds,AddUserId,AddTime)values('" + drpParentItem.SelectedItem.Text + "','" + drpSubItem.SelectedItem.Text + "','" + txtUser.Text + "','" + TxtMoney.Text + "','" + TxtStatement.Text + "','" + Session["UserId"].ToString() + "','" + this.txtDate.Text.Trim() + "')";

        data.RunSql(sql);
        
        Alert.AlertAndRedirect("添加成功！", "MoneyManger.aspx");

    }
}
