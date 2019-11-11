<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/10/7
  Time: 21:43
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
    <title>操作系统By江毅</title>
    <!-- jQuery -->
    <script src="<%=basePath%>js/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
    <%--引入页脚--%>
    <link href="<%=basePath%>css/footer.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <h3 class="text-center text-success">
                <strong><em>操作系统By江毅</em></strong>
            </h3>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="row-fluid">
                <div class="span4">
                </div>
                <div class="span4">
                    <ul class="nav nav-list">
                        <li class="nav-header">
                            传送门
                        </li>
                        <li class="active">
                            <a href="<%=basePath%>/pcb/toUPS.action">进程的优先数算法</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>/getResource/get.action">银行家算法</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>/staticDivideMemory/get.action">固定内存分区</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>/requestPage/display.action">请求页式存储管理</a>
                        </li>
                    </ul>
                </div>
                <div class="span4">
                </div>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
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
