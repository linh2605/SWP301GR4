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
                font-family: Arial, sans-serif;
                background-image: url('https://treobangron.com.vn/wp-content/uploads/2022/11/background-bong-da-6.jpg');
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                color: #343a40;
                margin: 0;
                padding: 20px;

                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .center-block {
                position: absolute;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
            }

            .form-container {
                background-color: rgba(255, 255, 255, 0.8);
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                width: 100%;
                max-width: 600px;
            }
            .form-group {
                margin-bottom: 20px;
            }
            .form-group label {
                font-weight: bold;
            }
            .form-control {
                width: 100%;
                padding: 10px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            .form-control:focus {
                outline: none;
                border-color: #007bff;
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
            }
            .btn-primary {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                border-radius: 4px;
                font-size: 16px;
            }
            .btn-primary:hover {
                background-color: #0056b3;
            }
            .form-message {
                color: red;
                font-size: 12px;
            }
        </style>
    </head>
    <body>

        <script defer>
            document.addEventListener('DOMContentLoaded', function () {
                Validator({
                    form: '#addcustomer',
                    formGroupSelector: '.form-group',
                    errorSelector: '.form-message',
                    rules: [
                        Validator.isRequired('#fullname', 'Please enter username!'),
                        Validator.isRequired('#email', 'Please enter password!'),
                        Validator.isRequired('#phone', 'Please enter username!'),
                        Validator.isRequired('#gender', 'Please enter password!'),
                        Validator.isRequired('#address', 'Please enter username!'),
                        Validator.isRequired('#username', 'Please enter username!'),
                        Validator.isRequired('#password', 'Please enter password!'),
                        Validator.minLength('#password', 8),
                    ]
                });
            });
        </script>
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
        <div class="col-lg-3 center-block">
            <c:if test="${not empty successMess}">
                <h3 style="color: green">
                    ${successMess}
                </h3>
            </c:if>
            <c:if test="${not empty errorMess}">
                <h3 style="color: red">
                    ${errorMess}
                </h3>
            </c:if>
            <div class="form-container">
                <c:if test="${not empty successMess}">
                    <h3 style="color: green">${successMess}</h3>
                </c:if>
                <c:if test="${not empty errorMess}">
                    <h3 style="color: red">${errorMess}</h3>
                </c:if>
                <form id="addcustomer" action="add_customer" method="post">
                    <input type="hidden" name="id" value="${user.id}">
                    <div class="form-group">
                        <label>Fullname</label>
                        <input id="fullname" type="text" class="form-control" placeholder="Fullname" name="name" value="${user.fullName}">
                        <span class="form-message"></span>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>Email</label>
                            <input id="email" type="email" class="form-control" placeholder="Email" name="email" value="${user.email}">
                            <span class="form-message"></span>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Phone number</label>
                            <input id="phone" type="text" class="form-control" placeholder="Phone number" name="phone" value="${user.phone}">
                            <span class="form-message"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Gender</label>
                        <select class="form-control" name="gender">
                            <option selected="" value="Male" ${user.gender == 'Male' ? 'selected' : ''}>Male</option>
                            <option value="Female" ${user.gender == 'Female' ? 'selected' : ''}>Female</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <input id="address" type="text" class="form-control" placeholder="Address" name="address" value="${user.address}">
                        <span class="form-message"></span>
                    </div>
                    <div class="form-group">
                        <label>Username</label>
                        <input id="username" type="text" class="form-control" placeholder="Username" name="username" value="${user.username}">
                        <span class="form-message"></span>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input id="password" type="password" class="form-control" placeholder="Password" name="pass">
                        <span class="form-message"></span>
                    </div>
                    <button type="submit" class="btn btn-primary">Add customer</button>
                </form>
            </div>
        </div>
        <script src="./plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="./plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE -->
        <script src="./dist/js/adminlte.js"></script>

        <script src="${pageContext.request.contextPath}/admin/assets/js/form-validator.js"></script>
        <!-- OPTIONAL SCRIPTS -->
        <script src="./plugins/chart.js/Chart.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="./dist/js/demo.js"></script>
        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="./dist/js/pages/dashboard3.js"></script>
    </body>
</html>
