<?php 

include_once 'conn.php';
$id=$_GET["id"];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�����¼��ϸ</title><link rel="stylesheet" href="css.css" type="text/css">
</head>
<body>
<p>�����¼��ϸ��</p>
					<?php
$sql="select * from goumaijilu where id=".$id;
$query=mysql_query($sql);
$rowscount=mysql_num_rows($query);
if($rowscount>0)
{
?>

<table width="90%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"> 
      <tr>
	  <td width='11%'>��ʳ��ţ�</td><td width='39%'><?php echo mysql_result($query,0,meishibianhao);?></td>      <td width='11%'>��ʳ���ƣ�</td><td width='39%'><?php echo mysql_result($query,0,meishimingcheng);?></td></tr><tr>      <td width='11%'>��ʳ���</td><td width='39%'><?php echo mysql_result($query,0,meishileibie);?></td>      <td width='11%'>�۸�</td><td width='39%'><?php echo mysql_result($query,0,jiage);?></td></tr><tr>      <td width='11%'>����������</td><td width='39%'><?php echo mysql_result($query,0,goumaishuliang);?></td>      <td width='11%'>��</td><td width='39%'><?php echo mysql_result($query,0,jine);?></td></tr><tr>      <td width='11%'>��ע��</td><td width='39%'><?php echo mysql_result($query,0,beizhu);?></td>      <td width='11%'>�����ˣ�</td><td width='39%'><?php echo mysql_result($query,0,goumairen);?></td>      </tr><tr>      <td colspan=4 align=center><input type=button name=Submit5 value=���� onClick="javascript:history.back()" style='border:solid 1px #000000; color:#666666'  /> <input type="button" name="Submit2" onclick="javascript:window.print();" value='��ӡ��ҳ' style='border:solid 1px #000000; color:#666666' /></td></tr>
    
     
  </table>

<?php
	}
?>
<p>&nbsp;</p>
</body>
</html>

