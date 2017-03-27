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
        $(document).ready(function () {
            ModifyClick();
        });

        function ModifyClick() {
            $("input[type='button'] ").each(function () {
                $(this).unbind("click");
                $(this).bind("click", function () {
                    if ($(this).val() == "＋") {
                        $("#nameflg").parent().after("<tr><td>郑博文</td><td>男</td><td>1993-04-22</td><td>讲师</td><td>数据库</td><td>博士</td><td>教研所</td><td></td></tr>");
                    }
                    if ($(this).val() == "－") {
                        $("#nameflg").parent().next().eq(0).remove();
                    }
                });
            });
         }
    </script> 
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
					<span>项目基本信息添加</span>
					<button class="btn btn-info fr"><a href="/SAES/appmana-index">返回</a></button>
					
				</div>
				

		  		<!-- Table -->
				<!-- Table -->
				<table class="table table-bordered table-hover">
					
      				<tbody>
				       <tr>
				          <td colspan="5" class="col-xs-1">项目名称</td>
				          <td colspan="4" class="col-xs-1">全国哲学社会</td>
			          </tr>
				        <tr>
				          <td colspan="2" class="col-xs-1">学科分类</td>
				          <td colspan="3" class="col-xs-5 tal">课程教材</a></td>
				          <td colspan="2" class="col-xs-1">研究领域</td>
				          <td colspan="2" class="col-xs-1">高等教育</td>
			            </tr>
						<tr>
				          <td colspan="2" class="col-xs-1">申请人姓名</td>
				          <td colspan="3" class="col-xs-5 tal">王 凯</td>
				          <td width="8%" class="col-xs-1">性别</td>
				          <td width="8%" class="col-xs-1">男</td>
				          <td width="8%" class="col-xs-1">身份证号码</td>
				          <td width="18%" class="col-xs-1">44445588663454546</td>
				        </tr>
						<tr>
				          <td colspan="2" class="col-xs-1">行政职务</td>
				          <td colspan="3" class="col-xs-5 tal">科员</td>
				          <td colspan="2" class="col-xs-1">职称</td>
				          <td colspan="2" class="col-xs-1">教授</td>
			            </tr>
						<tr>
				          <td colspan="2" class="col-xs-1">工作单位</td>
				          <td colspan="3" class="col-xs-5 tal">上海市科学研究所</td>
				          <td colspan="2" class="col-xs-1">电子信箱</td>
				          <td colspan="2" class="col-xs-1">www.123@.com</td>
			            </tr>
						<tr>
				          <td colspan="2" class="col-xs-1">通讯地址</td>
				          <td colspan="3" class="col-xs-5 tal">&nbsp;</td>
				          <td colspan="2" class="col-xs-1">联系电话</td>
				          <td colspan="2" class="col-xs-1">2346789456</td>
			            </tr>
						 <tr>
				          <td width="15%" rowspan="6" class="col-xs-1 STYLE2"></td>
				          <td width="3%" height="42" class="col-xs-1">姓名</td>
				          <td width="10%" class="col-xs-1">性别</td>
				          <td width="20%" class="col-xs-1">出生年月</td>
				          <td width="10%" class="col-xs-1">职称</td>
				          <td class="col-xs-1">研究专长</td>
				          <td class="col-xs-1">学历</td>
				          <td class="col-xs-1">工作单位</td>
						  <td class="col-xs-1"><input type="button" value="＋" class="btn"/><input type="button" class="btn" value="－" /></td>
			          </tr>
					  <tr>
					    <td class="col-xs-1"  id="nameflg">郑博文</td>
				          <td width="10%" class="col-xs-1">男</td>
				          <td width="20%" class="col-xs-1">1992-02-05</td>
				          <td width="10%" class="col-xs-1">讲授</td>
				          <td class="col-xs-1">数据库</td>
				          <td class="col-xs-1">硕士</td>
				          <td class="col-xs-1">上海理工大学</td>
						  <td class="col-xs-1">&nbsp;</td>
			          </tr>
					  
					  <tr>
					    <td class="col-xs-1">&nbsp;</td>
				          <td width="10%" class="col-xs-1">&nbsp;</td>
				          <td width="20%" class="col-xs-1">&nbsp;</td>
				          <td width="10%" class="col-xs-1">&nbsp;</td>
				          <td class="col-xs-1">&nbsp;</td>
				          <td class="col-xs-1">&nbsp;</td>
				          <td class="col-xs-1">&nbsp;</td>
						  <td class="col-xs-1">&nbsp;</td>
			          </tr>
						
						<tr>
				          <td colspan="2" class="col-xs-1">项目类别</td>
				          <td colspan="3" class="col-xs-5 tal">重大项目</td>
				          <td colspan="2" class="col-xs-1">申请经费（元）</td>
				          <td colspan="2" class="col-xs-1">&nbsp;</td>
			            </tr>
						
						<tr>
				          <td colspan="2" class="col-xs-1">预期成果</td>
				          <td colspan="3" class="col-xs-5 tal">&nbsp;</td>
				          <td colspan="2" class="col-xs-1">预计完成时间</td>
				          <td colspan="2" class="col-xs-1">&nbsp;</td>
			            </tr>
						<tr>
						    <td class="col-xs-1"><a href="#">添加附件：</a></td>
						</tr>
						<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>
					      <td align="right" class="col-xs-1"><button class="btn btn-info fr">保存</button></td>
						</tr>
				    </tbody>
				</table>
				
			</div>
		</div>
	</div>
	
<script src="<%=request.getContextPath()%>/js/jquery-1.10.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/control.js"></script>
</body>
</html>