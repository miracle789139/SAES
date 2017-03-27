<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<title>上海市教育科学研究院</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main_wk.css">
<script src="<%=request.getContextPath()%>/js/jquery-1.10.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/control_wk.js"></script>
   <script src="<%=request.getContextPath()%>/js/ALERT.js"></script>
   <script type="text/javascript">
		function myLoginClick(obj){
		if(obj.innerHTML=="论文"||obj.id=="lunwenf")
		{
		var biaoname="s_paper";
		var pnum="1";
		}
		if(obj.id=="lunwenq")
		{var biaoname="s_paper";
		var pnum=document.getElementById("lunwenpnum").value;
		if(pnum<=1){
	
		return;}
		else{
		pnum=pnum-1;}
		}
		if(obj.id=="lunwenh")
		{var biaoname="s_paper";
		var pnum=document.getElementById("lunwenpnum").value;
		if(pnum>=(document.getElementById("lunwenz").innerHTML)){
		return;}
		else{
		pnum=parseInt(pnum,10);
		pnum=pnum+1;}
		}
		if(obj.id=="lunwenl"){
		var biaoname="s_paper";
		var pnum=document.getElementById("lunwenz").innerHTML;}
		
		
		
		if(obj.innerHTML=="著作")
		{
		var biaoname="dm_edu_degree";
		var pnum="1";
		}
		if(obj.innerHTML=="奖项")
		{
		var biaoname="dm_edu_level";
		var pnum="1";
		}
		if(obj.innerHTML=="培训")
		{
		var biaoname="dm_nation";
		var pnum="1";
		}
		if(obj.innerHTML=="项目")
		{
		var biaoname="s_person";
		var pnum="1";
		}
		 $.ajax({
				url : "querykyxx",
				type : "POST",
				dataType : "json",
				data : {"biaoname":biaoname,"pnum":pnum},
				success: function(data) {
				var buffer="";
				 if("s_paper"==biaoname){
				 buffer+="<table class='table table-bordered table-hover'> <thead><tr><th class='col-xs-1'>全选</th><th class='col-xs-1'>论文题目</th><th class='col-xs-1'>发表期刊</th>";
                 buffer+="<th class='col-xs-1'>作者</th><th class='col-xs-1'>日期</th><th class='col-xs-1'>字数</th><th class='col-xs-1'>论文状态</th> <th class='col-xs-1'>操作</th></tr></thead> <tbody>";
                 for(var i=0 ;i <data[0].kyxxList.length; i++){
                 buffer+="<tr><td><input type='checkbox' name='check_1' id='check_1' value='"+data[0].kyxxList[i].id+"'></td></td><td>"+data[0].kyxxList[i].NAME+"</td><td>"+data[0].kyxxList[i].PUBLISH_UNIT+"</td><td>"+data[0].kyxxList[i].FIRST_AUTHOR_NAME+"</td><td>"+data[0].kyxxList[i].PUBLISH_DATE+"</td><td>"+data[0].kyxxList[i].WORD_NUMBER+"</td><td>"+data[0].kyxxList[i].CHECK_STATUS_ID+"</td><td>"+"<a href=''>查看/编辑</a>"+"</td></tr>";
               }
                 buffer+="</tbody></table>";
                 document.getElementById("lunwen").innerHTML = buffer;
                 document.getElementById("lunwenpnum").value =data[0].pNum;
               document.getElementById("lunwenz").innerHTML = data[0].totalPageNum;
                }
               if("dm_edu_degree"==biaoname){
				 buffer+="<table class='table table-bordered table-hover' >	<thead><tr> <th class='col-xs-1'>全选</th><th class='col-xs-1'>书名</th><th class='col-xs-1'>全选</th><th class='col-xs-1'>作者</th>";
				 buffer+="<th class='col-xs-1'>出版社</th><th class='col-xs-1'>日期</th><th class='col-xs-1'>字数</th><th class='col-xs-1'>备注</th><th class='col-xs-1'>主编</th><th class='col-xs-1'>编辑</th></tr></thead><tbody>";
                 for(var i=0 ;i <data[0].kyxxList.length; i++){
                 buffer+="<tr><td><input type='checkbox'></td><td></td><td></td><td>"+"0"+"</td><td>"+"00"+"</td><td>"+"00"+"</td><td>"+"00"+"</td><td>"+"00"+"</td><td>"+"00"+"</td><td>"+"00"+"</td></tr>";
               }
                 buffer+="</tbody></table>";
                 document.getElementById("zhuzuo").innerHTML = buffer;
                }
               if("dm_edu_level"==biaoname){
				 buffer+="<table class='table table-bordered table-hover'><thead><tr> <th class='col-xs-1'>全选</th><th class='col-xs-1'>获奖名称</th><th class='col-xs-1'>获奖成员</th>";
				 buffer+="<th class='col-xs-1'>颁奖单位</th><th class='col-xs-1'>颁奖时间</th><th class='col-xs-1'>奖项等级</th><th class='col-xs-1'>操作</th> </tr></thead><tbody>";
                 for(var i=0 ;i <data[0].kyxxList.length; i++){
                 buffer+="<tr><td><input type='checkbox' ></td><td></td><td></td><td>"+"0"+"</td><td>"+"00"+"</td><td>"+"00"+"</td><td>"+"00"+"</td></tr>";
               }
                 buffer+="</tbody></table>";
                 document.getElementById("jiangxiang").innerHTML = buffer;
                }
                 if("dm_nation"==biaoname){
				 buffer+="<table class='table table-bordered table-hover'><thead><tr> <th class='col-xs-1'>全选</th><th class='col-xs-1'>获奖名称</th><th class='col-xs-1'>获奖成员</th>";
				 buffer+="<th class='col-xs-1'>颁奖单位</th><th class='col-xs-1'>颁奖时间</th><th class='col-xs-1'>奖项等级</th><th class='col-xs-1'>操作</th> </tr></thead><tbody>";
                 for(var i=0 ;i <data[0].kyxxList.length; i++){
                 buffer+="<tr><td><input type='checkbox'></td><td></td><td></td><td>"+"0"+"</td><td>"+"00"+"</td><td>"+"00"+"</td><td>"+"00"+"</td></tr>";
               }
                 buffer+="</tbody></table>";
                 document.getElementById("jiangxiang").innerHTML = buffer;
                }
		  },
				error : function() {
					
				}
		  }); }
		  function init(){
      document.getElementById("yilan").click();   
  }
  
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
			location.href='kyxx-index.jsp?NAME='+encodeURI(encodeURI(NAME))+'&iddd='+iddd+'&ssname='+ssname;
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
                url: "keyanInfo",
                data: {"userId":userId}
      		})
      		
      		alert(userId);
      		
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
    	
		$("#container").load("keyaninfoadd.jsp?NAME="+NAME+"&iddd="+iddd+"&ssname="+ssname);
	});
		</script> 
	
  </head>
  
  <body onload="init();">
 
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
		<div class="mainMenu1">
			<ul>
				<li id="yilan" onclick="myLoginClick(this)">论文</li>
				<li id="lixiang" onclick="myLoginClick(this)" >著作</li>
				<li id="shishi" onclick="myLoginClick(this)">奖项</li>
				<li id="zhongjian" onclick="myLoginClick(this)">培训</li>
                <li id="jiexiang" onclick="myLoginClick(this)">项目</li>
			</ul>
		</div>
	</div>
	<div class="wrapper row content yilan">
		<div class="col-xs-12 mainPanel">
			<div class="panel panel-default">
   			  <div class="panel-body"></div>
                <div class=" result">
                		 <div class="panel-default panel-heading">
                            <span>成果列表</span>
                           
                        </div>
                        <div class="panel-body">
                           	<a rel="dele" href="javascript:void(0)" class="btn btn-info fr" id="dele">删除</a>
							<a rel="add" href="javascript:void(0)" class="btn btn-info fr" id="add">新增</a>
                  
                  </div>
                        <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                      
                                      <th class="col-xs-1">项目编号</th>
                                      <th class="col-xs-1">项目名称</th>
                                      <th class="col-xs-1">负责人</th>
                                      <th class="col-xs-1">所属部门</th>
                                      <th class="col-xs-1">立项时间</th>
                                      <th class="col-xs-1">项目分类</th>
                                      <th class="col-xs-1">所在科室</th>
                                      <th class="col-xs-1">成果形式</th>
                                      <th class="col-xs-1">附件操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <s:iterator value="#request.applyList.kyxxList">
                                   <tr>
                                     
                                      <td class="col-xs-1 tal"><a href="http://www.baidu.com">12220300</a></td>
                                      <td class="col-xs-1"><s:property value="ACCOUNT" /></td>
                                      <td class="col-xs-1">刘佳万</td>
                                      <td class="col-xs-1">研究中心</td>
                                      <td class="col-xs-1">2015-08-05</td>
                                      <td class="col-xs-1">重点任务</td>
                                      <td class="col-xs-1">区域创新研究室</td>
                                      <td class="col-xs-1">论文</td>
                                      <td class="col-xs-1"><a href="http://www.baidu.com">查看</a>   <a href="http://www.baidu.com">下载</a></td>
                                  </tr>
                                   </s:iterator>
                                </tbody>
                  </table>
                            <nav class="page">
                              <ul class="pagination ">
                                <li><a href="#">|&lt;</a></li>
                                <li><a href="#">&lt;</a></li>
                                <li><a href="#"><input type="number" placeholder="1" value="2"><span id=""></span></a></li>
                                <!-- <li><a href="#">/9</a></li> -->
                                <li><a href="#">&gt;</a></li>
                                 <li><a href="#">&gt;|</a></li>
                              </ul>
                            </nav>
                            
              </div>
				<!-- Default panel contents -->
                <div class=" doing">
                        <div class="panel-default panel-heading">
                            <span>公告列表</span>
                           
                        </div>
                         <%String NAME="";
						if(request.getParameter("NAME")==null){ %>
				<div id="lw">
                       
                        
                          <div class="panel-body">
                               	<a rel="dele" href="javascript:void(0)" class="btn btn-info fr" id="dele">删除</a>
								<a rel="add" href="javascript:void(0)" class="btn btn-info fr" id="add">新增</a>   
                            </div>
        
                      
                          <div id="lunwen"></div>
                    
                               <nav class="page">
                              <ul class="pagination ">
                               <li><a id="lunwenf" href="#" onclick="myLoginClick(this);return false">|&lt;</a></li>
                                <li><a href="#" id="lunwenq" onclick="myLoginClick(this);return false">&lt;</a></li>
                                <li><a href="#"><input id="lunwenpnum" type="number" placeholder="1" value="2"><span id="lunwenz"></span></a></li>
                                <!-- <li><a href="#">/9</a></li> -->
                                <li><a href="#" id="lunwenh" onclick="myLoginClick(this);return false">&gt;</a></li>
                                 <li><a href="#" id="lunwenl" onclick="myLoginClick(this);return false">&gt;|</a></li>
                              </ul>
                            </nav>
                             </div>   
                     <%}else{ %>
					<div id='container'></div>
				<%} %>  
                        </div>
                </div>
			</div>
		</div>

	<div class="wrapper row content lixiang">
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
				<div id="zhuzuo"></div>
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
	<div class="wrapper row content shishi">
		<div class="col-xs-12 mainPanel">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<span>奖项列表</span>
				</div>
				

		  		<!-- Table -->
		  	<div id="jiangxiang"></div>
              
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
	<div class="wrapper row content zhongjian">
		<div class="col-xs-12 mainPanel">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<span>培训列表</span>
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
				          <th class="col-xs-5">名称</th>
				          <th class="col-xs-1">单位</th>
				          <th class="col-xs-1">时间</th>
				          <th class="col-xs-1">内容</th>
				          <th class="col-xs-1">备注</th>
				        </tr>
      				</thead>
      				<tbody>
				       <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal"><a href="http://www.baidu.com">第一期培训</a></td>
				          <td class="col-xs-1">科学学所</td>
				          <td class="col-xs-1">2015-08-05</td>
				          <td class="col-xs-1">关于科研项目流程分析培训</td>
				          <td class="col-xs-1">无</td>
				        </tr>
				        <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-5 tal"><a href="#">第二期培训</a></td>
				          <td class="col-xs-1">科学学所</td>
				          <td class="col-xs-1">论文大全</td>
				          <td class="col-xs-1">30</td>
				          <td class="col-xs-1">宣讲</td>
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
    <div class="wrapper row content jiexiang">
		<div class="col-xs-12 mainPanel">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<span>项目列表</span>
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
				          <th class="col-xs-5">项目名称</th>
				          <th class="col-xs-1">立项单位</th>
				          <th class="col-xs-1">项目类型</th>
				          <th class="col-xs-1">项目来源</th>
				          <th class="col-xs-1">担任角色</th>
                          <th class="col-xs-1">获奖情况</th>
                          <th class="col-xs-1">项目负责人</th>
                          <th class="col-xs-1">项目经费</th>
                          <th class="col-xs-1">起始时间</th>
				        </tr>
      				</thead>
      				<tbody>
				       <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-3 tal"><a href="http://www.baidu.com">机器人研究</a></td>
				          <td class="col-xs-1">科学学所</td>
				          <td class="col-xs-1">基金项目</td>
				          <td class="col-xs-1">中国国家科学院</td>
				          <td class="col-xs-1">项目主持</td>
                          <td class="col-xs-1">一等奖</td>
                          <td class="col-xs-1">刘君梅</td>
                          <td class="col-xs-1">12000</td>
                          <td class="col-xs-1">2015.01.01-2015.09.14</td>
				        </tr>
				          <tr>
				          <td class="col-xs-1"><input type="checkbox"></td>
				          <td class="col-xs-3 tal"><a href="http://www.baidu.com">飞行器研究</a></td>
				          <td class="col-xs-1">科学学所</td>
				          <td class="col-xs-1">基金项目</td>
				          <td class="col-xs-1">中国国家科学院</td>
				          <td class="col-xs-1">成员</td>
                          <td class="col-xs-1">二等奖</td>
                          <td class="col-xs-1">刘君梅</td>
                          <td class="col-xs-1">12000</td>
                          <td class="col-xs-1">2015.01.01-2015.09.14</td>
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
