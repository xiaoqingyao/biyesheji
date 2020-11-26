<script language="javascript">
function checklog()
{
	if(document.userlog.username.value=="" || document.userlog.pwd1.value=="" || document.userlog.yzm.value=="")
	{
		alert("请输入完整");
		return false;
	}
}
</script>
<table id="__01" width="254" height="675" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td><table id="__01" width="254" height="234" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="254" height="48" background="qtimages/1_02_01_01_01.gif"><table width="100%" height="27" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="45%" align="center" valign="bottom" class="STYLE2">系统公告</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table id="__01" width="254" height="168" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td><img src="qtimages/1_02_01_01_02_01.gif" width="26" height="168" alt=""></td>
                        <td width="208" height="168" bgcolor="FCE0A6"><marquee border="0" direction="up" height="100%" onMouseOut="start()" onMouseOver="stop()"
                scrollamount="1" scrolldelay="50"><TABLE width="92%" height="100%" 
            border=0 align=center 
      cellPadding=0 cellSpacing=5>
                      <TBODY><TR><TD><?php 
					  $sql="select * from dx where leibie='系统公告'";
					  $query=mysql_query($sql);
					  $rowscount=mysql_num_rows($query);
					  if($rowscount>0)
					  {
					  	echo mysql_result($query,0,"content");
					  	}
						?></TD></TR></TBODY></TABLE></marquee></td>
                        <td><img src="qtimages/1_02_01_01_02_03.gif" width="20" height="168" alt=""></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/1_02_01_01_03.gif" width="254" height="18" alt=""></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><table id="__01" width="254" height="134" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="254" height="48" background="qtimages/1_02_01_01_01.gif"><table width="100%" height="27" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="45%" align="center" valign="bottom" class="STYLE2">用户登陆</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table id="__01" width="254" height="100" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="26" background="qtimages/1_02_01_01_02_01.gif">&nbsp;</td>
                          <td width="208" height="100" bgcolor="FCE0A6"><br />
                            <?php 
					if ($_SESSION['cx']=="" )
					{
				?>
                            <form action="userlog_post.php" method="post" name="userlog" id="userlog">
                              <table width="100%" height="68%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td width="12" height="28">&nbsp;</td>
                                  <td width="49" height="28">用户名:</td>
                                  <td height="28" colspan="2"><input name="username" type="text" id="username" style="width:100px; height:20px; border:solid 1px #000000; color:#666666" /></td>
                                </tr>
                                <tr>
                                  <td height="28">&nbsp;</td>
                                  <td height="28">密码:</td>
                                  <td height="28" colspan="2"><input name="pwd1" type="password" id="pwd1" style="width:100px; height:20px; border:solid 1px #000000; color:#666666" /></td>
                                </tr>
                                <tr >
                                  <td height="28">&nbsp;</td>
                                  <td height="28">权限:</td>
                                  <td height="28" colspan="2"><select name="cx" id="cx" style="width:100px; height:20px; border:solid 1px #000000; color:#666666" >
                                    <option value="美食达人">美食达人</option>
                                    </select>                                  </td>
                                </tr>
								<tr>
                                  <td height="28">&nbsp;</td>
                                  <td height="28">验证码:</td>
                                  <td width="53" height="28"><input name="yzm" type="text" id="yzm" style=" height:20px; border:solid 1px #000000; color:#666666; width:50px" /></td>
								  <td width="94"><img alt="刷新验证码" onclick="this.src='code.php?time='+new Date().getTime();" src="code.php?time='+new Date().getTime();" style="cursor:hand" /></td>
								</tr>
                                <tr>
                                  <td height="38" colspan="4" align="center"><input type="submit" name="Submit" value="登陆" style=" height:19px; border:solid 1px #000000; color:#666666" onclick="return checklog();"/>
                                      <input type="reset" name="Submit2" value="重置" style=" height:19px; border:solid 1px #000000; color:#666666" /></td>
                                </tr>
                              </table>
                            </form>
                            <?php 
							}
				  else
				  {
				 ?>
                            <table width="93%" height="68%" border="0" align="center" cellpadding="0" cellspacing="0">
                              <tr>
                                <td height="28" align="left">当前用户：<?php echo $_SESSION['username']?></td>
                              </tr>
                              <tr>
                                <td height="28" align="left">您的权限：<?php echo $_SESSION['cx']?></td>
                              </tr>
                              <tr>
                                <td height="28" align="left">欢迎您的到来!!!</td>
                              </tr>
                              <tr>
                                <td height="28" align="center"><input type="button" name="Submit3" value="退出" onclick="javascript:location.href='logout.php';" style=" height:19px; border:solid 1px #000000; color:#666666" />
                                    <input type="button" name="Submit22" value="个人后台" onclick="javascript:location.href='main.php';" style=" height:19px; border:solid 1px #000000; color:#666666" /></td>
                              </tr>
                            </table>
                          <?php } ?></td>
                          <td width="20" background="qtimages/1_02_01_01_02_03.gif">&nbsp;</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/1_02_01_01_03.gif" width="254" height="18" alt=""></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><table id="__01" width="254" height="167" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="254" height="48" background="qtimages/1_02_01_01_01.gif"><table width="100%" height="27" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="45%" align="center" valign="bottom" class="STYLE2">站内搜索</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="100"><table id="__01" width="254" height="100" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="26" background="qtimages/1_02_01_01_02_01.gif">&nbsp;</td>
                          <td width="208" height="100" valign="top" bgcolor="FCE0A6"><table width="100%" height="100" border="0" cellpadding="0" cellspacing="0">
                            <form action="news.php" method="post" name="formsearch" id="formsearch">
                              <tr>
                                <td width="19%">标题</td>
                                <td width="81%"><input name="biaoti" type="text" id="biaoti" size="20" style="width:130px; height:20px; border:solid 1px #000000; color:#666666" /></td>
                              </tr>
                              <tr>
                                <td>类别</td>
                                <td><select name="lb" style="width:130px; height:22px; border:solid 1px #000000; color:#666666">
                                    <?php
								  $sql="select distinct(leibie) from xinwentongzhi";
								  $query=mysql_query($sql);
								$rowscount=mysql_num_rows($query);
								if($rowscount>0)
								{
								for($i=0;$i<$rowscount;$i++)
	 							{
								  ?>
								  <option value="<?php echo mysql_result($query,$i,"leibie")?>"><?php echo mysql_result($query,$i,"leibie")?></option>
								  <?php
								  }
								  }
								  ?>
                                  </select>
                                </td>
                              </tr>
                              <tr>
                                <td>&nbsp;</td>
                                <td><input type="submit" name="Submit4" value="提交" style=" height:19px; border:solid 1px #000000; color:#666666" /></td>
                              </tr>
                            </form>
                          </table></td>
                          <td width="20" background="qtimages/1_02_01_01_02_03.gif">&nbsp;</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="18" background="qtimages/1_02_01_01_03.gif">&nbsp;</td>
                  </tr>
                </table></td>
              </tr>
			  <tr>
                <td><table id="__01" width="254" height="182" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="254" height="48" background="qtimages/1_02_01_01_01.gif"><table width="100%" height="27" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="45%" align="center" valign="bottom" class="STYLE2">友情连接</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="113"><table id="__01" width="254" height="113" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="26" background="qtimages/1_02_01_01_02_01.gif">&nbsp;</td>
                          <td width="208" height="113" valign="top" bgcolor="FCE0A6"><table class="newsline" cellspacing="0" cellpadding="0" width="98%" 
                  align="center" border="0">
                            <tbody>
                              <?php 
					  $sql="select * from youqinglianjie order by id desc";
					  $query=mysql_query($sql);
					  $rowscount=mysql_num_rows($query);
					  if($rowscount>0)
					  {
					  	for($i=0;$i<$rowscount;$i++)
						{
						?>
                              <tr>
                                <td width="9%" height="25"><span class="style2">·</span></td>
                                <td width="18%" height="25"><a href="<?php echo mysql_result($query,$i,"wangzhi");?>" target="_blank" ><?php echo mysql_result($query,$i,"wangzhanmingcheng");?></a></td>
                                <td width="73%" height="25"><a href="<?php echo mysql_result($query,$i,"wangzhi");?>" target="_blank" ><?php echo mysql_result($query,$i,"wangzhi");?></a></td>
                              </tr>
                              <?php
						}
					  }
					  ?>
                            </tbody>
                          </table></td>
                          <td width="20" background="qtimages/1_02_01_01_02_03.gif">&nbsp;</td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><img src="qtimages/1_02_01_01_03.gif" width="254" height="18" alt=""></td>
                  </tr>
                </table></td>
              </tr>
            </table>