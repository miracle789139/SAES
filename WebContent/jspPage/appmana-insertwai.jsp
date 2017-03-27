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
				<form action="/SAES/appmanaAddApply" method="post">
				<table class="table table-bordered table-hover">
					
      				<tbody>
      				
				       <tr>
				          <td colspan="2" class="col-xs-1">项目名称</td>
				          <td colspan="7" class="col-xs-1">
				              <input type="text" name="proName"/>
                          </td>
			          </tr>
				        <tr>
				          <td colspan="2" class="col-xs-1">项目来源</td>
				          <td colspan="7" class="col-xs-1">
				              <select id="prolocation" name="proLocation" >
				                  <option >北京</option>
				                  <option >上海</option>
				                  <option >河南</option>
				              </select> 
                          </td>
			            </tr>
						<tr>
				          <td colspan="2" class="col-xs-1">项目性质</td>
				          <td colspan="7" class="col-xs-1">
				              <select id="proClass"  name="proClass">
				                  <option>国家级</option>
				                  <option>省部级</option>
				                  <option>地区级</option>
				              </select> 
                          </td>
				        </tr>
				        <tr>
				          <td colspan="2" class="col-xs-1">项目类型</td>
				          <td colspan="7" class="col-xs-1">
				              <select id="proType"  name="proType">
				                  <option>全国哲学社会</option>
				                  <option>国家自然科学</option>
				                  <option>国家教育规划</option>
				                  <option>上海自然科学</option>
				                  <option>上海决策咨询</option>
				                  <option>上海哲学社会</option>
				                  <option>上海教育规划</option>
				                  <option>院外其他</option>
				              </select> 
                          </td>
				        </tr>
						<tr>
				          <tr>
				          <td colspan="2" class="col-xs-1">负责人姓名</td>
				          <td colspan="2" class="col-xs-1">
				              <input type="text" name="applierName"/>
                          </td>
				          <td width="8%" class="col-xs-1">性别</td>
				          <td width="8%" class="col-xs-1">
				              <input type="text" name="sex"/>
				          </td>
				          <td width="8%" class="col-xs-1">身份证号码</td>
				          <td colspan="2" class="col-xs-1">
				              <input type="text" name="idCard"/>
				          </td>
				        </tr>
			            </tr>
						<tr>
				          <td colspan="2" class="col-xs-1">行政职务</td>
				          <td colspan="2" class="col-xs-1">
				              <input type="text" name="xingzheng"/>
				          </td>
				          <td width="8%" class="col-xs-1">职称</td>
				          <td width="8%" class="col-xs-1">
				              <select name="zhicheng">
				                  <option>教授</option>
				                  <option>副教授</option>
				                  <option>讲师</option>
				              </select> 
				          </td>
				          <td width="8%" class="col-xs-1">研究专长</td>
				          <td colspan="2" class="col-xs-1">
				              <input type="text" name="search"/>
				          </td>
			            </tr>
						<tr>
				          <td colspan="2" class="col-xs-1">所在单位</td>
				          <td colspan="3" class="col-xs-1">
				              <input type="text" name="unit"/>
				          </td>
				          <td colspan="2" class="col-xs-1">电子信箱</td>
				          <td colspan="2" class="col-xs-1">
				              <input type="text" name="email"/>
				          </td>
			            </tr>
			            <tr>
				          <td colspan="2" class="col-xs-1">通讯地址</td>
				          <td colspan="3" class="col-xs-1">
                              <input type="text" name="address"/>
                          </td>
				          <td colspan="2" class="col-xs-1">邮政编码</td>
				          <td colspan="2" class="col-xs-1">
                              <input type="text" name="postal"/>
                          </td>
			            </tr>
						 <tr>
				           <td colspan="2" class="col-xs-1">联系电话</td>
				          <td colspan="7" class="col-xs-1">（手机）<input type="text" name="mobile"/>（家庭）<input type="text" name="telHome"/>（单位）<input type="text" name="telUnit"/></td>
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