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

    <title>My JSP 'add.jsp' starting page</title>

    <link href="<%=request.getContextPath() %>/css/add.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" >
        $(function () {
            var flag1  = 1;
            var form = document.getElementById("form");
            $("#id").blur(function () {
                var value = $("#id").val();
                $.ajax({
                    url: "/user/checkId",
                    data: {"id": value},
                    type: "post",
                    datatype: "json",
                    success: function (data) {
                        if (data) {
                            $("#span1").html("学号已存在");
                            flag1  = 0;
                        } else {
                            $("#span1").html("学号可用");
                            flag1  = 1;
                        }
                    },
                    error:function () {
                        $("#span1").html("查询失败");
                        flag1  = 0;
                    }
                })

            })
            form.onsubmit=function(){
                var reg1=/^(\d+)$/;
                var reg2=/^$/;
                console.log(flag1);
                console.log(flag1==0);
                var name=document.getElementById("name").value;
                var id=document.getElementById("id").value;
                var password=document.getElementById("password").value;
                var major=document.getElementById("major").value;
                var grade=document.getElementById("grade").value;
                var sexy=document.getElementById("sexy").value;
                console.log(name);
                console.log(reg2.test(name));
                console.log(reg2.test($("password").val()));
                if (flag1 == 0||reg2.test(name)||reg2.test(password)||reg2.test(major)||reg2.test(grade)||reg2.test(sexy)) {
                    alert("输入不合法");
                    return false;
                }else if (reg1.test(id)){
                    return true;
                }else {
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
        <li><span><a>学生管理 </a>&gt; 添加学生 &gt;</span></li>
    </ul>
</div>
<div id="down">
    <form id="form" method="post" action="/user/addStudent">
        <table width="700px">
            <tr>
                <td>学号：</td>
                <td><input type="text" id="id" name="id" class="in"/><span id="span1"></span></td>
            </tr>
            <tr>
                <td>名称：</td>
                <td><input type="text" id="name" name="name" class="in"/><span id="span2"></span></td>
            </tr>
            <tr>
                <td>密码：</td>
                <td><input type="text" id="password" name="password" class="in"/></td>
            </tr>
            <tr>
                <td>性别：</td>
                <td><input type="text" id="sexy" name="sexy" class="in"/></td>
            </tr>
            <tr>
                <td>专业：</td>
                <td><input type="text" id="major" name="major" class="in"/></td>
            </tr>
            <tr>
                <td>年级：</td>
                <td><input type="text" id="grade" name="grade" class="in"/></td>
            </tr>
            <tr>
                <td>类型：</td>
                <td>
                    <select name="type" class="in">
                        <option value="0">管理员</option>
                        <option value="1">教师</option>
                        <option value="2">学生</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <input type="submit" id="submit" value="提&nbsp;&nbsp;&nbsp;交" class="su">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="清&nbsp;&nbsp;&nbsp;空" class="su">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
