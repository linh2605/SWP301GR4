<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
        <!-- IonIcons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="../dist/css/adminlte.min.css">
        <title>Feedback List</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
                color: #343a40;
                margin: 0;
                padding: 20px;
            }
            h2 {
                text-align: center;
                color: #007bff;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid #dee2e6;
                padding: 12px;
                text-align: left;
            }
            th {
                background-color: #007bff;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #e9ecef;
            }
        </style>
    </head>
    <body>
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                </li>
                <li class="nav-item d-none d-sm-inline-block">
                    <a href="/SWP301_GR4_SE1842/view/dashboard.jsp" class="nav-link">Home</a>
                </li>
                <li class="nav-item d-none d-sm-inline-block">
                    <a href="#" class="nav-link">Contact</a>
                </li>
                <li class="nav-item d-none d-sm-inline-block">
                    <a href="/SWP301_GR4_SE1842/customerlist" class="nav-link">Customers List</a>
                </li>
                <li class="nav-item d-none d-sm-inline-block">
                    <a href="${pageContext.request.contextPath}/view/marketing-feedback" class="nav-link">Feedback List</a>
                </li>
            </ul>
        </nav>

        <h2>Feedback List</h2>
        <form action="marketing-feedback" method="get">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <div class="input-group" style="width: 80%">
                            <input type="text" class="form-control" name="search" placeholder="Enter Comment to search" value="${param.search}">
                        </div>
                    </div>
                </div>
                <div class="feature-filters clearfix center m-b40 col-md-4" style="text-align: right; margin-top: 9px">
                    <ul class="filters">
                        <li class="btn ${param.status == null || param.status == '' ? 'active' : ''}">
                            <a href="marketing-feedback?search=${param.search}&status=&page=1"><span>All</span></a>
                        </li>
                        <li class="btn ${param.status == '1' ? 'active' : ''}">
                            <a href="marketing-feedback?search=${param.search}&status=1&page=1"><span>Active</span></a>
                        </li>
                        <li class="btn ${param.status == '0' ? 'active' : ''}">
                            <a href="marketing-feedback?search=${param.search}&status=0&page=1"><span>Inactive</span></a>
                        </li>
                    </ul>
                </div>
            </div>

            <input type="hidden" name="status" value="${param.status}">
            <input type="hidden" name="page" value="1">
        </form>
        <table>
            <thead>
                <tr>
                    <th>No</th>
                    <th>Product</th>
                    <th>User</th>
                    <th>Rating</th>
                    <th>Comment</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="f" items="${feedbacks}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/view/product?pId=${f.product.productID}">${f.product.productName}</a> 
                        </td>
                        <td>${f.userName}</td>
                        <td>${f.rating}</td>
                        <td>${f.comment}</td>
                        <td><fmt:formatDate value="${f.feedbackDate}" pattern="dd/MM/yyyy"/></td>
                        <td>${f.status}</td>
                        <td>
                            <form action="marketing-feedback" method="post" style="display: inline;">
                                <input type="hidden" name="feedbackID" value="${f.feedbackID}">
                                <input type="hidden" name="status" value="${f.status == '1' ? '0' : '1'}">
                                <button type="submit" class="btn ${f.status == '1' ? 'btn-warning' : 'btn-success'}">
                                    ${f.status == '1' ? 'Deactivate' : 'Activate'}
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <c:if test="${currentPage > 1}">
                    <li class="page-item">
                        <a class="btn btn-primary" href="?search=${param.search}&status=${param.status}&page=${currentPage - 1}">Previous</a>
                    </li>
                </c:if>
                <c:forEach var="pageNum" begin="1" end="${totalPages}">
                    <li class="page-item ${pageNum == currentPage ? 'active' : ''}">
                        <a class="btn btn-primary" href="?search=${param.search}&status=${param.status}&page=${pageNum}">${pageNum}</a>
                    </li>
                </c:forEach>
                <c:if test="${currentPage < totalPages}">
                    <li class="page-item">
                        <a class="btn btn-primary" href="?search=${param.search}&status=${param.status}&page=${currentPage + 1}">Next</a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </body>
</html>
