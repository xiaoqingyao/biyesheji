<?php
//��֤��½��Ϣ
session_start();
include_once 'conn.php';
//if($_POST['submit']){
	
	$username=$_POST['username'];
	$pwd=$_POST['pwd1'];
	//$userpass=md5($userpass);
	$yzm=$_POST['yzm'];
		if ($username!="" && $pwd!="" && $yzm!="")
		{
			if($yzm==$_SESSION['regsession_code'])
			{
			
			}
			else
			{
				echo "<script language='javascript'>alert('��������ȷ��֤�룡');location.href='index.php';</script>";
				die;
			}
		$sql="select * from meishidaren where yonghuming='$username' and mima='$pwd' ";
		
		$query=mysql_query($sql);
		$rowscount=mysql_num_rows($query);
			if($rowscount>0)
			{
					$_SESSION['username']=$username;
					$_SESSION['cx']=$_POST["cx"];
					$_SESSION['xm']=mysql_result($query,$i,xingming);
					$_SESSION['zp']=mysql_result($query,$i,touxiang);
					$_SESSION['dz']=mysql_result($query,$i,dizhi);
					//$row = mysql_fetch_row($query)
					//echo $_SESSION['cx'];
					echo "<script language='javascript'>alert('��½�ɹ���');location='index.php';</script>";
			}
			else
			{
					echo "<script language='javascript'>alert('�û������������');history.back();</script>";
			}
		}
		else
		{
				echo "<script language='javascript'>alert('������������');history.back();</script>";
		}
	
	
//}
?>