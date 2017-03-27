<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.*" %>
<%@ page import="edu.usst.model.*" %>
<%@ taglib prefix="c" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>上海市教育科学研究院</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/smsb.css">
<script src="<%=request.getContextPath()%>/js/jquery-1.10.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
//JavaScript Document 
$(document).ready(function() { 
	
/* 批量删除 */ 
$("#dele").click(function() { 
// 判断是否至少选择一项 
var checkedNum = $("input[name='check']:checked").length; 
if(checkedNum == 0) { 
alert("请选择至少一项！"); 
return; 
} 
// 批量选择 
if(confirm("确定要删除所选项目？")) { 
var checkedList = new Array(); 
$("input[name='check']:checked").each(function() { 
checkedList.push($(this).val()); 
}); 
$.ajax({ 
type: "POST", 
url: "applyInfoDele", 
data: {'delitems':checkedList.toString()}, 
 success: function(result) { 
$("[name ='check']:checkbox").attr("checked", false); 
window.location.reload(); 
} 
}); 
} 
}); 
});
</script>
<script src="<%=request.getContextPath()%>/js/control_zbw.js"></script>
</head>
<body>

   
	<tags:common_header />
	<%--最顶部的头--%>
	<div class="wrapper">
		<div class="mainMenu">
			<ul>
				<li id="tongzhi">课题申报</li>
				<li id="gongzuo">结题申报</li>
				<li id="shenqing">报奖申报</li>
				<li id="download">团队申报</li>
				<li id="QT">其他申报</li>
			</ul>
		</div>
	</div>
	<div class="wrapper row content tongzhi">
		<div class="col-xs-12 mainPanel">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<span>申报列表</span>
					<span class="fr">共10项</span>
				</div>
				<div class="panel-body">
				<button  class="btn btn-danger fr" ><a rel="dele" href="javascript:void(0)" id="dele" var="dele">删除</a></button>
					
					<button class="btn btn-info fr"><a data-toggle="modal" href="#myModal" >院内新增</a></button>

                   <div class="modal" id="myModal">
                       <div class="modal-header">
                           <a class="close" data-dismiss="modal"><font color="white">×</font></a>
                           <h3><font color="white" >请选择院内项目类型</font></h3>
                       </div>
                       <div class="modal-body">
                           <ul type="disc">
                               <li><a href="/SAES/appmana-insert1"><font color="white" >新 进 人 员 研 究 项 目</font></a></li>
                               <li><a href="/SAES/appmana-insert2"><font color="white" >中 青 年 研 究 项 目</font></a></li>
                               <li><a href="/SAES/appmana-insert3"><font color="white" >重 大 研 究 项 目</font></a></li>
                           </ul>
                       </div>
                       <div class="modal-footer">
                           <a href="#" class="btn" data-dismiss="modal"><font color="white" >关闭</font></a>
                       </div>
</div>
					<button class="btn btn-info fr"><a href="/SAES/appmana-insertwai">院外新增</a></button>
				</div>
				<%
				    List<ProApplyInfo> applyInfos = (List<ProApplyInfo>)request.getAttribute("applyInfos");
				%>
				
		  		<!-- Table -->
				<table class="table table-bordered table-hover" id="mytable" >
					<thead>
				        <tr>
				          <th class="col-xs-1">全选</th>
				          <th class="col-xs-1">课题申报编号</th>
				          <th class="col-xs-1">课题申报名称</th>
				          <th class="col-xs-1">申报人</th>
				          <th class="col-xs-1">发布时间</th>
				          <th class="col-xs-1">所审核</th>
						  <th class="col-xs-1">院审核</th>
				          <th class="col-xs-1">操作</th>
				        </tr>
      				</thead>
      				<tbody>
      				<%
      				    for(ProApplyInfo applyInfo : applyInfos)
      				    {String proId = applyInfo.getApplyId();
      				    //System.out.println(proId);
      				   
      				%>
      				<tr>
				          <td class="col-xs-1">
				          <input type="checkbox" id="chk" name="check" value="<%= applyInfo.getApplyId() %>">
				          </td>
				          <td class="col-xs-1" id="shenbaoid" value="<%= applyInfo.getApplyId() %>"><%= applyInfo.getApplyId() %></td>
				          <td class="col-xs-1" ><%= applyInfo.getProName() %></td>
				          <td class="col-xs-1"><%= applyInfo.getApplierName() %></td>
				          <td class="col-xs-1"><%= applyInfo.getCreateTime() %></td>
				          <td class="col-xs-1"><%= applyInfo.getSuoCheckState()%></td>
						  <td class="col-xs-1"><%= applyInfo.getYuanCheckState()%></td>
				          <td class="col-xs-1"><p><a href="/SAES/editPro?proId=<%= applyInfo.getApplyId() %>">编辑 </a><strong>|</strong><a href="/SAES/appmanaCheck?applyId=<%=applyInfo.getApplyId() %>"> 查看</a>  <strong>|</strong><a href="/SAES/appmanaPrint?applyId=<%=applyInfo.getApplyId() %>"> 打印</a></p>
			              </td>
			           </tr>
			      <%
      				    }
			      %>
			         
				     			       
				    </tbody>
				</table>
				<nav class="page">
				  <ul class="pagination ">
				    <li><a href="#">|&lt;</a></li>
				    <li><a href="#">&lt;</a></li>
				    <li><a href="#"><input type="number" placeholder="1" value="2">/9</a></li>
				    <!-- <li><a href="#">/9</a></li> -->
				    <li><a href="#">&gt;</a></li>
				     <li><a href="#">&gt;|</a></li>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
	<div class="wrapper row content gongzuo">
		<div class="col-xs-12 mainPanel">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<span>申报列表</span>
					<span class="fr">共10项</span>
				</div>
				<div class="panel-body">
				<button class="btn btn-danger fr">删除</button>
					<button class="btn btn-info fr">新增</button>
				</div>

		  		<!-- Table -->
				<table class="table table-bordered table-hover">
				<thead>
				        <tr>
				          <th class="col-xs-1">全选</th>
				          <th class="col-xs-5">课题申报名称</th>
				          <th class="col-xs-1">申报人</th>
				          <th class="col-xs-1">发布时间</th>
				          <th class="col-xs-1">所审核</th>
						  <th class="col-xs-1">院审核</th>
				          <th class="col-xs-1">操作</th>
				        </tr>
      				</thead>
					<tbody>
				         <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal">全国哲学社会</td>
				          <td class="col-xs-1">王凯</td>
				          <td class="col-xs-1">2015-08-05</td>
				          <td class="col-xs-1">通过</td>
						  <td class="col-xs-1">未通过</td>
				          <td class="col-xs-1"><p><a href="/SAES/appmana-edit">编1辑 </a><strong>|</strong><a href="/SAES/appmana-check"> 查看</a> </p>
			              </td>
				        </tr>
				        <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal">国家自然科学</td>
				          <td class="col-xs-1">王凯</td>
				          <td class="col-xs-1">2015-09-05</td>
				          <td class="col-xs-1">通过</td>
						  <td class="col-xs-1">未通过</td>
				          <td class="col-xs-1"><p><a href="/SAES/appmana-edit">编2辑 </a><strong>|</strong><a href="/SAES/appmana-check"> 查看</a> </p>
			              </td>
				        </tr>
						<tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal">青年项目</a></td>
				          <td class="col-xs-1">王凯</td>
				          <td class="col-xs-1">2015-08-05</td>
				         <td class="col-xs-1">通过</td>
						  <td class="col-xs-1">未通过</td>
				         <td class="col-xs-1"><p><a href="/SAES/appmana-edit">编3辑 </a><strong>|</strong><a href="/SAES/appmana-check"> 查看</a> </p>
			              </td>
				        </tr>
				    </tbody>
				</table>
				<nav class="page">
				  <ul class="pagination ">
				    <li><a href="#">|&lt;</a></li>
				    <li><a href="#">&lt;</a></li>
				    <li><a href="#"><input type="number" placeholder="1" value="2">/9</a></li>
				    <!-- <li><a href="#">/9</a></li> -->
				    <li><a href="#">&gt;</a></li>
				     <li><a href="#">&gt;|</a></li>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
	<div class="wrapper row content shenqing">
		<div class="col-xs-12 mainPanel">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<span>申报列表</span>
					<span class="fr">共10项</span>
				</div>
				<div class="panel-body">
					<button class="btn btn-danger fr">删除</button>
					<button class="btn btn-info fr">新增</button>
				</div>

		  		<!-- Table -->
				<table class="table table-bordered table-hover">
				<thead>
				        <tr>
				          <th class="col-xs-1">全选</th>
				          <th class="col-xs-5">课题申报名称</th>
				          <th class="col-xs-1">申报人</th>
				          <th class="col-xs-1">发布时间</th>
				           <th class="col-xs-1">所审核</th>
						  <th class="col-xs-1">院审核</th>
				         <th class="col-xs-1">操作</th>
				        </tr>
      				</thead>
					<tbody>
				        <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal">全国哲学社会</td>
				          <td class="col-xs-1">王凯</td>
				          <td class="col-xs-1">2015-08-05</td>
				          <td class="col-xs-1">通过</td>
						  <td class="col-xs-1">未通过</td>
				          <td class="col-xs-1"><p><a href="/SAES/appmana-edit">编4辑 </a><strong>|</strong><a href="/SAES/appmana-check"> 查q看</a></p>
			              </td>
				        </tr>
				        <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal">优秀成果</td>
				          <td class="col-xs-1">王凯</td>
				          <td class="col-xs-1">2015-09-05</td>
				          <td class="col-xs-1">通过</td>
						  <td class="col-xs-1">通过</td>
				          <td class="col-xs-1"><p><a href="/SAES/appmana-edit">编5辑 </a><strong>|</strong><a href="/SAES/appmana-check"> 查看</a> </p>
			              </td>
				        </tr>
						<tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal">国家教育规划</a></td>
				          <td class="col-xs-1">王凯</td>
				          <td class="col-xs-1">2015-08-05</td>
				         <td class="col-xs-1">通过</td>
						  <td class="col-xs-1">未通过</td>
				         <td class="col-xs-1"><p><a href="/SAES/appmana-edit">编6辑 </a><strong>|</strong><a href="/SAES/appmana-check"> 查看</a> </p>
			              </td>
				        </tr>
						<tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal">上海决策咨询</a></td>
				          <td class="col-xs-1">王凯</td>
				          <td class="col-xs-1">2015-08-05</td>
				          <td class="col-xs-1">通过</td>
						  <td class="col-xs-1">通过</td>
				           <td class="col-xs-1"><p><a href="/SAES/appmana-edit">编7辑 </a><strong>|</strong><a href="/SAES/appmana-check"> 查看</a> </p>
			              </td>
				        </tr>
				    </tbody>
				</table>
				<nav class="page">
				  <ul class="pagination ">
				    <li><a href="#">|&lt;</a></li>
				    <li><a href="#">&lt;</a></li>
				    <li><a href="#"><input type="number" placeholder="1" value="2">/9</a></li>
				    <!-- <li><a href="#">/9</a></li> -->
				    <li><a href="#">&gt;</a></li>
				     <li><a href="#">&gt;|</a></li>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
	<div class="wrapper row content download">
		<div class="col-xs-12 mainPanel">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<span>申报列表</span>
					<span class="fr">共10项</span>
				</div>
				<div class="panel-body">
				<button class="btn btn-danger fr">删除</button>
					<button class="btn btn-info fr">新增</button>
				</div>

		  		<!-- Table -->
				<table class="table table-bordered table-hover">
				<thead>
				        <tr>
				          <th class="col-xs-1">全选</th>
				          <th class="col-xs-5">课题申报名称</th>
				          <th class="col-xs-1">申报人</th>
				          <th class="col-xs-1">发布时间</th>
				         <th class="col-xs-1">所审核</th>
						  <th class="col-xs-1">院审核</th>
				          <th class="col-xs-1">操作</th>
				        </tr>
      				</thead>
					<tbody>
				        
				       
						<tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal">国家教育规划</td>
				          <td class="col-xs-1">王凯</td>
				          <td class="col-xs-1">2015-08-05</td>
				          <td class="col-xs-1">通过</td>
						  <td class="col-xs-1">通过</td>
				          <td class="col-xs-1"><p><a href="/SAES/appmana-edit">编8辑 </a><strong>|</strong><a href="/SAES/appmana-check"> 查看</a> </p>
			              </td>
				        </tr>
						
				    </tbody>
				</table>
				<nav class="page">
				  <ul class="pagination ">
				    <li><a href="#">|&lt;</a></li>
				    <li><a href="#">&lt;</a></li>
				    <li><a href="#"><input type="number" placeholder="1" value="2">/9</a></li>
				    <!-- <li><a href="#">/9</a></li> -->
				    <li><a href="#">&gt;</a></li>
				     <li><a href="#">&gt;|</a></li>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
	<div class="wrapper row content QT">
		<div class="col-xs-12 mainPanel">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<span>申报列表</span>
					<span class="fr">共10项</span>
				</div>
				<div class="panel-body">
				<button class="btn btn-danger fr">删除</button>
					<button class="btn btn-info fr">新增</button>
				</div>

		  		<!-- Table -->
				<table class="table table-bordered table-hover">
				<thead>
				        <tr>
				          <th class="col-xs-1">全选</th>
				          <th class="col-xs-5">课题申报名称</th>
				          <th class="col-xs-1">申报人</th>
				          <th class="col-xs-1">发布时间</th>
				           <th class="col-xs-1">所审核</th>
						  <th class="col-xs-1">院审核</th>
				          <th class="col-xs-1">操作</th>
				        </tr>
      				</thead>
					<tbody>
				         <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal">出版资助</td>
				          <td class="col-xs-1">王凯</td>
				          <td class="col-xs-1">2015-08-05</td>
				           <td class="col-xs-1">通过</td>
						  <td class="col-xs-1">通过</td>
				           <td class="col-xs-1"><p><a href="/SAES/appmana-edit">编9辑 </a><strong>|</strong><a href="/SAES/appmana-check"> 查看</a> </p>
			              </td>
				        </tr>
				        <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal">国家自然科学</td>
				          <td class="col-xs-1">王凯</td>
				          <td class="col-xs-1">2015-09-05</td>
				           <td class="col-xs-1">通过</td>
						  <td class="col-xs-1">通过</td>
				          <td class="col-xs-1"><p><a href="/SAES/appmana-edit">编10辑 </a><strong>|</strong><a href="/SAES/appmana-check"> 查看</a> </p>
			              </td>
				        </tr>
						
						
				    </tbody>
				</table>
				<nav class="page">
				  <ul class="pagination ">
				    <li><a href="#">|&lt;</a></li>
				    <li><a href="#">&lt;</a></li>
				    <li><a href="#"><input type="number" placeholder="1" value="2">/9</a></li>
				    <!-- <li><a href="#">/9</a></li> -->
				    <li><a href="#">&gt;</a></li>
				     <li><a href="#">&gt;|</a></li>
				  </ul>
				</nav>
			</div>
		</div>
	</div>



</body>
</html>