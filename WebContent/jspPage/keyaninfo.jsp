<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>上海市教育科学研究院</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/smsb.css">
<script src="<%=request.getContextPath()%>/js/jquery-1.10.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/control_zbw.js"></script>
</head>
<body onunload="checkLeave()">
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
				<img src="<%=request.getContextPath()%>/images/user.jpg" alt="用户">
				<a href="">李明明</a>
			</div>
			<div class="info">
				<img src="<%=request.getContextPath()%>/images/info.jpg" alt="信息">
				<span>1</span>
				<!-- <span class="badge">42</span> -->
			</div>			
		</div>
	</div>
	<div class="wrapper">
		<div class="mainMenu">
			<ul>
				<li id="tongzhi">论文</li>
				<li id="gongzuo">著作</li>
				<li id="shenqing">奖项</li>
				<li id="download">培训学习</li>
				<li id="QT">项目</li>
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
				</div><%String NAME="";
						if(request.getParameter("NAME")==null){ %>
				<div id="lw">
				<div class="panel-body">
				<a rel="dele" href="javascript:void(0)" class="btn btn-info fr" id="dele">删除</a>
				<a rel="add" href="javascript:void(0)" class="btn btn-info fr" id="add">新增</a>
				</div>
				
		  		<!-- Table -->
				<table class="table table-bordered table-hover" id = "test">
				        <tr>
				          <th class="col-xs-1">全选</th>
				          <th class="col-xs-4">论文题目</th>
				          <th class="col-xs-1">发表期刊</th>
				          <th class="col-xs-2">作者</th>
				          <th class="col-xs-1">日期</th>
						  <th class="col-xs-1">字数</th>
						  <th class="col-xs-1">论文状态</th>
				          <th class="col-xs-1">操作</th>
				        </tr>
					<tbody>
      				<s:iterator value="pl" status="status">
				       <tr>
				          <td class="col-xs-1"><input type="checkbox" name="check_1" id="check_1" value="${ID}"  ></td>
				          <td class="col-xs-4 tal"><s:property value="NAME"/></td>
				          <td class="col-xs-1"><s:property value="PUBLISH_UNIT"/></td>
				          <td class="col-xs-2"><s:property value="FIRST_AUTHOR_NAME"/>/<s:property value="OTHER_AUTHOR_NAME"/></td>
				          <td class="col-xs-1"><s:property value="PUBLISH_DATE"/></td>
						  <td class="col-xs-1"><s:property value="WORD_NUMBER"/></td>
						  <td class="col-xs-1"><s:property value="CHECK_STATUS_ID"/></td>
				          <td class="col-xs-1"><p><a href="xmsb_edit.html">编辑 </a><strong>|</strong><a href="xmsb_kt.html"> 查看</a> </p>
			              </td>  
			           </tr>
	     			</s:iterator>
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
				</div><%}else{ %>
					<div id='container'></div>
				<%} %>
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
				<div id="zz">
				<div class="panel-body">
				<a rel="dele_2" href="javascript:void(0)" class="btn btn-info fr" id="dele_2">删除</a>
				<a rel="add_2" href="javascript:void(0)" class="btn btn-info fr" id="add_2">新增</a>
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
				          <td class="col-xs-1"><p><a href="xmsb_edit.html">编辑 </a><strong>|</strong><a href="xmsb_kt.html"> 查看</a> </p>
			              </td>
				        </tr>
				        <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal">国家自然科学</td>
				          <td class="col-xs-1">王凯</td>
				          <td class="col-xs-1">2015-09-05</td>
				          <td class="col-xs-1">通过</td>
						  <td class="col-xs-1">未通过</td>
				          <td class="col-xs-1"><p><a href="xmsb_edit.html">编辑 </a><strong>|</strong><a href="xmsb_kt.html"> 查看</a> </p>
			              </td>
				        </tr>
						<tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal">青年项目</a></td>
				          <td class="col-xs-1">王凯</td>
				          <td class="col-xs-1">2015-08-05</td>
				         <td class="col-xs-1">通过</td>
						  <td class="col-xs-1">未通过</td>
				         <td class="col-xs-1"><p><a href="xmsb_edit.html">编辑 </a><strong>|</strong><a href="xmsb_kt.html"> 查看</a> </p>
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
					<button class="btn btn-info fr">删除</button>
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
				          <td class="col-xs-1"><p><a href="xmsb_edit.html">编辑 </a><strong>|</strong><a href="xmsb_kt.html"> 查看</a> </p>
			              </td>
				        </tr>
				        <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal">优秀成果</td>
				          <td class="col-xs-1">王凯</td>
				          <td class="col-xs-1">2015-09-05</td>
				          <td class="col-xs-1">通过</td>
						  <td class="col-xs-1">通过</td>
				          <td class="col-xs-1"><p><a href="xmsb_edit.html">编辑 </a><strong>|</strong><a href="xmsb_kt.html"> 查看</a> </p>
			              </td>
				        </tr>
						<tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal">国家教育规划</a></td>
				          <td class="col-xs-1">王凯</td>
				          <td class="col-xs-1">2015-08-05</td>
				         <td class="col-xs-1">通过</td>
						  <td class="col-xs-1">未通过</td>
				         <td class="col-xs-1"><p><a href="xmsb_edit.html">编辑 </a><strong>|</strong><a href="xmsb_kt.html"> 查看</a> </p>
			              </td>
				        </tr>
						<tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal">上海决策咨询</a></td>
				          <td class="col-xs-1">王凯</td>
				          <td class="col-xs-1">2015-08-05</td>
				          <td class="col-xs-1">通过</td>
						  <td class="col-xs-1">通过</td>
				           <td class="col-xs-1"><p><a href="xmsb_edit.html">编辑 </a><strong>|</strong><a href="xmsb_kt.html"> 查看</a> </p>
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
				<button class="btn btn-info fr">删除</button>
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
				          <td class="col-xs-1"><p><a href="xmsb_edit.html">编辑 </a><strong>|</strong><a href="xmsb_kt.html"> 查看</a> </p>
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
				<button class="btn btn-info fr">删除</button>
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
				           <td class="col-xs-1"><p><a href="xmsb_edit.html">编辑 </a><strong>|</strong><a href="xmsb_kt.html"> 查看</a> </p>
			              </td>
				        </tr>
				        <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal">国家自然科学</td>
				          <td class="col-xs-1">王凯</td>
				          <td class="col-xs-1">2015-09-05</td>
				           <td class="col-xs-1">通过</td>
						  <td class="col-xs-1">通过</td>
				          <td class="col-xs-1"><p><a href="xmsb_edit.html">编辑 </a><strong>|</strong><a href="xmsb_kt.html"> 查看</a> </p>
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
<script type="text/javascript">
	$(function(){
		var NAME="";
		NAME='<%=request.getParameter("NAME") %>';
		var iddd='<%=request.getParameter("iddd") %>';
    	var ssname='<%=request.getParameter("ssname") %>' ;
		$("a[rel='add']").click(function (){
//			$('#lw').load('http://localhost:8080/SAES/jspPage/keyaninfoadd.jsp');
			NAME="点击选择期刊";
			iddd="";
			ssname="";
//			$.ajax({
//				type: "post",
//				url: "keyanInfo",
//				data: {"NAME":NAME}
//			});
			location.href='keyanInfo?NAME='+NAME+'&iddd='+iddd+'&ssname='+ssname;
//			$("#container").load("jspPage/keyaninfoadd.jsp?NAME="+NAME);
		})
		
		$("a[rel='add_2']").click(function (){
			$('#zz').load('http://localhost:8080/SAES/jspPage/zhuzuoadd.jsp');
		})
		
		$("a[rel='dele']").click(function (){
			var userId="";
			$("input:checkbox[name='check_1']:checked").each(function(i){
       			if(0==i){
        			
        			userId=$(this).val();
       			}else{
        			userId+=("','"+$(this).val());
       			}
       			
      		})
			$.ajax({
				 type: "post",
                 url: "keyanInfodele",
                 data: {"userId":userId}
			});
			refresh();
		})
		
		function refresh(){
    		window.location.reload();  		
    	}
    	
		$("#container").load("jspPage/keyaninfoadd.jsp?NAME="+NAME+"&iddd="+iddd+"&ssname="+ssname);
	});
	
</script>
</html>