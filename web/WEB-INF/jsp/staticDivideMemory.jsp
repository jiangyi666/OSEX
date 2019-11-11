<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/10/14
  Time: 17:22
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
    <title>固定分区存储器管理By江毅</title>
    <!-- jQuery -->
    <script src="<%=basePath%>js/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
    <%--引入页脚--%>
    <link href="<%=basePath%>css/footer.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        function divideMemory() {
            $.post("<%=basePath%>staticDivideMemory/divide.action",$("#postDivideInfo").serialize(),function (data) {
                if (data == "error")
                {
                    alert("分区失败！")
                }
                if (data == "success")
                {
                    alert("分区成功！")
                }
                window.location.reload();
            })

        }
        function releaseMemory() {
            $.ajax({
                type: "post",
                url: "<%=basePath%>staticDivideMemory/release.action",
                data:{"processName":$("#processNameOfRelease").val()},
                success: function (data) {
                    alert("释放成功！")
                    window.location.reload()
                }
            });
            
        }
    </script>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <h3>
                固定分区存储管理
            </h3>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="row-fluid">
                <div class="span2">
                </div>
                <div class="span8">
                    <table class="table" class="table table-bordered" contenteditable="true">
                        <thead>
                        <tr>
                            <th>
                                分区号
                            </th>
                            <th>
                                起始地址
                            </th>
                            <th>
                                长度
                            </th>
                            <th>
                                占用标志
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach begin="0" end="5" var="i">
                        <tr class="success">
                            <td>
                               ${processCell.dividedNum[i]}
                            </td>
                            <td>
                                ${processCell.startAddress[i]}K
                            </td>
                            <td>
                               ${processCell.size[i]}K
                            </td>
                            <td>
                                ${processCell.singal[i]}
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <form class="form-inline" action=""
                          method="get" id="postDivideInfo">
                    <div class="row-fluid">
                        <div class="span4">
                            <div class="form-group">
                                <label for="processName">进程名：</label>
                                <input type="text" class="form-control" id="processName" value="${backInfo.processName}"
                                       name="processName">
                            </div>
                        </div>
                        <div class="span4">
                            <div class="form-group">
                                <label for="needSize">需要的大小:</label>
                                <input type="text" class="form-control" id="needSize" value="${backInfo.needSize}"
                                       name="needSize">
                            </div>
                        </div>
                        <div class="span4">
                            <button class="btn btn-info" type="button" onclick="divideMemory()">点击分区</button>
                        </div>
                    </div>
                    </form>
                    <div class="row-fluid">
                        <div class="span8">
                            <div class="form-group">
                                <label for="processNameOfRelease">进程名：</label>
                                <input type="text" class="form-control" id="processNameOfRelease" value="${releaseName}"
                                       name="processNameOfRelease">
                            </div>
                        </div>
                        <div class="span4">
                            <button class="btn btn-warning" type="button" onclick="releaseMemory()">释放分区</button>
                        </div>
                    </div>
                </div>
                <div class="span2">
                </div>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
        </div>
    </div>
</div>
</body>
</html>
