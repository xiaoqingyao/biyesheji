<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TJHz.aspx.cs" Inherits="Admin_TJHz" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>家庭财务管理系统</title>
    <link rel="stylesheet" type="text/css" href="skin/css/base.css" />
<link rel="stylesheet" type="text/css" href="skin/css/main.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
<table width="100%" align="center" border="0" cellpadding="3" cellspacing="1" bgcolor="#20b1f3" style="margin-bottom:8px;margin-top:8px;">
  <tr>
    <td   class='title'><span>收支统计</span></td>
  </tr>
     
  <tr bgcolor="#FFFFFF">
    <td>
        <asp:GridView ID="GvInfo" runat="server" AllowPaging="false" AutoGenerateColumns="False"
            BackColor="White"    PageSize="12" Width="100%">
            <PagerSettings FirstPageText="首页" LastPageText="尾页" Mode="NextPreviousFirstLast"
                NextPageText="下一页" PageButtonCount="12" PreviousPageText="上一页" />
            <RowStyle HorizontalAlign="Left" />
            <Columns>
             <asp:TemplateField HeaderText="收支类型">
                          <ItemStyle HorizontalAlign="Left" Width="200px" />
                          <ItemTemplate>
                              <asp:Label ID="Label11" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                          </ItemTemplate>
                      </asp:TemplateField>
                       <asp:TemplateField HeaderText="金额">
                          <ItemStyle HorizontalAlign="Left" Width="200px" />
                          <ItemTemplate>
                              <asp:Label ID="Type" runat="server" Text='<%# Bind("je") %>'></asp:Label>
                          </ItemTemplate>
                      </asp:TemplateField>
                       
            
            </Columns>
             
            <PagerStyle BackColor="#F6F6F6" HorizontalAlign="Left" />
            <HeaderStyle BackColor="#F6F6F6" />
        </asp:GridView>
    </td>
  </tr>
    <tr bgcolor="#ffffff">
        <td align="center">
            </td>
    </tr>
</table>
    </div>
    </form>
</body>
</html>
