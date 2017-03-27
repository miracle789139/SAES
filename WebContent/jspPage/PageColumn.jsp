<%@ page language="java" pageEncoding="UTF-8"%>

<!-- 此处是显示为白色，一定要给其设置背景色，不然显示看不见 -->
<font color="#000000"> 当前页:第${pageView.pNum}页 |
	总记录数:${pageView.totalRecordNum}条 | 每页显示:${pageView.NUMPERPAGE}条 |
	总页数:${pageView.totalPageNum}页 |</font>
<c:if test="${pageView.pNum>2}">
	<a href="javascript:topage('1')" color="black">首页</a>
</c:if>
第
<c:forEach begin="0"
	end="${pageView.totalPageNum}" var="wp">
	<c:if test="${pageView.currentpage==wp}">
		<b><font color="black">${wp}</font></b>
	</c:if>
	<c:if test="${pageView.currentpage!=wp}">
		<a href="javascript:topage('${wp}')" style="color:#31b0d5">${wp}</a>
	</c:if>
</c:forEach>
页 &nbsp;&nbsp;&nbsp;
<c:if
	test="${pageView.currentpage+1<pageView.pageindex.endindex&&pageView.pageindex.endindex>2}">
	<a href="javascript:topage('${pageView.totalpage}')" >末页</a>
</c:if>