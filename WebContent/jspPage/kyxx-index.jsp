<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>上海市教育科学研究院</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main_hxh.css">
	<script src="<%=request.getContextPath()%>/js/jquery-1.10.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/control_hxh.js"></script>
	<script src="<%=request.getContextPath()%>/js/ALERT.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.form.js"></script>
	<style type="text/css">
		.tableClass tr{
			height:50px;
		}
	</style>

	<script type="text/javascript">
		function myLoginClick(obj,type,num){//obj:点击的对象, type:1-分页、0-直接查询， num:当type=1时代表页码 type=0时无效
			var biaoname="";
			var pnum="";
			var isread="";
			if(obj.innerHTML=="论文")
			{
				$('#isread').val("2");
				biaoname="s_paper";
				pnum="1";
				isread="2";
			}
			if(obj.innerHTML=="未阅读"){
				$('#isread').val("0");
				biaoname="s_book";
				pnum="1";
				isread="0";
			}
			if(obj.innerHTML=="已阅读"){
				$('#isread').val("1");
				biaoname="s_book";
				pnum="1";
				isread="1";
			}
			if(obj.innerHTML=="著作"||obj.innerHTML=="全部"){
				$('#isread').val("2");
				biaoname="s_book";
				pnum="1";
				isread="2";
			}

			if(obj.innerHTML=="奖项"||obj.id=="jiangxiangf")
			{$('#isread').val("2");
				biaoname="s_prize";
				pnum="1";
				isread="2";
			}

			if(obj.innerHTML=="培训"||obj.id=="peixunf")
			{$('#isread').val("2");
				biaoname="s_train";
				pnum="1";
				isread="2";
			}

			if(obj.innerHTML=="项目"||obj.id=="xiangmuf")
			{$('#isread').val("2");
				biaoname="s_project";
				pnum="1";
				isread="2";
			}
			if(type==1){
				biaoname="";
				pnum=num>1?num:1;
				isread="2";
				biaoname=$(obj).parents('div:first').attr('tablename');
				isread="2";
			}
			$.ajax({
				url : "querykyxx",
				type : "POST",
				dataType : "json",
				data : {"biaoname":biaoname,"pnum":pnum,"isread":isread},
				success: function(data) {
					var buffer="";
					var pageColumn="";
					pageColumn+="<font color='#000000'> 当前页:第 <font style='font-weight:bold' >"+data[0].pNum+"</font>页 | 总记录数:"+data[0].totalRecordNum+"条 | 每页显示:10条 |总页数:"+data[0].totalPageNum+"页 |</font>  ";
					if(data[0].pNum>2){
						pageColumn+="<a href='#none' onclick='myLoginClick(this,1,1)' color='black'>首页</a>&nbsp;&nbsp;";
					}
					pageColumn+="第 &nbsp;";
					for(var count=1;count<=data[0].totalPageNum;count++){
						if(data[0].pNum==count){
							pageColumn+="<b><font color='black'>"+count+"</font></b>&nbsp;";
						}else{
							pageColumn+="<a href='#none' onclick='myLoginClick(this,1,"+count+")' style='color:#31b0d5'>"+count+"</a>&nbsp;";
						}
					}
					pageColumn+="&nbsp;页";
					if(data[0].pNum+1<data[0].totalPageNum&&data[0].totalPageNum>2){
						pageColumn+="&nbsp;&nbsp;&nbsp;<a href='#none' onclick='myLoginClick(this,1,"+data[0].totalPageNum+")' >末页</a>";
					}
					if("s_paper"==biaoname){
						buffer+="<table class='table table-bordered table-hover'> <thead><tr><th class='col-xs-1'>全选</th><th class='col-xs-1'>论文题目</th><th class='col-xs-1'>发表期刊</th>";
						buffer+="<th class='col-xs-1'>作者</th><th class='col-xs-1'>日期</th><th class='col-xs-1'>字数</th><th class='col-xs-1'>论文状态</th> <th class='col-xs-1'>操作</th></tr></thead> <tbody>";
						for(var i=0 ;i <data[0].kyxxList.length; i++){
							buffer+="<tr><td><input type='checkbox' name='check_1' id='check_1' value='"+data[0].kyxxList[i].id+"'></td><td>"+data[0].kyxxList[i].NAME+"</td><td>"+data[0].kyxxList[i].PUBLISH_UNIT+"</td><td>"+data[0].kyxxList[i].FIRST_AUTHOR_NAME;
							if(data[0].kyxxList[i].OTHER_AUTHOR_NAME!=null&&data[0].kyxxList[i].OTHER_AUTHOR_NAME!=""){
								buffer+=","+data[0].kyxxList[i].OTHER_AUTHOR_NAME;
							}
							buffer+="</td><td>"+data[0].kyxxList[i].PUBLISH_DATE+"</td><td>"+data[0].kyxxList[i].WORD_NUMBER+"</td><td>"+data[0].kyxxList[i].CHECK_STATUS_ID+"</td><td>"+"<input type='button' id='lwckbj' onclick='kyxxxq(this)' name='"+data[0].kyxxList[i].id+"'  value='查看/编辑'>"+"</td></tr>";
						}
						buffer+="</tbody></table>";
						document.getElementById("lunwen").innerHTML = buffer;
						document.getElementById("lwpageColumn").innerHTML = pageColumn;
						document.getElementById('lwlist').style.display='block';
						document.getElementById('lw').style.display='none';
						document.getElementById('qk').style.display='none';
					}
					if("s_book"==biaoname){

						buffer+="<table class='table table-bordered table-hover' >	<thead><tr> <th class='col-xs-1'>全选</th><th class='col-xs-1'>书名</th><th class='col-xs-1'>作者</th>";
						buffer+="<th class='col-xs-1'>出版社</th><th class='col-xs-1'>日期</th><th class='col-xs-1'>字数</th><th class='col-xs-1'>备注</th><th class='col-xs-1'>主编</th><th class='col-xs-1'>编辑</th></tr></thead><tbody>";
						for(var i=0 ;i <data[0].kyxxList.length; i++){
							buffer+="<tr><td><input type='checkbox' name='check_1' id='check_1' value='"+data[0].kyxxList[i].ID+"'></td><td>"+data[0].kyxxList[i].NAME+"</td><td>"+data[0].kyxxList[i].FIRST_AUTHOR_NAME+""+data[0].kyxxList[i].OTHER_AUTHOR_NAME+"</td><td>"+data[0].kyxxList[i].PUBLISH_UNIT+"</td><td>"+data[0].kyxxList[i].PUBLISH_DATE+"</td><td>"+data[0].kyxxList[i].WORD_NUMBER+"</td><td>"+data[0].kyxxList[i].REMARK+"</td><td>"+data[0].kyxxList[i].EDITOR+"</td><td>"+"<input type='button' id='zzckbj' onclick='kyxxxq(this)' name='"+data[0].kyxxList[i].ID+"' value='查看/编辑'>"+"</td></tr>";
						}
						buffer+="</tbody></table>";
						document.getElementById("zhuzuo").innerHTML = buffer;
						document.getElementById("zzpageColumn").innerHTML = pageColumn;
						document.getElementById('zzlist').style.display='block';
						document.getElementById('zz').style.display='none';
						document.getElementById('xgzz').style.display='none'; }
					if("s_prize"==biaoname){
						buffer+="<table class='table table-bordered table-hover'><thead><tr> <th class='col-xs-1'>全选</th><th class='col-xs-1'>获奖名称</th><th class='col-xs-1'>成员</th>";
						buffer+="<th class='col-xs-1'>颁奖单位</th><th class='col-xs-1'>颁奖时间</th><th class='col-xs-1'>奖项等级</th><th class='col-xs-1'>操作</th> </tr></thead><tbody>";
						for(var i=0 ;i <data[0].kyxxList.length; i++){
							buffer+="<tr><td><input type='checkbox' name='check_1' id='check_1' value='"+data[0].kyxxList[i].ID+"'></td><td>"+data[0].kyxxList[i].NAME+"</td><td>"+data[0].kyxxList[i].FIRST_PRIZE_NAME+""+data[0].kyxxList[i].OTHER_PRIZE_NAME+"</td><td>"+data[0].kyxxList[i].UNIT+"</td><td>"+data[0].kyxxList[i].PRIZE_DATE+"</td><td>"+data[0].kyxxList[i].LEVEL+"</td><td>"+"<input type='button' id='jxckbj' onclick='kyxxxq(this)' name='"+data[0].kyxxList[i].ID+"' value='查看/编辑'>"+"</td></tr>";}
						buffer+="</tbody></table>";
						document.getElementById("jiangxiang").innerHTML = buffer;
						document.getElementById("jxpageColumn").innerHTML = pageColumn;
						document.getElementById('jxlist').style.display='block';
						document.getElementById('jx').style.display='none';
						document.getElementById('xgjx').style.display='none';
					}
					if("s_train"==biaoname){
						buffer+="<table class='table table-bordered table-hover'><thead><tr> <th class='col-xs-1'>全选</th><th class='col-xs-1'>名称</th><th class='col-xs-1'>单位</th>";
						buffer+="<th class='col-xs-1'>时间</th><th class='col-xs-1'>内容</th><th class='col-xs-1'>备注</th> <th class='col-xs-1'>操作</th></tr></thead><tbody>";
						for(var i=0 ;i <data[0].kyxxList.length; i++){
							buffer+="<tr><td><input type='checkbox' name='check_1' id='check_1' value='"+data[0].kyxxList[i].ID+"'></td><td>"+data[0].kyxxList[i].NAME+"</td><td>"+data[0].kyxxList[i].UNIT+"</td><td>"+data[0].kyxxList[i].DATE+"</td><td>"+data[0].kyxxList[i].CONTENT+"</td><td>"+data[0].kyxxList[i].RAMARK+"</td><td>"+"<input type='button' id='pxckbj' onclick='kyxxxq(this)' name='"+data[0].kyxxList[i].ID+"' value='查看/编辑'>"+"</td></tr>";}

						buffer+="</tbody></table>";
						document.getElementById("peixun").innerHTML = buffer;
						document.getElementById("pxpageColumn").innerHTML = pageColumn;
						document.getElementById('pxlist').style.display='block';
						document.getElementById('px').style.display='none';
						document.getElementById('xgpx').style.display='none';}
					if("s_project"==biaoname){
						buffer+="<table class='table table-bordered table-hover'><thead><tr> <th class='col-xs-1'>全选</th><th class='col-xs-1'>项目名称</th><th class='col-xs-1'>立项单位</th>";
						buffer+="<th class='col-xs-1'>项目类型</th><th class='col-xs-1'>项目来源</th><th class='col-xs-1'>担任角色</th> <th class='col-xs-1'>获奖情况</th><th class='col-xs-1'>项目负责人</th><th class='col-xs-1'>项目经费</th><th class='col-xs-1'>起止时间</th><th class='col-xs-1'>操作</th></tr></thead><tbody>";
						for(var i=0 ;i <data[0].kyxxList.length; i++){
							buffer+="<tr><td><input type='checkbox' name='check_1' id='check_1' value='"+data[0].kyxxList[i].ID+"'></td><td>"+data[0].kyxxList[i].NAME+"</td><td>"+data[0].kyxxList[i].UNIT+"</td><td>"+data[0].kyxxList[i].TYPE+"</td><td>"+data[0].kyxxList[i].FROMTO+"</td><td>"+data[0].kyxxList[i].ROLE+"</td><td>"+data[0].kyxxList[i].ACHIEVE+"</td><td>"+data[0].kyxxList[i].CHARGE+"</td><td>"+data[0].kyxxList[i].MONEY+"</td><td>"+data[0].kyxxList[i].DATE+"</td><td><input type='button' id='xmckbj' onclick='kyxxxq(this)' name='"+data[0].kyxxList[i].ID+"' value='查看/编辑'>"+"</td></tr>";}


						buffer+="</tbody></table>";
						document.getElementById("xiangmu").innerHTML = buffer;
						document.getElementById("xmpageColumn").innerHTML = pageColumn;
						document.getElementById('xmlist').style.display='block';
						document.getElementById('xm').style.display='none';
						document.getElementById('xgxm').style.display='none';}
					var inputs = document.getElementsByTagName("input");//获取所有的input标签对象


					for(var i=0;i<inputs.length;i++){
						var obj = inputs[i];

						if(obj.type=="checkbox")
						{obj.checked=false;  }

					}


				},
				error : function() {

				}
			}); }
		function init(){
			document.getElementById("yilan").click();

		}
		//重置按钮
		function chongzhi(){
			var inputs = document.getElementsByTagName("input");//获取所有的input标签对象


			for(var i=0;i<inputs.length;i++){
				var obj = inputs[i];
				obj.value="";


			}
		}
		//表信息详情
		function  kyxxxq(obj){
			var biaoname="";
			var bid="";
			if(obj.id=="lwckbj")
			{ biaoname="s_paper";
				bid=obj.name;
			}

			if(obj.id=="zzckbj")
			{ biaoname="s_book";

				bid=obj.name;}
			if(obj.id=="jxckbj")
			{ biaoname="s_prize";

				bid=obj.name;}
			if(obj.id=="pxckbj")
			{ biaoname="s_train";

				bid=obj.name;}
			if(obj.id=="xmckbj")
			{ biaoname="s_project";

				bid=obj.name;}
			$.ajax({
				url : "querykyxxxq",
				type : "POST",
				dataType : "json",
				data : {"biaoname":biaoname,"bid":bid},
				success: function(data) {
					var buffer="";

					if("s_paper"==biaoname){
						buffer+="<form id='formPaper' name='formPaper' method='post' action='keyanInfoupdate' enctype='multipart/form-data'><center><table class='tableClass author' id='author'><tr><td ><h2><font style='color:black'></font></h2></td><td colspan='3'><input type='hidden' size='35' class='form-control' name='id' id='id' value='"+ data[0].id+"'></td></tr><tr><td style='width:120px'><h2><font style='color:black'>来源项目：</font></h2></td><td colspan='3'><input type='text' size='35' class='form-control' name='PROJECT_SOURCE_ID' id='PROJECT_SOURCE_ID' value='"+ data[0].PROJECT_SOURCE_ID+"'></td></tr>";
						buffer+="<tr><td style='width:120px'><h2><font style='color:black'>论文题目：</font></h2></td><td colspan='3'><input type='text' size='35' class='form-control' name='NAME' id='NAME' value='"+ data[0].NAME+"'></td></tr>";
						buffer+="<tr><td><h2><font style='color:black'>论文类型：</font></h2></td><td colspan='3'><select  class='form-control' size='1' name='PAPER_MODE_ID' id='PAPER_MODE_ID' value='"+ data[0].PAPER_MODE_ID+"'>";
						if(data[0].PAPER_MODE_ID.indexOf("请选择")>0){
							buffer+=" <option selected>---请选择---</option> <option value='基础研究'>基础研究</option> <option value='应用研究'>应用研究</option> <option value='综合研究'>综合研究</option>  <option value='其他'>其他</option> </select> </td></tr>";
						}
						else if(data[0].PAPER_MODE_ID.indexOf("基础研究")>0){
							buffer+=" <option >---请选择---</option> <option selected value='基础研究'>基础研究</option> <option value='应用研究'>应用研究</option> <option value='综合研究'>综合研究</option>  <option value='其他'>其他</option> </select> </td></tr>";
						}
						else if(data[0].PAPER_MODE_ID.indexOf("应用研究")>0){
							buffer+=" <option >---请选择---</option> <option value='基础研究'>基础研究</option> <option selected value='应用研究'>应用研究</option> <option value='综合研究'>综合研究</option>  <option value='其他'>其他</option> </select> </td></tr>";
						}
						else if(data[0].PAPER_MODE_ID.indexOf("综合研究")>0){
							buffer+=" <option >---请选择---</option> <option value='基础研究'>基础研究</option> <option value='应用研究'>应用研究</option> <option selected value='综合研究'>综合研究</option>  <option value='其他'>其他</option> </select> </td></tr>";
						}else{
							buffer+=" <option >---请选择---</option> <option value='基础研究'>基础研究</option> <option value='应用研究'>应用研究</option> <option  value='综合研究'>综合研究</option>  <option selected value='其他'>其他</option> </select> </td></tr>";
						}
						buffer+="<tr><td><h2><font style='color:black'>发表期刊：</font></h2></td><td colspan='3'><input type='text' id='PUBLISH_UNIT' size='35' class='form-control' name='PUBLISH_UNIT' onclick='selectqk(this)' value='"+data[0].PUBLISH_UNIT+"' ></td></tr>";
						buffer+="<tr><td ><h2><font style='color:black'>作者：</font>(<a rel='adda' onClick='addaAuthor()' href='javascript:void(0)'>添加</a>)</h2></td><td><h2><font style='color:black'>姓名</font></h2></td><td><h2><font style='color:black'>单位</font></h2></td><td><h2><font style='color:black'>操作</font></h2></td></tr>";
						buffer+="<tr><td ><h2></h2></td><td><input type='text' class='form-control'  size='8' name='FIRST_AUTHOR_NAME' value='"+data[0].FIRST_AUTHOR_NAME+"' id='FIRST_AUTHOR_NAME'/></td><td><input type='text' class='form-control'  size='8' name=''/></td><td><h2></h2></td></tr>";
						buffer+="<tr><td ><h2></h2></td><td><input type='text' class='form-control'  size='8' name='OTHER_AUTHOR_NAME[]' value='"+data[0].OTHER_AUTHOR_NAME+"' id='OTHER_AUTHOR_NAME'/></td><td><input type='text' class='form-control'  size='8' name=''/></td><td><h2></h2></td></tr></table></center>";
						buffer+="<div><center><table class='tableClass'><tr><td style='width:120px'><h2><font style='color:black'>日期：</font></h2></td><td colspan='3'><input type='text' id='PUBLISH_DATE' value='"+data[0].PUBLISH_DATE+"' size='35' class='form-control' name='PUBLISH_DATE'/></td></tr><tr><td><h2><font style='color:black'>字数：</font></h2></td><td colspan='3'><input type='text' id='WORD_NUMBER' value='"+data[0].WORD_NUMBER+"' size='35' class='form-control' name='WORD_NUMBER'/></td></tr><tr><td style='width:120px'><h2><font style='color:black'>论文状态：</font></h2></td><td colspan='3'><select  class='form-control' size='1' name='CHECK_STATUS_ID' id='CHECK_STATUS_ID' value='"+ data[0].CHECK_STATUS_ID+"'>";
						if(data[0].CHECK_STATUS_ID.indexOf("请选择")>0){
							buffer+=" <option selected>---请选择---</option> <option value='待审核'>待审核</option> <option value='已通过'>已通过</option><option value='其他'>其他</option> </select> </td></tr>";
						}
						else if(data[0].CHECK_STATUS_ID.indexOf("待审核")>0){
							buffer+=" <option >---请选择---</option> <option selected value='待审核'>待审核</option> <option value='已通过'>已通过</option>  <option value='其他'>其他</option> </select> </td></tr>";
						}
						else if(data[0].CHECK_STATUS_ID.indexOf("已通过")>0){
							buffer+=" <option >---请选择---</option> <option value='待审核'>待审核</option> <option selected value='已通过'>已通过</option> <option value='其他'>其他</option> </select> </td></tr>";
						}
						else{
							buffer+=" <option >---请选择---</option> <option value='基础研究'>基础研究</option> <option value='应用研究'>应用研究</option> <option selected value='其他'>其他</option> </select> </td></tr>";
						}
						buffer+="<tr id='row11'><td><h2><font style='color:black'>附件：</font></h2></td><td colspan='3'>";
						if(data[0].FILE_IDS!=null&&data[0].FILE_IDS!=""&&data[0].FILE_IDS.length>0){
							var fileShortName=data[0].FILE_IDS.substring(data[0].FILE_IDS.lastIndexOf("_")+1);
							buffer+="<a href='<%=request.getContextPath()%>/"+data[0].FILE_IDS+"'>"+fileShortName+"</a>";
						}else{
							buffer+=" <input type='file' id='fileupload' name='fileupload'/> ";
						}
						buffer+="</td></tr>";
						buffer+="<tr><td colspan='2'><span class='pull-right' ><input type='reset' value='重置' onclick='chongzhi();return false'  class='btn btn-info fr'/></span></td><td colspan='2'><a id='updatelw' href='javascript:void(0)' onclick='saveClick(this)' class='btn btn-info fr'>修改</a></td></tr></table></center> </div></form>";

						document.getElementById("lw").innerHTML = buffer;
						document.getElementById('lw').style.display='block';
						document.getElementById('lwlist').style.display='none';
						document.getElementById('qk').style.display='none';
					}
					if("s_book"==biaoname){

						buffer+="<center><table class='tableClass author1' id='author1'><tr><td ><h2><font style='color:black'></font></h2></td><td colspan='3'><input type='hidden' size='35' class='form-control' name='id10' id='id10' value='"+ data[0].ID+"'></td></tr><tr><td style='width:120px'><h2>来源项目：</h2></td><td colspan='3'><input type='text' size='35' class='form-control' name='PROJECT_SOURCE_ID10' value='"+data[0].PROJECT_SOURCE_ID+"' id='PROJECT_SOURCE_ID10' ></td></tr>";
						buffer+="<tr><td><h2>书名：</h2></td><td colspan='3'><input type='text' size='35' class='form-control' value='"+data[0].NAME+"' name='NAME10' id='NAME10' ></td></tr>";
						buffer+="<tr><td ><h2>作者：(<a rel='adda1' onClick='adda1Author()' href='javascript:void(0)'>添加</a>)</h2></td><td><h2>姓名</h2></td><td><h2>单位</h2></td><td><h2>操作</h2></td></tr>";
						buffer+="<tr><td ><h2></h2></td><td><input type='text' class='form-control'  size='8' value='"+ data[0].FIRST_AUTHOR_NAME+"' name='FIRST_AUTHOR_NAME10' id='FIRST_AUTHOR_NAME10'/></td><td><input type='text' class='form-control'  size='8' name=''/></td><td><h2></h2></td></tr>";
						buffer+="<tr><td ><h2></h2></td><td><input type='text' class='form-control'  size='8' value='"+ data[0].OTHER_AUTHOR_NAME+"' name='OTHER_AUTHOR_NAME10' id='OTHER_AUTHOR_NAME10'/></td><td><input type='text' class='form-control'  size='8' name=''/></td><td><h2></h2></td></tr>";
						buffer+="</table></center><div><center>";
						buffer+="<table class='tableClass'><tr><td ><h2>出版社：</h2></td><td colspan='3'><input type='text' size='35' class='form-control' value='"+ data[0].PUBLISH_UNIT+"' name='PUBLISH_UNIT10' id='PUBLISH_UNIT10' ></td></tr><tr><td style='width:120px'><h2>日期：</h2></td>";
						buffer+="<td colspan='3'><input type='text' size='35' class='form-control' name='PUBLISH_DATE10' id='PUBLISH_DATE10' value='"+ data[0].PUBLISH_DATE+"'></td></tr><tr>";
						buffer+="<td ><h2>字数：</h2></td><td colspan='3'><input type='text' size='35' class='form-control' value='"+ data[0].WORD_NUMBER+"' name='WORD_NUMBER10' id='WORD_NUMBER10' ></td></tr>";
						buffer+="<tr><td ><h2>备注：</h2></td><td colspan='3'><input type='text' size='35' class='form-control' value='"+ data[0].REMARK+"' name='REMARK10' id='REMARK10' ></td></tr>";
						buffer+="<tr><td ><h2>主编：</h2></td><td colspan='3'><input type='text' size='35' class='form-control' value='"+data[0].EDITOR+"' name='EDITOR10' id='EDITOR10'></td></tr><tr><td colspan='2'><span class='pull-right' ><input type='reset' value='重置' onclick='chongzhi();return false' class='btn btn-info fr'/></span></td>";
						buffer+="<td colspan='2'><a id='updatezz' href='#' onclick='saveClick(this);return false' class='btn btn-info fr'>修改</a></td></tr></table></center>";

						document.getElementById("zz").innerHTML = buffer;
						document.getElementById('zz').style.display='block';
						document.getElementById('zzlist').style.display='none';
						document.getElementById('xgzz').style.display='none';}
					if("s_prize"==biaoname){

						buffer+="<center><table class='tableClass author2' id='author2'><tr><td ><h2><font style='color:black'></font></h2></td><td colspan='3'><input type='hidden' size='35' class='form-control' name='id20' id='id20' value='"+ data[0].ID+"'></td></tr><tr><td style='width:120px'><h2>来源项目：</h2></td><td colspan='3'><input type='text' size='35' class='form-control' name='PROJECT_SOURCE_ID20' value='"+data[0].PROJECT_SOURCE_ID+"' id='PROJECT_SOURCE_ID20' ></td></tr>";
						buffer+="<tr><td><h2>获奖名称：</h2></td><td colspan='3'><input type='text' size='35' class='form-control' value='"+data[0].NAME+"' name='NAME20' id='NAME20' ></td></tr>";
						buffer+="<tr style='height:30px'><td ><h2>成员：(<a rel='adda2' onClick='adda2Author()' href='javascript:void(0)'>添加</a>)</h2></td><td><h2>姓名</h2></td><td><h2>单位</h2></td><td><h2>操作</h2></td></tr>";
						buffer+="<tr><td ><h2></h2></td><td><input type='text' class='form-control'  size='8' value='"+ data[0].FIRST_PRIZE_NAME+"' name='FIRST_AUTHOR_NAME20' id='FIRST_AUTHOR_NAME20'/></td><td><input type='text' class='form-control'  size='8' name=''/></td><td><h2></h2></td></tr>";
						buffer+="<tr><td ><h2></h2></td><td><input type='text' class='form-control'  size='8' value='"+ data[0].OTHER_PRIZE_NAME+"' name='OTHER_AUTHOR_NAME20' id='OTHER_AUTHOR_NAME20'/></td><td><input type='text' class='form-control'  size='8' name=''/></td><td><h2></h2></td></tr>";
						buffer+="</table></center><div><center>";
						buffer+="<table class='tableClass'><tr><td ><h2>获奖单位：</h2></td><td colspan='3'><input type='text' size='35' class='form-control' value='"+ data[0].UNIT+"' name='UNIT20' id='UNIT20' ></td></tr><tr><td style='width:120px'><h2>获奖日期：</h2></td>";
						buffer+="<td colspan='3'><input type='text' size='35' class='form-control' name='PRIZE_DATE20' id='PRIZE_DATE20' value='"+ data[0].PRIZE_DATE+"'></td></tr>";
						buffer+="<tr><td ><h2>	奖项等级：</h2></td><td colspan='3'><select  class='form-control' size='1' name='LEVEL20' id='LEVEL20'><option>---请选择---</option> <option value='一等奖'>一等奖</option> <option value='二等奖'>二等奖</option> <option value='三等奖'>三等奖</option></select></td></tr><tr><td colspan='2'><span class='pull-right' ><input type='reset' value='重置' onclick='chongzhi();return false' class='btn btn-info fr'/></span></td>";
						buffer+="<td colspan='2'><a id='updatejx' href='#' onclick='saveClick(this);return false' class='btn btn-info fr'>修改</a></td></tr></table></center>";

						document.getElementById("jx").innerHTML = buffer;
						document.getElementById('jx').style.display='block';
						document.getElementById('jxlist').style.display='none';
						document.getElementById('xgjx').style.display='none';}

					if("s_project"==biaoname){

						buffer+="<center><table class='tableClass'><tr><td ><h2><font style='color:black'></font></h2></td><td colspan='3'><input type='hidden' size='35' class='form-control' name='id40' id='id40' value='"+ data[0].ID+"'></td></tr><tr><td><h2>项目名称：</h2></td><td colspan='3'><input type='text' size='35' class='form-control' name='NAME40' id='NAME40' value='"+data[0].NAME+"' ></td></tr>";
						buffer+="<tr><td ><h2>立项单位：</h2></td><td colspan='3'><input type='text' size='35' class='form-control' name='UNIT40' id='UNIT40' value='"+data[0].UNIT+"'></td></tr>";
						buffer+="<tr><td ><h2>项目类型：</h2></td><td colspan='3'><input type='text' size='35' class='form-control' name='TYPE40' id='TYPE40' value='"+data[0].TYPE+"'></td></tr>";
						buffer+="<tr><td ><h2>项目来源：</h2></td><td colspan='3'><input type='text' size='35' class='form-control' name='FROM40' id='FROM40' value='"+data[0].FROMTO+"'></td></tr>";
						buffer+="<tr><td ><h2>担任角色：</h2></td><td colspan='3'><input type='text' size='35' class='form-control' name='ROLE40' id='ROLE40' value='"+data[0].ROLE+"'></td></tr>";
						buffer+="<tr><td ><h2>获奖情况：</h2></td><td colspan='3'><input type='text' size='35' class='form-control' name='ACHIEVE40' id='ACHIEVE40' value='"+data[0].ACHIEVE+"'></td></tr>";
						buffer+="<tr><td ><h2>项目负责人：</h2></td><td colspan='3'><input type='text' size='35' class='form-control' name='CHARGE40' id='CHARGE40' value='"+data[0].CHARGE+"'></td></tr>";
						buffer+="<tr><td ><h2>项目经费：</h2></td><td colspan='3'><input type='text' size='35' class='form-control' name='MONEY40' id='MONEY40' value='"+data[0].MONEY+"'></td></tr>";
						buffer+="<tr><td ><h2>起止时间：</h2></td><td colspan='3'><input type='text' size='35' class='form-control' name='DATE40' id='DATE40' value='"+data[0].DATE+"'></td></tr>";
						buffer+="<tr><td colspan='2'><span class='pull-right' ><input type='reset' value='重置' onclick='chongzhi();return false' class='btn btn-info fr'/></span></td><td colspan='2'><a id='updatexm' href='#' class='btn btn-info fr' onclick='saveClick(this);return false'>修改</a></td></tr></table></center>";
						document.getElementById("xgxm").innerHTML = buffer;
						document.getElementById('xgxm').style.display='block';
						document.getElementById('xmlist').style.display='none';
						document.getElementById('xm').style.display='none';}

					if("s_train"==biaoname){

						buffer+="<center><table class='tableClass'><tr><td ><h2><font style='color:black'></font></h2></td><td colspan='3'><input type='hidden' size='35' class='form-control' name='id30' id='id30' value='"+ data[0].ID+"'></td></tr><tr><td><h2>培训名称：</h2></td><td colspan='3'><input type='text' size='35' class='form-control' name='NAME30' id='NAME30' value='"+data[0].NAME+"'></td>";
						buffer+="</tr><tr><td ><h2>培训单位：</h2></td><td colspan='3'><input type='text' size='35' class='form-control' name='UNIT30' id='UNIT30' value='"+data[0].UNIT+"'></td></tr>";
						buffer+="<tr><td ><h2>培训日期：</h2></td><td colspan='3'><input type='text' size='35' class='form-control' name='DATE30' id='DATE30' value='"+data[0].DATE+"'></td></tr>";
						buffer+="<tr><td ><h2>培训内容：</h2></td><td colspan='3'><input type='text' size='35' class='form-control' name='CONTENT30' id='CONTENT30' value='"+data[0].CONTENT+"'></td></tr>";
						buffer+="<tr><td ><h2>备注：</h2></td><td colspan='3'><input type='text' size='35' class='form-control' name='REMARK30' id='REMARK30' value='"+data[0].RAMARK+"'></td></tr>";
						buffer+="<tr><td colspan='2'><span class='pull-right' ><input type='reset' value='重置' onclick='chongzhi();return false' class='btn btn-info fr'/></span></td><td colspan='2'><a id='updatepx' href='#' class='btn btn-info fr' onclick='saveClick(this);return false'>修改</a></td></tr></table></center>";

						document.getElementById("xgpx").innerHTML = buffer;
						document.getElementById('xgpx').style.display='block';
						document.getElementById('pxlist').style.display='none';
						document.getElementById('pxlist').style.display='none';}

				}});




		}
		//选择期刊
		function selectqk(obj){
			$('#qk').load("magazine");
			document.getElementById('qk').style.display='block';
			document.getElementById('lwlist').style.display='none';
			document.getElementById('lw').style.display='none';
		}
		//表头删除
		function deletexx(obj){
			if (!confirm("确认要删除？")) {
				window.event.returnValue = false;
				return;
			}

			var userId="";
			var biaoname="";
			$("input:checkbox[name='check_1']:checked").each(function(i){
				if(0==i){

					userId=$(this).val();
				}else{
					userId+=("','"+$(this).val());
				}

			})

			if(obj.id=="deletelw")
			{biaoname="s_paper";
			}
			if(obj.id=="deletezz"){biaoname="s_book";}
			if(obj.id=="deletejx"){biaoname="s_prize";}
			if(obj.id=="deletepx"){biaoname="s_train";}
			if(obj.id=="deletexm"){biaoname="s_project";}

			$.ajax({
				type:"post",
				url:"keyanInfodele",
				dataType:"json",
				data:{"userId":userId,"biaoname":biaoname},
			});
			if(biaoname=="s_paper"){ location.href="kyxx-index.jsp";}
			if(biaoname=="s_book"){ document.getElementById("lixiang").click(); }
			if(biaoname=="s_prize"){ document.getElementById("shishi").click(); }
			if(biaoname=="s_train"){ document.getElementById("zhongjian").click(); }
			if(biaoname=="s_project"){ document.getElementById("jiexiang").click(); } }

		function resets()
		{
			var controls = document.getElementsByTagName('input');
			for(var i=0; i<controls.length; i++){
				if(controls[i].type=='text'){
					controls[i].value='';
				}
			}

		}
		//表头新增按钮
		function addClick(obj){
			resets();
			if(obj.id=="addlw"){

				document.getElementById('lw').style.display='block';
				document.getElementById('lwlist').style.display='none';
				document.getElementById('qk').style.display='none';}
			if(obj.id=="addxm"){
				document.getElementById('xm').style.display='block';
				document.getElementById('xmlist').style.display='none';
				document.getElementById('xgxm').style.display='none';}
			if(obj.id=="addzz")
			{
				document.getElementById('zz').style.display='block';
				document.getElementById('zzlist').style.display='none';
				document.getElementById('xgzz').style.display='none';
			} if(obj.id=="addjx")
			{
				document.getElementById('jx').style.display='block';
				document.getElementById('jxlist').style.display='none';
				document.getElementById('xgjx').style.display='none'; }
			if(obj.id=="addpx")
			{
				document.getElementById('px').style.display='block';
				document.getElementById('pxlist').style.display='none';
				document.getElementById('xgpx').style.display='none';}
			if(obj.id=="addxm")
			{
				document.getElementById('xm').style.display='block';
				document.getElementById('xmlist').style.display='none';
				document.getElementById('xgxm').style.display='none';
			}}
		//添加/修改信息
		function saveClick(obj){
			if(obj.id=="updatelw")
			{ var id=$('#id').val();
				var PROJECT_SOURCE_ID=$('#PROJECT_SOURCE_ID').val();
				var NAME=$('#NAME').val();
				var PAPER_MODE_ID=$('#PAPER_MODE_ID').val();
				var PUBLISH_UNIT=$('#PUBLISH_UNIT').val();
				var FIRST_AUTHOR_NAME=$('#FIRST_AUTHOR_NAME').val();
				var OTHER_AUTHOR_NAME=$('#OTHER_AUTHOR_NAME').val();
				var PUBLISH_DATE=$('#PUBLISH_DATE').val();
				var WORD_NUMBER=$('#WORD_NUMBER').val();
				var CHECK_STATUS_ID=$('#CHECK_STATUS_ID').val();
				var biaoname="s_paper";
				var docObj = document.getElementById("fileupload");
				var name="";
				if(docObj!=null){
					name=docObj.value;
				}
				//得到其他作者信息
				var authors = $('.paperAuthor');
				var totalprice=0;
				for(var i=0;i<authors.length;i++){
					var authorName=$(authors[i]).val();
					OTHER_AUTHOR_NAME+=","+authorName;
				}

				var options  = {
					url:'keyanInfoupdate',
					type:'post',
					dataType:'json',
					data: {"PROJECT_SOURCE_ID":PROJECT_SOURCE_ID,"NAME":NAME,"PAPER_MODE_ID":PAPER_MODE_ID,"PUBLISH_UNIT":PUBLISH_UNIT,"FIRST_AUTHOR_NAME":FIRST_AUTHOR_NAME,"OTHER_AUTHOR_NAME":OTHER_AUTHOR_NAME,"PUBLISH_DATE":PUBLISH_DATE,"WORD_NUMBER":WORD_NUMBER,"CHECK_STATUS_ID":CHECK_STATUS_ID,"id":id,"biaoname":biaoname,"fileName":name},
					success:function(data){
						Alert("提交成功!");
					} ,
					error:function(){
						Alert("提交失败!");
					}
				};
				$("#formPaper").ajaxSubmit(options);

				//1s刷新页面
				window.setTimeout(function(){
					location.reload();
				},1000);


			} if(obj.id=="insertzz"){
				var PROJECT_SOURCE_ID=$('#PROJECT_SOURCE_ID1').val();
				var NAME=$('#NAME1').val();
				var PUBLISH_UNIT=$('#PUBLISH_UNIT1').val();
				var FIRST_AUTHOR_NAME=$('#FIRST_AUTHOR_NAME1').val();
				var OTHER_AUTHOR_NAME=$('#OTHER_AUTHOR_NAME1').val();
				var PUBLISH_DATE=$('#PUBLISH_DATE1').val();
				var WORD_NUMBER=$('#WORD_NUMBER1').val();
				var REMARK=$('#REMARK1').val();
				var EDITOR=$('#EDITOR1').val();
				var biaoname="s_book";
				//得到其他作者信息
				var authors = $('.bookAuthor');
				var totalprice=0;
				for(var i=0;i<authors.length;i++){
					var authorName=$(authors[i]).val();
					OTHER_AUTHOR_NAME+=","+authorName;
				}
				$.ajax({
					type: "post",
					url: "keyanInfoadd",
					data: {"PROJECT_SOURCE_ID":PROJECT_SOURCE_ID,"NAME":NAME,"PUBLISH_UNIT":PUBLISH_UNIT,"FIRST_AUTHOR_NAME":FIRST_AUTHOR_NAME,"OTHER_AUTHOR_NAME":OTHER_AUTHOR_NAME,"PUBLISH_DATE":PUBLISH_DATE,"WORD_NUMBER":WORD_NUMBER,"EDITOR":EDITOR,"REMARK":REMARK,"biaoname":biaoname}
				});
				document.getElementById("lixiang").click();}
			if(obj.id=="insertpx"){
				var NAME=$('#NAME3').val();
				var UNIT=$('#UNIT3').val();
				var DATE=$('#DATE3').val();
				var CONTENT=$('#CONTENT3').val();
				var REMARK=$('#REMARK3').val();

				var biaoname="s_train";

				$.ajax({
					type: "post",
					url: "keyanInfoadd",
					data: {"NAME":NAME,"UNIT":UNIT,"DATE":DATE,"CONTENT":CONTENT,"REMARK":REMARK,"biaoname":biaoname}
				});
				document.getElementById("zhongjian").click();}
			if(obj.id=="updatepx"){
				var id=$('#id30').val();
				var NAME=$('#NAME30').val();
				var UNIT=$('#UNIT30').val();
				var DATE=$('#DATE30').val();
				var CONTENT=$('#CONTENT30').val();
				var REMARK=$('#REMARK30').val();

				var biaoname="s_train";

				$.ajax({
					type: "post",
					url: "keyanInfoupdate",
					data: {"NAME":NAME,"UNIT":UNIT,"DATE":DATE,"CONTENT":CONTENT,"REMARK":REMARK,"biaoname":biaoname,"id":id}
				});
				document.getElementById("zhongjian").click();}
			if(obj.id=="insertjx"){
				var PROJECT_SOURCE_ID=$('#PROJECT_SOURCE_ID2').val();
				var NAME=$('#NAME2').val();
				var UNIT=$('#UNIT2').val();
				var FIRST_AUTHOR_NAME=$('#FIRST_AUTHOR_NAME2').val();
				var OTHER_AUTHOR_NAME=$('#OTHER_AUTHOR_NAME2').val();
				var PUBLISH_DATE=$('#PRIZE_DATE2').val();
				var LEVEL=$('#LEVEL2').val();
				//var REMARK=$('#REMARK1').val();
				//var EDITOR=$('#EDITOR1').val();
				var biaoname="s_prize";
				//得到其他作者信息
				var authors = $('.priceAuthor');
				var totalprice=0;
				for(var i=0;i<authors.length;i++){
					var authorName=$(authors[i]).val();
					OTHER_AUTHOR_NAME+=","+authorName;
				}
				$.ajax({
					type: "post",
					url: "keyanInfoadd",
					data: {"PROJECT_SOURCE_ID":PROJECT_SOURCE_ID,"NAME":NAME,"UNIT":UNIT,"FIRST_AUTHOR_NAME":FIRST_AUTHOR_NAME,"OTHER_AUTHOR_NAME":OTHER_AUTHOR_NAME,"PRIZE_DATE":PUBLISH_DATE,"LEVEL":LEVEL,"biaoname":biaoname}
				});
				document.getElementById("shishi").click();}
			if(obj.id=="updatejx"){
				var id=$('#id20').val();
				var PROJECT_SOURCE_ID=$('#PROJECT_SOURCE_ID20').val();
				var NAME=$('#NAME20').val();
				var UNIT=$('#UNIT20').val();
				var FIRST_AUTHOR_NAME=$('#FIRST_AUTHOR_NAME20').val();
				var OTHER_AUTHOR_NAME=$('#OTHER_AUTHOR_NAME20').val();
				var PUBLISH_DATE=$('#PRIZE_DATE20').val();
				var LEVEL=$('#LEVEL20').val();
				//var REMARK=$('#REMARK1').val();
				//var EDITOR=$('#EDITOR1').val();
				var biaoname="s_prize";
				//得到其他作者信息
				var authors = $('.priceAuthor');
				var totalprice=0;
				for(var i=0;i<authors.length;i++){
					var authorName=$(authors[i]).val();
					OTHER_AUTHOR_NAME+=","+authorName;
				}
				$.ajax({
					type: "post",
					url: "keyanInfoupdate",
					data: {"PROJECT_SOURCE_ID":PROJECT_SOURCE_ID,"NAME":NAME,"UNIT":UNIT,"FIRST_AUTHOR_NAME":FIRST_AUTHOR_NAME,"OTHER_AUTHOR_NAME":OTHER_AUTHOR_NAME,"PRIZE_DATE":PUBLISH_DATE,"LEVEL":LEVEL,"biaoname":biaoname,"id":id}
				});
				document.getElementById("shishi").click();}
			if(obj.id=="insertxm"){
				var TYPE=$('#TYPE4').val();
				var NAME=$('#NAME4').val();
				var UNIT=$('#UNIT4').val();
				var FROM=$('#FROM4').val();
				var ROLE=$('#ROLE4').val();
				var ACHIEVE=$('#ACHIEVE4').val();
				var CHARGE=$('#CHARGE4').val();
				var MONEY=$('#MONEY4').val();
				var DATE=$('#DATE4').val();
				var biaoname="s_project";

				$.ajax({
					type: "post",
					url: "keyanInfoadd",
					data: {"TYPE":TYPE,"NAME":NAME,"UNIT":UNIT,"FROM":FROM,"ROLE":ROLE,"ACHIEVE":ACHIEVE,"CHARGE":CHARGE,"MONEY":MONEY,"DATE":DATE,"biaoname":biaoname}
				});
				document.getElementById("jiexiang").click();}

			if(obj.id=="updatexm"){
				var id=$('#id40').val();
				var TYPE=$('#TYPE40').val();
				var NAME=$('#NAME40').val();
				var UNIT=$('#UNIT40').val();
				var FROM=$('#FROM40').val();
				var ROLE=$('#ROLE40').val();
				var ACHIEVE=$('#ACHIEVE40').val();
				var CHARGE=$('#CHARGE40').val();
				var MONEY=$('#MONEY40').val();
				var DATE=$('#DATE40').val();
				var biaoname="s_project";

				$.ajax({
					type: "post",
					url: "keyanInfoupdate",
					data: {"TYPE":TYPE,"NAME":NAME,"UNIT":UNIT,"FROM":FROM,"ROLE":ROLE,"ACHIEVE":ACHIEVE,"CHARGE":CHARGE,"MONEY":MONEY,"DATE":DATE,"biaoname":biaoname,"id":id}
				});
				document.getElementById("jiexiang").click();}
			if(obj.id=="updatezz"){
				var id=$('#id10').val();
				var PROJECT_SOURCE_ID=$('#PROJECT_SOURCE_ID10').val();
				var NAME=$('#NAME10').val();
				var PUBLISH_UNIT=$('#PUBLISH_UNIT10').val();
				var FIRST_AUTHOR_NAME=$('#FIRST_AUTHOR_NAME10').val();
				var OTHER_AUTHOR_NAME=$('#OTHER_AUTHOR_NAME10').val();
				var PUBLISH_DATE=$('#PUBLISH_DATE10').val();
				var WORD_NUMBER=$('#WORD_NUMBER10').val();
				var REMARK=$('#REMARK10').val();
				var EDITOR=$('#EDITOR10').val();
				var biaoname="s_book";
				//得到其他作者信息
				var authors = $('.bookAuthor');
				var totalprice=0;
				for(var i=0;i<authors.length;i++){
					var authorName=$(authors[i]).val();
					OTHER_AUTHOR_NAME+=","+authorName;
				}
				$.ajax({
					type: "post",
					url: "keyanInfoupdate",
					data: {"PROJECT_SOURCE_ID":PROJECT_SOURCE_ID,"NAME":NAME,"PUBLISH_UNIT":PUBLISH_UNIT,"FIRST_AUTHOR_NAME":FIRST_AUTHOR_NAME,"OTHER_AUTHOR_NAME":OTHER_AUTHOR_NAME,"PUBLISH_DATE":PUBLISH_DATE,"WORD_NUMBER":WORD_NUMBER,"EDITOR":EDITOR,"REMARK":REMARK,"biaoname":biaoname,"id":id}
				});
				document.getElementById("lixiang").click();}}
	</script>
	<script type="text/javascript">
		var rowcount=2;
		function addaAuthor () {
			rowcount+=1;
			var txt="<tr id='row"+rowcount+"'><td ><h2></h2></td><td><input type='text' class='form-control paperAuthor'  size='10' name='OTHER_AUTHOR_NAME[]' /></td><td><input type='text' class='form-control'  size='10' name=''/></td><td><h2><input type='button' value='删除' id='delea"+rowcount+"'/></h2></td></tr>";
			$("#author").append(txt);

			$('#delea'+rowcount).click(function(){
				$('#row'+rowcount).remove();
				rowcount-=1;
			})

		}
		function adda1Author() {
			rowcount+=1;
			var txt="<tr id='row"+rowcount+"'><td ><h2></h2></td><td><input type='text' class='form-control bookAuthor'  size='10' name='OTHER_AUTHOR_NAME' /></td><td><input type='text' class='form-control'  size='10' name=''/></td><td><h2><input type='button' value='删除' id='delea"+rowcount+"'/></h2></td></tr>";
			$("#author1").append(txt);

			$('#delea'+rowcount).click(function(){
				$('#row'+rowcount).remove();
				rowcount-=1;
			})

		}
		function adda2Author() {
			rowcount+=1;
			var txt="<tr id='row"+rowcount+"'><td ><h2></h2></td><td><input type='text' class='form-control priceAuthor'  size='10' name='OTHER_AUTHOR_NAME' /></td><td><input type='text' class='form-control'  size='10' name=''/></td><td><h2><input type='button' value='删除' id='delea"+rowcount+"'/></h2></td></tr>";
			$("#author2").append(txt);

			$('#delea'+rowcount).click(function(){
				$('#row'+rowcount).remove();
				rowcount-=1;
			})
		}
		function deleaaa(){
			$('#row11').remove();
		}

	</script>
</head>

<body onload="init();">

<tags:common_header/><%--最顶部的头--%>
<div class="wrapper">
	<div class="mainMenu1">
		<ul>
			<li id="yilan" onclick="myLoginClick(this,0,0)">论文</li>
			<li id="lixiang" onclick="myLoginClick(this,0,0)" >著作</li>
			<li id="shishi" onclick="myLoginClick(this,0,0)">奖项</li>
			<li id="zhongjian" onclick="myLoginClick(this,0,0)">培训</li>
			<li id="jiexiang" onclick="myLoginClick(this,0,0)">项目</li>
		</ul>
	</div>
</div>
<div class="wrapper row content yilan">
	<div class="col-xs-12 mainPanel">
		<div class="panel panel-default">


			<!-- Default panel contents -->
			<div  id="lwlist" class=" doing">
				<div class="panel-default panel-heading">
					<span>论文列表</span>

				</div>
				<div class="panel-body">
					<a id="deletelw" href="#" class="btn btn-info fr" onclick="deletexx(this);return false">删除</a>
					<a id="addlw" href="#" onclick="addClick(this);return false" class="btn btn-info fr" >新增</a>
				</div>


				<div id="lunwen"></div>
				<div id="lwpageColumn" tablename="s_paper" style="text-align:center; height: 30px;background-color: rgb(239, 243, 248) !important;padding-top: 5px;">

				</div>

			</div>

			<div id="lw" style="display:none; margin-top:15px;">
				<form id="formPaper" name="formPaper" method="post" action="keyanInfoupdate" enctype="multipart/form-data">
					<center>
						<table class='tableClass author' id="author" >
							<tr>
								<td style='width: 120px;'><h2><font style='color:black'>来源项目：</font></h2></td>
								<td colspan="3"><input type="text" size="35" class="form-control" name="PROJECT_SOURCE_ID" id="PROJECT_SOURCE_ID"></td>
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
								<td colspan="3"><input type="text" id="PUBLISH_UNIT" size="35" class="form-control" name="PUBLISH_UNIT" onclick="selectqk(this)" value="点击选择期刊" ></td>
							</tr>
							<tr>
								<td ><h2><font style='color:black'>作者：</font>(<a rel="adda" onClick='addaAuthor()' href="javascript:void(0)">添加</a>)</h2></td>
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
								<td><input type="text" class="form-control"  size="8" name="OTHER_AUTHOR_NAME[]" id="OTHER_AUTHOR_NAME"/></td>
								<td><input type="text" class="form-control"  size="8" name=""/></td>
								<td><h2></h2></td>
							</tr>
						</table>
					</center>

					<div><center>
						<table class='tableClass'>
							<tr>
								<td style='width: 120px;'><h2><font style='color:black'>日期：</font></h2></td>
								<td colspan="3"><input type="text" id="PUBLISH_DATE" size="35" class="form-control" name="PUBLISH_DATE"/></td>
							</tr>
							<tr>
								<td ><h2><font style='color:black'>字数：</font></h2></td>
								<td colspan="3"><input type="text" id="WORD_NUMBER" size="35" class="form-control" name="WORD_NUMBER"/></td>
							</tr>
							<tr>
								<td ><h2><font style='color:black'>论文状态：</font></h2></td>
								<td colspan="3">
									<select name="" class="form-control" size="1" name="CHECK_STATUS_ID" id="CHECK_STATUS_ID">
										<option>---请选择---</option>
										<option value="待审核">待审核</option>
										<option value="已通过">已通过</option>
										<option value="其他">其他</option>
									</select>
									<input type="text" id="CHECK_STATUS_ID" size="35" class="form-control" name="CHECK_STATUS_ID"/></td>
							</tr>
							<tr id='row11'><td><h2><font style='color:black'>附件：</font></h2></td>
								<td colspan='3'>
									<input id="fileupload" name="fileupload" type="file" />
								</td></tr>
							<tr><td colspan='2'><span class='pull-right' >
    	<input type="reset" value="重置" class="btn btn-info fr"/>
    	</span></td><td colspan='2'>
								<a id='updatelw' href='javascript:void(0)' onclick='saveClick(this)' class='btn btn-info fr'>提交</a>
							</td></tr></table></center> </div>
				</form>
			</div>
			<div id="qk">  </div>
		</div>
	</div>
</div>


<div class="wrapper row content lixiang">
	<div class="col-xs-12 mainPanel">
		<div  class="panel panel-default">
			<!-- Default panel contents -->
			<div id="zzlist">
				<div class="panel-heading">
					<span>著作列表</span>

				</div>
				<div class="panel-body">
					<span><a  href="#" onclick="myLoginClick(this,0,0);return false">全部</a><a href="#" onclick="myLoginClick(this,0,0);return false">未阅读</a><a href="#" onclick="myLoginClick(this,0,0);return false">已阅读</a><input type="hidden" id="isread" value="2"></span>
					<a id="deletezz" href="#" class="btn btn-info fr" onclick="deletexx(this);return false">删除</a>
					<a id="addzz"  href="#" onclick="addClick(this);return false" class="btn btn-info fr" >新增</a>
				</div>

				<!-- Table -->
				<div id="zhuzuo"></div>
				<div id="zzpageColumn" tablename="s_book" style="text-align:center; height: 30px;background-color: rgb(239, 243, 248) !important;padding-top: 5px;">

				</div>
			</div>
			<div id="zz" style="display:none;margin-top:15px;"> <center>

				<table class='tableClass author1' id="author1" >
					<tr>
						<td style='width:120px'><h2>来源项目：</h2></td>
						<td colspan="3"><input type="text" size="35" class="form-control" name="PROJECT_SOURCE_ID1" id="PROJECT_SOURCE_ID1" ></td>
					</tr>
					<tr>
						<td><h2>书名：</h2></td>
						<td colspan="3"><input type="text" size="35" class="form-control" name="NAME1" id="NAME1" ></td>
					</tr>
					<tr>
						<td ><h2>作者：(<a rel="adda1" onClick='adda1Author()' href="javascript:void(0)">添加</a>)</h2></td>
						<td><h2>姓名</h2></td>
						<td><h2>单位</h2></td>
						<td><h2>操作</h2></td>
					</tr>
					<tr>
						<td ><h2></h2></td>
						<td><input type="text" class="form-control"  size="8" name="FIRST_AUTHOR_NAME1" id="FIRST_AUTHOR_NAME1"/></td>
						<td><input type="text" class="form-control"  size="8" name=""/></td>
						<td><h2></h2></td>
					</tr>
					<tr>
						<td ><h2></h2></td>
						<td><input type="text" class="form-control"  size="8" name="OTHER_AUTHOR_NAME1" id="OTHER_AUTHOR_NAME1"/></td>
						<td><input type="text" class="form-control"  size="8" name=""/></td>
						<td><h2></h2></td>
					</tr>
				</table>
			</center>
				<div><center>
					<table class='tableClass'>
						<tr>
							<td style='width:120px'><h2>出版社：</h2></td>
							<td colspan="3"><input type="text" size="35" class="form-control" name="PUBLISH_UNIT1" id="PUBLISH_UNIT1" ></td>
						</tr>
						<tr>
							<td ><h2>日期：</h2></td>
							<td colspan="3"><input type="text" size="35" class="form-control" name="PUBLISH_DATE1" id="PUBLISH_DATE1" ></td>
						</tr>
						<tr>
							<td ><h2>字数：</h2></td>
							<td colspan="3"><input type="text" size="35" class="form-control" name="WORD_NUMBER1" id="WORD_NUMBER1" ></td>
						</tr>
						<tr>
							<td ><h2>备注：</h2></td>
							<td colspan="3"><input type="text" size="35" class="form-control" name="REMARK1" id="REMARK1" ></td>
						</tr>
						<tr>
							<td ><h2>主编：</h2></td>
							<td colspan="3"><input type="text" size="35" class="form-control" name="EDITOR1" id="EDITOR1"></td>
						</tr><tr>
						<td colspan="2"><span class="pull-right" ><input type="reset" value="重置" onclick="chongzhi();return false" class="btn btn-info fr"/></span></td>
						<td colspan="2"><a id="insertzz" href="#" class="btn btn-info fr" onclick="saveClick(this);return false">提交</a></td>
					</tr>
					</table>
				</center></div>
			</div><div id="xgzz"></div>
		</div></div></div>
<div class="wrapper row content shishi">
	<div class="col-xs-12 mainPanel">
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div id="jxlist">
				<div class="panel-heading">
					<span>奖项列表</span>
					<a id="deletejx" href="#" class="btn btn-info fr" onclick="deletexx(this);return false">删除</a>
					<a id="addjx" href="#" onclick="addClick(this);return false" class="btn btn-info fr" >新增</a>
				</div>


				<!-- Table -->
				<div id="jiangxiang"></div>

				<div id="jxpageColumn" tablename="s_prize" style="text-align:center; height: 30px;background-color: rgb(239, 243, 248) !important;padding-top: 5px;">

				</div>
			</div>
			<div id="jx" style="display:none;margin-top:15px;"><center>

				<table id="author2" class='author2 tableClass'>
					<tr>
						<td style='width:120px'><h2>来源项目：</h2></td>
						<td colspan="3"><input type="text" size="35" class="form-control" name="PROJECT_SOURCE_ID2" id="PROJECT_SOURCE_ID2" ></td>
					</tr>
					<tr>
						<td><h2>获奖名称：</h2></td>
						<td colspan="3"><input type="text" size="35" class="form-control" name="NAME2" id="NAME2" ></td>
					</tr>
					<tr >
						<td style='height:20px'><h2>成员：(<a rel="adda2" onClick='adda2Author()' href="javascript:void(0)">添加</a>)</h2></td>
						<td style='height:20px'><h2>姓名</h2></td>
						<td style='height:20px'><h2>单位</h2></td>
						<td style='height:20px'><h2>操作</h2></td>
					</tr>
					<tr>
						<td ><h2></h2></td>
						<td><input type="text" class="form-control"  size="8" name="FIRST_AUTHOR_NAME2" id="FIRST_AUTHOR_NAME2"/></td>
						<td><input type="text" class="form-control"  size="8" name=""/></td>
						<td><h2></h2></td>
					</tr>
					<tr>
						<td ><h2></h2></td>
						<td><input type="text" class="form-control"  size="8" name="OTHER_AUTHOR_NAME2" id="OTHER_AUTHOR_NAME2"/></td>
						<td><input type="text" class="form-control"  size="8" name=""/></td>
						<td><h2></h2></td>
					</tr>
				</table>
			</center>
				<div><center>
					<table class='tableClass'>
						<tr>
							<td style='width:120px'><h2>颁奖单位：</h2></td>
							<td colspan="3"><input type="text" size="35" class="form-control" name="UNIT2" id="UNIT2" ></td>
						</tr>
						<tr>
							<td ><h2>颁奖日期：</h2></td>
							<td colspan="3"><input type="text" size="35" class="form-control" name="PRIZE_DATE2" id="PRIZE_DATE2" ></td>
						</tr>
						<tr>
							<td ><h2>等级：</h2></td>
							<td colspan="3"><select name="" class="form-control" size="1" name="LEVEL2" id="LEVEL2">
								<option>---请选择---</option>
								<option value="一等奖">一等奖</option>
								<option value="二等奖">二等奖</option>
								<option value="三等奖">三等奖</option>

							</select> </td>
						<tr>
							<td ><h2>备注：</h2></td>
							<td colspan="3"><input type="text" size="35" class="form-control" name="REMARK2" id="REMARK2" ></td>
						</tr>
						<tr>
							<td colspan="2"><span class="pull-right" ><input type="reset" onclick="chongzhi();return false" value="重置" class="btn btn-info fr"/></span></td>
							<td colspan="2"><a id="insertjx" href="#" class="btn btn-info fr" onclick="saveClick(this);return false">提交</a></td>
						</tr>
					</table>
				</center>
				</div></div><div id="xgjx"></div>
		</div>
	</div>
</div>
<div class="wrapper row content zhongjian">
	<div class="col-xs-12 mainPanel">
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div id="pxlist">
				<div class="panel-heading">
					<span>培训列表</span>

				</div>
				<div class="panel-body">
					<a id="deletepx" href="#" class="btn btn-info fr" onclick="deletexx(this);return false">删除</a>
					<a id="addpx" href="#" onclick="addClick(this);return false" class="btn btn-info fr" >新增</a>

				</div>

				<!-- Table -->
				<div id="peixun"></div>
				<div id="pxpageColumn" tablename="s_train" style="text-align:center; height: 30px;background-color: rgb(239, 243, 248) !important;padding-top: 5px;">

				</div>
			</div>
			<div id="px" style="display:none; margin-top:15px;"><center>

				<table class='tableClass'>

					<tr>
						<td><h2>培训名称：</h2></td>
						<td colspan="3"><input type="text" size="35" class="form-control" name="NAME3" id="NAME3" ></td>
					</tr>

					<tr>
						<td class="col-md-4"><h2>培训单位：</h2></td>
						<td colspan="3"><input type="text" size="35" class="form-control" name="UNIT3" id="UNIT3" ></td>
					</tr>
					<tr>
						<td class="col-md-4"><h2>培训日期：</h2></td>
						<td colspan="3"><input type="text" size="35" class="form-control" name="DATE3" id="DATE3" ></td>
					</tr>
					<tr>
						<td class="col-md-4"><h2>培训内容：</h2></td>
						<td colspan="3"><input type="text" size="35" class="form-control" name="CONTENT3" id="CONTENT3" ></td>
					</tr>
					<tr>
						<td class="col-md-4"><h2>备注：</h2></td>
						<td colspan="3"><input type="text" size="35" class="form-control" name="REMARK3" id="REMARK3" ></td>
					</tr>
					<tr>
						<td colspan="2"><span class="pull-right" ><input type="reset" onclick="chongzhi();return false" value="重置" class="btn btn-info fr"/></span></td>
						<td colspan="2"><a id="insertpx" href="#" class="btn btn-info fr" onclick="saveClick(this);return false">提交</a></td>
					</tr>
				</table>
			</center></div><div id="xgpx"></div>
		</div></div>
</div>

<div class="wrapper row content jiexiang">
	<div class="col-xs-12 mainPanel">
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div id="xmlist">
				<div class="panel-heading">
					<span>项目列表</span>

				</div>
				<div class="panel-body">
					<a id="deletexm" href="#" class="btn btn-info fr" onclick="deletexx(this);return false">删除</a>
					<a id="addxm" href="#" onclick="addClick(this);return false" class="btn btn-info fr" >新增</a>


				</div>

				<!-- Table -->
				<div id="xiangmu"></div>

				<div id="xmpageColumn" tablename="s_project" style="text-align:center; height: 30px;background-color: rgb(239, 243, 248) !important;padding-top: 5px;">

				</div>
			</div><div id="xm" style="display:none;margin-top:15px;"><center>

			<table class='tableClass'>
				<tr>
					<td><h2>项目名称：</h2></td>
					<td colspan="3"><input type="text" size="35" class="form-control" name="NAME4" id="NAME4" ></td>
				</tr>

				<tr>
					<td class="col-md-4"><h2>立项单位：</h2></td>
					<td colspan="3"><input type="text" size="35" class="form-control" name="UNIT4" id="UNIT4" ></td>
				</tr>
				<tr>
					<td class="col-md-4"><h2>项目类型：</h2></td>
					<td colspan="3"><input type="text" size="35" class="form-control" name="TYPE4" id="TYPE4" ></td>
				</tr>
				<tr>
					<td class="col-md-4"><h2>项目来源：</h2></td>
					<td colspan="3"><input type="text" size="35" class="form-control" name="FROM4" id="FROM4" ></td>
				</tr>
				<tr>
					<td class="col-md-4"><h2>担任角色：</h2></td>
					<td colspan="3"><input type="text" size="35" class="form-control" name="ROLE4" id="ROLE4" ></td>
				</tr>
				<tr>
					<td class="col-md-4"><h2>获奖情况：</h2></td>
					<td colspan="3"><input type="text" size="35" class="form-control" name="ACHIEVE4" id="ACHIEVE4" ></td>
				</tr>
				<tr>
					<td class="col-md-4"><h2>项目负责人：</h2></td>
					<td colspan="3"><input type="text" size="35" class="form-control" name="CHARGE4" id="CHARGE4" ></td>
				</tr>
				<tr>
					<td class="col-md-4"><h2>项目经费：</h2></td>
					<td colspan="3"><input type="text" size="35" class="form-control" name="MONEY4" id="MONEY4" ></td>
				</tr>
				<tr>
					<td class="col-md-4"><h2>起止时间：</h2></td>
					<td colspan="3"><input type="text" size="35" class="form-control" name="DATE4" id="DATE4" ></td>
				</tr>
				<tr>
					<td colspan="2"><span class="pull-right" ><input type="reset" value="重置" onclick="chongzhi();return false" class="btn btn-info fr"/></span></td>
					<td colspan="2"><a id="insertxm" href="#" class="btn btn-info fr" onclick="saveClick(this);return false">提交</a></td>
				</tr>
			</table>
		</center></div><div id="xgxm"></div></div>
	</div>
</div>
</body>
</html>
