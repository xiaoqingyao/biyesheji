﻿<%@ Page Language="C#" MasterPageFile="~/SysManage/MasterPage.master" AutoEventWireup="true" CodeFile="CommentManage.aspx.cs" Inherits="SysManage_CommentManage" %>
<%@ Register assembly="AspNetPager" namespace="Wuqi.Webdiyer" tagprefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="30" background="images/tab_05.gif">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td valign="middle">
                                        <img src="images/tb.gif" width="16" height="16" align="absmiddle" />
                                        当前位置：博客评论管理
                                    </td>
                                    
                                </tr>
                            </table>
                        </td>
                        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="8"></td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td style="padding:3px 0;">
                                    &nbsp;&nbsp;关键字：
                                    <asp:TextBox ID="txtKey" runat="server" CssClass="textbox"></asp:TextBox>
                                    <asp:Button ID="btnSearch" runat="server" CssClass="btn" OnClick="btnSearch_Click" Text="查  询" />&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btnShowAll" runat="server" CssClass="btn" OnClick="btnShowAll_Click" Text="显示全部" />
                                </td>
                              </tr>
                            </table>
                        </td>
                        <td width="8"></td>
                    </tr>
                    <tr>
                        <td width="8" style="height:52px">&nbsp;</td>
                        <td style="height:52px">
                        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#dddddd" onmouseover="changeto()"  onmouseout="changeback()" class="tab1">
                        
                            <asp:Repeater ID="rptList" runat="server"   onitemcommand="rptList_ItemCommand">
                                <ItemTemplate>
                                    <tr style=" height:25px;">
                                        <td align="center"><asp:CheckBox ID="CheckBox2" runat="server" /></td>
                                        <td align="center"><asp:Label ID="lblId" runat="server" Text='<%#Eval("CommentId")%>'></asp:Label></td>
                                        <td align="center">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                            <tr height="30">
                                                <td align="left">评论人：<%#Eval("CommentUser") %></td>
                                                <td align="left">评论时间：<%#Eval("CommentTime") %></td>
                                                <td align="left">评论博客：<a href="../Bloginfo.aspx?id=<%#Eval("blogid") %>" target="_blank"><%#Eval("blogname") %></a></td>
                                            </tr>
                                            <tr height="25">
                                                <td colspan="3" align="left">评论内容：<%#Eval("CommentContent") %></td>
                                            </tr>
                                        </table>
                                        </td>
                                        <td align="center">
                                            <asp:LinkButton ID="LinkButton1"  OnClientClick="JavaScript:return confirm('确定要删除吗？')" runat="server" CommandArgument='<%#Eval("CommentId") %>' CommandName="del"><img src="images/del.gif" width="16" height="16" style="border:none" /></asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>    
                        </td>
                        <td width="8" style="height:52px">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="35">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="12" height="35">&nbsp;</td>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="100">
                                        <asp:LinkButton ID="btnBatchDel" runat="server" onclick="btnBatchDel_Click" OnClientClick="JavaScript:return confirm('确定要删除吗？')" ><img src="images/deleteall.jpg" align="absmiddle" /></asp:LinkButton></td>
                                    <td style="color: #03515d;">
                                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server" 
                                            CustomInfoHTML="当前第 %CurrentPageIndex%页，共%PageCount%页，每页%PageSize%条" 
                                            FirstPageText="首页" HorizontalAlign="Center" LastPageText="尾页" 
                                            LayoutType="Table" NextPageText="下一页" PrevPageText="上一页" 
                                            ShowCustomInfoSection="Left" ShowPageIndexBox="Never" SubmitButtonText="Go" 
                                            TextAfterPageIndexBox="Page" TextBeforePageIndexBox="Go" OnPageChanging="AspNetPager1_PageChanging">
                                        </webdiyer:AspNetPager>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="16">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>