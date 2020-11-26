<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MemoSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin:0 auto; width: 400px;    height: 100px;      margin-top:400px;  ">
            <table >
                <tr>
                    <td>用户姓名：</td>
                    <td>

                        <asp:TextBox runat="server" ID="txtName"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="用户姓名不能为空" ControlToValidate="txtName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>用户密码：</td>
                    <td>

                        <asp:TextBox runat="server" ID="txtPwd"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="用户密码不能为空" ControlToValidate="txtPwd" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center">
                        <asp:Button runat="server" ID="login" Text="登陆" OnClick="login_Click"/>
                        
                        <input type="reset" value="重置" />
                        <asp:Label ID="msg" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
