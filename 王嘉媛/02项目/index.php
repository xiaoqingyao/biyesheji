<?php
session_start();
include_once 'conn.php';
?>
<html>
<head>
<title>幸福时光美食网站</title>
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
                <td><table id="__01" width="750" height="234" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="750" height="46" background="qtimages/1_02_02_01_01.gif"><table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="18%" align="center" valign="bottom" class="STYLE2">菜谱大全</td>
                        <td width="71%">&nbsp;</td>
                        <td width="11%" valign="bottom"><a href="news.php?lb=菜谱大全">更多&gt;&gt;</a></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table id="__01" width="750" height="174" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="16" background="qtimages/1_02_02_01_02_01.gif">&nbsp;</td>
                        <td width="248" height="174" align="center" bgcolor="FCD89A"><SCRIPT type=text/javascript>
var focus_width=246;
var focus_height=180;
var text_height=20;
var swf_height = focus_height+text_height;
var pics="";
var links="";
var texts="";
<?php
$sql="select id,biaoti,shouyetupian,id from xinwentongzhi where shouyetupian<>'' and shouyetupian like '%.jpg' order by id desc";
$query=mysql_query($sql);
$rowscount=mysql_num_rows($query);
for($i=0;$i<5;$i++)
{
	$tt=mysql_result($query,$i,"biaoti");
	$tt=str_replace("'","",$tt);
	$tt=str_replace("\"","",$tt);
	$tt=str_replace("(","",$tt);
	$tt=str_replace(")","",$tt);
	$pics=$pics.mysql_result($query,$i,"shouyetupian")."|";
	$links=$links."gg_detail.php?id=".mysql_result($query,$i,"id")."|";
	$texts=$texts.$tt."|";
}
$pics=substr($pics,0,strlen($pics)-1);
$links=substr($links,0,strlen($links)-1);
$texts=substr($texts,0,strlen($texts)-1);
?>

pics="<?php echo $pics;?>";
links="<?php echo $links;?>";
texts="<?php echo $texts;?>";

document.write('<embed src="qtimages/pixviewer.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" bgcolor="#ffffff" quality="Best" width="'+ focus_width +'" height="'+ swf_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer">');

</SCRIPT></td>
                        <td width="458" height="174" valign="top" bgcolor="FCD89A"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="newsline">
                          <?php 
					  $sql="select biaoti,id,addtime from xinwentongzhi where leibie='菜谱大全' order by id desc";
					  $query=mysql_query($sql);
					  $rowscount=mysql_num_rows($query);
					  if($rowscount>0)
					  {
					  	for($i=0;$i<$rowscount;$i++)
						{
							if($i==8)
							{
								break ;
							}
						?>
                          <tr height="25">
                            <td width="4%" align="center" class="newslist">·</td>
                            <td width="79%" class="newslist"><a href="gg_detail.php?id=<?php echo mysql_result($query,$i,"id");?>"><span class="STYLE1">
							 <?php 
								if (strlen(mysql_result($query,$i,"biaoti"))>54)
								{
									echo substr(mysql_result($query,$i,"biaoti"),0,54);
								}
								else
								{
									echo mysql_result($query,$i,"biaoti");
								}
								
								?></span></a></td>
                            <td width="17%" align="center" class="newslist"><?php echo date("Y-m-d",strtotime(mysql_result($query,$i,"addtime")));?></td>
                          </tr>
                          <?php
						}
					  }
					  ?>
                        </table></td>
                        <td width="28" background="qtimages/1_02_02_01_02_04.gif">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/1_02_02_01_03.gif" width="750" height="14" alt=""></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><table id="__01" width="750" height="206" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="750" height="45" background="qtimages/1_02_02_02_01.gif"><table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="18%" align="center" valign="bottom" class="STYLE2">美食菜单</td>
                        <td width="71%">&nbsp;</td>
                        <td width="11%" valign="bottom">更多&gt;&gt;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table id="__01" width="750" height="147" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="15" background="qtimages/1_02_02_02_02_01.gif">&nbsp;</td>
                        <td width="708" height="147" bgcolor="FCD89A"><table width="96%" height="100%" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <?php 
    $sql="select * from meishixinxi where zhutu<>''";
 
  $sql=$sql." order by id desc";
  
$query=mysql_query($sql);
  $rowscount=mysql_num_rows($query);
  
	 for($i=0;$i<$rowscount;$i++)
{
	if($i<4)
	{
	
  ?>
                            <td height="176" align="center"><table width="20%" height="193" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td height="163" align="center"><a href="meishixinxidetail.php?id=<?php echo mysql_result($query,$i,"id");?>" ><img src="<?php echo mysql_result($query,$i,"zhutu");?>" width="131" height="155" border="0"></a></td>
                                </tr>
                                <tr>
                                  <td height="25" align="center"><?php echo mysql_result($query,$i,"meishimingcheng");?></td>
                                </tr>
                            </table></td>
                            <?php
							}
  	}
  ?>
                          </tr>
                        </table></td>
                        <td width="27" background="qtimages/1_02_02_02_02_03.gif">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/1_02_02_02_03.gif" width="750" height="14" alt=""></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><table id="__01" width="750" height="235" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="750" height="45" background="qtimages/3.gif"><table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="17%" align="center" valign="bottom" class="STYLE2">饮食健康</td>
                        <td width="22%">&nbsp;</td>
                        <td width="15%" valign="bottom"><a href="news.php?lb=饮食健康">更多&gt;&gt;</a></td>
                        <td width="36%" valign="bottom"><span class="STYLE2">家居馆</span></td>
                        <td width="10%" valign="bottom"><a href="news.php?lb=家居馆">更多&gt;&gt;</a></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table id="__01" width="750" height="173" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="13" background="qtimages/1_02_02_03_02_01.gif">&nbsp;</td>
                        <td width="711" height="173" bgcolor="FCD89A"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="49%" valign="top"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="newsline">
                              <?php 
					  $sql="select biaoti,id,addtime from xinwentongzhi where leibie='饮食健康' order by id desc";
					  $query=mysql_query($sql);
					  $rowscount=mysql_num_rows($query);
					  if($rowscount>0)
					  {
					  	for($i=0;$i<$rowscount;$i++)
						{
							if($i==9)
							{
								break ;
							}
						?>
                              <tr height="25">
                                <td width="6%" align="center" class="STYLE2">·</td>
                                <td width="94%" class="newslist"><a href="gg_detail.php?id=<?php echo mysql_result($query,$i,"id");?>"><span class="STYLE1">
								<?php 
								if (strlen(mysql_result($query,$i,"biaoti"))>50)
								{
									echo substr(mysql_result($query,$i,"biaoti"),0,50);
								}
								else
								{
									echo mysql_result($query,$i,"biaoti");
								}
								
								?></span>
								</a></td>
                                </tr>
                              <?php
						}
					  }
					  ?>
                            </table></td>
                            <td width="1%">&nbsp;</td>
                            <td width="50%" valign="top"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="newsline">
                              <?php 
					  $sql="select biaoti,id,addtime from xinwentongzhi where leibie='家居馆' order by id desc";
					  $query=mysql_query($sql);
					  $rowscount=mysql_num_rows($query);
					  if($rowscount>0)
					  {
					  	for($i=0;$i<$rowscount;$i++)
						{
							if($i==9)
							{
								break ;
							}
						?>
                              <tr height="25">
                                <td width="6%" align="center" class="STYLE2">·</td>
                                <td width="94%" class="newslist"><a href="gg_detail.php?id=<?php echo mysql_result($query,$i,"id");?>"><span class="STYLE1">
                                  <?php 
								if (strlen(mysql_result($query,$i,"biaoti"))>26)
								{
									echo substr(mysql_result($query,$i,"biaoti"),0,50);
								}
								else
								{
									echo mysql_result($query,$i,"biaoti");
								}
								
								?>
                                </span> </a></td>
                              </tr>
                              <?php
						}
					  }
					  ?>
                            </table></td>
                          </tr>
                        </table></td>
                        <td width="26" background="qtimages/1_02_02_03_02_03.gif">&nbsp;</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/1_02_02_03_03.gif" width="750" height="13" alt=""></td>
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