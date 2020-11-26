<?php 
session_start();
include_once 'conn.php';
$id=$_GET["id"];
$ndate =date("Y-m-d");
$addnew=$_POST["addnew"];
if ($addnew=="1" )
{
	$meishibianhao=$_POST["meishibianhao"];    $meishimingcheng=$_POST["meishimingcheng"];    $meishileibie=$_POST["meishileibie"];    $zhutu=$_POST["zhutu"];    $xiangqingmiaoshu=$_POST["xiangqingmiaoshu"];    $jiage=$_POST["jiage"];    $pingfen=$_POST["pingfen"];    $faburen=$_POST["faburen"];    
	//lixandonxgjixelxb
	$sql="update meishixinxi set meishibianhao='$meishibianhao',meishimingcheng='$meishimingcheng',meishileibie='$meishileibie',zhutu='$zhutu',xiangqingmiaoshu='$xiangqingmiaoshu',jiage='$jiage',pingfen='$pingfen',faburen='$faburen' where id= ".$id;
	mysql_query($sql);
	echo "<script>javascript:alert('修改成功!');</script>";
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>修改美食信息</title>
<link rel="stylesheet" href="kindeditor-4.1.10/themes/default/default.css" />
	<link rel="stylesheet" href="kindeditor-4.1.10/plugins/code/prettify.css" />
	<script charset="utf-8" src="kindeditor-4.1.10/kindeditor.js"></script>
	<script charset="utf-8" src="kindeditor-4.1.10/lang/zh_CN.js"></script>
	<script charset="utf-8" src="kindeditor-4.1.10/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="xiangqingmiaoshu"]', {
				cssPath : 'kindeditor-4.1.10/plugins/code/prettify.css',
				uploadJson : 'kindeditor-4.1.10/php/upload_json.php',
				fileManagerJson : 'kindeditor-4.1.10/php/file_manager_json.php',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
<link rel="stylesheet" href="css.css" type="text/css">
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
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
<!--hxsglxiangdxongjxs-->
<body>
<p>修改美食信息： 当前日期： <?php echo $ndate; ?></p>
<?php
$sql="select * from meishixinxi where id=".$id;
$query=mysql_query($sql);
$rowscount=mysql_num_rows($query);
if($rowscount>0)
{
//lixanxdoxngcxhaxifxen
?>
<form id="form1" name="form1" method="post" action="">
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"> 

      <tr><td>美食编号：</td><td><input name='meishibianhao' type='text' id='meishibianhao' value='<?php echo mysql_result($query,0,meishibianhao);?>' /></td></tr>      <tr><td>美食名称：</td><td><input name='meishimingcheng' type='text' id='meishimingcheng' value='<?php echo mysql_result($query,0,meishimingcheng);?>' /></td></tr>      <tr><td>美食类别：</td><td><select name='meishileibie' id='meishileibie'><?php getoption("meishileibie","meishileibie")?></select></td></tr><script language="javascript">document.form1.meishileibie.value='<?php echo mysql_result($query,0,meishileibie);?>';</script>      <tr><td>主图：</td><td><input name='zhutu' type='text' id='zhutu' size='50'  value='<?php echo mysql_result($query,0,zhutu);?>' /> &nbsp;<a href="javaScript:OpenScript('upfile.php?Result=zhutu',460,180)"><img src="Images/Upload.gif" width="30" height="16" border="0" align="absmiddle" /></a></td></tr>      <tr><td>详情描述：</td><td><textarea name="xiangqingmiaoshu" style="width:700px;height:200px;visibility:hidden;"><?php echo mysql_result($query,0,xiangqingmiaoshu);?></textarea></td></tr>      <tr><td>价格：</td><td><input name='jiage' type='text' id='jiage' value='<?php echo mysql_result($query,0,jiage);?>' /></td></tr>      <tr><td>评分：</td><td><input name='pingfen' type='text' id='pingfen' value='<?php echo mysql_result($query,0,pingfen);?>' /></td></tr>      <tr><td>发布人：</td><td><input name='faburen' type='text' id='faburen' value='<?php echo mysql_result($query,0,faburen);?>' /></td></tr>      
   
   
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

