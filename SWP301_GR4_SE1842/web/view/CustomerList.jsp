<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="./plugins/fontawesome-free/css/all.min.css">
        <!-- IonIcons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="./dist/css/adminlte.min.css">
        <title>User List</title>
        <style>
            :root {
                --primary-color: #3498db; /* Màu chính cho nút Update */
                --secondary-color: #2ecc71; /* Màu chính cho nút Detail */
                --text-color: #ffffff; /* Màu chữ */
            }

            /* Thiết lập chung cho nút */
            .btn {
                display: inline-block;
                padding: 12px 24px;
                margin-right: 10px;
                text-align: center;
                text-decoration: none;
                font-size: 16px;
                font-weight: bold;
                color: var(--text-color);
                border-radius: 5px;
                transition: background-color 0.3s ease, color 0.3s ease;
                border: 2px solid transparent;
            }

            /* Màu và kiểu chữ cho nút Update */
            .btn-update {
                background-color: var(--primary-color);
            }

            .btn-update:hover {
                background-color: transparent;
                color: var(--primary-color);
                border-color: var(--primary-color);
            }

            /* Màu và kiểu chữ cho nút Detail */
            .btn-detail {
                background-color: var(--secondary-color);
            }

            .btn-detail:hover {
                background-color: transparent;
                color: var(--secondary-color);
                border-color: var(--secondary-color);
            }
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
    <body>
        <jsp:include page= "common/ProfileHeader.jsp"></jsp:include>
            <div class="wrapper">
                <!-- Navbar -->

                <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                    <!-- Left navbar links -->
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                        </li>
                        <li class="nav-item d-none d-sm-inline-block">
                            <a href="view/mktdashboard.jsp" class="nav-link">Home</a>
                        </li>
                        <li class="nav-item d-none d-sm-inline-block">
                            <a href="#" class="nav-link">Contact</a>
                        </li>
                        <li class="nav-item d-none d-sm-inline-block">
                            <a href="/SWP301_GR4_SE1842/customerlist" class="nav-link">Customers List</a>
                        </li>
                        <li class="nav-item d-none d-sm-inline-block">
                            <a href="#" class="nav-link" data-toggle="modal" data-target="#myModalProfile">My Account</a>
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
                                <form action="customerlist" class="form-inline">
                                    <div class="input-group input-group-sm">
                                        <input class="form-control form-control-navbar" name="search" type="text" placeholder="Search" aria-label="Search">
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
                        <!-- Notifications Dropdown Menu -->
                        <li class="nav-item dropdown">
                            <a class="nav-link" data-toggle="dropdown" href="#">
                                <i class="far fa-bell"></i>
                                <span class="badge badge-warning navbar-badge">15</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                                <span class="dropdown-item dropdown-header">15 Notifications</span>
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
                                <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
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
                <div style="margin: 20px 0;">
                    <button onclick="window.location.href = 'add_customer'" class="btn btn-primary">Add New Customer</button>
                </div>
                <h2>User List</h2>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Role ID</th>
                            <th>Avatar</th>
                            <th>Full Name</th>
                            <th>Gender</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${listUser}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.username}</td>
                            <td>${user.password}</td>
                            <td>${user.roleID}</td>
                            <td><img src="${user.avatar}" alt="Avatar" width="50" height="50"></td>
                            <td>${user.fullName}</td>
                            <td>${user.gender}</td>
                            <td>${user.phone}</td>
                            <td>${user.email}</td>
                            <td>${user.address}</td>
                            <td>
                                <a href="update_user?id=${user.id}" class="btn btn-update">Update</a>
                                <a href="detail_user?id=${user.id}" class="btn btn-detail">Detail</a>
                            </td>
                            <c:if test="${user.role == false}">

                            </c:if>
                            <c:if test="${user.role == true}">
                                <td></td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <nav class="mt-3" aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <!-- Display the page numbers as links -->
                    <c:forEach var="pageNum" begin="1" end="${totalPages}">
                        <li class="page-item <c:if test='${pageNum == currentPage}'>active</c:if>'">
                            <a class="page-link" href="?brandId=${sessionScope.currBrand}&&catId=${sessionScope.currCate}&&search=${sessionScope.currSearch}&amp;page=${pageNum}">${pageNum}</a>
                        </li>
                    </c:forEach>
                </ul>
            </nav>

            <script src="./plugins/jquery/jquery.min.js"></script>
            <!-- Bootstrap -->
            <script src="./plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
            <!-- AdminLTE -->
            <script src="./dist/js/adminlte.js"></script>


            <script src="./plugins/jquery/jquery.min.js"></script>
            <!-- Bootstrap -->
            <script src="./plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
            <!-- AdminLTE -->
            <script src="./dist/js/adminlte.js"></script>


            <!-- OPTIONAL SCRIPTS -->
            <script src="./plugins/chart.js/Chart.min.js"></script>
            <!-- AdminLTE for demo purposes -->
            <script src="./dist/js/demo.js"></script>
            <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
            <script src="./dist/js/pages/dashboard3.js"></script>
    </body>
</html>
