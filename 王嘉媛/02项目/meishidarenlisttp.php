<?php
session_start();
include_once 'conn.php';
//xuxyxaodenxglxxu
?>
<html>
<head>
<title>美食达人</title>
<LINK href="qtimages/style.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<!--hxsglxiangdxongjxs-->
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="1004" height="1146" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
	<tr>
		<td><?php include_once 'qttop.php';?></td>
	</tr>
	<tr>
		<td><table id="__01" width="1004" height="675" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><?php include_once 'qtleft.php';?></td>
            <td valign="top"><table id="__01" width="750" height="675" border="0" cellpadding="0" cellspacing="0">
              
              <tr>
                <td valign="top"><table id="__01" width="750" height="206" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="750" height="45" background="qtimages/1_02_02_02_01.gif"><table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="18%" align="center" valign="bottom" class="STYLE2">美食达人</td>
                        <td width="71%">&nbsp;</td>
                        <td width="11%" valign="bottom">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table id="__01" width="750" height="147" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="15" background="qtimages/1_02_02_02_02_01.gif">&nbsp;</td>
                        <td width="708" height="738" valign="top" bgcolor="FCD89A">
						
						
						
                          <form id="form1" name="form1" method="post" action="">
  &nbsp;搜索: 用户名：<input name="yonghuming" type="text" id="yonghuming" style='border:solid 1px #000000; color:#666666;width:80px' /> 姓名：<input name="xingming" type="text" id="xingming" style='border:solid 1px #000000; color:#666666;width:80px' /> 性别：<select name='xingbie' id='xingbie' style='border:solid 1px #000000; color:#666666;'><option value="">所有</option><option value="男">男</option><option value="女">女</option></select> 喜好：<input name="xihao" type="text" id="xihao" style='border:solid 1px #000000; color:#666666;width:80px' />
    <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' />&nbsp;<input type="button" name="Submit3" value="切换视图" style='border:solid 1px #000000; color:#666666' onClick="location.href='meishidarenlist.php';" />
</form>

                          <table width="98%" height="7%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                             <?php 
    $sql="select * from meishidaren where 1=1";
if ($_POST["yonghuming"]!=""){$nreqyonghuming=$_POST["yonghuming"];$sql=$sql." and yonghuming like '%$nreqyonghuming%'";}if ($_POST["xingming"]!=""){$nreqxingming=$_POST["xingming"];$sql=$sql." and xingming like '%$nreqxingming%'";}if ($_POST["xingbie"]!=""){$nreqxingbie=$_POST["xingbie"];$sql=$sql." and xingbie like '%$nreqxingbie%'";}if ($_POST["xihao"]!=""){$nreqxihao=$_POST["xihao"];$sql=$sql." and xihao like '%$nreqxihao%'";}
  $sql=$sql." order by id desc";
  
$query=mysql_query($sql);
  $rowscount=mysql_num_rows($query);
  if($rowscount==0)
  {}
  else
  {
  $pagelarge=20;//每页行数；
  $pagecurrent=$_GET["pagecurrent"];
  if($rowscount%$pagelarge==0)
  {
		$pagecount=$rowscount/$pagelarge;
  }
  else
  {
   		$pagecount=intval($rowscount/$pagelarge)+1;
  }
  if($pagecurrent=="" || $pagecurrent<=0)
{
	$pagecurrent=1;
}
 
if($pagecurrent>$pagecount)
{
	$pagecurrent=$pagecount;
}
		$ddddd=$pagecurrent*$pagelarge;
	if($pagecurrent==$pagecount)
	{
		if($rowscount%$pagelarge==0)
		{
		$ddddd=$pagecurrent*$pagelarge;
		}
		else
		{
		$ddddd=$pagecurrent*$pagelarge-$pagelarge+$rowscount%$pagelarge;
		}
	}
$k=0;
	for($i=$pagecurrent*$pagelarge-$pagelarge;$i<$ddddd;$i++)
{
$k=$k+1;
  ?>
                            <td height="165" align="center"><table width="150" height="160" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td height="123" align="center"><a href="meishidarendetail.php?id=<?php echo mysql_result($query,$i,id);?>"><img src="<?php echo mysql_result($query,$i,touxiang);?>" width="133" height="135" border="0" /></a></td>
                                </tr>
                                <tr>
                                  <td height="25" align="center"><?php echo mysql_result($query,$i,xingming);?></td>
                                </tr>
                            </table></td>
                             	<?php
								if ($k==4)
									{
										echo "</tr><tr>";
										$k=0;
									}
	}
}
?>
                          </tr>
                        </table>
						<p>
</p>
<P align=center><a href="meishidarenlisttp.php?pagecurrent=1">首页</a>, <a href="meishidarenlisttp.php?pagecurrent=<?php echo $pagecurrent-1;?>">前一页</a> ,<a href="meishidarenlisttp.php?pagecurrent=<?php echo $pagecurrent+1;?>">后一页</a>, <a href="meishidarenlisttp.php?pagecurrent=<?php echo $pagecount;?>">末页</a>, 以上数据共<?php echo $pagecount;?>页,当前第<?php echo $pagecurrent;?>页,<?php echo $pagelarge;?>条每页
<input type="button" name="Submit2" onClick="javascript:window.print();" value="打印本页" style='border:solid 1px #000000; color:#666666' />                
</P>
					
					
					
</td>
                        <td width="27" background="qtimages/1_02_02_02_02_03.gif">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/1_02_02_02_03.gif" width="750" height="14" alt=""></td>
                  </tr>
                </table></td>
              </tr>
              
            </table></td>
          </tr>
        </table></td>
	</tr>
	<tr>
		<td width="1004" height="100" background="qtimages/1_03.gif"><?php include_once 'qtdown.php';?></td>
	</tr>
</table>
<!-- dfexnxxiaxng -->
</body>
</html>
