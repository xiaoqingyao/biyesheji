<?php
session_start();
include_once 'conn.php';
//xuxyxaodenxglxxu
?>
<html>
<head>
<title>��ʳ����</title>
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
                        <td width="18%" align="center" valign="bottom" class="STYLE2">��ʳ����</td>
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
  ����: �û�����<input name="yonghuming" type="text" id="yonghuming" style='border:solid 1px #000000; color:#666666;width:80px' /> ������<input name="xingming" type="text" id="xingming" style='border:solid 1px #000000; color:#666666;width:80px' /> �Ա�<select name='xingbie' id='xingbie' style='border:solid 1px #000000; color:#666666;'><option value="">����</option><option value="��">��</option><option value="Ů">Ů</option></select> ϲ�ã�<input name="xihao" type="text" id="xihao" style='border:solid 1px #000000; color:#666666;width:80px' />
  <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' />&nbsp;<input type="button" name="Submit3" value="�л���ͼ" style='border:solid 1px #000000; color:#666666' onClick="location.href='meishidarenlisttp.php';" />
</form>
<table width="98%" border="0"  align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse" class="newsline">  
  <tr>
    <td width="25" bgcolor="#CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>�û���</td><td bgcolor='#CCFFFF'>����</td><td bgcolor='#CCFFFF'>�Ա�</td><td bgcolor='#CCFFFF'>ͷ��</td><td bgcolor='#CCFFFF'>ϲ��</td><td bgcolor='#CCFFFF'>�绰</td><td bgcolor='#CCFFFF'>��ַ</td>
    
    <td width="30" align="center" bgcolor="#CCFFFF">����</td>
  </tr>
  <?php 
    $sql="select * from meishidaren where 1=1";
  
if ($_POST["yonghuming"]!=""){$nreqyonghuming=$_POST["yonghuming"];$sql=$sql." and yonghuming like '%$nreqyonghuming%'";}
if ($_POST["xingming"]!=""){$nreqxingming=$_POST["xingming"];$sql=$sql." and xingming like '%$nreqxingming%'";}
if ($_POST["xingbie"]!=""){$nreqxingbie=$_POST["xingbie"];$sql=$sql." and xingbie like '%$nreqxingbie%'";}
if ($_POST["xihao"]!=""){$nreqxihao=$_POST["xihao"];$sql=$sql." and xihao like '%$nreqxihao%'";}
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
    <td><?php echo mysql_result($query,$i,yonghuming);?></td><td><?php echo mysql_result($query,$i,xingming);?></td><td><?php echo mysql_result($query,$i,xingbie);?></td><td width='80'><a href="meishidarendetail.php?id=<?php echo mysql_result($query,$i,"id");?>" target='_parent'><img src='<?php echo mysql_result($query,$i,touxiang) ?>' width='80' height='88' border='0'></a></td>
    <td><?php echo mysql_result($query,$i,xihao);?></td><td><?php echo mysql_result($query,$i,dianhua);?></td><td><?php echo mysql_result($query,$i,dizhi);?></td>
    
    <td width="30" align="center"><a href="meishidarendetail.php?id=<?php echo mysql_result($query,$i,"id");?>">��ϸ</a></td>
  </tr>
  	<?php
	}
}
?>
</table>
<p>�������ݹ�<?php echo $rowscount;?>��,
  <input type="button" name="Submit2" onClick="javascript:window.print();" value="��ӡ��ҳ" style='border:solid 1px #000000; color:#666666' />
</p>
<p align="center"><a href="meishidarenlist.php?pagecurrent=1">��ҳ</a>, <a href="meishidarenlist.php?pagecurrent=<?php echo $pagecurrent-1;?>">ǰһҳ</a> ,<a href="meishidarenlist.php?pagecurrent=<?php echo $pagecurrent+1;?>">��һҳ</a>, <a href="meishidarenlist.php?pagecurrent=<?php echo $pagecount;?>">ĩҳ</a>, ��ǰ��<?php echo $pagecurrent;?>ҳ,��<?php echo $pagecount;?>ҳ </p>

					
					
					
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
