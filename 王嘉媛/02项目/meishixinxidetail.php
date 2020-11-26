<?php
session_start();
include_once 'conn.php';
//xuxyxaodenxglxxu
$id=$_GET["id"];
?>
<html>
<head>
<title>美食信息</title>
<LINK href="qtimages/style.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<script language="javascript">
	function OpenScript(url,width,height)
{
  var win = window.open(url,"SelectToSort",'width=' + width + ',height=' + height + ',resizable=1,scrollbars=yes,menubar=no,status=yes' );
}
	function OpenDialog(sURL, iWidth, iHeight)
{
   var oDialog = window.open(sURL, "_EditorDialog", "width=" + iWidth.toString() + ",height=" + iHeight.toString() + ",resizable=no,left=0,top=0,scrollbars=no,status=no,titlebar=no,toolbar=no,menubar=no,location=no");
   oDialog.focus();
}
</script>
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
                        <td width="18%" align="center" valign="bottom" class="STYLE2">美食信息</td>
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
						
						
						
                          						 <?php
$sql="select * from meishixinxi where id=".$id;
$query=mysql_query($sql);
$rowscount=mysql_num_rows($query);
if($rowscount>0)
{
?>

<table width="98%" border="0"  align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse" class="newsline"> 
      <tr>
	  <td width='11%' height=44>美食编号：</td><td width='39%'><?php echo mysql_result($query,0,meishibianhao);?></td><td  rowspan=6 align=center><a href=<?php echo mysql_result($query,0,zhutu);?> target=_blank><img src=<?php echo mysql_result($query,0,zhutu);?> width=228 height=215 border=0></a></td></tr><tr>
    <td width='11%' height=44>美食名称：</td><td width='39%'><?php echo mysql_result($query,0,meishimingcheng);?></td></tr><tr>
    <td width='11%' height=44>美食类别：</td><td width='39%'><?php echo mysql_result($query,0,meishileibie);?></td></tr><tr>
    
    
    <td width='11%' height=44>价格：</td><td width='39%'><?php echo mysql_result($query,0,jiage);?></td></tr><tr>
    <td width='11%' height=44>评分：</td><td width='39%'><?php echo mysql_result($query,0,pingfen);?></td></tr><tr>
    <td width='11%' height=44>发布人：</td><td width='39%'><?php echo mysql_result($query,0,faburen);?></td></tr><tr>
    <td width='11%' height=100  >详情描述：</td><td width='39%' colspan=2 height=100 ><?php echo mysql_result($query,0,xiangqingmiaoshu);?></td></tr><tr>      <td colspan=3 align=center><table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
        <tr>
          <td width="50" bgcolor="#D8E8F8">序号</td>
          <td width="323" align="left" bgcolor='#D8E8F8'>评论内容</td>
          <td width="98" align="left" bgcolor='#D8E8F8'>评论人</td>
          <td width="106" align="center" bgcolor="#D8E8F8">评分</td>
          <td width="106" align="center" bgcolor="#D8E8F8">评论时间</td>
        </tr>
        <?php 
    $sql="select * from pinglun where wenzhangID='$id' and biao='meishixinxi' order by id desc";
    $query=mysql_query($sql);
  $rowscount=mysql_num_rows($query);
  if($rowscount==0)
  {}
  else
  {
	for($i=0;$i<$rowscount;$i++)
	{
  	?>
        <tr>
          <td width="50"><?php echo $i+1;?></td>
          <td align="left"><?php echo mysql_result($query,$i,pinglunneirong);?></td>
          <td align="left"><?php echo mysql_result($query,$i,pinglunren);?></td>
          <td width="106" align="center"><?php echo mysql_result($query,$i,"pingfen");?></td>
          <td width="106" align="center"><?php echo mysql_result($query,$i,"addtime");?></td>
        </tr>
        <?php
			}
		}
		?>
      </table></td>
    </tr>
<tr><td colspan=3 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" style='border:solid 1px #000000; color:#666666; width:50px;'  /><input type=button name=Submit53 value=评论 onClick="javascript:OpenScript('hsgpinglun.php?biao=meishixinxi&id=<?php echo $id;?>',500,200)" style='border:solid 1px #000000; color:#666666; width:50px;'  /><input type=button name=Submit52 value=收藏 onClick="javascript:location.href='jrsc.php?id=<?php echo $id;?>&biao=meishixinxi&ziduan=meishimingcheng';" style='border:solid 1px #000000; color:#666666; width:50px;'  />
  <input type=button name=Submit522 value=购买 onClick="javascript:location.href='goumaijiluadd.php?id=<?php echo $id;?>';" style='border:solid 1px #000000; color:#666666; width:50px;'  /></td></tr>
    
     
  </table>

<?php
	}
?>
					
					
					
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
