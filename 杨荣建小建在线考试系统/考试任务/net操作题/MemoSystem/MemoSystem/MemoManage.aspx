<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemoManage.aspx.cs" Inherits="MemoSystem.MemoManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        .hidden {
        display:none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="add" Text="新增" runat="server" />
        <asp:Button ID="del" Text="删除" runat="server" OnClick="del_Click" />
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                             <asp:CheckBox runat="server" ID="checkAll"></asp:CheckBox>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="CheckBoxId"></asp:CheckBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="id" DataField="memoId" FooterStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" />
                    <asp:BoundField HeaderText="标题" DataField="memoTitle" />
                    <asp:BoundField HeaderText="开始时间" DataField="beginTime" />
                    <asp:BoundField HeaderText="结束时间" DataField="endTime" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
