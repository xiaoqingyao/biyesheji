<?php
session_start();
if($_SESSION['cx']=="超级管理员" || $_SESSION['cx']=="普通管理员"){echo "<script>javascript:location.href='left.php';</script>";}
if($_SESSION['cx']=="美食达人"){echo "<script>javascript:location.href='left2.php';</script>";}

?>




