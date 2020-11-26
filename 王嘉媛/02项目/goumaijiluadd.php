<?php
session_start();
 if($_SESSION["username"]=="")
 {
	echo "<script>javascript:alert('对不起，请您先登陆！');location.href='index.php';</script>";
	exit;
 }
include_once 'conn.php';
$ndate =date("Y-m-d");
$addnew=$_POST["addnew"];
if ($addnew=="1" )
{
	$meishibianhao=$_POST["meishibianhao"];
    $meishimingcheng=$_POST["meishimingcheng"];
    $meishileibie=$_POST["meishileibie"];
    $jiage=$_POST["jiage"];
    $goumaishuliang=$_POST["goumaishuliang"];
    $jine=$_POST["jine"];
    $beizhu=$_POST["beizhu"];
    $goumairen=$_POST["goumairen"];
    
	//lixandonxgjixelxb
	$jinej=$jiage*$goumaishuliang;
	//ischongfu("select id from goumaijilu where goumairen='".$goumairen."'");
	$sql="insert into goumaijilu(meishibianhao,meishimingcheng,meishileibie,jiage,goumaishuliang,jine,beizhu,goumairen) values('$meishibianhao','$meishimingcheng','$meishileibie','$jiage','$goumaishuliang','$jinej','$beizhu','$goumairen') ";
	mysql_query($sql);
	//danjuzhixi;mysql_query($sql);
	echo "<script>javascript:alert('操作成功!');location.href='goumaijiluadd.php';</script>";
}
?>
<html>
<head>
<title>购买记录</title>
<LINK href="qtimages/style.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
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
	function check()
{
	if(document.form1.meishibianhao.value==""){alert("请输入美食编号");document.form1.meishibianhao.focus();return false;}
    if(document.form1.meishimingcheng.value==""){alert("请输入美食名称");document.form1.meishimingcheng.focus();return false;}
    if(document.form1.jiage.value==""){alert("请输入价格");document.form1.jiage.focus();return false;}
    if(document.form1.goumaishuliang.value==""){alert("请输入购买数量");document.form1.goumaishuliang.focus();return false;}
    if((/^(\+|-)?(0|[1-9]\d*)(\.\d*[1-9])?$/.test(document.form1.goumaishuliang.value))){}else{alert("购买数量必需数字型");document.form1.goumaishuliang.focus();return false;}
    if((/^(\+|-)?(0|[1-9]\d*)(\.\d*[1-9])?$/.test(document.form1.jine.value))){}else{alert("金额必需数字型");document.form1.jine.focus();return false;}
    if(document.form1.goumairen.value==""){alert("请输入购买人");document.form1.goumairen.focus();return false;}
    
}
	function gow()
	{
		location.href='goumaijiluadd.php?jihuabifffanhao='+document.form1.jihuabifffanhao.value+"&id=<?php echo $_GET["id"]?>";
	}
</script>
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
                        <td width="18%" align="center" valign="bottom" class="STYLE2">购买记录</td>
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
 $sql="select * from meishixinxi where id=".$_GET["id"];
 $query=mysql_query($sql);
 $rowscount=mysql_num_rows($query);
 if($rowscount>0)
 {
 	$meishibianhao=mysql_result($query,0,meishibianhao);
 	$meishimingcheng=mysql_result($query,0,meishimingcheng);
 	$meishileibie=mysql_result($query,0,meishileibie);
 	$jiage=mysql_result($query,0,jiage);
 	
 }
?>
<form id="form1" name="form1" method="post" action="">
<table width="98%" border="0"  align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse" class="newsline">    
	<tr><td>美食编号：</td><td><input name='meishibianhao' type='text' id='meishibianhao' value='' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr><script language="javascript">document.form1.meishibianhao.value='<?php echo $meishibianhao?>';</script>
    <tr><td>美食名称：</td><td><input name='meishimingcheng' type='text' id='meishimingcheng' value='' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr><script language="javascript">document.form1.meishimingcheng.value='<?php echo $meishimingcheng?>';</script>
    <tr><td>美食类别：</td><td><input name='meishileibie' type='text' id='meishileibie' value='' style='border:solid 1px #000000; color:#666666' /></td></tr><script language="javascript">document.form1.meishileibie.value='<?php echo $meishileibie?>';</script>
    <tr><td>价格：</td><td><input name='jiage' type='text' id='jiage' value='' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr><script language="javascript">document.form1.jiage.value='<?php echo $jiage?>';</script>
    <tr><td>购买数量：</td><td><input name='goumaishuliang' type='text' id='goumaishuliang' value='' style='border:solid 1px #000000; color:#666666' />&nbsp;*&nbsp;必需数字型</td></tr>
    <tr style="display:none"><td>金额：</td><td><input name='jine' type='text' id='jine' value='0' style='border:solid 1px #000000; color:#666666; background-color:#CCCCCC' />
&nbsp;此项不必填写，系统自动计算&nbsp;必需数字型</td>
    </tr>
    <tr><td>备注：</td><td><textarea name='beizhu' cols='50' rows='8' id='beizhu' style='border:solid 1px #000000; color:#666666'></textarea></td></tr>
    <tr><td>购买人：</td><td><input name='goumairen' type='text' id='goumairen' value='<?php echo $_SESSION['username'];?>' style='border:solid 1px #000000; color:#666666' readonly='readonly' />&nbsp;*</td></tr>
    

    <tr>
      <td>&nbsp;</td>
      <td><input type="hidden" name="addnew" value="1" />
        <input type="submit" name="Submit" value="确定" onClick="return check();"  style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="重置" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
  </table>
</form>
<p>&nbsp;</p>
<?php
	function ischongfu($sql)
	{
		$query=mysql_query($sql);
 		$rowscount=mysql_num_rows($query);
		if($rowscount>0)
		{
			echo "<script>javascript:alert('对不起，该购买人已经存在，请换其他购买人!');history.back();</script>";
			exit;
		}
		
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
