<?php 
session_start();
include_once 'conn.php';

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��ʳ��Ϣ</title>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<link rel="stylesheet" href="css.css" type="text/css">
</head>
<!--hxsglxiangdxongjxs-->
<body>

<p>������ʳ��Ϣ�б�</p>
<form id="form1" name="form1" method="post" action="">
  ����: ��ʳ��ţ�<input name="meishibianhao" type="text" id="meishibianhao" style='border:solid 1px #000000; color:#666666;width:80px' /> ��ʳ���ƣ�<input name="meishimingcheng" type="text" id="meishimingcheng" style='border:solid 1px #000000; color:#666666;width:80px' /> ��ʳ���<select name='meishileibie' id='meishileibie' style='border:solid 1px #000000; color:#666666;'><option value="">����</option><?php getoption("meishileibie","meishileibie")?></select></select>
  <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' />
</form>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="25" bgcolor="#CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>��ʳ���</td>    <td bgcolor='#CCFFFF'>��ʳ����</td>    <td bgcolor='#CCFFFF'>��ʳ���</td>    <td bgcolor='#CCFFFF'>��ͼ</td>    <td bgcolor='#CCFFFF'>�۸�</td>    <td bgcolor='#CCFFFF'>����</td>    <td bgcolor='#CCFFFF'>������</td>    <td bgcolor='#CCFFFF' width='80' align='center'>�Ƿ����</td>    
	<td width="90" align="center" bgcolor="#CCFFFF">���۹���</td>
    <td width="120" align="center" bgcolor="#CCFFFF">���ʱ��</td>
    <td width="120" align="center" bgcolor="#CCFFFF">����</td>
  </tr>
  <?php 
    $sql="select * from meishixinxi where 1=1";
  if ($_POST["meishibianhao"]!=""){$nreqmeishibianhao=$_POST["meishibianhao"];$sql=$sql." and meishibianhao like '%$nreqmeishibianhao%'";}if ($_POST["meishimingcheng"]!=""){$nreqmeishimingcheng=$_POST["meishimingcheng"];$sql=$sql." and meishimingcheng like '%$nreqmeishimingcheng%'";}if ($_POST["meishileibie"]!=""){$nreqmeishileibie=$_POST["meishileibie"];$sql=$sql." and meishileibie like '%$nreqmeishileibie%'";}
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
//youzuiping1
	for($i=$pagecurrent*$pagelarge-$pagelarge;$i<$ddddd;$i++)
{
//zoxngxetxoxngjxvi
//txixgihxngjs
//youzuiping2

  ?>
  <tr>
    <td width="25"><?php echo $i+1;?></td>
    <td><?php echo mysql_result($query,$i,meishibianhao);?></td>    <td><?php echo mysql_result($query,$i,meishimingcheng);?></td>    <td><?php echo mysql_result($query,$i,meishileibie);?></td>    <td width='80'><a href="<?php echo mysql_result($query,$i,zhutu) ?>" target='_blank'><img src='<?php echo mysql_result($query,$i,zhutu) ?>' width='80' height='88' border='0'></a></td>        <td><?php echo mysql_result($query,$i,jiage);?></td>    <td><?php echo mysql_result($query,$i,pingfen);?></td>    <td><?php echo mysql_result($query,$i,faburen);?></td>    <td width='80' align='center'><a href="sh.php?id=<?php echo mysql_result($query,$i,"id") ?>&yuan=<?php echo mysql_result($query,$i,"issh")?>&tablename=meishixinxi" onclick="return confirm('��ȷ��Ҫִ�д˲�����')"><?php echo mysql_result($query,$i,"issh")?></a></td>
	<td width="90" align="center"><a href="pinglun_list.php?id=<?php echo mysql_result($query,$i,"id");?>&biao=meishixinxi">���۹���</a></td>
    <td width="120" align="center"><?php echo mysql_result($query,$i,"addtime");?></td>
    <td width="120" align="center"><a href="del.php?id=<?php echo mysql_result($query,$i,"id");?>&tablename=meishixinxi" onclick="return confirm('���Ҫɾ����')">ɾ��</a> <a href="meishixinxi_updt.php?id=<?php echo mysql_result($query,$i,"id");?>">�޸�</a> <a href="meishixinxidetail.php?id=<?php echo mysql_result($query,$i,"id");?>" target="_blank">��ϸ</a> </td>
  </tr>
  	<?php
	}
}
?>
</table>
<p>�������ݹ�<?php echo $rowscount;?>��,<!--yoxugonxgzitoxnxgjxi--> <!--youzuiping3-->
  <input type="button" name="Submit2" onclick="javascript:window.print();" value="��ӡ��ҳ" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit3" onclick="javascript:location.href='meishixinxi_listxls.php';" value="����EXCEL" style='border:solid 1px #000000; color:#666666' />
</p>
<p align="center"><a href="meishixinxi_list.php?pagecurrent=1">��ҳ</a>, <a href="meishixinxi_list.php?pagecurrent=<?php echo $pagecurrent-1;?>">ǰһҳ</a> ,<a href="meishixinxi_list.php?pagecurrent=<?php echo $pagecurrent+1;?>">��һҳ</a>, <a href="meishixinxi_list.php?pagecurrent=<?php echo $pagecount;?>">ĩҳ</a>, ��ǰ��<?php echo $pagecurrent;?>ҳ,��<?php echo $pagecount;?>ҳ </p>
<?php
//yoxutixinxg if($kucddduntx>0)
//yoxutixinxg{
//yoxutixinxg tsgehxdhdm
//yoxutixinxg}
?>
</body>
</html>

