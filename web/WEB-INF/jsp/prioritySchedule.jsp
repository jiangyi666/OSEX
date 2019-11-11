<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/9/24
  Time: 19:46
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
    <title>优先数调度算法By江毅</title>
    <!-- jQuery -->
    <script src="<%=basePath%>js/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
    <%--引入页脚--%>
    <link href="<%=basePath%>css/footer.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        function addPCB() {
            $.post("<%=basePath%>/pcb/addPCB.action",$("#add_pcb_form").serialize(),function(data){
                alert("添加进程信息成功！");
                window.location.reload();
            });
        }
    </script>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <div class="row-fluid">
                <div class="span12">
                    <h3 class="text-center">
                        <em>优先数算法进程调度By江毅</em>
                    </h3>
                </div>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <h3>
                下面为进程信息
            </h3>
        </div>
        <div class="span3">
        </div>
        <div class="span3">
            <a href="#" class="btn btn-success" data-toggle="modal"
               data-target="#addPCB">添加新的进程到就绪队列</a>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
        </div>
        <div class="span8">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>
                        进程标识符
                    </th>
                    <th>
                        优先数
                    </th>
                    <th>
                        占用CPU时间片数
                    </th>
                    <th>
                        进程所需时间片数
                    </th>
                    <th>
                        进程状态
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="row">
                    <tr>
                        <td>${row.threadNo}</td>
                        <td>${row.priorityNum}</td>
                        <td>${row.useTime}</td>
                        <td>${row.needTime}</td>
                        <td>${row.threadStatus}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="row-fluid">
                <div class="span12">
                    <%--<a type="button" class="btn btn-info" href="<%=basePath%>pcb/doPrioritySchedule.action">执行调度程序</a>--%>
                        <div class="row-fluid">
                            <div class="span6">
                                <a type="button" class="btn btn-info" href="<%=basePath%>pcb/doPrioritySchedule.action">执行调度程序</a>
                            </div>
                            <div class="span6">
                                <a class="btn btn-danger" type="button" href="<%=basePath%>pcb/ReDo.action">清除</a>
                            </div>
                        </div>
                </div>
            </div>
        </div>
        <div class="span2">
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <%--这里写页脚--%>
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
<!-- 添加进程对话框 -->
<div class="modal fade" id="addPCB" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加新的进程</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="add_pcb_form">
                    <div class="form-group">
                        <label for="threadNo" class="col-sm-2 control-label">进程号</label>
                        <div class="col-sm-10">
                            <input type="text"  class="form-control"  id="threadNo" name="threadNo" placeholder="进程号" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="priorityNum" class="col-sm-2 control-label">优先数</label>
                        <div class="col-sm-10">
                            <input type="text"  class="form-control" id="priorityNum" name="priorityNum" placeholder="优先数" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="useTime" class="col-sm-2 control-label">占用CPU时间片数</label>
                        <div class="col-sm-10">
                            <input type="text"  class="form-control" id="useTime" name="useTime" placeholder="占用CPU时间片数" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="needTime" class="col-sm-2 control-label">进程所需时间片数</label>
                        <div class="col-sm-10">
                            <input type="text"  class="form-control" id="needTime" name="needTime" placeholder="进程所需时间片数" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="threadStatus" class="col-sm-2 control-label">进程状态</label>
                        <div class="col-sm-10">
                            <input type="text"  class="form-control" id="threadStatus" name="threadStatus" placeholder="进程状态" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" onclick="addPCB()">添加</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
