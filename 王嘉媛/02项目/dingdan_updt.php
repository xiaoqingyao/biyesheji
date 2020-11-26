<?php 
$id=$_GET["id"];
include_once 'conn.php';
$ndate =date("Y-m-d");
$addnew=$_POST["addnew"];
if ($addnew=="1" )
{

	$dingdanhao=$_POST["dingdanhao"];$jine=$_POST["jine"];$dingdanneirong=$_POST["dingdanneirong"];$yonghuming=$_POST["yonghuming"];$xingming=$_POST["xingming"];$youjidizhi=$_POST["youjidizhi"];$youbian=$_POST["youbian"];$dianhua=$_POST["dianhua"];$kuaidileixing=$_POST["kuaidileixing"];$kuaidifeiyong=$_POST["kuaidifeiyong"];
	$sql="update dingdan set dingdanhao='$dingdanhao',jine='$jine',dingdanneirong='$dingdanneirong',yonghuming='$yonghuming',xingming='$xingming',youjidizhi='$youjidizhi',youbian='$youbian',dianhua='$dianhua',kuaidileixing='$kuaidileixing',kuaidifeiyong='$kuaidifeiyong' where id= ".$id;
	mysql_query($sql);
	echo "<script>javascript:alert('修改成功!');location.href='dingdan_list.php';</script>";
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>修改订单</title><link rel="stylesheet" href="css.css" type="text/css"><script language="javascript" src="js/hsgrili.js"></script>
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
<body>
<p>修改订单： 当前日期： <?php echo $ndate; ?></p>
<?php
$sql="select * from dingdan where id=".$id;
$query=mysql_query($sql);
$rowscount=mysql_num_rows($query);
if($rowscount>0)
{
?>
<form id="form1" name="form1" method="post" action="">
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"> 

      <tr><td>订单号：</td><td><input name='dingdanhao' type='text' id='dingdanhao' value='<?php echo mysql_result($query,$i,dingdanhao);?>' /></td></tr><tr><td>金额：</td><td><input name='jine' type='text' id='jine' value='<?php echo mysql_result($query,$i,jine);?>' /></td></tr><tr><td>订单内容：</td><td><textarea name='dingdanneirong' cols='50' rows='8' id='dingdanneirong'><?php echo mysql_result($query,$i,dingdanneirong);?></textarea></td></tr><tr><td>用户名：</td><td><input name='yonghuming' type='text' id='yonghuming' value='<?php echo mysql_result($query,$i,yonghuming);?>' /></td></tr><tr><td>姓名：</td><td><input name='xingming' type='text' id='xingming' value='<?php echo mysql_result($query,$i,xingming);?>' /></td></tr><tr><td>邮寄地址：</td><td><input name='youjidizhi' type='text' id='youjidizhi' size='50' value='<?php echo mysql_result($query,$i,youjidizhi);?>' /></td></tr><tr><td>邮编：</td><td><input name='youbian' type='text' id='youbian' value='<?php echo mysql_result($query,$i,youbian);?>' /></td></tr><tr><td>电话：</td><td><input name='dianhua' type='text' id='dianhua' value='<?php echo mysql_result($query,$i,dianhua);?>' /></td></tr><tr><td>快递类型：</td><td><input name='kuaidileixing' type='text' id='kuaidileixing' value='<?php echo mysql_result($query,$i,kuaidileixing);?>' /></td></tr><tr><td>快递费用：</td><td><input name='kuaidifeiyong' type='text' id='kuaidifeiyong' value='<?php echo mysql_result($query,$i,kuaidifeiyong);?>' /></td></tr>
   
   
    <tr>
      <td>&nbsp;</td>
      <td><input name="addnew" type="hidden" id="addnew" value="1" />
      <input type="submit" name="Submit" value="修改" style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="重置" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
  </table>
</form>
<?php
	}
?>
<p>&nbsp;</p>
</body>
</html>

