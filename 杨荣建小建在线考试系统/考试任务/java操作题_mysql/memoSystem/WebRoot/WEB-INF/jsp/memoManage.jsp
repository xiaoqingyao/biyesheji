<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ck" uri="http://ckeditor.com"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>宠物领养</title>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js">
        </script>
        <script>
        function del(){
        	if($('input[type=checkbox]:checked').length==0){
        		
        		alert("请选择一行数据信息！");
        		return;
        	}
        	$('input[type=checkbox]:checked').each(function(index,obj){
//         		$.post(,function(data,status){
//         		  });
        		
        		
            	$.ajax({
            		url : "${pageContext.request.contextPath}/del.action?id="+$(obj).attr("id"),
            		type : 'post',
            		async: false
            		});
        		$(obj).remove();
        		 
        	});
        
        	
        	
        	 location.reload(); 
        }
        $(function(){
        	
        	$("#all").click(function(){    
        	    if(this.checked){    
        	        $("input[class='checkbox']").attr("checked", true);   
        	    }else{    
        	        $("input[class='checkbox']").attr("checked", false); 
        	    }    
        	});  
        });
        </script>
</head>
<body>

	 <div style="text-align:right">
		 <input type="button" value="新增" />
		 <input type="button" value="删除" onclick="del()"/>
		 </div>
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #FFE4C4">
 								<td><input type=checkbox id=all id=0></input></td>
								<td align="center" >标题</td>
								<td align="center">开始时间</td>
								<td align="center" >结束时间</td>
							</tr>
					 <c:forEach items="${infos}" var="message"> 
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									 <td><input type=checkbox class="checkbox" id=${message.memoId}></input></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										 >${message.memoTitle}
									</td>
									
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										 >${message.beginTime}
									</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										 >${message.endTime}
									</td>
									 
								</tr>
							</c:forEach>
						</table> 
</body>
</html>