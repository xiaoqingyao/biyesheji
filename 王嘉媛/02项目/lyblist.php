<?php
session_start();
include_once 'conn.php';
?>
<html>
<head>
<title>�Ҹ�ʱ����ʳ��վ</title>
<LINK href="qtimages/style.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
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
                        <td width="18%" align="center" valign="bottom" class="STYLE2">��������</td>
                        <td width="69%">&nbsp;</td>
                        <td width="13%" valign="bottom"><a href="lyb.php"><span class="STYLE2">��Ҫ����</span></a></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table id="__01" width="750" height="147" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="15" background="qtimages/1_02_02_02_02_01.gif">&nbsp;</td>
                        <td width="708" height="738" valign="top" bgcolor="FCD89A"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#67B41A" class="tb">
                          <?php
					$sql="select * from liuyanban where 1=1";
					$sql=$sql." order by id desc";
  					$query=mysql_query($sql);
	 				 $rowscount=mysql_num_rows($query);
					 if($rowscount==0)
  {}
  else
  {
  $pagelarge=5;//ÿҳ������
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
                            <td width="11" rowspan="3" valign="top" bgcolor="#FCD89A"><!--DWLayoutEmptyCell-->&nbsp;</td>
                            <td width="85" rowspan="3" align="center" valign="middle" bgcolor="#FCD89A"><img width='70'height='70' src=<?php echo mysql_result($query,$i,"zhaopian");?> border=0> </td>
                            <td height="20" colspan="2" align="left" valign="middle" bgcolor="#FCD89A">&nbsp; &nbsp; ������:<?php echo mysql_result($query,$i,"addtime");?> &nbsp;</td>
                            <td width="12" rowspan="3" valign="top" bgcolor="#FCD89A" style="width: 10px"><!--DWLayoutEmptyCell-->&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="78" align="left" valign="top" bgcolor="#FCD89A">&nbsp;<?php echo mysql_result($query,$i,"liuyan");?></td>
                            <td align="left" valign="top" bgcolor="#FCD89A"><p>�ظ���</p>
                                <p><?php echo mysql_result($query,$i,"huifu");?></p></td>
                          </tr>
                          <tr>
                            <td colspan="2" align="left" valign="middle" bgcolor="#FCD89A" style="height: 25px">&nbsp; &nbsp;�˺ţ�<?php echo mysql_result($query,$i,"zhanghao");?> &nbsp; &nbsp;������<?php echo mysql_result($query,$i,"xingming");?>&nbsp;&nbsp;</td>
                          </tr>
                          <?php
						  }
  	}
  ?>
                        </table>
                          <p align="center"><a href="lyblist.php?pagecurrent=1">��ҳ</a>, <a href="lyblist.php?pagecurrent=<?php echo $pagecurrent-1;?>">ǰһҳ</a> ,<a href="lyblist.php?pagecurrent=<?php echo $pagecurrent+1;?>">��һҳ</a>, <a href="lyblist.php?pagecurrent=<?php echo $pagecount;?>">ĩҳ</a>, ��ǰ��<?php echo $pagecurrent;?>ҳ,��<?php echo $pagecount;?>ҳ �������ݹ�
                            <?php
		echo $rowscount;
	?>
                            ��,
  <input type="button" name="Submit2" onClick="javascript:window.print();" value="��ӡ��ҳ" style=" height:19px; border:solid 1px #000000; color:#666666" />
                          </p>
                          <p align="center">&nbsp;</p>
                          <p align="center">&nbsp;</p></td>
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

</body>
</html>