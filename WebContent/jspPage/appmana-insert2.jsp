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
        function ClickFun(){
        	$("#tixing").html("*每个关键字之间用逗号隔开*");
        }

        function ModifyClick() {
            $("input[type='button'] ").each(function () {
                $(this).unbind("click");
                $(this).bind("click", function () {
                    if ($(this).val() == "＋") {
                        $("#nameflg").parent().after().html("<tr><td><input type="text" name="authorName"/></td><td><input type="text" name="achievementName"/></td><td ><input type="text" name="achievementMode"/></td><td><input type="text" name="publicUnit"/></td><td><input type="text" name="publicTime"/></td><td></td></tr>");
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
					<span>中青年研究项目基本信息添加</span>
					<button class="btn btn-info fr"><a href="/SAES/appmana-index">返回</a></button>
					
				</div>
				

		  		<!-- Table -->
				<!-- Table -->
				<form action="#" method="post">
				<table class="table table-bordered table-hover">
					
      				<tbody>
      				<tr>
				          <td colspan="9" class="col-xs-1 tal">一、基本信息表</td>
			          </tr>
				       <tr>
				          <td colspan="1" class="col-xs-1">项目名称</td>
				          <td colspan="8" class="col-xs-1">
				              <input type="text" name="proName" />
                          </td>
			          </tr>
			          <tr>
				          <td colspan="1" class="col-xs-1">关键字</td>
				          <td colspan="8" class="col-xs-1">
				               <input type="text" name="key" id="key"  onclick="ClickFun()"/><font color="red" id="tixing"></font>
                          </td>
			          </tr>
			          <tr>
				          <td colspan="1" class="col-xs-1">研究领域</td>
				          <td colspan="8" class="col-xs-1">
				              <select id="searchArear"  name="searchArear">
				                  <option>高等教育</option>
				                  <option>职业教育</option>
				                  <option>成人教育</option>
				                  <option>基础教育</option>
				                  <option>学前教育</option>
				                  <option>特殊教育</option>
				              </select>
				          </td>
			          </tr>
				        <tr>
				          <td colspan="1" class="col-xs-1">学科分类</td>
				          <td colspan="8" class="col-xs-1">
				              <select id="subjectClass"  name="subjectClass" >
				                  <option>教育发展战略</option>
				                  <option>教育基本理论</option>
				                  <option>教育心理</option>
				                  <option>教育史</option>
				                  <option>比较教育</option>
				                  <option>教育管理</option>
				                  <option>德育</option>
				                  <option>美育</option>
				                  <option>体育</option>
				                  <option>课程教材</option>
				                  <option> 综合</option>
				                  <option>其它</option>
				              </select>
                          </td>
			            </tr>
			            <tr>
				          <td colspan="1" class="col-xs-1">研究类型</td>
				          <td colspan="8" class="col-xs-1">
				               <select id="searchClass"  name="searchClass" >
				                  <option>基础研究</option>
				                  <option>应用研究</option>
				                  <option>综合研究</option>
				                  <option>其他研究</option>
				              </select>
                          </td>
			          </tr>
						<tr>
				          <td colspan="1" class="col-xs-1">申请人姓名</td>
				          <td colspan="1" class="col-xs-1 ">
				              <input type="text" name="applierName"/>
                          </td>
				          <td colspan="1" class="col-xs-1">性别</td>
				          <td colspan="1" class="col-xs-1"><input type="text" name="sex"/></td>
				          <td colspan="1" class="col-xs-1">出生年月</td>
				          <td colspan="4" class="col-xs-1"><input type="text" name="birthday"/></td>
				        </tr>
				        <tr>
				          <td colspan="1" class="col-xs-1">最后学历</td>
				          <td colspan="1" class="col-xs-1 ">
				              <select id="eduLevel"  name="eduLevel" >
				                  <option>小学</option>
				                  <option>初中</option>
				                  <option>中专</option>
				                  <option>高中</option>
				                  <option>专科</option>
				                  <option>本科</option>
				                  <option>硕士研究生</option>
				                  <option>博士研究生</option>
				              </select>
				          </td>
				          <td colspan="1" class="col-xs-1">最后学位</td>
				          <td colspan="1" class="col-xs-1">
				              <select id="eduDegree"  name="eduDegree" >
				                  <option>学士</option>
				                  <option>硕士</option>
				                  <option>博士</option>
				              </select>
                          </td>
				          <td colspan="1" class="col-xs-1">研究专长</td>
				          <td colspan="4" class="col-xs-1"><input type="text" name="search"/></td>
				        </tr>
				         <tr>
				          <td colspan="1" class="col-xs-1">所在部门</td>
				          <td colspan="3" class="col-xs-1 ">
				              <input type="text" name=bumen/>
				          </td>
				          <td colspan="1" class="col-xs-1">电子邮箱</td>
				          <td colspan="4" class="col-xs-1"><input type="text" name="email"/></td>
				        </tr>
				        <tr>
				          <td colspan="1" class="col-xs-1">联系电话</td>
				          <td colspan="8" class="col-xs-1 tal">（手机）<input type="text" name="mobile"/>（家庭）<input type="text" name="telHome"/>（单位）<input type="text" name="telUnit"/></td>
				        </tr>
				       
				         <tr>
				          <td colspan="1" class="col-xs-1">研究导师</td>
				          <td colspan="1" class="col-xs-1 "><input type="text" name="daoshiName"/></td>
				          <td colspan="1" class="col-xs-1">导师专业职称</td>
				          <td colspan="1" class="col-xs-1"><input type="text" name="daoshiZhichen"/></td>
				          <td colspan="1" class="col-xs-1">导师工作单位</td>
				          <td colspan="4" class="col-xs-1"><input type="text" name="daoshiDanwei"/></td>
				        </tr>
				        <tr>
				          <td colspan="1" class="col-xs-1">预期成果</td>
				          <td colspan="3" class="col-xs-1 "><input type="text" name="yuqiProject"/></td>
				          <td colspan="1" class="col-xs-1">预期完成时间</td>
				          <td colspan="4" class="col-xs-1"><input type="text" name="yuqiProject"/><input type="text" name="yuqiTime"/></td>
				        </tr>
				        <tr>
				          <td colspan="2" class="col-xs-1">申请经费（单位：元）</td>
				          <td colspan="7" class="col-xs-1"><input type="text" name="applyFee"/></td>
				        </tr>
				         <tr>
				          <td colspan="9" class="col-xs-1">近期主要研究成果</td>
				        </tr>
				          <td colspan="1"  class="col-xs-1">著作者</td>
				          <td colspan="2"  class="col-xs-1">成果名称</td>
				          <td colspan="1"  class="col-xs-1">成果形式</td>
				          <td colspan="3"  class="col-xs-1">发表刊物和出版单位</td>
				          <td colspan="1"  class="col-xs-1">发表出版时间</td>
						  <td colspan="1"  class="col-xs-1"><input type="button" value="＋" class="btn"/><input type="button" class="btn" value="－" /></td>
			          </tr>
			          </tr>
				          <td colspan="1"  class="col-xs-1" id="nameflg"><input type="text" name="authorName"/></td>
				          <td colspan="2"  class="col-xs-1"><input type="text" name="achievementName"/></td>
				          <td colspan="1"  class="col-xs-1"><input type="text" name="achievementMode"/></td>
				          <td colspan="3"  class="col-xs-1"><input type="text" name="publicUnit"/></td>
				          <td colspan="1"  class="col-xs-1"><input type="text" name="publicTime"/></td>
						  <td colspan="1"  class="col-xs-1"></td>
			          </tr>
			          <tr>
				          <td colspan="9" class="col-xs-1 tal">二、课题设计论证</td>
			          </tr>
			          <tr>
				          <td colspan="9" class="col-xs-1 tal">
				          本表参照以下提纲撰写，要求逻辑清晰，主题突出，层次分明，内容翔实，排版清晰。（5000字以内）<br>
				          1. 选题依据：选题背景、研究意义，含国内外相关研究的学术史梳理及研究动态。<br>
                          2. 研究内容：本课题的研究对象、总体框架、重点难点、主要目标等。<br>
                          3. 研究方法：本课题研究的具体研究方法、研究计划及其可行性等。<br>
                          4. 创新之处：在学术思想、学术观点、研究方法等方面的特色和创新。<br>
                          5. 参考文献：开展本课题研究的主要中外参考文献。
				          </td>
			          </tr>
			          <tr>
				          <td colspan="9" class="col-xs-1 ">
				          <textarea rows="50" cols="160"></textarea>
				          </td>
			          </tr>
			           <tr>
				          <td colspan="9" class="col-xs-1 tal">三、经费预算</td>
			          </tr>
			          <tr>
				          <td colspan="1" class="col-xs-1 ">序号</td>
				          <td colspan="2" class="col-xs-1 ">经费开支科目</td>
				          <td colspan="1" class="col-xs-1 ">金额（万元）</td>
				          <td colspan="1" class="col-xs-1 ">序号</td>
				          <td colspan="3" class="col-xs-1 ">经费开支科目</td>
				          <td colspan="1" class="col-xs-1 ">金额（万元）</td>
			          </tr>
			          <tr>
				          <td colspan="1" class="col-xs-1 ">1</td>
				          <td colspan="2" class="col-xs-1 tal ">资料费</td>
				          <td colspan="1" class="col-xs-1 "></td>
				          <td colspan="1" class="col-xs-1 ">6</td>
				          <td colspan="3" class="col-xs-1  tal ">专家咨询费</td>
				          <td colspan="1" class="col-xs-1 "></td>
			          </tr>
			          <tr>
				          <td colspan="1" class="col-xs-1 ">2</td>
				          <td colspan="2" class="col-xs-1 tal ">数据采集费</td>
				          <td colspan="1" class="col-xs-1 "></td>
				          <td colspan="1" class="col-xs-1 ">7</td>
				          <td colspan="3" class="col-xs-1  tal ">劳务费</td>
				          <td colspan="1" class="col-xs-1 "></td>
			          </tr>
			          <tr>
				          <td colspan="1" class="col-xs-1 ">3</td>
				          <td colspan="2" class="col-xs-1 tal ">差旅费</td>
				          <td colspan="1" class="col-xs-1 "></td>
				          <td colspan="1" class="col-xs-1 ">8</td>
				          <td colspan="3" class="col-xs-1  tal ">印刷费</td>
				          <td colspan="1" class="col-xs-1 "></td>
			          </tr>
			          <tr>
				          <td colspan="1" class="col-xs-1 ">4</td>
				          <td colspan="2" class="col-xs-1 tal ">交流费</td>
				          <td colspan="1" class="col-xs-1 "></td>
				          <td colspan="1" class="col-xs-1 ">9</td>
				          <td colspan="3" class="col-xs-1  tal ">其他费用</td>
				          <td colspan="1" class="col-xs-1 "></td>
			          </tr>
			          <tr>
				          <td colspan="1" class="col-xs-1 ">5</td>
				          <td colspan="2" class="col-xs-1 tal ">设备费</td>
				          <td colspan="1" class="col-xs-1 "></td>
				          <td colspan="1" class="col-xs-1 "></td>
				          <td colspan="3" class="col-xs-1  tal "></td>
				          <td colspan="1" class="col-xs-1 "></td>
			          </tr>
			          <tr>
				          <td colspan="1" class="col-xs-1 ">总金额</td>
				          <td colspan="8" class="col-xs-1 "></td>
				        </tr>
				        <tr>
				          <td colspan="9" class="col-xs-1 tal">四、导师意见</td>
			          </tr>
			          <tr>
				          <td colspan="9" class="col-xs-1 tal">
				          导师须认真负责地介绍课题负责人的专业水平、科研能力、科研态度和科研条件，
				          说明该课题取得预期成果的可能性，并承担信誉保证。
				          </td>
			          </tr>
			          <tr>
				          <td colspan="9" class="col-xs-1 ">
				          <textarea rows="50" cols="160"></textarea>
				          </td>
			          </tr>
			          <tr>
				          <td colspan="9" class="col-xs-1 tal">五、课题负责人所属部门审核意见</td>
			          </tr>
			          <tr>
				          <td colspan="9" class="col-xs-1 tal">
				          申请书所填写的内容是否属实；该课题负责人是否适合承担本课题的研究工作；本部门能否提供完成本课题所需的时间和条件。
				          </td>
			          </tr>
			          <tr>
				          <td colspan="9" class="col-xs-1 ">
				          <textarea rows="30" cols="160"></textarea>
				          </td>
			          </tr>
			          <tr>
				          <td colspan="9" class="col-xs-1 tal">六、科研管理部门审核意见</td>
			          </tr>
			          <tr>
				          <td colspan="9" class="col-xs-1 tal">
				          填写参考提示：本表所填写的内容是否属实；本单位能否提供完成本课题所需要的时间和条件保障，是否同意承担本项目的管理任务和信誉保证；本单位为确保课题研究顺利实施而制定的特殊政策措施；单位科研管理部门对课题研究全过程监督管理的措施等。
				          </td>
			          </tr>
			          <tr>
				          <td colspan="9" class="col-xs-1 ">
				          <textarea rows="30" cols="160"></textarea>
				          </td>
			          </tr>
			          <tr>
			              <td colspan="9" class="col-xs-1 ">
				          <button class="btn btn-info">保存</button>
				          </td>
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