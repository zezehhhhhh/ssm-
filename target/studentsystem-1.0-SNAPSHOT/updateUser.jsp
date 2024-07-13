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
            var flag1 = 1;
            var form = document.getElementById("form");
            $("#id").blur(function () {
                var value = $("#id").val();
                var id = document.getElementById("id").value;
                var oid = document.getElementById("oid").value;
                if (id==oid){
                    $("#span1").html("学号未变动");
                }else {
                    $.ajax({
                        url: "/user/checkId",
                        data: {"id": value},
                        type: "post",
                        datatype: "json",
                        success: function (data) {
                            if (data) {
                                $("#span1").html("学号已存在");
                                flag1 = 0;
                            } else {
                                $("#span1").html("学号可用");
                                flag1 = 1;
                            }
                        },
                        error: function () {
                            $("#span1").html("查询失败");
                            flag1 = 0;
                        }
                    })
                }
            })
            form.onsubmit = function () {
                var reg1 = /^(\d+)$/;
                var reg2 = /^$/;
                console.log(flag1);
                console.log(flag1 == 0);
                var id = document.getElementById("id").value;
                var oid = document.getElementById("oid").value;
                var name = document.getElementById("name").value;

                var password = document.getElementById("password").value;
                var major = document.getElementById("major").value;
                var grade = document.getElementById("grade").value;
                var sexy = document.getElementById("sexy").value;
                console.log(name);
                console.log(reg2.test(name));
                console.log(reg2.test($("password").val()));
                if (id == oid) {
                    return true;
                }
                if (flag1 == 0 || reg2.test(name) || reg2.test(password) || reg2.test(major) || reg2.test(grade) || reg2.test(sexy)) {
                    alert("输入不合法");
                    return false;
                } else if (reg1.test(id)) {
                    return true;
                } else {
                    alert("输入不合法");
                    return false;
                }
            }
        })
    </script>
</head>

<body>
<div id="up">
    <ul>
        <li><span><a href="">学生管理 </a>&gt; 编辑用户 &gt;</span></li>
    </ul>
</div>
<div id="down">
    <form id="form" method="post" action="/user/updateStudent">
        <table width="700px">
            <tr>
                <td>学号：<input type="hidden" id="oid" name="oid" class="in" value="${student.id}"/></td>

                <td><input type="text" id="id" name="id" class="in" value="${student.id}"/><span id="span1"></span></td>
            </tr>
            <tr>
                <td>名称：</td>
                <td><input type="text" id="name" name="name" class="in" value="${student.name}"/></td>
            </tr>
            <tr>
                <td>密码：</td>
                <td><input type="text" id="password" name="password" class="in" value="${student.password}"/></td>
            </tr>
            <tr>
                <td>性别：</td>
                <td><input type="text" id="sexy" name="sexy" class="in" value="${student.sexy}"/></td>
            </tr>
            <tr>
                <td>专业：</td>
                <td><input type="text" id="major" name="major" class="in" value="${student.major}"/></td>
            </tr>
            <tr>
                <td>年级：</td>
                <td><input type="text" id="grade" name="grade" class="in" value="${student.grade}"/></td>
            </tr>
            <tr>
                <td>类型：</td>
                <td>
                    <select name="type" class="in">
                        <option value="0" <c:if test="${student.type==0}">selected="selected"</c:if>>管理员</option>
                        <option value="1" <c:if test="${student.type==1}">selected="selected"</c:if>>教师</option>
                        <option value="2" <c:if test="${student.type==2}">selected="selected"</c:if>>学生</option>
                    </select>
                </td>
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
