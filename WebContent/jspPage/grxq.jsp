<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>    
  
    <title>个人</title>
    <link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/smsb.css">
    <script src="<%=request.getContextPath()%>/bootstrap/js/jquery.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/font-awesome.min.css" />
    <script src="<%=request.getContextPath()%>/js/ALERT.js"></script>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/ace.min.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/ace-rtl.min.css" />
	<script src="<%=request.getContextPath()%>/bootstrap/js/html5shiv.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/js/respond.min.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-1.10.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/control_zbw.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="DesignerQQ:243696826">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	#style-b
			{
				font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
				font-size: 18px;
				background: #fff;
				margin: 0px auto;
				width: 100%;
				/* height:700px; */
				border-collapse: collapse;
				text-align: center;
			}
			#style-b th
			{
				font-size: 14px;
				font-weight: normal;
				color: #039;
				padding: 10px 8px;
				border-bottom: 2px solid #6678b1;
			}
			#style-b tr,#style-b td
			{
				border: 1px solid #ccc;
				color: #669;
				padding: 6px 8px;
				height:50px;
			}
			

  </style>

  </head>
  
  <body>
    <div class="main-container">
    	<div class="top">
		<div class="topbar">
			<div class="logo">
				上海市教育科学研究院
				Shanghai Academic of Education Sciences
			</div>
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
    	<div class="container" style="margin-top:10px">
    		<div>
    			<ul id="myTab" class="nav nav-tabs">
    				<li class="active">
    					<a href='#xx' data-toggle="tab">个人信息详情</a>
    				</li>
    				<li>
    					<a href='#jl' data-toggle='tab'>个人简历</a>
    				</li>
    			</ul>
    		</div>
    		<div class="tab-content">
    			<div class="tab-pane fade in active" id="xx">
    				<form action="">
    					<div>
    						<h4>详情列表</h4>
    					</div>
    					<div class="divider">
    						<hr/>	
    					</div>
    					<div class="pull-right">
    						<a rel="edit" href="javascript:void(0)" class="btn btn-primary"  id="edit">编辑</a>
    						<a rel="update" href="javascript:void(0)" class="btn btn-primary" disabled="true" id="update">保存</a> 
    					</div>
    					<div style="margin-top:80px"><hr/></div>
    					<div><center>
    						<table id="style-b" class="container" >
    						
    							<tr>
    								<td class="col-md-2">姓名</td>
    								<td class="col-md-4" ><span class="username">${PersonList.NAME}</span></td>
    								<td class="col-md-2">工号</td>
    								<td class="col-md-4"><span class="userid">${PersonList.PERSON_ID}</span></td>
    							</tr>
    							<tr>
    								<td class="col-md-2">性别</td>
    								<td class="col-md-4"><span class="usersex">
									<c:if test="${PersonList.SEXID==1 }">男</c:if>
    								<c:if test="${PersonList.SEXID==2 }">女</c:if>
									</span></td>
    								<td class="col-md-2">职务</td>
    								<td class="col-md-4"><span class="userduty">${PersonList.DUTY}</span></td>
    							</tr>
    							<tr>
    								<td class="col-md-2">职称</td>
    								<td class="col-md-4"><span class="usertitle">${PersonList.TITLE_ID}</span></td>
    								<td class="col-md-2">电话</td>
    								<td class="col-md-4"><span class="usertele">${PersonList.MOBILE}</span></td>
    							</tr>
    							<tr>
    								<td class="col-md-2">邮编</td>
    								<td class="col-md-4"><span class="userpostal">${PersonList.POSTAL_CODE}</span></td>
    								<td class="col-md-2">通讯地址</td>
    								<td class="col-md-4"><span class="useraddr">${PersonList.ADDRESS}</span></td>
    							</tr>
    							<tr>
    								<td class="col-md-2">所属科室</td>
    								<td class="col-md-4"><span class="usersubject">${PersonList.SUBJECT_CLASS_ID}</span></td>
    								<td class="col-md-2">所属科研所</td>
    								<td class="col-md-4"><span class="userresearch">${PersonList.RESEARCH_FIELD}</span></td>
    							</tr>
    					
    						</table></center>
    					</div>
    				</form>
    			</div>
    			<div class="tab-pane fade" id="jl">
    				<form action="">
    					<div class="pull-right" id="Layer1">
    						<a rel="edit_2" href="javascript:void(0)" class="btn btn-primary" id="edit_2">编辑</a>
    						<a rel="update_2" href="javascript:void(0)" class="btn btn-primary" disabled="true" id="update_2">保存</a>
    						<a rel="exportWord" href="javascript:void(0)" class="btn btn-primary" id="exportWord" onClick="return saveas(content,'文件名.doc')">导出</a>
    					</div><br/>
    					<div style="margin-top:40px"><hr/></div>
    					<div id="content" class="table-c"><center>
    						<table id="style-b" class="container" style="margin-top:60px" border="1" cellspacing="0" cellpadding="0" >
    							<tr >
    								<td class="col-md-2">姓名</td>
    								<td class="col-md-4"><span class="username_2">${PersonList.NAME}</span></td>
    								<td class="col-md-2">性别</td>
    								<td class="col-md-4"><span class="usersex_2">
    								<c:if test="${PersonList.SEXID==1 }">男</c:if>
    								<c:if test="${PersonList.SEXID==2 }">女</c:if>
    								</span></td>
    							</tr>
    							<tr>
    								<td class="col-md-2">出生年月</td>
    								<td class="col-md-4"><span class="userbirth">${PersonList.BIRTHDAY}</span></td>
    								<td class="col-md-2">民族</td>
    								<td class="col-md-4"><span class="usernation">${PersonList.NATION_ID}</span></td>
    							</tr>
    							<tr>
    								<td class="col-md-2">学历</td>
    								<td class="col-md-4"><span class="useredudegree">${PersonList.EDU_DEGREE_ID}</span></td>
    								<td class="col-md-2">专业</td>
    								<td class="col-md-4"><span class="">没有找到对应字段</span></td>
    							</tr>
    							<tr>
    								<td class="col-md-2">工作经验</td>
    								<td class="col-md-4"><span class="userexp">${PersonList.EXPERT_FLAG}</span></td>
    								<td class="col-md-2">联系电话</td>
    								<td class="col-md-4"><span class="usermobile">${PersonList.MOBILE}</span></td>
    							</tr>
    							<tr>
    								<td class="col-md-2">毕业学院</td>
    								<td colspan="3" class="col-md-10"><span class="userschool">${PersonList.GRADUATE_SCHOOL}</span></td>	
    							</tr>
    							<tr>
    								<td class="col-md-2">住址</td>
    								<td colspan="3" class="col-md-10">
    								<span class="useraddr_2">${PersonList.ADDRESS}</span></td>
    							</tr>
    							<tr>
    								<td class="col-md-2">电子信箱</td>
    								<td colspan="3" class="col-md-10"><span class="useremail">${PersonList.EMAIL}</span></td>
    							</tr>
    							<tr>
    								<td class="col-md-2" border-right="0px">自我评价</td>
    								<td colspan="3" class="col-md-10"></td>
    							</tr>
    							<tr>
    								<td colspan="4" class="col-md-12"><span class="selfeva">${PersonList.SELF_EVA}</span></td>

    							</tr>
    							<tr>
    								<td class="col-md-2">工作经历</td>
    								<td colspan="3" class="col-md-10"></td>
    							</tr>
    							<tr>
    								<td colspan="4" class="col-md-2"><span class="workexp" >${PersonList.WORK_EXP}</span></td>
    							</tr>
    							<tr>
    								<td class="col-md-2">教育经历</td>
    								<td colspan="3" class="col-md-10"></td>
    							</tr>
    							<tr>
    								<td colspan="4" class="col-md-12"><span class="eduexp">${PersonList.EDU_EXP}</span></td>
    							</tr>
    							<tr>
    								<td class="col-md-2">专业技能</td>
    								<td colspan="3" class="col-md-10"></td>
    							</tr>
    							<tr>
    								<td colspan="4" class="col-md-12"><span class="proskill">${PersonList.PRO_SKILL}</span></td>

    							</tr>
    							<tr>
    								<td class="col-md-2">其他信息</td>
    								<td colspan="3" class="col-md-10"></td>
    							</tr>
    							<tr>
    								<td colspan="4" class="col-md-12"><span class="eelse">${PersonList.EELSE}</span></td>
    							</tr>
    						</table></center>
    						</div>
    				</form>
    			</div>
    		</div>
    	</div>
    </div>
   
   
   	<script type="text/javascript"><!--
 		$(function(){
            $("a[rel='edit']").click(function () {
            	$('#update').attr("disabled",false);
            	$('#edit').attr("disabled",true);
                var username=$(".username");
                var txt01=username.text();
                var news01= $("<input type='text' id='username' value='" + txt01 + "'/>");
                username.html(news01);
                
                var userid=$(".userid");
                var txt02=userid.text();
                var news02= $("<input type='text' id='userid' value='" + txt02 + "'/>");
                userid.html(news02);
                
                var usersex=$(".usersex");
                var txt03=usersex.text();
                var news03= $("<input type='radio' id='usersex' name='usersex' value=1 <c:if test='${PersonList.SEXID==1 }'>checked='true'</c:if>/>男 </input> <input <c:if test='${PersonList.SEXID==2 }'>checked='true'</c:if> type='radio' name='usersex' value='2'>女  </input>");
                usersex.html(news03);
                
                var userduty=$(".userduty");
                var txt04=userduty.text();
                var news04= $("<input type='text' id='userduty' value='" + txt04 + "'/>");
                userduty.html(news04);
                
                var usertitle=$(".usertitle");
                var txt05=usertitle.text();
                var news05= $("<input type='text' id='usertitle' value='" + txt05 + "'/>");
                usertitle.html(news05);
                
                var usertele=$(".usertele");
                var txt06=usertele.html();
                var news06= $('<input type="text" id="usertele" value="' + txt06 + '"/>');
                usertele.html(news06);
                
                var userpostal=$(".userpostal");
                var txt07=userpostal.text();
                var news07= $("<input type='text' id='userpostal' value='" + txt07 + "'/>");
                userpostal.html(news07);
                
                var useraddr=$(".useraddr");
                var txt08=useraddr.text();
                var news08= $("<input type='text' id='useraddr' value='" + txt08 + "'/>");
                useraddr.html(news08);
                
                var usersubject=$(".usersubject");
                var txt09=usersubject.text();
                var news09= $("<input type='text' id='usersubject' value='" + txt09 + "'/>");
                usersubject.html(news09);
                
                var userresearch=$(".userresearch");
                var txt10=userresearch.text();
                var news10= $("<input type='text' id='userresearch' value='" + txt10 + "'/>");
                userresearch.html(news10);
            })
            
             $("a[rel='edit_2']").click(function () {
             	$('#update_2').attr("disabled",false);
            	$('#edit_2').attr("disabled",true);
                var username_2=$(".username_2");
                var txt01=username_2.text();
                var news01= $("<input type='text' id='username_2' value='" + txt01 + "'/>");
                username_2.html(news01);
                
                var usersex_2=$(".usersex_2");
                var txt02=usersex_2.text();
                var news02= $("<input type='radio' id='usersex_2' name='usersex_2' value=1 <c:if test='${PersonList.SEXID==1 }'>checked='true'</c:if>/>男 </input> <input <c:if test='${PersonList.SEXID==2 }'>checked='true'</c:if> type='radio' name='usersex_2' value='2'>女  </input>");
                usersex_2.html(news02);
                
                var userbirth=$(".userbirth");
                var txt03=userbirth.text();
                var news03= $("<input type='text' id='userbirth' value='" + txt03 + "'/>");
                userbirth.html(news03);
                
                var usernation=$(".usernation");
                var txt04=usernation.text();
                var news04= $("<input type='text' id='usernation' value='" + txt04 + "'/>");
                usernation.html(news04);
                
                var useredudegree=$(".useredudegree");
                var txt05=useredudegree.text();
                var news05= $("<input type='text' id='useredudegree' value='" + txt05 + "'/>");
                useredudegree.html(news05);
                
				
                
                var userexp=$(".userexp");
                var txt07=userexp.text();
                var news07= $("<input type='text' id='userexp' value='" + txt07 + "'/>");
                userexp.html(news07);
                
                var usermobile=$(".usermobile");
                var txt08=usermobile.text();
                var news08= $("<input type='text' id='usermobile' value='" + txt08 + "'/>");
                usermobile.html(news08);
                
                var userschool=$(".userschool");
                var txt09=userschool.text();
                var news09= $("<input type='text' id='userschool' value='" + txt09 + "'/>");
                userschool.html(news09);
                
                var useraddr_2=$(".useraddr_2");
                var txt10=useraddr_2.text();
                var news10= $("<input type='text' id='useraddr_2' value='" + txt10 + "'/>");
                useraddr_2.html(news10);
                
                var useremail=$(".useremail");
                var txt11=useremail.text();
                var news11= $("<input type='text' id='useremail' value='" + txt11 + "'/>");
                useremail.html(news11);
                
                var selfeva=$(".selfeva");
                var txt12=selfeva.text();
                var news12= $("<input type='text' id='selfeva' value='" + txt12 + "'/>");
                selfeva.html(news12);
                
                var workexp=$(".workexp");
                var txt13=workexp.text();
                var news13= $("<input type='text' id='workexp' value='" + txt13 + "'/>");
                workexp.html(news13);
                
                var eduexp=$(".eduexp");
                var txt14=eduexp.text();
                var news14= $("<input type='text' id='eduexp' value='" + txt14 + "'/>");
                eduexp.html(news14);
                
                var proskill=$(".proskill");
                var txt15=proskill.text();
                var news15= $("<input type='text' id='proskill' value='" + txt15 + "'/>");
                proskill.html(news15);
                
                var eelse=$(".eelse");
                var txt16=eelse.text();
                var news16= $("<input type='text' id='eelse' value='" + txt16 + "'/>");
                eelse.html(news16);
                
                
                
                
                
            })
        });
        
        $(function(){
        	$("a[rel='update']").click(function (){
        		$('#edit').attr("disabled",false);
        		$('#update').attr("disabled",true);
        		var username=$('#username').val();
        		var userid=$('#userid').val();
        		var usersex=$('input[name=usersex][checked]').val();
        		var userduty=$('#userduty').val();
        		var usertitle=$('#usertitle').val();
        		var usertele=$('#usertele').val();
        		var userpostal=$('#userpostal').val();
        		var useraddr=$('#useraddr').val();
        		var usersubject=$('#usersubject').val();
        		var userresearch=$('#userresearch').val();
        		$.ajax({
                    type: "post",
                    url: "personInfoUpdateAction",
                    data: {"username":username,"userid":userid,"usersex":usersex,"userduty":userduty,"usertitle":usertitle,"usertele":usertele,"userpostal":userpostal,"useraddr":useraddr,"usersubject":usersubject,"userresearch":userresearch}
                });
                
                var username=$(".username");
				var txt01=$('#username').val();
				username.html(txt01);
				
				var userid=$(".userid");
				var txt02=$('#userid').val();
				userid.html(txt02);
				
				var usersex=$(".usersex");
				var txt03=$('input[name=usersex][checked]').val();
				var sexHtml="女";
				if(txt03==1){
					sexHtml="男";
				}
				usersex.html(sexHtml);
				
				var userduty=$(".userduty");
				var txt04=$('#userduty').val();
				userduty.html(txt04);
				
				var usertitle=$(".usertitle");
				var txt05=$('#usertitle').val();
				usertitle.html(txt05);
				
				var usertele=$(".usertele");
				var txt06=$('#usertele').val();
				usertele.html(txt06);
				
				var userpostal=$(".userpostal");
				var txt07=$('#userpostal').val();
				userpostal.html(txt07);
				
				var useraddr=$(".useraddr");
				var txt08=$('#useraddr').val();
				useraddr.html(txt08);
				
				var usersubject=$(".usersubject");
				var txt09=$('#usersubject').val();
				usersubject.html(txt09);
				
				var userresearch=$(".userresearch");
				var txt10=$('#userresearch').val();
				userresearch.html(txt10);
                
        	})
        	
        	$("a[rel='update_2']").click(function (){
        		$('#edit_2').attr("disabled",false);
        		$('#update_2').attr("disabled",true);	
        		var username_2=$('#username_2').val();
        		var usersex_2=$('input[name=usersex_2][checked]').val();
        		var userbirth=$('#userbirth').val();
        		var usernation=$('#usernation').val();
        		var useredudegree=$('#useredudegree').val();
        		
        		var userexp=$('#userexp').val();
        		var usermobile=$('#usermobile').val();
        		var userschool=$('#userschool').val();
        		var useraddr_2=$('#useraddr_2').val();
        		var useremail=$('#useremail').val();
        		
        		var selfeva=$('#selfeva').val();
        		var workexp=$('#workexp').val();
        		var eduexp=$('#eduexp').val();
        		var proskill=$('#proskill').val();
        		var eelse=$('#eelse').val();
        		
        		
        		$.ajax({
                    type: "post",
                    url: "personInfoUpdateAction_2",
                    data: {"username_2":username_2,
                    	"usersex_2":usersex_2,
                    	"userbirth":userbirth,
                    	"usernation":usernation,
                    	"useredudegree":useredudegree,
                    	"userexp":userexp,
                    	"usermobile":usermobile,
                    	"userschool":userschool,
                    	"useraddr_2":useraddr_2,
                    	"useremail":useremail,
                    	"selfeva":selfeva,
                    	"workexp":workexp,
                    	"eduexp":eduexp,
                    	"proskill":proskill,
                    	"eelse":eelse
                    	
                    }
                });
                

				var username_2=$(".username_2");
				var txt01=$('#username_2').val();
				username_2.html(txt01);
				
				var usersex_2=$(".usersex_2");
				var txt02=$('input[name=usersex_2][checked]').val();
				var sexHtml="女";
				if(txt02==1){
					sexHtml="男";
				}
				usersex_2.html(sexHtml);
				
				var userbirth=$(".userbirth");
				var txt03=$('#userbirth').val();
				userbirth.html(txt03);
				
				var usernation=$(".usernation");
				var txt04=$('#usernation').val();
				usernation.html(txt04);
				
				var useredudegree=$(".useredudegree");
				var txt05=$('#useredudegree').val();
				useredudegree.html(txt05);
				
				var userexp=$(".userexp");
				var txt06=$('#userexp').val();
				userexp.html(txt06);
				
				var usermobile=$(".usermobile");
				var txt07=$('#usermobile').val();
				usermobile.html(txt07);
				
				var userschool=$(".userschool");
				var txt08=$('#userschool').val();
				userschool.html(txt08);
				
				var useraddr_2=$(".useraddr_2");
				var txt09=$('#useraddr_2').val();
				useraddr_2.html(txt09);
				
				var useremail=$(".useremail");
				var txt10=$('#useremail').val();
				useremail.html(txt10);
				
				var selfeva=$(".selfeva");
				var txt11=$('#selfeva').val();
				selfeva.html(txt11);
				
				var workexp=$(".workexp");
				var txt12=$('#workexp').val();
				workexp.html(txt12);
				
				var eduexp=$(".eduexp");
				var txt13=$('#eduexp').val();
				eduexp.html(txt13);
				
				var proskill=$(".proskill");
				var txt14=$('#proskill').val();
				proskill.html(txt14);
				
				var eelse=$(".eelse");
				var txt15=$('#eelse').val();
				eelse.html(txt15);
				
				
				
            })
            
            $("a[rel='exportWord']").click(function (){
				
            })
        	
        });
  
        function refresh(){
    		window.location.replace("personInfo");  		
    	}
    	
    	function refresh_2(){
    		window.location.replace("personInfo");      				
    	}
			
		function saveas(Id,filename)
            {
            var mStr;
            mStr = window.document.body.innerHTML ;
            var mWindow = window;
            window.document.body.innerHTML= Id.innerHTML; 
            //mWindow.print();
            document.write(window.document.body.innerHTML);
            document.execCommand("saveAs","1",filename);
             
            window.document.body.innerHTML = mStr;
            history.back();
            }
		
</script>
<!--
	
	<script language="javascript">
function OpenWord(){
			Layer1.style.border=0;
			ExcelSheet = new ActiveXObject('Word.Application');
			ExcelSheet.Application.Visible = true;
			var mydoc=ExcelSheet.Documents.Add('',0,1);
			myRange =mydoc.Range(0,1);
			var sel=Layer1.document.body.createTextRange();
			sel.select();
			Layer1.document.execCommand('Copy');
			sel.moveEnd('character');
			myRange.Paste();
			location.reload();;
			ExcelSheet.ActiveWindow.ActivePane.View.Type=9;
		}
</script>
  --><!--
  <script type="text/javascript">
  	function exportWord() {  
    		var filePath = getExportPath();  
    		if(filePath != null) {  
        		try {  
           		 	var word = new ActiveXObject("Word.Application");  
            		var doc = word.Documents.Add("", 0, 1);  
            		var range = doc.Range(0, 1);  
            		var sel = document.body.createTextRange();  
            		try {  
                		sel.moveToElementText(content);  
            			} catch (notE) {  
               		 		alert("导出数据失败，没有数据可以导出。");  
                			window.close();  
                			return;  
            			}  
            			sel.select();  
           				sel.execCommand("Copy");  
            			range.Paste();  
            //word.Application.Visible = true;// 控制word窗口是否显示  
            			doc.saveAs(filePath + "/导出测试.doc");// 保存  
            			alert("导出成功");  
       					} catch (e) {  
            				alert("导出数据失败，需要在客户机器安装Microsoft Office Word(不限版本)，将当前站点加入信任站点，允许在IE中运行ActiveX控件。");  
        				} finally {  
            				try {word.quit();// 关闭word窗口} catch (ex) {}  
        					}  
    					}  
				}  	
		}

		function getExportPath() {  
    var shell = new ActiveXObject("Shell.Application");  
    var folder = shell.BrowseForFolder(0, '请选择存储目录', 0x0040, 0x11);   
    var filePath;  
    if(folder != null) {  
         filePath = folder.Items().Item().Path;  
    }  
    return filePath;  
}  
  </script>
  --></body>
</html>


