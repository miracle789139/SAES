<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/xmsb_kt.css">
<script src="<%=request.getContextPath()%>/js/jquery-1.10.1.min.js"></script>

<script type="text/javascript">

</script>
<style type="text/css">
<!--
.STYLE1 {font-size: 10px}
-->
</style>
<title>上海市教育科学研究院</title>
</head>
<body>
	<div class="top">
		<div class="topbar">
			<div class="logo">
				上海市教育科学研究院
				Shanghai Academic of Education Sciences
			</div>
			<div class="logout">
				<a href="1.html">[退出]</a>
			</div>
			<div class="user">
				<img src="images/user.jpg" alt="用户">
				<a href="">某某某</a>
			</div>
			<div class="info">
				<img src="images/info.jpg" alt="信息">
				<span>1</span>
				<!-- <span class="badge">42</span> -->
			</div>			
		</div>
	</div>
	<div class="wrapper row content tongzhi">
		<div class="col-xs-12 mainPanel">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<span>院外项目基本信息添加</span>
					<button class="btn btn-info fr"><a href="/SAES/appmana-index">返回</a></button>
					
				</div>
				

		  		<!-- Table -->
				<!-- Table -->
				<form action="/SAES/appmana-addApply" method="post">
				<table class="table table-bordered table-hover">
					
      				<tbody>
      				
				       <tr>
				          <td colspan="2" class="col-xs-1">项目名称</td>
				          <td colspan="7" class="col-xs-1">
				              ${insertInfo.applyName}
				    
                          </td>
			          </tr>
				        <tr>
				          <td colspan="2" class="col-xs-1">项目来源</td>
				          <td colspan="7" class="col-xs-1">
				              ${insertInfo.projectSourceUnit}
                          </td>
			            </tr>
						<tr>
				          <td colspan="2" class="col-xs-1">项目性质</td>
				          <td colspan="7" class="col-xs-1">
				              ${insertInfo.projectClass}
                          </td>
				        </tr>
				        <tr>
				          <td colspan="2" class="col-xs-1">项目类型</td>
				          <td colspan="7" class="col-xs-1">
				              ${insertInfo.projectType}
                          </td>
				        </tr>
						<tr>
				          <tr>
				          <td colspan="2" class="col-xs-1">负责人姓名</td>
				          <td colspan="2" class="col-xs-1">
				              ${insertInfo.applierName}
                          </td>
				          <td width="8%" class="col-xs-1">性别</td>
				          <td width="8%" class="col-xs-1">
				              ${insertInfo.sex}
				          </td>
				          <td width="8%" class="col-xs-1">身份证号码</td>
				          <td colspan="2" class="col-xs-1">
				              ${insertInfo.idCard}
				          </td>
				        </tr>
			            </tr>
						<tr>
				          <td colspan="2" class="col-xs-1">行政职务</td>
				          <td colspan="2" class="col-xs-1">
				               ${insertInfo.duty}
				          </td>
				          <td width="8%" class="col-xs-1">职称</td>
				          <td width="8%" class="col-xs-1">
				              ${insertInfo.title}
				          </td>
				          <td width="8%" class="col-xs-1">研究专长</td>
				          <td colspan="2" class="col-xs-1">
				              ${insertInfo.researchField}
				          </td>
			            </tr>
						<tr>
				          <td colspan="2" class="col-xs-1">所在单位</td>
				          <td colspan="3" class="col-xs-1">
				              ${insertInfo.school}
				          </td>
				          <td colspan="2" class="col-xs-1">电子信箱</td>
				          <td colspan="2" class="col-xs-1">
				             ${insertInfo.email}
				          </td>
			            </tr>
			            <tr>
				          <td colspan="2" class="col-xs-1">通讯地址</td>
				          <td colspan="3" class="col-xs-1">
                              ${insertInfo.adress}
                          </td>
				          <td colspan="2" class="col-xs-1">邮政编码</td>
				          <td colspan="2" class="col-xs-1">
                              ${insertInfo.postalCode}
                          </td>
			            </tr>
						 <tr>
				           <td colspan="2" class="col-xs-1">联系电话</td>
				          <td colspan="7" class="col-xs-1">（手机）${insertInfo.mobile}（家庭）${insertInfo.telHome}（单位）${insertInfo.telOffice}</td>
			          </tr>
					  
						<tr>
						    <td class="col-xs-1"><a href="#">添加附件：</a></td>
						</tr>
						<tr>
						
					      <td colspan="9" align="right" class="col-xs-1"><button class="btn btn-info fr" type="submit">保存</button></td>
						</tr>
				    </tbody>
				</table>
				</form>
				
			</div>
		</div>
	</div>
	
<script src="<%=request.getContextPath()%>/js/jquery-1.10.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/control.js"></script>
</body>
</html>