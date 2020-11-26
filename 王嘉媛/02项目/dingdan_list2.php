<?php
session_start();
include_once 'conn.php';

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>订单</title><script language="javascript" src="js/hsgrili.js"></script><link rel="stylesheet" href="css.css" type="text/css">
</head>

<body>

<p>已有订单列表：</p>
<form id="form1" name="form1" method="post" action="">
  搜索: 订单号：
  <input name="jine" type="text" id="jine" />
  <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' />
</form>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="25" bgcolor="#CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>订单号</td><td bgcolor='#CCFFFF'>金额</td><td bgcolor='#CCFFFF'>订单内容</td><td bgcolor='#CCFFFF'>用户名</td><td bgcolor='#CCFFFF'>姓名</td><td bgcolor='#CCFFFF'>邮寄地址</td><td bgcolor='#CCFFFF'>电话</td><td bgcolor='#CCFFFF'>快递类型</td><td bgcolor='#CCFFFF'>快递费用</td><td bgcolor='#CCFFFF' width='80' align='center'>是否审核</td>
    <td width='80' align='center' bgcolor='#CCFFFF'>是否支付</td>
    <td width="70" align="center" bgcolor="#CCFFFF">操作</td>
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
  $pagelarge=10;//每页行数；
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
        <?php if(mysql_result($query,$i,iszf)=="否"){?>
      <a href="zhifu/index.php?id=<?php echo mysql_result($query,$i,id);?>&amp;biao=dingdan"><font color="#FF0000">支付</font></a>
        <?php } ?>    </td>
    <td width="70" align="center">
	<?php
	if( mysql_result($query,$i,"issh")=="否")
	{
	?>
	<a href="del.php?id=<?php
		echo mysql_result($query,$i,"id");
	?>&tablename=dingdan" onclick="return confirm('真的要删除？')">删除</a> <a href="dingdan_updt.php?id=<?php
		echo mysql_result($query,$i,"id");
	?>">修改</a>
	<?php
	}
	
	?>	</td>
  </tr>
  	<?php
	}
}
?>
</table>
<p>以上数据共<?php
		echo $rowscount;
	?>条,
  <input type="button" name="Submit2" onclick="javascript:window.print();" value="打印本页" style='border:solid 1px #000000; color:#666666' />
</p>
<p align="center"><a href="dingdan_list2.php?pagecurrent=1">首页</a>, <a href="dingdan_list2.php?pagecurrent=<?php echo $pagecurrent-1;?>">前一页</a> ,<a href="dingdan_list2.php?pagecurrent=<?php echo $pagecurrent+1;?>">后一页</a>, <a href="dingdan_list2.php?pagecurrent=<?php echo $pagecount;?>">末页</a>, 当前第<?php echo $pagecurrent;?>页,共<?php echo $pagecount;?>页 </p>

<p>&nbsp; </p>

</body>
</html>

