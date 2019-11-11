<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2019/9/29
  Time: 19:19
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
    <title>银行家算法By江毅</title>
    <!-- jQuery -->
    <script src="<%=basePath%>js/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
    <%--引入页脚--%>
    <link href="<%=basePath%>css/footer.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        function checkSafety() {
            $.ajax({
                type: "get",
                url: "<%=basePath%>getResource/getSafetyInfo.action",
                success: function (data) {
                    if (data == "true") {
                        alert("安全！")
                    } else {
                        alert("不安全！")
                    }
                }
            });

        }

        function distributeResource() {
            $.post("<%=basePath%>/getResource/distribute.action",$("#getResourceOperation").serialize(),function(data){
                if (data.status == "error") {
                    alert("出错了，它请求的资源大于它所宣布的最大值！")
                }else if (data.status == "notEnough") {
                    alert("系统里面没有足够资源")
                }else if (data.status =="permit") {
                    alert("允许本次分配")
                }else if(data.status =="redo"){
                    alert("不安全，不允许本次分配!撤销！");
                }
                // $("#CResource").val(data.cresource);
                // $("#AResource").val(data.aresource);
                // $("#BResource").val(data.bresource);
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
                        <em>银行家算法By江毅</em>
                    </h3>
                </div>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <table class="table table-bordered" contenteditable="true">
                <thead style="text-align: center">
                <tr>
                    <th>
                    </th>
                    <th>
                        Max
                    </th>
                    <th>
                        Allocation
                    </th>
                    <th>
                        Need
                    </th>
                    <th>
                        Available
                    </th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>

                    </td>
                    <td>
                        A &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; B&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; C
                    </td>
                    <td>
                        A &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; B&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; C
                    </td>
                    <td>
                        A &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; B&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; C
                    </td>
                    <td>
                        A &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; B&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; C
                    </td>
                </tr>
                <c:forEach begin="0" end="4" var="i">
                    <tr>
                        <td>P${i}</td>
                        <td>${resource.max[i][0]}&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;${resource.max[i][1]}&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;${resource.max[i][2]}</td>
                        <td>${resource.allocation[i][0]}&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;${resource.allocation[i][1]}&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;${resource.allocation[i][2]}</td>
                        <td>${resource.need[i][0]}&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;${resource.need[i][1]}&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;${resource.need[i][2]}</td>
                        <c:if test="${i==0}">
                            <td>${resource.available[0]}&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;${resource.available[1]}&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;${resource.available[2]}</td>
                        </c:if>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="row-fluid">
                <div class="span6">
                    <h3 class="text-left">
                        A,B,C资源数量分别为：10,5,7
                    </h3>
                </div>
                <div class="span6">
                    <button class="btn btn-info" type="button" onclick="checkSafety()">T0时刻：开始进行分配并进行安全性检查</button>
                </div>
            </div>
            <form class="form-inline" action=""
                  method="get" id="getResourceOperation">
                <div class="row-fluid">
                    <div class="span6">
                        <h3 class="text-info text-left">
                            请输入请求分配的各类资源
                        </h3>
                    </div>
                    <div class="span6">
                        <div class="form-group">
                            <label for="AResource">A</label>
                            <input type="text" class="form-control" id="AResource" value="${backResource.AResource}"
                                   name="AResource">
                        </div>
                        <div class="form-group">
                            <label for="BResource">B</label>
                            <input type="text" class="form-control" id="BResource" value="${backResource.BResource}"
                                   name="BResource">
                        </div>
                        <div class="form-group">
                            <label for="CResource">C</label>
                            <input type="text" class="form-control" id="CResource" value="${backResource.CResource}"
                                   name="CResource">
                        </div>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="span12">
                        <div class="row-fluid">
                            <div class="span6">
                                <h3 class="text-left">
                                    请选择请求分配资源的进程：
                                </h3>
                            </div>
                            <div class="span6">
                                <div class="form-group">
                                    <label for="chooseProcess" style="float:left;padding:7px 15px 0 27px;">选择进程</label>
                                    <div class="">
                                        <select class="form-control" id="chooseProcess" name="chooseProcess">
                                            <option value="0">P0</option>
                                            <option value="1">P1</option>
                                            <option value="2">P2</option>
                                            <option value="3">P3</option>
                                            <option value="4">P4</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="row-fluid">
                <div class="span6">
                    <h3 class="text-left">
                        安全性
                    </h3>
                </div>
                <div class="span6">
                    <button class="btn btn-info" type="button" onclick="distributeResource()">分配资源并进行安全性检测</button>
                </div>
            </div>
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
</body>
</html>
