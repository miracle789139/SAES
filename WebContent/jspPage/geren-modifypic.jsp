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
<title>�޸�ͷ��</title>
<base href="<%=basePath%>">
<link
	href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/font-awesome.min.css" />
<script src="<%=request.getContextPath()%>/js/ALERT.js"></script>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/ace.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/ace-rtl.min.css" />
<script src="<%=request.getContextPath()%>/bootstrap/js/html5shiv.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/respond.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-1.4.2.min.js">
</script>
<script type="text/javascript" src="<%=path%>/js/jquery.form.js">
</script>

<script type="text/javascript">
function uploadImage() {
var fileupload=$('#fileupload').val();
			if(fileupload==null||fileupload.length==0){
			Alert("����ѡ��ͷ��");
			return ;}
	$(document)
			.ready(
					function() {
						var options = {
							url : "<%=path%>/uploadFile.action",
							type : "POST",
							dataType : "script",
							success : function(msg) {
							alert("000");
				            if (msg.indexOf("#") > 0) {
									var data = msg.split("#");
									$("#tipDiv").html(data[0]);
									$("#showImage").html("<img src='<%=path%>/showImage.action?imageUrl="+data[1]+"'/>");
								    $("#savepic").val(data[2]);
								} else {
									$("#tipDiv").html(msg);
								}
							}
						};
						$("#form2").ajaxSubmit(options);
						return false;
					});}		
</script>  
<script type="text/javascript">
		function myLoginClick(){
			var savepic=$('#savepic').val();
			if(savepic==null||savepic.length==0){
			Alert("�����ϴ�ͷ���ٱ��浽���ݿ���");
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
					$("#tipDiv1").html("�������ݿ�ʧ��");
					}
					
				},
				error : function() {
				$("#tipDiv1").html("�������ݿ�ɹ�");
					 window.document.location.href="/SAES/queryperson";
				}		  }); 
		}
		</script>
</head>

<body>
	<center>
		<form id="form2" method="post" enctype="multipart/form-data">
			<table width="500px" border="1" cellspacing="1" cellpadding="10">
				<tr>
					<td height="25">���ͷ��</td>
					<td><input id="fileupload" name="fileupload" type="file" />
						<div id="tipDiv"></div></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button"
						class="right-button02" onclick="uploadImage()" value="�ϴ�" /> 
				</td>
				</tr>
			</table>
		</form>
		<form id="form1" >	<fieldset>
			<table width="500px" border="1" cellspacing="1" cellpadding="10">
	<tr><td>ͷ��Ԥ��</td><td><input type="hidden" id="savepic" /><input type="button" class="right-button02" value="���浽���ݿ�" onclick=" myLoginClick()"/></td></tr>
	<tr><td> <div id="showImage" style="width:200px,height:300px"></div></td><td><div id="tipDiv1"></div></td></tr>
		</table>	</fieldset> </form>
	</center>
</body>
</html>
