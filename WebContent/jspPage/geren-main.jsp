<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.util.*"%>
<%@ page import="edu.usst.model.*"%>
<%@ taglib prefix="c" uri="/struts-tags"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>上海市教育科学研究院</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/smsb.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/font-awesome.min.css" />

<!--[if IE 7]>-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/font-awesome-ie7.min.css" />
<!--<![endif]-->
<!-- ace styles -->

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/ace.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/ace-rtl.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/ace-skins.min.css" />

<!--[if lte IE 8]>-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap/css/ace-ie.min.css" />
<!--<![endif]-->

<script src="<%=request.getContextPath()%>/js/jquery-1.10.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/control_zbw.js"></script>
<script src="<%=request.getContextPath()%>/js/ALERT.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.form.js"></script>
<style type="text/css">
.itemTitle {
	line-height: 30px;
}
</style>

</head>
<body style="background-color: #CDCDCD">
	<div class="top">
		<div class="topbar">
			<div class="logo">上海市教育科学研究院 Shanghai Academic of Education
				Sciences</div>
			<div class="logout">
				<a href="<%=request.getContextPath()%>/SAES/logoutAction">[退出]</a>
			</div>
			<div class="user">
				<img src="<%=request.getContextPath()%>/images/user.jpg" alt="用户">
				<a href="">${PersonList.NAME}</a>
			</div>
			<div class="info">
				<img src="<%=request.getContextPath()%>/images/info.jpg" alt="信息">
				<span>1</span>
				<!-- <span class="badge">42</span> -->
			</div>
		</div>
	</div>
	<div class="container" style="background-color: #CDCDCD">
		<table class="col-xs-12 mainPanel">
			<tr>
				<td style="min-width: 200px">
					<div
						style="background-color: #E6E8FA; margin-top: 10px; margin-right: 15px; height: 430px;">
						<div style="height: 30px; background-color: #3AA5F3">
							<a href="personInfo" class="itemTitle">个人信息</a>
						</div>
						<div class="center" style="margin: 30px;">
							<%--  <a href="<%=request.getContextPath()%>/jspPage/geren-modifypic.jsp" target="_blank" title="单击可更换头像" > --%>
							<a href="#none" onclick="openDialog()" title="单击可更换头像"> <s:if
									test="#request.PersonList.PHOTO_ID==null">
									<img id="myHeadImg" src="<%=request.getContextPath()%>/images/ren.jpg"
										width="150px" />
								</s:if>
								<s:else>
									<img id="myHeadImg" src="<%=request.getContextPath()%>/${PersonList.PHOTO_ID}"
										width="150px" style="max-height: 200px"/>
								</s:else></a>
						</div>
						<div>
							<ul style="text-align: left; margin-left: 40px;">

								<li>姓名：${PersonList.NAME}</li>
								<li>工号：${PersonList.PERSON_ID}</li>
								<li>性别：${PersonList.SEXID}</li>
								<li>职务：${PersonList.DUTY}</li>
								<li>职称：${PersonList.TITLE_ID}</li>
								<li>电话：${PersonList.MOBILE}</li>
							</ul>
						</div>
					</div>
				</td>
				<td><div
						style="background-color: #E6E8FA; margin-top: 10px; margin-right: 15px;">
						<div style="height: 30px; background-color: #3AA5F3">
							<a href="<%=request.getContextPath()%>/notify_view"
								class="itemTitle">个人日程</a>
						</div>
						<div>
							<img src="<%=request.getContextPath()%>/images/rili.png"
								style="width: 100%; height: 200px" />
						</div>
						<div style="height: 30px; background-color: #3AA5F3">
							<a href="<%=request.getContextPath()%>/notify_view"
								class="itemTitle">代办事项</a>
						</div>
						<div>
							<img src="<%=request.getContextPath()%>/images/daibanxiang.jpg"
								style="width: 100%; height: 170px" />
						</div>

					</div></td>
				<td style="min-width: 200px">
					<div style="background-color: #E6E8FA; margin-top: 10px;">
						<div style="height: 30px; background-color: #3AA5F3">
							<a href="<%=request.getContextPath()%>/pro_manage"
								class="itemTitle"> 我的项目</a>
						</div>
						<div class="center" style="width: 100%; height: 200px">
							<s:if test="#request.proManageModels==null">您当前没有项目</s:if>
							<s:if test="#request.proManageModels">
								<center>
									<table>
										<!-- <tr>
											<td>项目名称</td>
										</tr> -->
										<s:iterator value="#request.proManageModels" var="sa" status="st" >
										<s:if test="#st.count<11">
											<tr>
												<td><a href="pro_manage"><s:property
															value="#sa.PROJECT_NAME" /></a></td>
											</tr>
											</s:if>
										</s:iterator>
									</table>
								</center>
							</s:if>
						</div>
						<div style="height: 30px; background-color: #3AA5F3"
							class="itemTitle">友情链接</div>
						<div class="center" style="width: 100%; height: 170px">
							<ul>
								<li><a href="http://www.paper.edu.cn/" target="_blank"
									class="channel">中国科技论文在线</a></li>
								<li><a href="http://www.moe.edu.cn/" target="_blank"
									class="channel">中华人民共和国教育部</a></li>
								<li><a href="http://www.chsi.com.cn/" target="_blank"
									class="channel">中国高等教育学生信息网</a></li>
								<li><a href="http://www.shmec.gov.cn/" target="_blank"
									class="channel">上海市教育委员会</a></li>
								<li><a href="http://www.sinori.cn/jsp/index.jsp"
									target="_blank" class="channel">中国科研诚信网</a></li>
								<li><a href="http://www.moe.edu.cn/" target="_blank"
									class="channel">中华人民共和国教育部</a></li>
								<li><a href="http://www.cas.ac.cn" target="_blank"
									class="channel">中国科学院</a></li>
								<li><a href="http://www.cae.cn" target="_blank"
									class="channel">中国工程院</a></li>
								<li><a href="http://www.cast.org.cn" target="_blank"
									class="channel">中国科学技术协会</a></li>



							</ul>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div id="overlay"
		style="height: 100%; width: 100%; position: fixed; left: 0px; top: 0px; z-index: 1040 !important; background: rgba(0, 0, 0, 0.25); opacity: 0.7 !important; display: none"></div>
	<div id="uploadImg" class="ui-widget ui-widget-content ui-corner-all ui-jqdialog jqmID1"
		aria-hidden="false" aria-labelledby="edithdgrid-table" role="dialog" tabindex="-1"	dir="ltr"
		style="height: 335px; width: 350px; position: fixed; left: 30%; top: 20%; z-index: 1050 !important; background: #ffffff; display: none">
		<div class="ui-jqdialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
		<div class="widget-header">
		<span class="ui-jqdialog-title">更换头像 </span>
		<a class="ui-jqdialog-titlebar-close ui-corner-all" style="position: absolute; top: 5px;" href="javascript:void(0)" onclick="closeDialog()"><span class="ui-icon ui-icon-closethick"></span></a>
		</div>
		</div>
		<div class="ui-jqdialog-content ui-widget-content">
		<form id="imgForm" name="imgForm" class="FormGrid" style="width:auto;overflow:auto;position:relative;height:auto;" action="ModifyImg" method="post" enctype="multipart/form-data">
		<table cellpadding="0" cellspacing="0" border="0" style="width:100%">
			<tr class="FormData">
				<td>选择图片</td>
				<td>
				<input id="headImg" name="headImg" style="width: 280px;" onchange="javascript:setImagePreviews();"
						accept="image/*"	 type="file"></input>
				 <input id="userId" name="userId" style="display:none"  type="text" value="${PersonList.ID}"></input>
				</td>
			</tr>
			<tr class="FormData">
				<td colspan="2">
					<div style="margin: 0px auto; ">
						<div id="dd" style="margin-left: 55px;"></div>
					</div>
				</td>
			</tr>
			<tr id="Act_Buttons" >
				<td class="EditButton" colspan="2" style="text-align:right">
				<a class="fm-button ui-state-default ui-corner-all fm-button-icon-left btn btn-sm btn-primary" href="javascript:void(0)" onclick="uploadImgClick()">
				<i class="icon-ok"></i>确定
				</a> 
				<a  class="fm-button ui-state-default ui-corner-all fm-button-icon-left btn btn-sm" href="javascript:void(0)" onclick="closeDialog()"> 
				<i class="icon-remove"></i>取消
				</a></td>
			</tr>
		</table>
		</form>
		</div>
		
	</div>
	
	<script type="text/javascript">
		function openDialog() {
			$("#overlay").css("display", "block");
			$("#uploadImg").css("display", "block");
		}
		
		function closeDialog(){
			$("#overlay").css("display", "none");
			$("#uploadImg").css("display", "none");
		}


    //下面用于多图片上传预览功能

    function setImagePreviews(avalue) {
        var docObj = document.getElementById("headImg");
      //判断类型
        var name=docObj.value;
        var fileName = name.substring(name.lastIndexOf(".")+1).toLowerCase();
        if(fileName !="jpg" && fileName !="jpeg" && fileName !="png"&& fileName !="gif"){
          alert("请选择图片格式文件上传(jpg,png,gif,jpeg)！");
          $("#headImg").value="";
            return
        }
        var dd = document.getElementById("dd");
        var fileList = docObj.files;
        for (var i = 0; i < fileList.length; i++) {            
            dd.innerHTML += "<div style='float:left' > <img id='img" + i + "'  /> </div>";
            var imgObjPreview = document.getElementById("img"+i); 
            if (docObj.files && docObj.files[i]) {
                //火狐下，直接设img属性
                imgObjPreview.style.display = 'block';
                imgObjPreview.style.width = '180px';
                imgObjPreview.style.height = '180px';
                //imgObjPreview.src = docObj.files[0].getAsDataURL();
                //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
                imgObjPreview.src = window.URL.createObjectURL(docObj.files[i]);
            }
            else {
                //IE下，使用滤镜
                docObj.select();
                var imgSrc = document.selection.createRange().text;
                alert(imgSrc)
                var localImagId = document.getElementById("img" + i);
                //必须设置初始大小
                localImagId.style.width = "150px";
                localImagId.style.height = "195px";
                //图片异常的捕捉，防止用户修改后缀来伪造图片
                try {
                    localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                    localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
                }
                catch (e) {
                    alert("您上传的图片格式不正确，请重新选择!");
                    return false;
                }
                imgObjPreview.style.display = 'none';
                document.selection.empty();
            }
        }  
        return true;
    }
    
    function uploadImgClick(){
    	var savepic=$('#headImg').val();
		if(savepic==null||savepic.length==0){
		Alert("请先选择图片");
		return ;}
		 var fileName = savepic.substring(savepic.lastIndexOf(".")+1).toLowerCase();
		if(fileName !="jpg" && fileName !="jpeg" && fileName !="png"&& fileName !="gif"){
			Alert("请选择图片格式文件上传(jpg,png,gif,jpeg)！");
		     return
		 }
            var options  = {    
                url:'ModifyImg',    
                type:'post',  
                dataType:'json',
                data : {"savepic":savepic},
                success:function(data){
                     if(data["returnCode"] == "000000"){  
                         var url = data["returnDescipt"]; 
                         Alert("头像更换成功");
         				var imgUrl="<%=request.getContextPath()%>/"+url;
         				$("#myHeadImg").attr("src",imgUrl);
         				$("#overlay").css("display", "none");
         				$("#uploadImg").css("display", "none"); 
                     }else{  
                         Alert("头像更换失败");
                     }  
                 } ,
                 error:function(){
                	 Alert("头像更换失败");
                 }
            };    
            $("#imgForm").ajaxSubmit(options);  
            //
            $("#overlay").css("display", "none");
			$("#uploadImg").css("display", "none"); 
			//1s刷新页面
			window.setTimeout(function(){ 
				 location.reload();
			},1000); 

			
        }  
		
</script>
</body>
</html>