<%-- 
    Document   : login-register
    Created on : Oct 2, 2023, 8:04:15 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">


    <!-- Mirrored from htmldemo.net/pustok/pustok/index-3.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:17:02 GMT -->
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>login-register</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Use Minified Plugins Version For Fast Page Load -->
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/plugins.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/main.css" />
        <link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
        <style>
            .form-group span {
                font-size: .8rem;
                color: red;
            }
            .loader {
                border: 4px solid #f3f3f3;
                border-top: 4px solid #28a745;  /* #28a745 is the color for .btn-success in Bootstrap */
                border-radius: 50%;
                width: 20px;
                height: 20px;
                animation: spin 1s linear infinite;
                display: inline-block;
                vertical-align: middle;
                margin-right: 8px;
            }

            @keyframes spin {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(360deg);
                }
            }
        </style>

        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

        <!-- all css here -->
        <!-- bootstrap css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <!-- animate css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
        <!-- meanmenu css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/meanmenu.min.css">
        <!-- owl.carousel css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.css">
        <!-- font-awesome css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <!-- material-design-iconic-font.css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/material-design-iconic-font.css">
        <!-- chosen.min.css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chosen.min.css">
        <!-- flexslider.css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flexslider.css">
        <!-- style css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <!-- responsive css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
    </head>



    <body>
        <div class="site-wrapper" id="top">
            <script defer>
                document.addEventListener('DOMContentLoaded', function () {
                    Validator({
                        form: '#login__form',
                        formGroupSelector: '.form-group',
                        errorSelector: '.form-message',
                        rules: [
                            Validator.isRequired('#username', 'Please enter username!'),
                            Validator.isRequired('#password', 'Please enter password!')
                        ]
                    });

                    Validator({
                        form: '#signup__form',
                        formGroupSelector: '.form-group',
                        errorSelector: '.form-message',
                        rules: [
                            Validator.isRequired('#username', 'Please enter username!'),
                            Validator.isRequired('#fullname', 'Please enter fullname!'),
                            Validator.isRequired('#email', 'Please enter email!'),
                            Validator.isRequired('#pass', 'Please enter password!'),
                            Validator.minLength('#pass', 8),
                            Validator.isRequired('#repass', 'Please enter repassword!'),
                            Validator.isEmail('#email', 'Invalid email format!'),
                            Validator.isRequired('#repass', 'Please enter username!'),
                            Validator.isConfirmed('#repass', function () {
                                return document.querySelector('#signup__form #pass').value
                            }, 'Password does not match!'),
                        ]
                    });
                });
            </script>



            <header>
                <!-- header-top-area-start -->
                <jsp:include page= "../view/common/header-top-area.jsp"></jsp:include>
                    <!-- header-top-area-end -->
                </header>
                <main class="page-section inner-page-sec-padding-bottom">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-xs-12 col-lg-6 mb--30 mb-lg--0">
                                <!-- Login Form s-->
                                <form action="registerEmail" method="Post" id="signup__form">
                                    <div class="login-form">
                                        <h4 class="login-title">New Customer</h4>
                                        <p><span class="font-weight-bold">I am a new customer</span></p>
                                        <div class="row">
                                            <div class="form-group col-md-12 col-12 mb--15">
                                                <label for="username">Username</label>
                                                <input value="${username}" onchange="checkUsername(this)" name="username" class="mb-0 form-control" type="text" id="username"
                                                   placeholder="Enter your username">
                                            <span id="result" class="form-message">${usernameExistsMsg}${errmsgusername}</span>
                                        </div>
                                        <div class="form-group col-md-12 col-12 mb--15">
                                            <label for="fullname">Full Name</label>
                                            <input value="${fullname}" name="fullname" class="mb-0 form-control" type="text" id="fullname"
                                                   placeholder="Enter your full name">
                                            <span class="form-message"></span>
                                        </div>
                                        <div class="form-group col-12 mb--20">
                                            <label for="email">Email</label>
                                            <input value="${email}" name="email" class="mb-0 form-control" type="email" id="email" 
                                                   placeholder="Enter Your Email Address Here..">
                                            <span class="form-message">${errmsgemail}</span>
                                        </div>
                                        <div class="form-group col-lg-6 mb--20">
                                            <label for="password">Password</label>
                                            <input name="password" class="mb-0 form-control" type="password" id="pass" 
                                                   placeholder="Enter your password">
                                            <span class="form-message"></span>
                                        </div>
                                        <div class="form-group col-lg-6 mb--20">
                                            <label for="password">Repeat Password</label>
                                            <input name="repassword" class="mb-0 form-control" type="password" id="repass" 
                                                   placeholder="Repeat your password">
                                            <span class="form-message"></span>
                                        </div>
                                        <div class="col-md-12">
                                            <button id="register__submit" type="submit" class="btn btn-outlined">Register</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="col-sm-12 col-md-12 col-lg-6 col-xs-12">
                            <form action="login" method="POST" id="login__form">
                                <div class="login-form">
                                    <h4 class="login-title">Returning Customer</h4>
                                    <p><span class="font-weight-bold">I am a returning customer</span></p>
                                    <c:if test="${errmsg ne null}">
                                        ${errmsg}
                                    </c:if>
                                    <div class="row">
                                        <div class="form-group col-md-12 col-12 mb--15">
                                            <label for="email">Enter your username here...</label>
                                            <input name="username" class="mb-0 form-control" type="text" id="username"
                                                   placeholder="Enter your user name">
                                            <span class="form-message"></span>
                                        </div>
                                        <div class="form-group col-12 mb--20">
                                            <label for="password">Password</label>
                                            <input name="password" class="mb-0 form-control" type="password" id="password" 
                                                   placeholder="Enter your password">
                                            <span class="form-message"></span>
                                        </div>
                                        <a href="${pageContext.request.contextPath}/auth/forgotPassword.jsp">Forgot password?</a>
                                        <div class="col-md-12">
                                            <button type="submit" class="btn btn-outlined">Login</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </main>
        </div>

        <!--=================================
           Footer Area
       ===================================== -->               

        <jsp:include page="../client/component/footer.jsp"></jsp:include>

            <script src="${pageContext.request.contextPath}/admin/assets/js/form-validator.js"></script>
        <!-- Use Minified Plugins Version For Fast Page Load -->
        <script src="${pageContext.request.contextPath}/client/assets/js/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/ajax-mail.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/custom.js"></script>
        <script>
                                                    const form = document.querySelector('#signup__form');
                                                    const btn = document.querySelector('#register__submit');

                                                    form.addEventListener('submit', function (e) {

                                                        e.preventDefault();

                                                        btn.setAttribute('disabled', true);
                                                        btn.innerHTML = '<span class="loader"></span> Processing...';

                                                        setTimeout(() => {
                                                            if (!form.submitted) {
                                                                btn.removeAttribute('disabled');
                                                                btn.innerHTML = 'Register';
                                                            }
                                                        }, 1000);

                                                    });
                                                    function checkUsername(param) {
                                                        var username = param.value;
                                                        $.ajax({
                                                            type: 'POST',
                                                            data: {username: username},
                                                            url: 'UsernameChecking',
                                                            success: function (result) {
                                                                document.querySelector('#result').innerHTML = result;
                                                            }
                                                        });
                                                    }
        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </body>

</html>