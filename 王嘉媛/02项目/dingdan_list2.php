<?php
session_start();
include_once 'conn.php';

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����</title><script language="javascript" src="js/hsgrili.js"></script><link rel="stylesheet" href="css.css" type="text/css">
</head>

<body>

<p>���ж����б�</p>
<form id="form1" name="form1" method="post" action="">
  ����: �����ţ�
  <input name="jine" type="text" id="jine" />
  <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' />
</form>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="25" bgcolor="#CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>������</td><td bgcolor='#CCFFFF'>���</td><td bgcolor='#CCFFFF'>��������</td><td bgcolor='#CCFFFF'>�û���</td><td bgcolor='#CCFFFF'>����</td><td bgcolor='#CCFFFF'>�ʼĵ�ַ</td><td bgcolor='#CCFFFF'>�绰</td><td bgcolor='#CCFFFF'>�������</td><td bgcolor='#CCFFFF'>��ݷ���</td><td bgcolor='#CCFFFF' width='80' align='center'>�Ƿ����</td>
    <td width='80' align='center' bgcolor='#CCFFFF'>�Ƿ�֧��</td>
    <td width="70" align="center" bgcolor="#CCFFFF">����</td>
  </tr>
  <?php 
    $sql="select * from dingdan where yonghuming='".$_SESSION['username']."'";
  
if ($_POST["jine"]!=""){$nreqjine=$_POST["jine"];$sql=$sql." and dingdanhao like '%$nreqjine%'";}
  $sql=$sql." order by id desc";
  
$query=mysql_query($sql);
  $rowscount=mysql_num_rows($query);
  if($rowscount==0)
  {}
  else
  {
  $pagelarge=10;//ÿҳ������
  $pagecurrent=$_GET["pagecurrent"];
  if($rowscount%$pagelarge==0)
  {
		$pagecount=$rowscount/$pagelarge;
  }
  else
  {
   		$pagecount=intval($rowscount/$pagelarge)+1;
  }
  if($pagecurrent=="" || $pagecurrent<=0)
{
	$pagecurrent=1;
}
 
if($pagecurrent>$pagecount)
{
	$pagecurrent=$pagecount;
}
		$ddddd=$pagecurrent*$pagelarge;
	if($pagecurrent==$pagecount)
	{
		if($rowscount%$pagelarge==0)
		{
		$ddddd=$pagecurrent*$pagelarge;
		}
		else
		{
		$ddddd=$pagecurrent*$pagelarge-$pagelarge+$rowscount%$pagelarge;
		}
	}

	for($i=$pagecurrent*$pagelarge-$pagelarge;$i<$ddddd;$i++)
{
  ?>
  <tr>
    <td width="25"><?php
	echo $i+1;
?></td>
    <td><?php echo mysql_result($query,$i,dingdanhao);?></td><td><?php echo mysql_result($query,$i,jine);?></td><td><?php echo mysql_result($query,$i,dingdanneirong);?></td><td><?php echo mysql_result($query,$i,yonghuming);?></td><td><?php echo mysql_result($query,$i,xingming);?></td><td><?php echo mysql_result($query,$i,youjidizhi);?></td><td><?php echo mysql_result($query,$i,dianhua);?></td><td><?php echo mysql_result($query,$i,kuaidileixing);?></td><td><?php echo mysql_result($query,$i,kuaidifeiyong);?></td><td width='80' align='center'><?php echo mysql_result($query,$i,"issh")?></td>
    <td align='center'><?php echo mysql_result($query,$i,iszf);?>
        <?php if(mysql_result($query,$i,iszf)=="��"){?>
      <a href="zhifu/index.php?id=<?php echo mysql_result($query,$i,id);?>&amp;biao=dingdan"><font color="#FF0000">֧��</font></a>
        <?php } ?>    </td>
    <td width="70" align="center">
	<?php
	if( mysql_result($query,$i,"issh")=="��")
	{
	?>
	<a href="del.php?id=<?php
		echo mysql_result($query,$i,"id");
	?>&tablename=dingdan" onclick="return confirm('���Ҫɾ����')">ɾ��</a> <a href="dingdan_updt.php?id=<?php
		echo mysql_result($query,$i,"id");
	?>">�޸�</a>
	<?php
	}
	
	?>	</td>
  </tr>
  	<?php
	}
}
?>
</table>
<p>�������ݹ�<?php
		echo $rowscount;
	?>��,
  <input type="button" name="Submit2" onclick="javascript:window.print();" value="��ӡ��ҳ" style='border:solid 1px #000000; color:#666666' />
</p>
<p align="center"><a href="dingdan_list2.php?pagecurrent=1">��ҳ</a>, <a href="dingdan_list2.php?pagecurrent=<?php echo $pagecurrent-1;?>">ǰһҳ</a> ,<a href="dingdan_list2.php?pagecurrent=<?php echo $pagecurrent+1;?>">��һҳ</a>, <a href="dingdan_list2.php?pagecurrent=<?php echo $pagecount;?>">ĩҳ</a>, ��ǰ��<?php echo $pagecurrent;?>ҳ,��<?php echo $pagecount;?>ҳ </p>

<p>&nbsp; </p>

</body>
</html>

