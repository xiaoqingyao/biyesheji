<?php
session_start();
include_once 'conn.php';
//xuxyxaodenxglxxu
?>
<html>
<head>
<title>��ʳ��Ϣ</title>
<LINK href="qtimages/style.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<!--hxsglxiangdxongjxs-->
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="1004" height="1146" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
	<tr>
		<td><?php include_once 'qttop.php';?></td>
	</tr>
	<tr>
		<td><table id="__01" width="1004" height="675" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><?php include_once 'qtleft.php';?></td>
            <td valign="top"><table id="__01" width="750" height="675" border="0" cellpadding="0" cellspacing="0">
              
              <tr>
                <td valign="top"><table id="__01" width="750" height="206" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="750" height="45" background="qtimages/1_02_02_02_01.gif"><table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="18%" align="center" valign="bottom" class="STYLE2">��ʳ��Ϣ</td>
                        <td width="71%">&nbsp;</td>
                        <td width="11%" valign="bottom">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table id="__01" width="750" height="147" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="15" background="qtimages/1_02_02_02_02_01.gif">&nbsp;</td>
                        <td width="708" height="738" valign="top" bgcolor="FCD89A">
						
						
						
                          <form id="form1" name="form1" method="post" action="">
  ����: ��ʳ��ţ�<input name="meishibianhao" type="text" id="meishibianhao" style='border:solid 1px #000000; color:#666666;width:80px' /> ��ʳ���ƣ�<input name="meishimingcheng" type="text" id="meishimingcheng" style='border:solid 1px #000000; color:#666666;width:80px' /> ��ʳ���<select name='meishileibie' id='meishileibie' style='border:solid 1px #000000; color:#666666;'><option value="">����</option><?php getoption("meishileibie","meishileibie")?></select></select>
  <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' />&nbsp;<input type="button" name="Submit3" value="�л���ͼ" style='border:solid 1px #000000; color:#666666' onClick="location.href='meishixinxilisttp.php';" />
</form>
<table width="98%" border="0"  align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse" class="newsline">  
  <tr>
    <td width="25" bgcolor="#CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>��ʳ���</td><td bgcolor='#CCFFFF'>��ʳ����</td><td bgcolor='#CCFFFF'>��ʳ���</td><td bgcolor='#CCFFFF'>��ͼ</td><td bgcolor='#CCFFFF'>�۸�</td><td bgcolor='#CCFFFF'>����</td><td bgcolor='#CCFFFF'>������</td>
    
    <td width="30" align="center" bgcolor="#CCFFFF">����</td>
  </tr>
  <?php 
    $sql="select * from meishixinxi where issh='��'";
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

	for($i=$pagecurrent*$pagelarge-$pagelarge;$i<$ddddd;$i++)
{
  ?>
  <tr>
    <td width="25"><?php echo $i+1;?></td>
    <td><?php echo mysql_result($query,$i,meishibianhao);?></td><td><?php echo mysql_result($query,$i,meishimingcheng);?></td><td><?php echo mysql_result($query,$i,meishileibie);?></td><td width='80'><a href="<?php echo mysql_result($query,$i,zhutu) ?>" target='_blank'><img src='<?php echo mysql_result($query,$i,zhutu) ?>' width='80' height='88' border='0'></a></td><td><?php echo mysql_result($query,$i,jiage);?></td><td><?php echo mysql_result($query,$i,pingfen);?></td><td><?php echo mysql_result($query,$i,faburen);?></td>
    
    <td width="30" align="center"><a href="meishixinxidetail.php?id=<?php echo mysql_result($query,$i,"id");?>">��ϸ</a></td>
  </tr>
  	<?php
	}
}
?>
</table>
<p>�������ݹ�<?php echo $rowscount;?>��,
  <input type="button" name="Submit2" onclick="javascript:window.print();" value="��ӡ��ҳ" style='border:solid 1px #000000; color:#666666' />
</p>
<p align="center"><a href="meishixinxilist.php?pagecurrent=1">��ҳ</a>, <a href="meishixinxilist.php?pagecurrent=<?php echo $pagecurrent-1;?>">ǰһҳ</a> ,<a href="meishixinxilist.php?pagecurrent=<?php echo $pagecurrent+1;?>">��һҳ</a>, <a href="meishixinxilist.php?pagecurrent=<?php echo $pagecount;?>">ĩҳ</a>, ��ǰ��<?php echo $pagecurrent;?>ҳ,��<?php echo $pagecount;?>ҳ </p>

					
					
					
</td>
                        <td width="27" background="qtimages/1_02_02_02_02_03.gif">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/1_02_02_02_03.gif" width="750" height="14" alt=""></td>
                  </tr>
                </table></td>
              </tr>
              
            </table></td>
          </tr>
        </table></td>
	</tr>
	<tr>
		<td width="1004" height="100" background="qtimages/1_03.gif"><?php include_once 'qtdown.php';?></td>
	</tr>
</table>
<!-- dfexnxxiaxng -->
</body>
</html>
