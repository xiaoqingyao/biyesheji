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
	$sql="update goumaijilu set issh='��' where goumairen='".$_SESSION["username"]."'";
	mysql_query($sql);
	echo "<script>javascript:alert('��ӳɹ�!');location.href='dingdan_add.php';</script>";
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title><script language="javascript" src="js/Calendar.js"></script><link rel="stylesheet" href="css.css" type="text/css">
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
<p>��Ӷ����� ��ǰ���ڣ� <?php echo $ndate; ?></p>
<script language="javascript">
	function check()
{
	if(document.form1.dingdanhao.value==""){alert("�����붩����");document.form1.dingdanhao.focus();return false;}if(document.form1.jine.value==""){alert("��������");document.form1.jine.focus();return false;}if(document.form1.dingdanneirong.value==""){alert("�����붩������");document.form1.dingdanneirong.focus();return false;}if(document.form1.yonghuming.value==""){alert("�������û���");document.form1.yonghuming.focus();return false;}if(document.form1.xingming.value==""){alert("����������");document.form1.xingming.focus();return false;}if(document.form1.youjidizhi.value==""){alert("�������ʼĵ�ַ");document.form1.youjidizhi.focus();return false;}if(document.form1.youbian.value==""){alert("�������ʱ�");document.form1.youbian.focus();return false;}if(document.form1.dianhua.value==""){alert("������绰");document.form1.dianhua.focus();return false;}if(document.form1.kuaidifeiyong.value==""){alert("�������ݷ���");document.form1.kuaidifeiyong.focus();return false;}
}
	function gow()
	{
		location.href='peixunccccailiao_add.php?jihuabifffanhao='+document.form1.jihuabifffanhao.value;
	}
</script>
 <?php
	$sql="select * from goumaijilu where goumairen='".$_SESSION["username"]."' and issh='��'";
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
				$ddnr=$ddnr."��ʳ��ţ�".mysql_result($query,$i,meishibianhao)."��������".mysql_result($query,$i,goumaishuliang).";\n";
			 }
		 }
?>
<form id="form1" name="form1" method="post" action="">
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">    
	<tr><td>�����ţ�</td><td><input name='dingdanhao' type='text' id='dingdanhao' value='<?php echo makefilename2();?>' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr><tr><td>��</td><td><input name='jine' type='text' id='jine' value='<?php echo $ze?>' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr><tr><td>�������ݣ�</td><td><textarea name='dingdanneirong' cols='50' rows='8' id='dingdanneirong' style='border:solid 1px #000000; color:#666666'><?php echo $ddnr?></textarea>&nbsp;*</td></tr><tr><td>�û�����</td><td><input name='yonghuming' type='text' id='yonghuming' value='<?php echo  $_SESSION['username'];?>' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr><tr><td>������</td><td><input name='xingming' type='text' id='xingming' value='<?php echo  $_SESSION['xm'];?>' style='border:solid 1px #000000; color:#666666' />
&nbsp;*</td>
	</tr><tr><td>�ʼĵ�ַ��</td><td><input name='youjidizhi' type='text' id='youjidizhi' value='<?php echo  $_SESSION['dz'];?>' size='50' style='border:solid 1px #000000; color:#666666'  />
&nbsp;*</td>
	</tr><tr><td>�ʱࣺ</td><td><input name='youbian' type='text' id='youbian' value='' style='border:solid 1px #000000; color:#666666' />&nbsp;*</td></tr><tr><td>�绰��</td><td><input name='dianhua' type='text' id='dianhua' value='<?php echo  $_SESSION['dh'];?>' style='border:solid 1px #000000; color:#666666' />
&nbsp;*</td>
	</tr><tr><td>������ͣ�</td>
	  
	  <td><p>
	    <input name="kuaidileixing" type="radio" value="����ͻ�10" checked="checked" onclick="javascript:document.form1.kuaidifeiyong.value='10'" />
	    ����ͻ�<U>[֧��: ��ͨ��Բͨ����ͨ����ͨ��, һ��1-3�쵽��, �շ�10Ԫ]</U></p>
	    <p>
          <input type="radio" name="kuaidileixing" value="����EMS15" onclick="javascript:document.form1.kuaidifeiyong.value='15'" />
      ����EMS<U>[EMS ����������ȫ, һ��1-3�쵽��, �շ�15Ԫ]</U></p></td>
	</tr><tr><td>��ݷ��ã�</td><td><input name='kuaidifeiyong' type='text' id='kuaidifeiyong' value='10' style='border:solid 1px #000000; color:#666666' />
&nbsp;*</td>
	</tr>

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
			echo "<script>javascript:alert('�Բ��𣬸ö������Ѿ����ڣ��뻻����������!');history.back();</script>";
		}
		
	}
?>
</body>
</html>

