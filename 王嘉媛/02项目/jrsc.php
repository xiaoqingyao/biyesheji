<?php
//��֤��¼��Ϣ
session_start();
 if($_SESSION["username"]=="")
 {
	echo "<script>javascript:alert('�Բ��������ȵ�¼��');location.href='index.php';</script>";
	exit;
 }
include_once 'conn.php';
//if($_POST['submit']){
	$id=$_GET["id"];
	$biao=$_GET["biao"];
	$ziduan=$_GET["ziduan"];
	$sql="insert into shoucangjilu(username,xwid,ziduan,biao) values('".$_SESSION["username"]."','$id','$ziduan','$biao')";
	//echo $sql;
	 	mysql_query($sql);
		$comewhere=$_SERVER['HTTP_REFERER'];
		echo "<script language='javascript'>alert('�����ɹ���');location.href='$comewhere';</script>";
	
//}
?>