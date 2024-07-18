<%-- 
    Document   : book_form
    Created on : Sep 29, 2023, 4:00:41 AM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

    <!-- Mirrored from templates.iqonic.design/booksto/html/admin-add-book.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:20:08 GMT -->
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Booksto - Responsive Bootstrap 4 Admin Dashboard Template</title>

        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/plugins.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/main.css" />
        <link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
        <style>
            .profile-image__container {
                width: 100%;
                display: flex;
                flex-direction: column;
                align-items: center;
                margin-bottom: 1rem;
            }
            .profile-image__container .button {
                width: 3rem;
                height: 3rem;
                display: flex;
                align-items: center;
                justify-content: center;
                border: .04rem solid #000;
                padding: 1rem;
                margin: .4rem;
                cursor: pointer;
            }
            .form-group span {
                font-size: .8rem;
                color: tomato;
            }

        </style>

        <!-- Favicon -->
        <link rel="shortcut icon" href="images/favicon.ico" />
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/dataTables.bootstrap4.min.css">
        <!-- Typography CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/typography.css">
        <!-- Style CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/style.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/responsive.css">


    </head>
    <body>

        <!-- loader Start -->
        <div id="loading">
            <div id="loading-center">
            </div>
        </div>
        <!-- loader END -->
        <!-- Wrapper Start -->
        <div class="wrapper">
            <!-- Sidebar  -->
            <jsp:include page="./component/sidebar.jsp"></jsp:include>
                <!-- TOP Nav Bar -->
            <jsp:include page="./component/header.jsp"></jsp:include>
                <!-- TOP Nav Bar END -->
                <!-- Page Content  -->
                <div id="content-page" class="content-page">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="iq-card">

                                <c:if test="${errmsg ne null}">
                                    <div class="alert alert-danger" role="alert">
                                        <div class="iq-alert-icon">
                                            <i class="ri-information-line"></i>
                                        </div>
                                        <div class="iq-alert-text">${errmsg}</div>
                                    </div>
                                </c:if> 
                                <div class="myaccount-content">
                                    <h3>User Details</h3>
                                    <c:set var="disabled" value="disabled"/>
                                    <c:if test="${action eq 'add'}">
                                        <c:set var="disabled" value=""/>
                                    </c:if>
                                    <div class="account-details-form">
                                        <form action="users" method="POST" id="profile__form">
                                            <input type="text" value="${uid}" name="uid" hidden>
                                            <input hidden type="text" value="${action}" name="action">

                                            <div class="row">
                                                <c:if test="${action eq 'view'}">
                                                    <div class="col-12 profile-image__container">
                                                        <div style="width: 5rem;height:5rem;border-radius: 50%;overflow: hidden;">
                                                            <img style="object-fit: cover;" id="preview-avatar" src="${uv.avatar}" alt="user avatar">
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${sessionScope.usersession.roleID == 1}"> 
                                                    <c:if test="${action eq 'add'}">
<!--                                                        <div class="form-group col-12  mb--30">
                                                            <label for="full-name">Full Name</label>
                                                            <input ${disabled} name="fullName" 
                                                                               <c:if test="${last_fullName == null}">value="${uv.fullName}"</c:if>
                                                                               <c:if test="${last_fullName != null}">value="${last_fullName}"</c:if>
                                                                                   id="fullName" placeholder="" type="text">
                                                                               <span class="form-message">${fullNameExistMsg}</span>
                                                        </div>-->
                                                        <div class="form-group col-12  mb--30">
                                                            <label for="full-name">Username</label>
                                                            <input ${disabled} name="username" 
                                                                               <c:if test="${last_username == null}">value="${uv.username}"</c:if>
                                                                               <c:if test="${last_username != null}">value="${last_username}"</c:if>
                                                                                   id="username" placeholder="" type="text">
                                                                               <span class="form-message">${usernameexistmsg}</span>
                                                        </div>
                                                        <div class="form-group col-12  mb--30">
                                                            <label for="full-name">Password</label>
                                                            <input ${disabled} name="password" value="${uv.password}" id="password" placeholder="" type="password">
                                                            <span class="form-message"></span>
                                                        </div>

                                                        <div class="form-group col-12  mb--30">
                                                            <label for="full-name">Confirm password</label>
                                                            <input name="repassword" id="repassword" type="password">
                                                            <span class="form-message"></span>
                                                        </div>
                                                    </c:if>
                                                </c:if> 
                                                <c:if test="${action eq 'view'}">
                                                    <div class="form-group col-12  mb--30">
                                                        <label for="full-name">Fullname</label>
                                                        <input ${disabled} name="fullname" value="${uv.fullName}" id="full-name" placeholder="Not fill" type="text">

                                                    </div>
                                                    <div class="form-group col-12  mb--30">
                                                        <label for="phone">Phone number</label>
                                                        <input ${disabled} name="phone" value="${uv.phone}" id="phone" placeholder="Not fill" type="text">
                                                    </div>
                                                    <div class="form-group col-12  mb--30">
                                                        <label for="email">Email</label>
                                                        <input ${disabled} name="email" value="${uv.email}" id="email" placeholder="Not fill" type="email">
                                                    </div>
                                                    <div class="form-group col-12  mb--30">
                                                        <label for="address">Address</label>
                                                        <input ${disabled} name="address" value="${uv.address}" id="address" placeholder="Not fill" type="text">

                                                    </div>
                                                    <div class="form-group col-12  mb--30">
                                                        <label for="gender">Gender</label>
                                                        <select ${disabled} name="gender" style="width:20%; height:2.8rem;margin-top: .4rem;" id="gender" class="custom-select d-lg-block">
                                                            <c:if test="${uv.gender == 'Male'}">
                                                                <c:set var="ms" value="selected" />
                                                            </c:if>
                                                            <c:if test="${uv.gender == 'Female'}">
                                                                <c:set var="fs" value="selected" />
                                                            </c:if>
                                                            <c:if test="${uv.gender == 'Other'}">
                                                                <c:set var="os" value="selected" />
                                                            </c:if>
                                                            <option ${ms} value="Male">Male</option>
                                                            <option ${fs} value="Female">Female</option>
                                                            <option ${os} value="Other">Other</option>
                                                        </select>
                                                    </div>
                                                </c:if>
                                                <div style="display: flex; align-items: center; justify-content: flex-start; gap: 10%;margin-bottom: 2rem;">
                                                    <c:forEach items="${rList}" var="r">
                                                        <c:if test="${uv.roleID == r.role_id}">
                                                            <c:set var="checked" value="checked" />
                                                        </c:if>
                                                        <c:if test="${uv.roleID != r.role_id}">
                                                            <c:set var="checked" value="" />
                                                        </c:if>
                                                        <c:if test="${r.role_id == 4 && action eq 'add'}">
                                                            <c:set var="checked" value="checked" />
                                                        </c:if>
                                                        <div>
                                                            <input ${checked} ${disabled} name="roleid" value="${r.role_id}" id="role__${r.role_id}" type="radio">
                                                            <label for="role__${r.role_id}">${r.role_name}</label>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                                <c:if test="${sessionScope.usersession.roleID == 1}">
                                                    <div class="col-12" style="display: flex; justify-content: flex-end">
                                                        <button style="background: #0dd6b8" type="submit" class="btn btn--primary">Save Changes</button>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:if test="${action eq 'view'}">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="iq-card">
                                    <div class="iq-card-header d-flex justify-content-between">
                                        <div class="iq-header-title">
                                            <h4 class="card-title">Wishlist</h4>
                                        </div>
                                    </div>
                                    <div class="iq-card-body">
                                        <div class="table-responsive">
                                            <table class="data-tables table table-striped table-bordered" style="width:100%">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 3%;">#</th>
                                                        <th style="width: 12%;">Book Cover</th>
                                                        <th style="width: 15%;">Book Name</th>
                                                        <th style="width: 15%;">Book Category</th>
                                                        <th style="width: 15%;">Book Author</th>
                                                        <th style="width: 15%;">Book Publisher</th>
                                                        <th style="width: 18%;">Book Description</th>
                                                        <th style="width: 7%;">Book Price</th>
                                                        <th style="width: 7%;">Book Stock</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${bList}" var="b">
                                                        <tr>
                                                            <td>${b.id}</td>
                                                            <td>
                                                                <c:if test="${empty b.iList && b.img0 eq ''}">
                                                                    <i style="color: grey;font-size:.8rem">No image!</i>
                                                                </c:if>
                                                                <img class="img-fluid rounded" src="${b.img0}" alt="">
                                                            </td>
                                                            <td>${b.title}</td>
                                                            <td>
                                                                <c:forEach items="${b.scList}" var="sc">
                                                                    ${sc.name}, 
                                                                </c:forEach>
                                                            </td>
                                                            <td>${b.author.name}</td>
                                                            <td>${b.publisher.name}</td>
                                                            <td>
                                                                <p class="mb-0">${b.desc}</p>
                                                            </td>
                                                            <td>${b.cost}</td>
                                                            <td>${b.stock}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <!-- Wrapper END -->
        <!-- Footer -->
        <jsp:include page="./component/footer.jsp"></jsp:include>
            <!-- Footer END -->
            <!-- color-customizer -->
            <div class="iq-colorbox color-fix">
                <div class="buy-button"> <a class="color-full" href="#"><i class="fa fa-spinner fa-spin"></i></a> </div>
                <div id="right-sidebar-scrollbar" class="iq-colorbox-inner">
                    <div class="clearfix color-picker">
                        <h3 class="iq-font-black">Booksto Awesome Color</h3>
                        <p>This color combo available inside whole template. You can change on your wish, Even you can create your own with limitless possibilities! </p>
                        <ul class="iq-colorselect clearfix">
                            <li class="color-1 iq-colormark" data-style="color-1"></li>
                            <li class="color-2" data-style="iq-color-2"></li>
                            <li class="color-3" data-style="iq-color-3"></li>
                            <li class="color-4" data-style="iq-color-4"></li>
                            <li class="color-5" data-style="iq-color-5"></li>
                            <li class="color-6" data-style="iq-color-6"></li>
                            <li class="color-7" data-style="iq-color-7"></li>
                            <li class="color-8" data-style="iq-color-8"></li>
                            <li class="color-9" data-style="iq-color-9"></li>
                            <li class="color-10" data-style="iq-color-10"></li>
                            <li class="color-11" data-style="iq-color-11"></li>
                            <li class="color-12" data-style="iq-color-12"></li>
                            <li class="color-13" data-style="iq-color-13"></li>
                            <li class="color-14" data-style="iq-color-14"></li>
                            <li class="color-15" data-style="iq-color-15"></li>
                            <li class="color-16" data-style="iq-color-16"></li>
                            <li class="color-17" data-style="iq-color-17"></li>
                            <li class="color-18" data-style="iq-color-18"></li>
                            <li class="color-19" data-style="iq-color-19"></li>
                            <li class="color-20" data-style="iq-color-20"></li>
                        </ul>
                        <a target="_blank" class="btn btn-primary d-block mt-3" href="#">Purchase Now</a>
                    </div>
                </div>
            </div>
            <!-- color-customizer END -->
            <!-- Optional JavaScript -->
            <script>
                // Get references to the image preview, upload input, and remove button
                const previewImage = document.getElementById('preview-avatar');
                const uploadInput = document.getElementById('imageUpload');
                const removeButton = document.getElementById('removeButton');

                // Add event listeners for the upload input and remove button
                uploadInput.addEventListener('change', handleImageUpload);
                removeButton.addEventListener('click', removeImage);

                function handleImageUpload(event) {
                    const file = event.target.files[0];
                    const reader = new FileReader();

                    reader.onload = function (event) {
                        previewImage.src = event.target.result;
                        document.querySelector('#imageBase64').value = event.target.result;
                    };

                    if (file) {
                        reader.readAsDataURL(file);
                    }
                }

                function removeImage() {
                    previewImage.src = 'assets/profile.png';
                    uploadInput.value = null; // Clear the value of the upload input if an image was selected
                    document.querySelector('#imageBase64').value = 'assets/profile.png'
                }
            </script>
            <script src="${pageContext.request.contextPath}/admin/assets/js/form-validator.js"></script>
        <script src="https://kit.fontawesome.com/ff0d738c65.js" crossorigin="anonymous"></script>
        <!-- Use Minified Plugins Version For Fast Page Load -->
        <script src="${pageContext.request.contextPath}/client/assets/js/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/ajax-mail.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/custom.js"></script>

        <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/dataTables.bootstrap4.min.js"></script>

        <script src="${pageContext.request.contextPath}/admin/assets/js/form-validator.js"></script>
        <!-- FontAwesome JavaScript -->
        <script src="https://kit.fontawesome.com/ff0d738c65.js" crossorigin="anonymous"></script>
        <!-- Appear JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.appear.js"></script>
        <!-- Countdown JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/countdown.min.js"></script>
        <!-- Counterup JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.counterup.min.js"></script>
        <!-- Wow JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/wow.min.js"></script>
        <!-- Apexcharts JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/apexcharts.js"></script>
        <!-- Slick JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/slick.min.js"></script>
        <!-- Select2 JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/select2.min.js"></script>
        <!-- Owl Carousel JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/owl.carousel.min.js"></script>
        <!-- Magnific Popup JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.magnific-popup.min.js"></script>
        <!-- Smooth Scrollbar JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/smooth-scrollbar.js"></script>
        <!-- lottie JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/lottie.js"></script>
        <!-- am core JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/core.js"></script>
        <!-- am charts JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/charts.js"></script>
        <!-- am animated JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/animated.js"></script>
        <!-- am kelly JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/kelly.js"></script>
        <!-- am maps JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/maps.js"></script>
        <!-- am worldLow JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/worldLow.js"></script>
        <!-- Raphael-min JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/raphael-min.js"></script>
        <!-- Morris JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/morris.js"></script>
        <!-- Morris min JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/morris.min.js"></script>
        <!-- Flatpicker Js -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/flatpickr.js"></script>
        <!-- Style Customizer -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/style-customizer.js"></script>
        <!-- Chart Custom JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/chart-custom.js"></script>
        <!-- Custom JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/custom.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/form-validator.js"></script>
        <script>
                document.addEventListener('DOMContentLoaded', function () {
                    Validator({
                        form: '#profile__form',
                        formGroupSelector: '.form-group',
                        errorSelector: '.form-message',
                        rules: [
                            Validator.isRequired('#username', 'Please enter username!'),
                            Validator.isRequired('#password', 'Please enter password!'),
                            Validator.isRequired('#repassword', 'Please confirm password!'),
                            Validator.minLengthAllowNull('#password', 8),
                            Validator.isConfirmed('#repassword', function () {
                                return document.querySelector('#profile__form #password').value
                            }, 'Password does not match!'),
                        ]
                    });
                });
        </script>
    </body>

    <!-- Mirrored from templates.iqonic.design/booksto/html/admin-add-book.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:20:08 GMT -->
</html>