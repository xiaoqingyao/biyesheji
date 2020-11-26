<?php
session_start();
include_once 'conn.php';
$ndate =date("Y-m-d");
$addnew=$_POST["addnew"];
if ($addnew=="1" )
{
	$dingdanhao=$_POST["dingdanhao"];$jine=$_POST["jine"];$dingdanneirong=$_POST["dingdanneirong"];$yonghuming=$_POST["yonghuming"];$xingming=$_POST["xingming"];$youjidizhi=$_POST["youjidizhi"];$youbian=$_POST["youbian"];$dianhua=$_POST["dianhua"];$kuaidileixing=$_POST["kuaidileixing"];$kuaidifeiyong=$_POST["kuaidifeiyong"];
	//ischongfu("select id from dingdan where dingdanhao='".$dingdanhao."'");
	$sql="insert into dingdan(dingdanhao,jine,dingdanneirong,yonghuming,xingming,youjidizhi,youbian,dianhua,kuaidileixing,kuaidifeiyong) values('$dingdanhao','$jine','$dingdanneirong','$yonghuming','$xingming','$youjidizhi','$youbian','$dianhua','$kuaidileixing','$kuaidifeiyong') ";
	mysql_query($sql);
	$sql="update goumaijilu set issh='是' where goumairen='".$_SESSION["username"]."'";
	mysql_query($sql);
	echo "<script>javascript:alert('添加成功!');location.href='dingdan_add.php';</script>";
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title><script language="javascript" src="js/Calendar.js"></script><link rel="stylesheet" href="css.css" type="text/css">
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
<p>添加订单： 当前日期： <?php echo $ndate; ?></p>
<script language="javascript">
	function check()
{
	if(document.form1.dingdanhao.value==""){alert("请输入订单号");document.form1.dingdanhao.focus();return false;}if(document.form1.jine.value==""){alert("请输入金额");document.form1.jine.focus();return false;}if(document.form1.dingdanneirong.value==""){alert("请输入订单内容");document.form1.dingdanneirong.focus();return false;}if(document.form1.yonghuming.value==""){alert("请输入用户名");document.form1.yonghuming.focus();return false;}if(document.form1.xingming.value==""){alert("请输入姓名");document.form1.xingming.focus();return false;}if(document.form1.youjidizhi.value==""){alert("请输入邮寄地址");document.form1.youjidizhi.focus();return false;}if(document.form1.youbian.value==""){alert("请输入邮编");document.form1.youbian.focus();return false;}if(document.form1.dianhua.value==""){alert("请输入电话");document.form1.dianhua.focus();return false;}if(document.form1.kuaidifeiyong.value==""){alert("请输入快递费用");document.form1.kuaidifeiyong.focus();return false;}
}
	function gow()
	{
		location.href='peixunccccailiao_add.php?jihuabifffanhao='+document.form1.jihuabifffanhao.value;
	}
</script>
 <?php
	$sql="select * from goumaijilu where goumairen='".$_SESSION["username"]."' and issh='否'";
	$query=mysql_query($sql);
		$rowscount=mysql_num_rows($query);
		 if($rowscount==0)
		 {
		 	$ze=0;
			$ddnr="";
		 }
		 else
		 {
		 	 for($i=0;$i<$rowscount;$i++)
			 {
			 	$ze=$ze+mysql_result($query,$i,jiage)*mysql_result($query,$i,goumaishuliang);
				$ddnr=$ddnr."美食编号：".mysql_result($query,$i,meishibianhao)."，件数：".mysql_result($query,$i,goumaishuliang).";\n";
			 }
		 }
?>
<form id="form1" name="form1" method="post" action="">
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">    
	<tr><td>订单号：</td><td><input name='dingdanhao' type='text' id='dingdanhao' value='<?php echo makefilename2();?>' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr><tr><td>金额：</td><td><input name='jine' type='text' id='jine' value='<?php echo $ze?>' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr><tr><td>订单内容：</td><td><textarea name='dingdanneirong' cols='50' rows='8' id='dingdanneirong' style='border:solid 1px #000000; color:#666666'><?php echo $ddnr?></textarea>&nbsp;*</td></tr><tr><td>用户名：</td><td><input name='yonghuming' type='text' id='yonghuming' value='<?php echo  $_SESSION['username'];?>' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr><tr><td>姓名：</td><td><input name='xingming' type='text' id='xingming' value='<?php echo  $_SESSION['xm'];?>' style='border:solid 1px #000000; color:#666666' />
&nbsp;*</td>
	</tr><tr><td>邮寄地址：</td><td><input name='youjidizhi' type='text' id='youjidizhi' value='<?php echo  $_SESSION['dz'];?>' size='50' style='border:solid 1px #000000; color:#666666'  />
&nbsp;*</td>
	</tr><tr><td>邮编：</td><td><input name='youbian' type='text' id='youbian' value='' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr><tr><td>电话：</td><td><input name='dianhua' type='text' id='dianhua' value='<?php echo  $_SESSION['dh'];?>' style='border:solid 1px #000000; color:#666666' />
&nbsp;*</td>
	</tr><tr><td>快递类型：</td>
	  
	  <td><p>
	    <input name="kuaidileixing" type="radio" value="快递送货10" checked="checked" onclick="javascript:document.form1.kuaidifeiyong.value='10'" />
	    快递送货<U>[支持: 申通、圆通、汇通、中通等, 一般1-3天到货, 收费10元]</U></p>
	    <p>
          <input type="radio" name="kuaidileixing" value="邮政EMS15" onclick="javascript:document.form1.kuaidifeiyong.value='15'" />
      邮政EMS<U>[EMS 国内网点齐全, 一般1-3天到货, 收费15元]</U></p></td>
	</tr><tr><td>快递费用：</td><td><input name='kuaidifeiyong' type='text' id='kuaidifeiyong' value='10' style='border:solid 1px #000000; color:#666666' />
&nbsp;*</td>
	</tr>

    <tr>
      <td>&nbsp;</td>
      <td><input type="hidden" name="addnew" value="1" />
        <input type="submit" name="Submit" value="添加" onclick="return check();"  style='border:solid 1px #000000; color:#666666' />
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
			echo "<script>javascript:alert('对不起，该订单号已经存在，请换其他订单号!');history.back();</script>";
		}
		
	}
?>
</body>
</html>

