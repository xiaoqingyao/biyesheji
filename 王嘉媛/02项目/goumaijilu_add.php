<?php
session_start();
include_once 'conn.php';
$ndate =date("Y-m-d");
$addnew=$_POST["addnew"];
if ($addnew=="1" )
{
	$meishibianhao=$_POST["meishibianhao"];    $meishimingcheng=$_POST["meishimingcheng"];    $meishileibie=$_POST["meishileibie"];    $jiage=$_POST["jiage"];    $goumaishuliang=$_POST["goumaishuliang"];    $jine=$_POST["jine"];    $beizhu=$_POST["beizhu"];    $goumairen=$_POST["goumairen"];    
	//lixandonxgjixelxb
	$jinej=$jiage*$goumaishuliang;
	//qiuhe
	//ischongfu("select id from goumaijilu where trjrtjtrjrtj");
	$sql="insert into goumaijilu(meishibianhao,meishimingcheng,meishileibie,jiage,goumaishuliang,jine,beizhu,goumairen) values('$meishibianhao','$meishimingcheng','$meishileibie','$jiage','$goumaishuliang','$jinej','$beizhu','$goumairen') ";
	mysql_query($sql);
	//danjuzhixi;mysql_query($sql);
	echo "<script>javascript:alert('��ӳɹ�!');history.back();</script>";
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�����¼</title>
<!--bixanjxiqxi-->
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<link rel="stylesheet" href="css.css" type="text/css">
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
<p>��ӹ����¼�� ��ǰ���ڣ� <?php echo $ndate; ?></p>
<script language="javascript">
	function check()
{
	if(document.form1.meishibianhao.value==""){alert("��������ʳ���");document.form1.meishibianhao.focus();return false;}    if(document.form1.meishimingcheng.value==""){alert("��������ʳ����");document.form1.meishimingcheng.focus();return false;}    if(document.form1.jiage.value==""){alert("������۸�");document.form1.jiage.focus();return false;}    if(document.form1.goumaishuliang.value==""){alert("�����빺������");document.form1.goumaishuliang.focus();return false;}    if((/^(\+|-)?(0|[1-9]\d*)(\.\d*[1-9])?$/.test(document.form1.goumaishuliang.value))){}else{alert("������������������");document.form1.goumaishuliang.focus();return false;}    if((/^(\+|-)?(0|[1-9]\d*)(\.\d*[1-9])?$/.test(document.form1.jine.value))){}else{alert("������������");document.form1.jine.focus();return false;}    if(document.form1.goumairen.value==""){alert("�����빺����");document.form1.goumairen.focus();return false;}    
}
	function gow()
	{
		location.href='goumaijilu_add.php?jihuabifffanhao='+document.form1.jihuabifffanhao.value+"&id=<?php echo $_GET["id"]?>";
	}
</script>
<!--hxsglxiangdxongjxs-->
 <?php
 $sql="select * from meishixinxi where id=".$_GET["id"];
//islbd2q $sql="select * from meishixinxi where goumairen='".$_SESSION["username"]."'";
 $query=mysql_query($sql);
 $rowscount=mysql_num_rows($query);
 if($rowscount>0)
 {
 	$meishibianhao=mysql_result($query,0,meishibianhao); 	$meishimingcheng=mysql_result($query,0,meishimingcheng); 	$meishileibie=mysql_result($query,0,meishileibie); 	$jiage=mysql_result($query,0,jiage); 	
 }
?>
<form id="form1" name="form1" method="post" action="?id=<?php echo $_GET["id"]?>">
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">    
	<tr><td>��ʳ��ţ�</td><td><input name='meishibianhao' type='text' id='meishibianhao' value='' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr><script language="javascript">document.form1.meishibianhao.value='<?php echo $meishibianhao?>';</script>    <tr><td>��ʳ���ƣ�</td><td><input name='meishimingcheng' type='text' id='meishimingcheng' value='' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr><script language="javascript">document.form1.meishimingcheng.value='<?php echo $meishimingcheng?>';</script>    <tr><td>��ʳ���</td><td><input name='meishileibie' type='text' id='meishileibie' value='' style='border:solid 1px #000000; color:#666666' /></td></tr><script language="javascript">document.form1.meishileibie.value='<?php echo $meishileibie?>';</script>    <tr><td>�۸�</td><td><input name='jiage' type='text' id='jiage' value='' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr><script language="javascript">document.form1.jiage.value='<?php echo $jiage?>';</script>    <tr><td>����������</td><td><input name='goumaishuliang' type='text' id='goumaishuliang' value='' style='border:solid 1px #000000; color:#666666' />&nbsp;*&nbsp;����������</td></tr>    <tr><td>��</td><td><input name='jine' type='text' id='jine' value='' style='border:solid 1px #000000; color:#666666; background-color:#CCCCCC' />&nbsp;�������д��ϵͳ�Զ�����&nbsp;����������</td></tr>    <tr><td>��ע��</td><td><textarea name='beizhu' cols='50' rows='8' id='beizhu' style='border:solid 1px #000000; color:#666666'></textarea></td></tr>    <tr><td>�����ˣ�</td><td><input name='goumairen' type='text' id='goumairen' value='<?php echo $_SESSION['username'];?>' style='border:solid 1px #000000; color:#666666' readonly='readonly' />&nbsp;*</td></tr>    

    <tr>
      <td>&nbsp;</td>
      <td><input type="hidden" name="addnew" value="1" />
        <input type="submit" name="Submit" value="���" onclick="return check();"  style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="����" style='border:solid 1px #000000; color:#666666' /></td>
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
			echo "<script>javascript:alert('�Բ����������tsisshistxiaojxi�Ѿ����ڣ�������!');history.back();</script>";
			exit;
		}
		
	}
?>
</body>
</html>

