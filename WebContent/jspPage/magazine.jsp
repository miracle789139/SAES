<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'magazine.jsp' starting page</title>
    
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
 <script type="text/javascript">
    	$(function(){
    		$("input:button[id='xz']").click(function(){
    			var ID= $(this).attr("name");
    			var NAME=$('#name_'+ID).html();
    			$("input:text[name='PUBLISH_UNIT']").val(NAME);
    			document.getElementById('qk').style.display='none';
    			document.getElementById('lwlist').style.display='none';
    			document.getElementById('lw').style.display='block';});

 
    		
    	$("a[rel='add5']").click(function (){
    		   
    			document.getElementById('ma2').style.display='block';
    			document.getElementById('ma1').style.display='none';
    		})
    		
    		$("a[rel='add_20']").click(function (){
    			var name=$('#name').val();
    			var level=$('#level').val();
    			var issn=$('#issn').val();
    			var cn=$('#cn').val();
    			var type=$('#type').val();
    			$.ajax({
    				type: "post",
                    url: "magazineadd",
                    data: {"name":name,"level":level,"issn":issn,"cn":cn,"type":type}
    			});
				$("input:text[name='PUBLISH_UNIT']").val(name);
				document.getElementById('qk').style.display='none';
    			document.getElementById('lwlist').style.display='none';
    			document.getElementById('lw').style.display='block';
    		})
    	});
    </script>
  </head>
  
  <body>
    <div id="lw2">
    <div class="panel-body">
		<a rel="add5" href="javascript:void(0)" class="btn btn-info fr" id="add5">新增</a>
	</div>
	<div id="ma1">
    	<table class="table table-bordered table-hover">
    		<tr>
				<th class="col-xs-2"><font style='color:black'>期刊名称</font></th>
				<th class="col-xs-2"><font style='color:black'>期刊级别</font></th>
				<th class="col-xs-2"><font style='color:black'>ISSN号</font></th>
				<th class="col-xs-2"><font style='color:black'>CN号</font></th>
				<th class="col-xs-2"><font style='color:black'>分类</font></th>
				<th class="col-xs-2"><font style='color:black'>选择</font></th>
			</tr>
			<tbody>
				<s:iterator value="ml" status="status">
					<tr>
				   		<td class="col-xs-2" id="name_${ID}" style='color:black'><s:property value="NAME"/></td>
				  		<td class="col-xs-2"><font style='color:black'><s:property value="LEVEL"/></font></td>
				  		<td class="col-xs-2"><font style='color:black'><s:property value="ISSN"/></font></td>
				  		<td class="col-xs-2"><font style='color:black'><s:property value="CN"/></font></td>
				   		<td class="col-xs-2"><font style='color:black'><s:property value="PAPER_TYPE_ID"/></font></td>
				 		<td class="col-xs-2"><input type="button" value="选择" name="${ID}" id="xz"></td>
			 		</tr>
	     		</s:iterator>
			</tbody>
    	</table>
    </div>
    <div id="ma2" style="display:none">
    	<table class="table table-bordered table-hover">
    		<tr>
				<th class="col-xs-2"><font style='color:black'>期刊名称</font></th>
				<th class="col-xs-2"><font style='color:black'>期刊级别</font></th>
				<th class="col-xs-2"><font style='color:black'>ISSN号</font></th>
				<th class="col-xs-2"><font style='color:black'>CN号</font></th>
				<th class="col-xs-2"><font style='color:black'>分类</font></th>
				<th class="col-xs-2"><font style='color:black'>选择</font></th>
			</tr>
			<tr>
				<td class="col-xs-2"><input type="text" id="name" size="35" class="form-control" name="name"/></td>
				<td class="col-xs-2"><input type="text" id="level" size="35" class="form-control" name="level"/></td>
				<td class="col-xs-2"><input type="text" id="issn" size="35" class="form-control" name="issn"/></td>
				<td class="col-xs-2"><input type="text" id="cn" size="35" class="form-control" name="cn"/></td>
				<td class="col-xs-2"><input type="text" id="type" size="35" class="form-control" name="type"/></td>
				<td class="col-xs-2"><a rel="add_20" href="javascript:void(0)" class="btn btn-info fr" id="add_20">添加并选择</a></td>
			</tr>
    	</table>
    </div>
    </div>
  
  </body>
</html>
