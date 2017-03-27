<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>著作</title>
      	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/smsb.css">
	<script src="<%=request.getContextPath()%>/js/jquery-1.10.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/control_zbw.js"></script>
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <center>
    	
    	<table>
    		<tr>
    			<td class="col-md-4"><h2>来源项目：</h2></td>
    			<td colspan="3"><input type="text" size="35" class="form-control" name="PROJECT_SOURCE_ID1" id="PROJECT_SOURCE_ID1" ></td>
    		</tr>
    		<tr>
    			<td><h2>书名：</h2></td>
    			<td colspan="3"><input type="text" size="35" class="form-control" name="NAME1" id="NAME1" ></td>
    		</tr>
    		<tr>
    			<td class='col-md-4'><h2>作者：(<a rel="adda" href="javascript:void(0)">添加</a>)</h2></td>
    			<td><h2>姓名</h2></td>
    			<td><h2>单位</h2></td>
    			<td><h2>操作</h2></td>
    		</tr>
    		<tr>
    			<td class='col-md-4'><h2></h2></td>
    			<td><input type="text" class="form-control"  size="8" name="FIRST_AUTHOR_NAME1" id="FIRST_AUTHOR_NAME1"/></td>
    			<td><input type="text" class="form-control"  size="8" name=""/></td>
    			<td><h2></h2></td>
    		</tr>
    		<tr>
    			<td class='col-md-4'><h2></h2></td>
    			<td><input type="text" class="form-control"  size="8" name="OTHER_AUTHOR_NAME1" id="OTHER_AUTHOR_NAME1"/></td>
    			<td><input type="text" class="form-control"  size="8" name=""/></td>
    			<td><h2></h2></td>
    		</tr>
    		</table>
    		</center>
    		
    			<span id="author1" class="author1"></span>	
    		<div><center>
    		<table>
    		<tr>
    			<td class="col-md-4"><h2>出版社：</h2></td>
    			<td colspan="3"><input type="text" size="35" class="form-control" name="PUBLISH_UNIT" id="PUBLISH_UNIT" ></td>
    		</tr>
    		<tr>
    			<td class="col-md-4"><h2>日期：</h2></td>
    			<td colspan="3"><input type="text" size="35" class="form-control" name="PUBLISH_DATE1" id="PUBLISH_DATE1" ></td>
    		</tr>
    		<tr>
    			<td class="col-md-4"><h2>字数：</h2></td>
    		<td colspan="3"><input type="text" size="35" class="form-control" name="WORD_NUMBER1" id="WORD_NUMBER1" ></td>
    		</tr>
    		<tr>
    			<td class="col-md-4"><h2>备注：</h2></td>
    			<td colspan="3"><input type="text" size="35" class="form-control" name="REMARK1" id="REMARK1" ></td>
    		</tr>
    		<tr>
    			<td class="col-md-4"><h2>主编：</h2></td>
    			<td colspan="3"><input type="text" size="35" class="form-control" name="EDITOR1" id="EDITOR1"></td>
    		</tr><tr>
    			<td colspan="2"><span class="pull-right" ><input type="reset" value="重置" class="btn btn-info fr"/></span></td>
    			<td colspan="2"><a rel="addzz" href="javascript:void(0)" class="btn btn-info fr" >提交</a></td>
    		</tr>
    		</table>
    		</center>
    		</div>
    			
    	
    	
    	
    	
    
   	<script type="text/javascript">
   		$(function(){
   			$("a[rel='addzz']").click(function () {
   			alert("mm");
   				var PROJECT_SOURCE_ID=$('#PROJECT_SOURCE_ID1').val();
   				var NAME=$('#NAME1').val();
   				var PUBLISH_UNIT=$('#PUBLISH_UNIT1').val();
   				var FIRST_AUTHOR_NAME=$('#FIRST_AUTHOR_NAME1').val();
   				var OTHER_AUTHOR_NAME=$('#OTHER_AUTHOR_NAME1').val();
   				var PUBLISH_DATE=$('#PUBLISH_DATE1').val();
   				var WORD_NUMBER=$('#WORD_NUMBER1').val();
   				var REMARK=$('#REMARK1').val();
   				var EDITOR=$('#EDITOR1').val();
   				var biaoname="s_book";
   				$.ajax({
                    type: "post",
                    url: "keyanInfoadd",
                    data: {"PROJECT_SOURCE_ID":PROJECT_SOURCE_ID,"NAME":NAME,"PAPER_MODE_ID":PAPER_MODE_ID,"PUBLISH_UNIT":PUBLISH_UNIT,"FIRST_AUTHOR_NAME":FIRST_AUTHOR_NAME,"OTHER_AUTHOR_NAME":OTHER_AUTHOR_NAME,"PUBLISH_DATE":PUBLISH_DATE,"WORD_NUMBER":WORD_NUMBER,"CHECK_STATUS_ID":CHECK_STATUS_ID,"biaoname":biaoname}
                });
                
   			})
   			
   			var rowcount=2;
   			$("a[rel='adda']").click(function () {
   				rowcount+=1;
   				var txt="<center><table><tr id='row"+rowcount+"'><td class='col-md-4'><h2></h2></td><td><input type='text' class='form-control'  size='10' name='OTHER_AUTHOR_NAME' id='OTHER_AUTHOR_NAME'/></td><td><input type='text' class='form-control'  size='10' name=''/></td><td><h2><input type='button' value='删除' id='delea"+rowcount+"'/></h2></td></tr></table></center>";
   				alert(txt);
   				$("#author1").append(txt);
   				
   				$('#delea'+rowcount).click(function(){
   					$('#row'+rowcount).remove();
   					rowcount-=1;
   				})
   				
   			})
   			function deleaaa(){
   				$('#row11').remove();
   			}
   			
   			function refresh(){
    			window.location.reload();  		
    		}
   		});
   	</script>
    
  </body>
   
</html>
