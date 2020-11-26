<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>




<html>
<head>
<title>在线家教网</title>
<LINK href="qtimages/style.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="1000" height="1160" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
	<tr>
		<td><%@ include file="qttop.jsp"%></td>
	</tr>
	<tr>
		<td><table id="__01" width="1000" height="804" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><%@ include file="qtleft.jsp"%></td>
            <td valign="top"><table id="__01" width="770" height="804" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td><table id="__01" width="770" height="276" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="770" height="36" background="qtimages/1_02_02_01_01.gif"><table width="98%" height="22" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="17%" align="center"><strong><a href="news.jsp?lb=辅助资料">辅助资料</a></strong></td>
                        <td width="83%">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table id="__01" width="770" height="231" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td><img src="qtimages/1_02_02_01_02_01.gif" width="11" height="231" alt=""></td>
                        <td width="301" height="231">
						<%=new CommDAO().DynamicImage("",6,301,206) %>
						</td>
                        <td width="448" height="231" valign="top"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="newsline">
                          <%
										
    for(HashMap map:new CommDAO().select("select * from xinwentongzhi where leibie='辅助资料' order by id desc ",1,7)){
	
     %>
                          <tr height="25">
                            <td width="15" align="center" class="newslist"><img src="qtimages/1.jpg" /></td>
                            <td width="383"  class="newslist"><a href="gg_detail.jsp?id=<%=map.get("id")%>"><%=Info.ensubStr(map.get("biaoti"),28)%></a></td>
                            <td width="63" class="newslist"><%=map.get("addtime").toString().substring(0,10) %></td>
                          </tr>
                          <%
							}
							%>
                        </table></td>
                        <td><img src="qtimages/1_02_02_01_02_04.gif" width="10" height="231" alt=""></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/1_02_02_01_03.gif" width="770" height="9" alt=""></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><table id="__01" width="770" height="223" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="770" height="36" background="qtimages/1_02_02_02_01.gif"><table width="98%" height="22" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="17%" align="center" valign="bottom"><strong class="STYLE1">会员风彩</strong></td>
                        <td width="83%">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table id="__01" width="770" height="178" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td><img src="qtimages/1_02_02_02_02_01.gif" width="9" height="178" alt=""></td>
                        <td width="750" height="178" style="padding-left:5px;">
						
						
						 <div style="margin:0px;">
                  <div id="demo"  style="float:left; overflow:hidden">
                    <div id="indemo">
                      <div id="demo1">
                        <div id="dbgdtp">
				<table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                      <%
        for(HashMap m:new CommDAO().select("select * from yonghuzhuce order by id desc",1,8)){
         %>
	    <td align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" id="product">
	        <tr align="center">
	          <td>
              <div  style=" margin-left:13px; width:150px; height:120px; border:1px #CCC solid; padding:2px; background:#FFF">
              <a href="<%=m.get("touxiang") %>" target=""><img src="<%=m.get("touxiang") %>" border="0" title="<%=m.get("xingming") %>"  height="120" width="150"/></a></div></td>
	        </tr>
	        <tr align="center">
	          <td ><a href="" 
	          			target="">
	          		<%=m.get("xingming") %>
	          	</a></td>
	        </tr>
	       
       
	      </table></td>
          <%} %>
                  </tr>
                </table>
				
				 </div>
                      </div>
                      <div id="demo2"></div>
                    </div>
                  </div>
                  
                  
                  
                  
	       <script language="javascript"> 
			var speed=20;
			var tab=document.getElementById("demo"); 
			var tab1=document.getElementById("demo1"); 
			var tab2=document.getElementById("demo2"); 
			tab2.innerHTML=tab1.innerHTML; 
			function Marquee(){ 
			if(tab2.offsetWidth-tab.scrollLeft<=0) 
			tab.scrollLeft-=tab1.offsetWidth 
			else{ 
			tab.scrollLeft++; 
			} 
			} 
			var MyMar=setInterval(Marquee,speed); 
			tab.onmouseover=function() {clearInterval(MyMar)}; 
			tab.onmouseout=function() {MyMar=setInterval(Marquee,speed)}; 
			</script>
       
                  <style type="text/css">
<!--
#dbgdtp {float:left;  margin:0px; }
#demo {overflow:hidden; width: 744px; }
#demo1 {float: left; }
#demo2 {float: left; }
#indemo {float: left; width: 1500%; }
-->
</style>
						
						</td>
                        <td><img src="qtimages/1_02_02_02_02_03.gif" width="11" height="178" alt=""></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/1_02_02_02_03.gif" width="770" height="9" alt=""></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><table id="__01" width="770" height="305" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td><table id="__01" width="384" height="305" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="384" height="35" background="qtimages/1_02_02_03_01_01.gif"><table width="98%" height="17" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="37%" height="17" align="center" valign="bottom"><strong><a href="news.jsp?lb=站内新闻" ><font class="STYLE1">站内新闻</font></a></strong></td>
                            <td width="63%">&nbsp;</td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td><table id="__01" width="384" height="260" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td><img src="qtimages/1_02_02_03_01_02_01.gif" width="8" height="260" alt=""></td>
                            <td width="366" height="260" valign="top"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="newsline">
                              <%
                                for(HashMap map:new CommDAO().select("select * from xinwentongzhi where leibie='站内新闻' order by id desc",1,9)){
								%>
                              <tr height="25">
                                <td width="7%" align="center" class="newslist"><img src="qtimages/1.jpg" width="7" height="7"  /></td>
                                <td width="93%" class="newslist"><a href="gg_detail.jsp?id=<%=map.get("id")%>"><%=Info.ensubStr(map.get("biaoti"),26)%></a></td>
                              </tr>
                              <%
							}
							%>
                            </table></td>
                            <td><img src="qtimages/1_02_02_03_01_02_03.gif" width="10" height="260" alt=""></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td><img src="qtimages/1_02_02_03_01_03.gif" width="384" height="10" alt=""></td>
                      </tr>
                    </table></td>
                    <td><table id="__01" width="384" height="305" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="384" height="35" background="qtimages/1_02_02_03_01_01.gif"><table width="98%" height="17" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="37%" height="17" align="center" valign="bottom"><strong><a href="news.jsp?lb=站内新闻" ><font class="STYLE1">站内新闻</font></a></strong></td>
                            <td width="63%">&nbsp;</td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td><table id="__01" width="384" height="260" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td><img src="qtimages/1_02_02_03_01_02_01.gif" width="8" height="260" alt=""></td>
                            <td width="366" height="260" valign="top"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="newsline">
                              <%
                                for(HashMap map:new CommDAO().select("select * from xinwentongzhi where leibie='站内新闻' order by id desc",1,9)){
								%>
                              <tr height="25">
                                <td width="7%" align="center" class="newslist"><img src="qtimages/1.jpg" width="7" height="7"  /></td>
                                <td width="93%" class="newslist"><a href="gg_detail.jsp?id=<%=map.get("id")%>"><%=Info.ensubStr(map.get("biaoti"),26)%></a></td>
                              </tr>
                              <%
							}
							%>
                            </table></td>
                            <td><img src="qtimages/1_02_02_03_01_02_03.gif" width="10" height="260" alt=""></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td><img src="qtimages/1_02_02_03_01_03.gif" width="384" height="10" alt=""></td>
                      </tr>

                    </table></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
	</tr>
	<tr>
		<td><%@ include file="qtdown.jsp"%></td>
	</tr>
</table>
</body>
</html>