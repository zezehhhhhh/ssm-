<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'list.jsp' starting page</title>
    
	<link href="<%=request.getContextPath() %>/css/content.css" rel="stylesheet" type="text/css">
	<style type="text/css">
		#down table {
			position: relative;
			left: 50%;
			margin-left: -500px;
			top: 50px;
			border-top: 1px #999 solid;
			border-right: 1px #999 solid;
		}
		#down tr {
			height: 60px;
		}
		
		#down tr td {
			text-align: center;
			border-left: 1px #999 solid;
			border-bottom: 1px #999 solid;
		}
		
		#up a:VISITED,#up a:LINK {
			color: #4C8FBD;
			text-decoration: none;
		}
		#up a:HOVER {
			color: #4C8FBD;
			text-decoration: none;
		}
		.head {
			background: #438EB9;
			color: #fff;
		}
		tbody tr:nth-child(odd) {
			background: #e5e5e5;
		}
		
		tbody tr:nth-child(even) {
			background: #d5d5d5;
		}
	</style>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.8.3.js"></script>
	<script type="text/javascript">
		
	</script>
  </head>
  
  <body>
  	<div id="up">
	   <ul>
	    	<li><span><a href="welcome.jsp">平台首页 </a>&gt; 学生管理 &gt; 学生列表</span></li>
	   </ul>
	</div>
	<div id="down">
	    <table width="1000px" cellpadding="0" cellspacing="0">
	    	<thead>
		    	<tr class="head">
		    		<td>序号</td>
					<td>学号</td>
					<td>用户名</td>
					<td>性别</td>
					<td>年级</td>
					<td>专业</td>
					<td>类型</td>
					<td>操作</td>
		    	</tr>
	    	</thead>
	    	<tbody>
				<c:forEach items="${myList}" var="student" varStatus="status">
					<tr>
					<td>${status.count}</td>
					<td>${student.id}</td>
					<td>${student.name}</td>
					<td>${student.sexy}</td>
					<td>${student.grade}</td>
						<td>
							${student.major}
						</td>
						<td>
							<c:if test="${student.type==0}">
								管理员
							</c:if>
							<c:if test="${student.type==1}">
								教师
							</c:if>
							<c:if test="${student.type==2}">
								学生
							</c:if>
						</td>
						<td>
							<c:if test="${user2.type==0||user2.type==1}">
							<a href="/user/toEditStudent?id=${student.id}">编辑</a>
							<a href="/user/delStudent?id=${student.id}">删除</a></c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
	    </table>
    </div>
  </body>
</html>
