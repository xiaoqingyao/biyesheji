<?php 
session_start();
include_once 'conn.php';

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ҵ��ղ�</title><link rel="stylesheet" href="css.css" type="text/css">
</head>

<body>

<p>�ҵ��ղأ�</p>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="25" bgcolor="#CCFFFF">���</td>
    <td width="790" bgcolor='#CCFFFF'>���� </td>
    <td width="135" align="center" bgcolor="#CCFFFF">�ղ�ʱ��</td>
    <td width="75" align="center" bgcolor="#CCFFFF">����</td>
  </tr>
  <?php 
    $sql="select * from shoucangjilu where username='".$_SESSION['username']."'";
  
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
$goumaishuliangz=$goumaishuliangz+floatval(mysql_result($query,$i,goumaishuliang));

  ?>
  <tr>
    <td width="25"><?php echo $i+1;?></td>
    <td><?php readzd(mysql_result($query,$i,"biao"),mysql_result($query,$i,"ziduan"),"id",mysql_result($query,$i,"xwid"));?></td>
    <td width="135" align="center"><?php echo mysql_result($query,$i,"addtime");?></td>
    <td width="75" align="center"><a href="del.php?id=<?php echo mysql_result($query,$i,"id");?>&tablename=shoucangjilu" onclick="return confirm('���Ҫɾ����')" >ɾ��</a> <a href="<?php echo mysql_result($query,$i,"biao"); ?>detail.php?id=<?php echo mysql_result($query,$i,"xwid");?>" target="_blank">��ϸ</a></td>
  </tr>
  	<?php
	}
}
?>
</table>
<p>�������ݹ�<?php
		echo $rowscount;
	?>��,
  <input type="button" name="Submit2" onclick="javascript:window.print();" value="��ӡ��ҳ"  style='border:solid 1px #000000; color:#666666' />
</p>
<p align="center"><a href="shoucangjilu_list2.php?pagecurrent=1">��ҳ</a>, <a href="shoucangjilu_list2.php?pagecurrent=<?php echo $pagecurrent-1;?>">ǰһҳ</a> ,<a href="shoucangjilu_list2.php?pagecurrent=<?php echo $pagecurrent+1;?>">��һҳ</a>, <a href="shoucangjilu_list2.php?pagecurrent=<?php echo $pagecount;?>">ĩҳ</a>, ��ǰ��<?php echo $pagecurrent;?>ҳ,��<?php echo $pagecount;?>ҳ </p>

<p>&nbsp; </p>

</body>
</html>

