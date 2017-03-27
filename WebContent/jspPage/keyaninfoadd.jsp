<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <base href="<%=basePath%>">
<script type="text/javascript" src="<%=path%>/js/jquery-1.4.2.min.js">
</script>
<script type="text/javascript" src="<%=path%>/js/jquery.form.js">
</script>
<style type="text/css">
.tableClass td{
height:50px;
}
</style>
     <script type="text/javascript">
function uploadImage() {
var fileupload=$('#fileupload').val();
			if(fileupload==null||fileupload.length==0){
			alert("请先选择文件");
			return ;}
	$(document)
			.ready(
					function() {
						var options = {
							url : "uploadFilepaper",
							type : "POST",
							dataType : "script",
							success : function(msg) { 
						
							
				           if (msg.indexOf("#") > 0) {
				          $("#PROJECT_SOURCE_ID").val("111");
									var data = msg.split("#");
									
									
									$("#FILE_IDS").val(data[1]);
									
									$("#tipDiv").html("<font color='red'>上传成功<font>");
									
								} else {
									$("#tipDiv").html("<font color='red'>请上传txt,doc,docx,rar格式的图片!<font>");
								
							}}
						};
						$("#form2").ajaxSubmit(options);
						return false;
					});}	
</script>  
    <title>My JSP 'keyaninfoadd.jsp' starting page</title>
    
  </head>
  
  <body>
  <div id="lw1">
    <center>
    	<table class="tableClass author"  class="author">
    		<tr>
    			<td style='width:120px;'><h2><font style='color:black'>来源项目：</font></h2></td>
    			<td colspan="3"><input type="text" size="35" class="form-control" name="PROJECT_SOURCE_ID" id="PROJECT_SOURCE_ID" ></td>
    		</tr>
    		<tr>
    			<td><h2><font style='color:black'>论文题目：</font></h2></td>
    			<td colspan="3"><input type="text" size="35" class="form-control" name="NAME" id="NAME" ></td>
    		</tr>
    		<tr>
    			<td><h2><font style='color:black'>论文类型：</font></h2></td>
    			<td colspan="3">
    				<select name="" class="form-control" size="1" name="PAPER_MODE_ID" id="PAPER_MODE_ID"> 
    					<option>---请选择---</option> 
  						<option value="基础研究">基础研究</option>  
						<option value="应用研究">应用研究</option>  
  						<option value="综合研究">综合研究</option>  
  						<option value="其他">其他</option>  
					</select>  
				</td>
    		</tr>
    		<tr>
    			<td><h2><font style='color:black'>发表期刊：</font></h2></td>
    			<td colspan="3"><input type="text" id="PUBLISH_UNIT" size="35" class="form-control" name="PUBLISH_UNIT"  value="点击选择期刊" ></td>
    		</tr>
    		<tr>
    			<td ><h2><font style='color:black'>作者：</font>(<a rel="adda" href="javascript:void(0)">添加</a>)</h2></td>
    			<td><h2><font style='color:black'>姓名</font></h2></td>
    			<td><h2><font style='color:black'>单位</font></h2></td>
    			<td><h2><font style='color:black'>操作</font></h2></td>
    		</tr>
    		<tr>
    			<td ><h2></h2></td>
    			<td><input type="text" class="form-control"  size="8" name="FIRST_AUTHOR_NAME" id="FIRST_AUTHOR_NAME"/></td>
    			<td><input type="text" class="form-control"  size="8" name=""/></td>
    			<td><h2></h2></td>
    		</tr>
    		<tr>
    			<td ><h2></h2></td>
    			<td><input type="text" class="form-control"  size="8" name="OTHER_AUTHOR_NAME" id="OTHER_AUTHOR_NAME"/></td>
    			<td><input type="text" class="form-control"  size="8" name=""/></td>
    			<td><h2></h2></td>
    		</tr>
    		</table>
    		</center>
    		
    		<div><center>
    		<table class="tableClass">
    		<tr>
    			<td style='width:120px'><h2><font style='color:black;'>日期：</font></h2></td>
    			<td colspan="3"><input type="text" id="PUBLISH_DATE" size="35" class="form-control" name="PUBLISH_DATE"/></td>
    		</tr>
    		<tr>
    			<td><h2><font style='color:black'>字数：</font></h2></td>
    			<td colspan="3"><input type="text" id="WORD_NUMBER" size="35" class="form-control" name="WORD_NUMBER"/></td>
    		</tr>
    		<tr>
    			<td><h2><font style='color:black'>论文状态：</font></h2></td>
    			<td colspan="3"><input type="text" id="CHECK_STATUS_ID" size="35" class="form-control" name="CHECK_STATUS_ID"/></td>
    		</tr></table><form id="form2" method="post" enctype="multipart/form-data">
    		<table class="tableClass"><tr><td><font style='color:black'>附件：</font>
    			<input id="fileupload" name="fileupload" type="file" /><input type="hidden" id="FILE_IDS" name="FILE_IDS" size="35" class="form-control" />
    		<input type="button" class="btn btn-info fr" onclick="uploadImage()" value="上传" /><div id="tipDiv"></div></td></tr></table></form><table>
    	<tr>
    			<td colspan="2"><span class="pull-right" ><a href="#"  onclick="chongzhi();return false" class="btn btn-info fr">重置</a></span></td>
    			<td colspan="2"><a rel="add" href="javascript:void(0)" class="btn btn-info fr" >提交</a></td>
    		</tr>
    	</table>
    	</center>
    	</div>
    	</div>
   	<script type="text/javascript">
   	function chongzhi(){
	  var inputs = document.getElementsByTagName("input");//获取所有的input标签对象
	       for(var i=0;i<inputs.length;i++){
	       var obj = inputs[i];
	       obj.value="";
	  }
   	}
   		$(function(){
   			$("a[rel='add']").click(function () {
   				var PROJECT_SOURCE_ID=$('#PROJECT_SOURCE_ID').val();
   				var NAME=$('#NAME').val();
   				var PAPER_MODE_ID=$('#PAPER_MODE_ID').val();
   				var PUBLISH_UNIT=$('#PUBLISH_UNIT').val();
   				var FIRST_AUTHOR_NAME=$('#FIRST_AUTHOR_NAME').val();
   				var OTHER_AUTHOR_NAME=$('#OTHER_AUTHOR_NAME').val();
   				var PUBLISH_DATE=$('#PUBLISH_DATE').val();
   				var WORD_NUMBER=$('#WORD_NUMBER').val();
   			
   				var CHECK_STATUS_ID=$('#CHECK_STATUS_ID').val();
   				var FILE_IDS=$('#FILE_IDS').val();
   				//alert(FILE_IDS);
   				var biaoname="s_paper";
   				$.ajax({
                    type: "post",
                    url: "keyanInfoadd",
                    data: {"PROJECT_SOURCE_ID":PROJECT_SOURCE_ID,"NAME":NAME,"PAPER_MODE_ID":PAPER_MODE_ID,"PUBLISH_UNIT":PUBLISH_UNIT,"FIRST_AUTHOR_NAME":FIRST_AUTHOR_NAME,"OTHER_AUTHOR_NAME":OTHER_AUTHOR_NAME,"PUBLISH_DATE":PUBLISH_DATE,"WORD_NUMBER":WORD_NUMBER,"CHECK_STATUS_ID":CHECK_STATUS_ID,"biaoname":biaoname,"FILE_IDS":FILE_IDS}
                });
                location.href='<%=path%>/jspPage/kyxx-index.jsp';
   			})
   			
   			$("input:text[name='PUBLISH_UNIT']").click(function(){
   			    
   				var idd=$('#PROJECT_SOURCE_ID').val();
   				var sname=$('#NAME').val();
   			   document.getElementById('qk').style.display='block';
    	       document.getElementById('lwlist').style.display='none';
		       document.getElementById('lw').style.display='none';
				 $.ajaxSetup ({
            cache: false //close AJAX cache
                 });
          
				$('#qk').load("magazine?idd='+idd+'&sname='+sname");
	
			})
   				
   			var rowcount=2;
   			$("a[rel='adda']").click(function () {
   				
   				rowcount+=1;
   				var txt="<tr id='row"+rowcount+"'><td ><h2></h2></td><td><input type='text' class='form-control'  size='10' name='OTHER_AUTHOR_NAME' id='OTHER_AUTHOR_NAME'/></td><td><input type='text' class='form-control'  size='10' name=''/></td><td><h2><input type='button' value='删除' id='delea"+rowcount+"'/></h2></td></tr>";
   				$("#author").append(txt);
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
