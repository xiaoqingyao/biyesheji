<?php 
include_once 'conn.php';
header("Content-Type: application/vnd.ms-execl");   
header("Content-Disposition: attachment; filename=��һЩ��λ.xls");   
header("Pragma: no-cache");   
header("Expires: 0");  
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��ʳ����</title>
</head>

<body>

<p>������ʳ�����б�</p>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="25" bgcolor="#CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>�û���</td>    <td bgcolor='#CCFFFF'>����</td>    <td bgcolor='#CCFFFF'>����</td>    <td bgcolor='#CCFFFF'>�Ա�</td>    <td bgcolor='#CCFFFF'>ͷ��</td>    <td bgcolor='#CCFFFF'>ϲ��</td>    <td bgcolor='#CCFFFF'>�绰</td>    <td bgcolor='#CCFFFF'>��ַ</td>    
    <td width="120" align="center" bgcolor="#CCFFFF">���ʱ��</td>
  </tr>
  <?php 
    $sql="select * from meishidaren order by id desc";
  
$query=mysql_query($sql);
  $rowscount=mysql_num_rows($query);
  

for($i=0;$i<$rowscount;$i++)
{
  ?>
  <tr>
    <td width="25"><?php
	echo $i+1;
?></td>
    <td><?php echo mysql_result($query,$i,yonghuming);?></td>    <td><?php echo mysql_result($query,$i,mima);?></td>    <td><?php echo mysql_result($query,$i,xingming);?></td>    <td><?php echo mysql_result($query,$i,xingbie);?></td>    <td width='80'><a href="<?php echo mysql_result($query,$i,touxiang) ?>" target='_blank'><img src='<?php echo mysql_result($query,$i,touxiang) ?>' width='80' height='88' border='0'></a></td>    <td><?php echo mysql_result($query,$i,xihao);?></td>    <td><?php echo mysql_result($query,$i,dianhua);?></td>    <td><?php echo mysql_result($query,$i,dizhi);?></td>        
    <td width="120" align="center"><?php echo mysql_result($query,$i,"addtime");?></td>
    
  </tr>
  	<?php
}
?>
</table>

</body>
</html>

