<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'add.jsp' starting page</title>

    <link href="<%=request.getContextPath() %>/css/add.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $(function () {
            let flag = 1;
            var form = document.getElementById("form");
            $("#id").blur(function () {
                console.log($("#id").val());
                console.log($("#oid").val());
                if ($("#id").val() != $("#oid").val()) {
                    $.ajax({
                        url: "/course/check",
                        data: {"id": $("#id").val()},
                        type: "post",
                        datatype: "json",
                        success: function (data) {
                            if (data) {
                                $("#span1").html("课程已存在");
                                flag = 0;
                            } else {
                                $("#span1").html("课程可用");
                                flag = 1;
                            }
                        }
                    })
                } else {
                    flag = 1;
                    $("#span1").html("课程号未变动");
                }
            });
            form.onsubmit = function () {
                var id = document.getElementById("id").value;
                if (flag == 0 || isNaN(id) || id % 1 !== 0) {
                    alert("输入不合法")
                    return false;
                }
            }
        })
    </script>
</head>

<body>
<div id="up">
    <ul>
        <li><span><a href="">课程管理 </a>&gt; 编辑课程 &gt;</span></li>
    </ul>
</div>
<div id="down">
    <form method="post" id="form" action="/course/updateCourse">
        <table width="700px">
            <tr>
                <td>课程号：<input type="hidden" id="oid" name="oid" class="in" value="${course.id}"/></td>
                <td><input type="text" id="id" name="id" class="in" value="${course.id}"/><span id="span1"></span></td>
            </tr>
            <tr>
                <td>课程名：</td>
                <td><input type="text" id="name" name="name" class="in" value="${course.name}"/></td>
            </tr>
            <tr>
                <td>教师：</td>
                <td><input type="text" name="teacher" class="in" value="${course.teacher}"/></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="提&nbsp;&nbsp;&nbsp;交" class="su">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="清&nbsp;&nbsp;&nbsp;空" class="su">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
