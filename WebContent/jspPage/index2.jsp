<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<script type="text/javascript" src="<%=path%>/js/jquery-1.10.1.min.js">
</script>
		<script type="text/javascript" src="<%=path%>/js/jquery.form.js">
</script>
		
		<script type="text/javascript">
function uploadImage() {
	$(document)
			.ready(
					function() {
						var options = {
							url : "<%=path%>/uploadFile.action",
							type : "POST",
							dataType : "script",
							success : function(msg) {
								if (msg.indexOf("#") > 0) {
									var data = msg.split("#");
									$("#tipDiv").html(data[0]);
									$("#showImage").html("<img src='<%=path%>/showImage.action?imageUrl="+data[1]+"'/>");
								} else {
									$("#tipDiv").html(msg);
								}
							}
						};
						$("#form2").ajaxSubmit(options);
						return false;
					});
}
</script>
<script type="text/javascript">
		function myLoginClick(){
			var savepic=$('#savepic').val();
			if(savepic==null||savepic.length==0){
			Alert("请先上传头像，再保存到数据库中");
			return ;}
			 $.ajax({
				url :"<%=path%>/ModifyImg.action",
				type :"POST",
				dataType :"json",
				data : {"savepic":savepic},
				success : function(data) {
				
				if(data["returnCode"]=="000000"){
			        	 window.document.location.href="/SAES/getHomeViewAction";
		              }
					else{
					$("#tipDiv1").html("保存数据库失败");
					}
					
				},
				error : function() {
					$("#tipDiv1").html("请求失败，请稍后重试");
				}
		  }); 
		}
		</script>
	</head>

	<body>
	<center>
		<form id="form2" method="post" enctype="multipart/form-data">
			<table width="400" border="1" cellspacing="1" cellpadding="10">
				<tr>
					<td height="25">
						浏览图片：
					</td>
					<td>
						<input id="fileupload" name="fileupload" type="file" />
						<div id="tipDiv"></div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" class="right-button02"
							onclick="uploadImage()" value="上传" />
					</td>
				</tr>
			</table>
		</form>
       <form id="form1" >	<fieldset>
			<table width="500px" border="1" cellspacing="1" cellpadding="10">
	<tr><td>头像预览</td><td><input type="text" id="savepic" /><input type="submit" class="right-button02" value="保存到数据库" onclick=" myLoginClick()"/></td></tr>
	<tr><td> <div id="showImage" style="width:200px,height:300px"></div></td><td><div id="tipDiv1"></div></td></tr>
		</table>	</fieldset> </form>
        </center>
	</body>
</html>
