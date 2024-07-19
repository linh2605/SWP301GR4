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
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f7f7f7;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                background-image: url('https://toigingiuvedep.vn/wp-content/uploads/2021/05/hinh-nen-cau-thu-bong-da.jpg');
            }

            .form-container {
                display: flex;
                flex-direction: column; /* Chỉnh form thành dạng cột */
                background: #ffffff;
                padding: 20px 40px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                max-width: 500px;
                width: 100%;
                position: absolute;
                left: 50%;
                top: 50%;
                transform: translate(-50%, 30%);
            }

            .form-container h2 {
                margin-bottom: 20px;
                font-size: 24px;
                color: #333;
                text-align: center; /* Canh giữa tiêu đề */
            }

            .form-group {
                margin-bottom: 15px;
            }

            .form-group label {
                display: block;
                margin-bottom: 5px;
                color: #555;
            }

            .form-control {
                width: 100%;
                padding: 10px; /* Tăng padding cho ô input */
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
                color: #333;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }

            .form-control:focus {
                border-color: #007bff;
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
            }

            .form-row {
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap; /* Cho phép các cặp form-group xuống dòng khi không đủ không gian */
            }

            .form-row .form-group {
                width: calc(50% - 10px); /* 50% với khoảng cách giữa các cột */
                margin-bottom: 0; /* Bỏ margin-bottom vì đã có margin-bottom ở .form-group */
            }

            .form-row .form-group:first-child {
                margin-right: 10px; /* Khoảng cách giữa các cặp form-group */
            }

            .btn-primary {
                background-color: #007bff;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s ease;
            }

            .btn-primary:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body class="hold-transition sidebar-mini">
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
                <div class="form-container">
                <c:if test="${not empty successMess}">
                    <h3 style="color: green">${successMess}</h3>
                </c:if>
                <c:if test="${not empty errorMess}">
                    <h3 style="color: red">${errorMess}</h3>
                </c:if>
                <form action="detail_user" method="post">
                    <input type="hidden" name="id" value="${user.id}">

                    <div class="form-group">
                        <label for="name">Fullname</label>
                        <input type="text" id="name" class="form-control" placeholder="Fullname" name="name" value="${user.fullName}" disabled>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" class="form-control" placeholder="Email" name="email" value="${user.email}" disabled>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone number</label>
                            <input type="text" id="phone" class="form-control" placeholder="Phone number" name="phone" value="${user.phone}" disabled>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="gender">Gender</label>
                        <select id="gender" class="form-control form-select" name="gender" disabled>
                            <option value="Male" ${user.gender == 'Male' ? 'selected' : ''}>Male</option>
                            <option value="Female" ${user.gender == 'Female' ? 'selected' : ''}>Female</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" id="address" class="form-control" placeholder="Address" name="address" value="${user.address}" disabled>
                    </div>

                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" class="form-control" placeholder="Username" name="username" value="${user.username}" disabled>
                    </div>

                    <div class="form-group">
                        <label for="pass">Password</label>
                        <input type="password" id="pass" class="form-control" placeholder="Password" name="pass" disabled>
                    </div>

                </form>
            </div>
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
