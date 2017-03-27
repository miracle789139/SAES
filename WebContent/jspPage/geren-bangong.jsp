<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>上海市教育科学研究院</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/fullcalendar.css">
<script src="<%=request.getContextPath()%>/js/jquery-1.10.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/fullcalendar.min.js"></script>
<script type="text/javascript">
<script>
   
</script>
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
				<a href="">李明明</a>
			</div>
			<div class="info">
				<img src="images/info.jpg" alt="信息">
				<span>1</span>
				<!-- <span class="badge">42</span> -->
			</div>			
		</div>
	</div>
	<div class="wrapper">
		<div class="mainMenu">
			<ul>
				<li id="tongzhi">通知公告</li>
				<li id="gongzuo">工作安排</li>
				<li id="shenqing">申请汇报</li>
				<li id="download">下载专区</li>
			</ul>
		</div>
	</div>
	<div class="wrapper row content tongzhi">
		<div class="col-xs-12 mainPanel">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<span>公告列表</span>
					<span class="fr">共100项</span>
				</div>
				<div class="panel-body">
					<span>全部 未阅读 已阅读</span>
					<button class="btn btn-info fr">查询</button>
				</div>

		  		<!-- Table -->
				<table class="table table-bordered table-hover">
					<thead>
				        <tr>
				          <th class="col-xs-1">全选</th>
				          <th class="col-xs-5">公共标题</th>
				          <th class="col-xs-1">发布人</th>
				          <th class="col-xs-1">发布时间</th>
				          <th class="col-xs-1">查询人数</th>
				          <th class="col-xs-1">操作</th>
				        </tr>
      				</thead>
      				<tbody>
				       <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal"><a href="http://www.baidu.com">关于做好2014年国家自然科学基金项目结题报告填报工作的通知 </a></td>
				          <td class="col-xs-1">李明明</td>
				          <td class="col-xs-1">2015-08-05</td>
				          <td class="col-xs-1">30</td>
				          <td class="col-xs-1">删除</td>
				        </tr>
				        <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal"><a href="#">科技部基础研究司关于2014年973计划项目结题验收工作安排的通知 </a></td>
				          <td class="col-xs-1">李明明</td>
				          <td class="col-xs-1">2015-08-05</td>
				          <td class="col-xs-1">30</td>
				          <td class="col-xs-1">删除</td>
				        </tr>
				          <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal"><a href="#">关于973计划、国家重大科学研究计划2014年结题项目财务验收工作安排的通知  </a></td>
				          <td class="col-xs-1">李明明</td>
				          <td class="col-xs-1">2015-08-05</td>
				          <td class="col-xs-1">30</td>
				          <td class="col-xs-1">删除</td>
				        </tr>
				          <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal"><a href="#">关于组织编报国家重点基础研究发展计划2013年度财务决算的通知 </a></td>
				          <td class="col-xs-1">李明明</td>
				          <td class="col-xs-1">2015-08-05</td>
				          <td class="col-xs-1">30</td>
				          <td class="col-xs-1">删除</td>
				        </tr>
				             </tr>
				          <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal"><a href="#">关于填报2013年度国家级科技计划项目调查表的通知  </a></td>
				          <td class="col-xs-1">李明明</td>
				          <td class="col-xs-1">2015-08-05</td>
				          <td class="col-xs-1">30</td>
				          <td class="col-xs-1">删除</td>
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
	<div class="wrapper row content gongzuo">
		<div class="col-xs-12 mainPanel">
			<div class="panel panel-default">
				<!-- Default panel contents -->
								<div class="" id='calendar' ></div>
			</div>
		</div>
	</div>
	<div class="wrapper row content shenqing">
		<div class="col-xs-12 mainPanel">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<span>申请汇报</span>
				</div>
				<div class="panel-body">
					<button class="btn btn-info fr">删除</button>
					<button class="btn btn-info fr">查询</button>
					<button class="btn btn-info fr">新增</button>
				</div>

		  		<!-- Table -->
				<table class="table table-bordered table-hover">
					<thead>
				        <tr>
				          <th class="col-xs-1">全选</th>
				          <th class="col-xs-5">申请标题</th>
				          <th class="col-xs-1">申请人</th>
				          <th class="col-xs-1">发布时间</th>
				          <th class="col-xs-1">申请对象</th>
				          <th class="col-xs-1">批复状态</th>
				        </tr>
      				</thead>
      				<tbody>
				       <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal"><a href="http://www.baidu.com">关于购置办公室文具的申请</a></td>
				          <td class="col-xs-1">李明明</td>
				          <td class="col-xs-1">2015-08-05</td>
				          <td class="col-xs-1">孙崇文</td>
				          <td class="col-xs-1">未通过</td>
				        </tr>
				        <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal"><a href="#">关于添置办公家具的申请</a></td>
				          <td class="col-xs-1">李明明</td>
				          <td class="col-xs-1">2015-08-05</td>
				          <td class="col-xs-1">方建峰</td>
				          <td class="col-xs-1">通过</td>
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
					<span>文档列表</span>
					<span class="fr">共100项</span>
				</div>
				<div class="panel-body">
					<button class="btn btn-info fr">下载</button>
					<button class="btn btn-info fr">查询</button>
				</div>

		  		<!-- Table -->
				<table class="table table-bordered table-hover">
					<thead>
				        <tr>
				          <th class="col-xs-1">全选</th>
				          <th class="col-xs-5">文件名称</th>
				          <th class="col-xs-1">发布人</th>
				          <th class="col-xs-1">发布时间</th>
				          <th class="col-xs-1">下载次数</th>
				          <th class="col-xs-1">操作</th>
				        </tr>
      				</thead>
      				<tbody>
				       <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal"><a href="http://www.baidu.com">附件：上海市教育规划项目申报书</a></td>
				          <td class="col-xs-1">系统管理员</td>
				          <td class="col-xs-1">2015-08-05</td>
				          <td class="col-xs-1">30</td>
				          <td class="col-xs-1">下载</td>
				        </tr>
				        <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal"><a href="#">附件3：2015年国家重大（点）课题投标书</a></td>
				          <td class="col-xs-1">系统管理员</td>
				          <td class="col-xs-1">2015-08-05</td>
				          <td class="col-xs-1">30</td>
				          <td class="col-xs-1">下载</td>
				        </tr>
				         <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal"><a href="#">全国教育科学规划课题中期报告格式文本</a></td>
				          <td class="col-xs-1">系统管理员</td>
				          <td class="col-xs-1">2015-08-05</td>
				          <td class="col-xs-1">30</td>
				          <td class="col-xs-1">下载</td>
				        </tr>
				         <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal"><a href="#">全国教育科学规划课题重要事项变更申请审批表</a></td>
				          <td class="col-xs-1">系统管理员</td>
				          <td class="col-xs-1">2015-08-05</td>
				          <td class="col-xs-1">30</td>
				          <td class="col-xs-1">下载</td>
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
<script src="js/control.js"></script>
</body>
</html>