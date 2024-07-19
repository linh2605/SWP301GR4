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
        <title>User List</title>
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
            td img {
                border-radius: 50%;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #e9ecef;
            }
            thead {
                background-color: #343a40;
                color: white;
            }
            @media screen and (max-width: 600px) {
                table, th, td {
                    display: block;
                    width: 100%;
                }
                th {
                    text-align: right;
                }
                th, td {
                    padding: 10px;
                    text-align: right;
                }
                th:after {
                    content: ": ";
                }
                td {
                    text-align: left;
                    border-top: 0;
                }
            }
        </style>
    </head>
    <body class="sidebar-collapse">
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
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

            <!-- Right navbar links -->
            <ul class="navbar-nav ml-auto">
                <!-- Navbar Search -->
                <li class="nav-item">
                    <a class="nav-link" data-widget="navbar-search" href="#" role="button">
                        <i class="fas fa-search"></i>
                    </a>
                    <div class="navbar-search-block">
                        <form class="form-inline">
                            <div class="input-group input-group-sm">
                                <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
                                <div class="input-group-append">
                                    <button class="btn btn-navbar" type="submit">
                                        <i class="fas fa-search"></i>
                                    </button>
                                    <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                                        <i class="fas fa-times"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </li>

                <!-- Messages Dropdown Menu -->
                <li class="nav-item dropdown">
                    <a class="nav-link" data-toggle="dropdown" href="#">
                        <i class="far fa-comments"></i>
                        <span class="badge badge-danger navbar-badge">3</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                        <a href="#" class="dropdown-item">
                            <!-- Message Start -->
                            <div class="media">
                                <img src="dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
                                <div class="media-body">
                                    <h3 class="dropdown-item-title">
                                        Brad Diesel
                                        <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                                    </h3>
                                    <p class="text-sm">Call me whenever you can...</p>
                                    <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                                </div>
                            </div>
                            <!-- Message End -->
                        </a>
                        <div class="dropdown-divider"></div>
                        <a href="#" class="dropdown-item">
                            <!-- Message Start -->
                            <div class="media">
                                <img src="dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
                                <div class="media-body">
                                    <h3 class="dropdown-item-title">
                                        John Pierce
                                        <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                                    </h3>
                                    <p class="text-sm">I got your message bro</p>
                                    <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                                </div>
                            </div>
                            <!-- Message End -->
                        </a>
                        <div class="dropdown-divider"></div>
                        <a href="#" class="dropdown-item">
                            <!-- Message Start -->
                            <div class="media">
                                <img src="dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
                                <div class="media-body">
                                    <h3 class="dropdown-item-title">
                                        Nora Silvester
                                        <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                                    </h3>
                                    <p class="text-sm">The subject goes here</p>
                                    <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                                </div>
                            </div>
                            <!-- Message End -->
                        </a>
                        <div class="dropdown-divider"></div>
                        <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
                    </div>
                </li>
                <!-- msgs Dropdown Menu -->
                <li class="nav-item dropdown">
                    <a class="nav-link" data-toggle="dropdown" href="#">
                        <i class="far fa-bell"></i>
                        <span class="badge badge-warning navbar-badge">15</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                        <span class="dropdown-item dropdown-header">15 msgs</span>
                        <div class="dropdown-divider"></div>
                        <a href="#" class="dropdown-item">
                            <i class="fas fa-envelope mr-2"></i> 4 new messages
                            <span class="float-right text-muted text-sm">3 mins</span>
                        </a>
                        <div class="dropdown-divider"></div>
                        <a href="#" class="dropdown-item">
                            <i class="fas fa-users mr-2"></i> 8 friend requests
                            <span class="float-right text-muted text-sm">12 hours</span>
                        </a>
                        <div class="dropdown-divider"></div>
                        <a href="#" class="dropdown-item">
                            <i class="fas fa-file mr-2"></i> 3 new reports
                            <span class="float-right text-muted text-sm">2 days</span>
                        </a>
                        <div class="dropdown-divider"></div>
                        <a href="#" class="dropdown-item dropdown-footer">See All msgs</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                        <i class="fas fa-expand-arrows-alt"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
                        <i class="fas fa-th-large"></i>
                    </a>
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
                            <a href="marketing-feedback?search=${param.search}&status=0&page=1"><span>In Active</span></a>
                        </li>
                    </ul>
                </div>
            </div>

            <input type="hidden" name="status" value="${param.status}">
            <input type="hidden" name="page" value="1">
        </form>
          <c:if test="${not empty sessionScope.msg}">
            <div class="alert alert-success alert-dismissible fade show" role="alert" style="text-align: center">
                ${sessionScope.msg}
                <button type="button" class="btn-danger" data-dismiss="alert" aria-label="Close">X</button>
            </div>
            <%
                session.removeAttribute("msg");
            %>
        </c:if>
        <c:if test="${not empty sessionScope.err}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert"  style="text-align: center">
                ${sessionScope.err}
                <button type="button" class="btn-danger" data-dismiss="alert" >X</button>
            </div>
            <%
                session.removeAttribute("err");
            %>
        </c:if>
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
                    <th>Action</th>
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

                        <td>
                            <c:if test="${f.status == 1}">
                                <span style="color: green">Active</span>
                            </c:if>
                            <c:if test="${f.status == 0}">
                                <span style="color: red">In Active</span>
                            </c:if>
                        </td>
                        <td>
                            <form action="marketing-feedback" method="POST">
                                <input type="hidden" name="id" value="${f.feedbackID}">
                                <input type="hidden" name="status" value="${f.status}">
                                <c:if test="${f.status == 1}">
                                    <button type="submit" class="btn btn-sm btn-success" onclick="return confirm('Are you sure you want to deactivate this feedback?');">
                                        De-active
                                    </button>
                                </c:if>
                                <c:if test="${f.status == 0}">
                                    <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to activate this feedback?');">
                                        Active
                                    </button>
                                </c:if>
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
                        <a class="btn btn-primary" href="?search=${param.search}&status=${param.status}&subject=${param.subject}&page=${currentPage - 1}">Previous</a>
                    </li>
                </c:if>
                <c:forEach var="pageNum" begin="1" end="${totalPages}">
                    <li class="page-item ${pageNum == currentPage ? 'active' : ''}">
                        <a class="btn btn-primary" href="?search=${param.search}&status=${param.status}&subject=${param.subject}&page=${pageNum}">${pageNum}</a>
                    </li>
                </c:forEach>
                <c:if test="${currentPage < totalPages}">
                    <li class="page-item">
                        <a class="btn btn-primary" href="?search=${param.search}&status=${param.status}&subject=${param.subject}&page=${currentPage + 1}">Next</a>
                    </li>
                </c:if>
            </ul>
        </nav>
        <script src="../plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE -->
        <script src="../dist/js/adminlte.js"></script>

        <!-- OPTIONAL SCRIPTS -->
        <script src="../plugins/chart.js/Chart.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="../dist/js/demo.js"></script>
        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="../dist/js/pages/dashboard3.js"></script>
    </body>
</html>
