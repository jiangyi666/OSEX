<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/11/5
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>请求页式存储管理</title>
    <!-- jQuery -->
    <script src="<%=basePath%>js/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
    <%--引入页脚--%>
    <link href="<%=basePath%>css/footer.css" rel="stylesheet" type="text/css">

    <script type="text/javascript">
        function requestPage() {
            if($("#orderAddress").val()==""){
                alert("请输入指令地址！")
            }else{
            $.ajax({
                type: "post",
                url: "<%=basePath%>requestPage/get.action",
                data:{"commitOrderAdd":$("#orderAddress").val()},
                success: function (data) {
                    //alert("${tip}")
                    window.location.reload()
                }
            });
            }
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3 class="text-center text-success">
                请求分页存储管理方式模拟
            </h3>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-4 column">
            请输入一个指令地址：&nbsp;&nbsp;
           <font style="color:red;"><b>${tip}</b></font>
        </div>
        <div class="col-md-4 column">
            <div class="form-group">
                <input type="text" class="form-control" id="orderAddress" value=""
                       name="orderAddress">
            </div>
        </div>
        <div class="col-md-4 column">
            <button type="button" class="btn btn-success btn-default" onclick="requestPage()">请求页面</button>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>
                        页号
                    </th>
                    <th>
                        物理块号
                    </th>
                    <th>
                        状态位
                    </th>
                    <th>
                       外存地址
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pageQueue}" var="page">
                <tr class="success">
                    <td>
                        ${page.pageNum}
                    </td>
                    <td>
                       ${page.blockNum}
                    </td>
                    <td>
                        ${page.flag}
                    </td>
                    <td>
                        ${page.address}
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <%--这里用来放页脚--%>
                <div id="footer">
                    <div style="text-align: center">
                        <br>
                        <font color="#f5f5f5" style="font-family: -apple-system" size="2">All Rights Reserved.</font>
                        <font color="#f5f5f5"><span class="glyphicon glyphicon-copyright-mark"></span></font>
                        <font color="#f5f5f5" style="font-family: -apple-system" size="2">Designed By JiangYi In FJNU.2019</font>
                    </div>
                </div>
        </div>
    </div>
</div>
</body>
</html>
