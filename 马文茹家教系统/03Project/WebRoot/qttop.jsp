<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>



	<script type="text/javascript">
 <%
String error = (String)request.getAttribute("error"); 
if(error!=null)
{
 %>
 alert("�û������������");
 <%}%>
 
  <%
String random = (String)request.getAttribute("random"); 
if(random!=null)
{
 %>
 alert("��֤�����");
 <%}%>
 
 popheight = 39;
 </script>
 <style type="text/css">
<!--
.STYLE1 {color: #0000CC}
-->
 </style>
 
 



<table id="__01" width="1000" height="185" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="1000" height="146" background="qtimages/1_01_01.gif"><table width="72%" height="51" border="0" align="left">
              <tr>
                <td><div style="font-family:����; color:#FFFFFF;  WIDTH: 100%; FONT-WEIGHT: bold; FONT-SIZE: 19pt; margin-top:5pt">
                    <div align="left" class="STYLE5 STYLE1">���߼ҽ���</div>
                </div></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td width="1000" height="39" background="qtimages/1_01_02.gif"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="red">
              <tr>
                <td align="center"><strong><a href="index.jsp"><font  class="STYLE1">��ҳ</font></a></strong></td>
                <td align="center"><strong><a href="dx_detail.jsp?lb=�γ̽���"><font  class="STYLE1">�γ̽���</font></a></strong></td>
				<td align="center"><strong><a href="news.jsp?lb=��������"><font  class="STYLE1">��������</font></a></strong></td>
                <td align="center"><strong><a href="userreg.jsp"><font  class="STYLE1">ѧ��ע��</font></a></strong></td>
                <td align="center"><strong><a href="jiaoshizhuceadd.jsp"><font  class="STYLE1">��ʦע��</font></a></strong></td>
                <td align="center"><strong><a href="zuoyexinxilist.jsp"><font  class="STYLE1">������ҵ</font></a></strong></td>
                <td align="center"><strong><a href="kejianxinxilist.jsp"><font  class="STYLE1">ѧϰ�μ�</font></a></strong></td>
				<td align="center"><strong><a href="bbs.jsp"><font  class="STYLE1">���߽���</font></a></strong></td>
                <td align="center"><strong><a href="login.jsp"><font  class="STYLE1">��̨</font></a></strong></td>
              </tr>
            </table></td>
          </tr>
        </table>