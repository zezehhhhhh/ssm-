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
    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $(function () {
            var flag1 = 1;
            var flag2 = 1;
            var flag3 = 1;
            var form = document.getElementById("form");
            $("#sid").blur(function () {
                if ($("#sid").val() != $("#osid").val() || $("#cid").val() != $("#ocid").val()) {
                    $.ajax({
                        url: "/score/check",
                        data: {"sid": $("#sid").val(), "cid": $("#cid").val()},
                        type: "post",
                        datatype: "json",
                        async: false,
                        success: function (data) {
                            if (data) {

                                $("#span1").html("成绩已存在");
                                flag1 = 0;
                            } else {
                                $("#span1").html("成绩唯一");
                                flag1 = 1;
                            }
                        }
                        ,
                        error: function () {
                            flag1 = 0;
                            $("#span1").html("查询失败");
                        }
                    })
                } else {

                    flag1 = 1;
                    $("#span1").html("学号课程号未变动");
                }
                $.ajax({
                    url: "/score/checkSid",
                    data: {"sid": $("#sid").val()},
                    type: "post",
                    datatype: "json",
                    async: false,
                    success: function (data) {
                        flag2 = 1;
                        $("#span2").html(data);
                    }
                    ,
                    error: function () {
                        flag2 = 0;
                        $("#span2").html("查询失败");
                    }
                })
            })
            $("#cid").blur(function () {
                if ($("#sid").val() != $("#osid").val() || $("#cid").val() != $("#ocid").val()) {
                    $.ajax({
                        url: "/score/check",
                        data: {"sid": $("#sid").val(), "cid": $("#cid").val()},
                        type: "post",
                        datatype: "json",
                        async: false,
                        success: function (data) {
                            if (data) {

                                $("#span1").html("成绩已存在");
                                flag1 = 0;
                            } else {
                                $("#span1").html("成绩唯一");
                                flag1 = 1;
                            }
                        }
                        ,
                        error: function () {
                            flag1 = 0;
                            $("#span1").html("查询失败");
                        }
                    })
                } else {

                    flag1 = 1;
                    $("#span1").html("学号课程号未变动");
                }
                $.ajax({
                    url: "/score/checkCid",
                    data: {"cid": $("#cid").val()},
                    type: "post",
                    datatype: "json",
                    async: false,
                    success: function (data) {
                        flag3 = 1;
                        $("#span3").html(data);
                    }
                    ,
                    error: function () {
                        flag3 = 0;
                        $("#span3").html("查询失败");
                    }
                })
            })
            form.onsubmit = function () {

                var sid = document.getElementById("sid").value;
                var cid = document.getElementById("cid").value;
                var score = document.getElementById("score").value;
                if (flag1 == 0 || flag2 == 0 || flag3 == 0 || sid % 1 !== 0 || cid % 1 !== 0 || id % 1 !== 0 || isNaN($("#sid").val()) || isNaN($("#id").val()) || isNaN($("#cid").val()) || isNaN($("#score").val())) {
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
        <li><span><a>成绩管理 </a>&gt; 修改成绩 &gt;</span></li>
    </ul>
</div>
<div id="down">
    <form method="post" id="form" action="/score/updateScore">
        <table width="700px">
            <tr>
                <td>学号：<input type="hidden" id="osid" name="osid" class="in" value="${score.sid}"/></td>
                <td><input type="text" id="sid" name="sid" class="in" value="${score.sid}"/> <span id="span2"></span>
                </td>
            </tr>
            <tr>
                <td>课程号：<input type="hidden" id="ocid" name="ocid" class="in" value="${score.cid}"/></td>
                <td><input type="text" id="cid" name="cid" class="in" value="${score.cid}"/> <span id="span3"></span>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>分数：</td>
                <td><input type="text" id="score" name="score" class="in" value="${score.score}"/></td>
            </tr>
            <tr>
                <td><span id="span1"></span></td>
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
