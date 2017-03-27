<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<style>
    #footer {
        margin: 20px auto;
        height: 80px;
        padding-top: 20px;
        background-color: #131111;
        opacity: 0.85;
    }

    #footer p {
        text-align: center;
        line-height: 25px;
        margin: 0 auto;
        color: #ffffff;
    }

    td {
        text-align: center;
    }
</style>

<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>首页</title>
    <link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/font-awesome.min.css"/>
    <script src="<%=request.getContextPath()%>/js/ALERT.js"></script>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/ace.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/ace-rtl.min.css"/>
    <script src="<%=request.getContextPath()%>/bootstrap/js/html5shiv.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/js/respond.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/js/jquery-2.0.3.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/js/jquery.min.js"></script>
    <style type="text/css">
        a:link {
            text-decoration: none;
        }

        a:visited {
            text-decoration: none;
        }

        a:hover {
            text-decoration: none;
        }

        a:active {
            text-decoration: none;
        }

        #nihao, #tuichu{
            text-align: right;
        }
        #nihao a, #tuichu a{
            color: white;
        }
    </style>
</head>
<body background="<%=request.getContextPath()%>/images/main_bg.png">
<div id="whole">
<table width="100%" border="0" cellspacing="0" height="100%" style="margin-top:20px">
    <tr>
        <td width="20%">&nbsp;</td>
        <td width="60%">
            <table width="100%" border="0" cellspacing="4">
                <tr height="10%">
                    <td width="33%"><a href="<%=request.getContextPath()%>/getHomeViewAction"><img
                            src="<%=request.getContextPath()%>/images/logo.png" width="271"/></a></td>
                    <td width="33%">&nbsp;</td>
                    <td width="17%" align="right" valign="baseline" id="nihao"><img
                            src="<%=request.getContextPath()%>/images/user.jpg"/><a
                            href="<%=request.getContextPath()%>/queryperson?is=1">
                        <c:if test="${!empty userSession}">${userSession.NAME}</c:if>
                        <c:if test="${empty userSession}">你好</c:if>
                    </a></td>
                    <td width="17%" align="center" valign="baseline" id="tuichu"><a
                            href="<%=request.getContextPath()%>/SAES/logoutAction">[退出]</a>
                    </td>
                </tr>
                <tr height="40%">
                    <td><p>&nbsp;</p>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td rowspan="2"><a href="/SAES/queryperson?is=1"> <img
                            src="<%=request.getContextPath()%>/images/grsy.png"/></a></td>
                    <td><a href="/SAES/notify"><img src="<%=request.getContextPath()%>/images/grbg.png"/></a></td>
                    <td colspan="2"><a href="jspPage/kyxx-index.jsp"> <img
                            src="<%=request.getContextPath()%>/images/zllb.png"/></a></td>
                </tr>
                <tr>
                    <td><a href="/SAES/appmana-index"> <img src="<%=request.getContextPath()%>/images/kyxm.png"/></a>
                    </td>
                    <td colspan="2" style="color:#F00"><a href="/SAES/pro_manage"> <img
                            src="<%=request.getContextPath()%>/images/xmjc.png"/></a></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div id="footer" class="col-xs-12">
                            <p>版权所有 © 2016 上海市教育科学研究院 沪ICP备08108292号-5</p>

                            <p>技术支持:上海市教育科学研究院信息化办公室</p>
                        </div>

                    </td>
                </tr>
            </table>
        </td>
        <td width="20%">&nbsp;</td>
    </tr>
</table>

</div>


<script type="text/javascript">
    /* function logoutClick(){
     $.ajax({
     url : "logoutAction",
     type : "POST",
     dataType : "json",
     data : "",
     success : function(data) {
     window.document.location.href="/SAES/logoutAction";
     },
     error : function() {
     Alert("请求失败，请稍后重试");
     }
     });
     } */
</script>

</body>
</html>