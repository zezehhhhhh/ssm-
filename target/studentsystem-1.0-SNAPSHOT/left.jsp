<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'left.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link href="<%=request.getContextPath() %>/css/left.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("h3").click(topic, topic);

            function topic() {
                $(this).next("ul").slideToggle(200);
                $(this).next("ul").siblings("ul").slideUp(200);
            }
        });
    </script>
</head>

<body>
<div>
    <h3 id="con"></h3>
    <h3 class="h1"><span>学生管理</span></h3>
    <ul><c:if test="${user2.type==0||user2.type==1}">
        <li><a href="/addStudent.jsp" target="con">--学生添加</a></li>
    </c:if>
        <li><a href="/user/getAllStudent" target="con">--学生列表</a></li>
    </ul>
    <h3 class="h2"><span>成绩管理</span></h3>
    <ul>
        <c:if test="${user2.type==0||user2.type==1}">
            <li><a href="/addScore.jsp" target="con">--成绩录入</a></li>
        </c:if>
        <li><a href="/score/getAllScore" target="con">--成绩列表</a></li>
    </ul>
	<h3 class="h2"><span>课程管理</span></h3>
	<ul>
		<c:if test="${user2.type==0||user2.type==1}">
			<li><a href="/addCourse.jsp" target="con">--课程录入</a></li>
		</c:if>
		<li><a href="/course/getAllCourse" target="con">--课程列表</a></li>
	</ul>
    <h3 class="h5"><span>个人信息</span></h3>
    <ul>
        <li><a href="/user/toEditStudent?id=${user2.id}" target="con">修改信息</a></li>
    </ul>
</div>
</body>
</html>
