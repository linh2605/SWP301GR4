<%-- 
    Document   : user_list
    Created on : Oct 6, 2023, 1:38:44 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <!-- Mirrored from templates.iqonic.design/booksto/html/user-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:19:34 GMT -->
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>RonaldoSportShop - List of books</title>
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
            <jsp:include page="./component/sidebar.jsp"></jsp:include>

            <jsp:include page="./component/header.jsp"></jsp:include>

                <!-- Page Content  -->
                <div id="content-page" class="content-page">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="iq-card">
                                    <div class="iq-card-header d-flex justify-content-between">
                                        <div class="iq-header-title">
                                            <h4 class="card-title">User List</h4>
                                        </div>
                                    </div>
                                    <div class="iq-card-body">
                                        <div class="table-responsive">
                                            <div class="row justify-content-between">
                                                <div class="col-sm-12 col-md-6">
                                                    <div id="user_list_datatable_info" class="dataTables_filter">
                                           
                                                    </div>
                                                </div>
                                            </div>
                                            <table id="user-list-table" class="table table-striped table-bordered mt-4" role="grid" aria-describedby="user-list-page-info">
                                                <thead>
                                                    <tr>
                                                        <th>Profile</th>
                                                        <th>Fullname</th>
                                                        <th>Contact</th>
                                                        <th>Email</th>
                                                        <th>Address</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${uList}" var="u">
                                                    <c:if test="${sessionScope.usersession.roleID != 1 && (u.roleID == 1 || u.roleID == 2 || u.roleID == 3)}">
                                                        <c:set var="hide" value="1" />
                                                    </c:if>
                                                    <c:if test="${sessionScope.usersession.roleID == 1 || u.roleID == 4}">
                                                        <c:set var="hide" value="0" />
                                                    </c:if>
                                                    <c:if test="${hide ne '1'}">
                                                        <tr>
                                                            <td class="text-center"><img class="rounded img-fluid avatar-40" src="${u.avatar}" alt="profile"></td>
                                                            <td>${u.fullName}</td>
                                                            <td>${u.phone}</td>
                                                            <td>${u.email}</td>
                                                            <td>${u.address}</td>
                                                            <td>
                                                                <div class="flex align-items-center list-user-action">
                                                                    <a class="iq-bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="View" href="${pageContext.request.contextPath}/users?action=view&u=${u.id}"><i class="fa-solid fa-eye"></i></a>
                                                                        <c:if test="${sessionScope.usersession.roleID == 1 && u.roleID != 1}">
                                                                        <div onclick="loadUid(${u.id})" data-toggle="modal" data-target="#delete-account-confirmation__modal">
                                                                            <a class="iq-bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete" href="javascript:void(0)"><i class="ri-delete-bin-line"></i></a>
                                                                        </div> 
                                                                    </c:if>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="delete-account-confirmation__modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="display: none;">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Deleting account</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <input hidden type="text" id="u-id" name="u-id">
                                    By clicking Delete button, you will delete all data of this account!<br>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button onclick="deleteAccount(document.getElementById('u-id').value)" type="button" class="btn btn-danger">Delete</button>
                                </div>
                            </div>
                        </div>
                    </div>     

                </div>
            </div>
        </div>
        <!-- Wrapper END -->
        <!-- Footer -->
        <footer class="iq-footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
                        <ul class="list-inline mb-0">
                            <li class="list-inline-item"><a href="${pageContext.request.contextPath}/admin/assets/privacy-policy.html">Privacy Policy</a></li>
                            <li class="list-inline-item"><a href="${pageContext.request.contextPath}/admin/assets/terms-of-service.html">Terms of Use</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-6 text-right">
                        Copyright 2020 <a href="${pageContext.request.contextPath}/admin/assets/#">Booksto</a> All Rights Reserved.
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer END -->
        <!-- color-customizer -->
        <div class="iq-colorbox color-fix">
            <div class="buy-button"> <a class="color-full" href="${pageContext.request.contextPath}/admin/assets/#"><i class="fa fa-spinner fa-spin"></i></a> </div>
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
                <a target="_blank" class="btn btn-primary d-block mt-3" href="${pageContext.request.contextPath}/admin/assets/#">Purchase Now</a>
            </div>
        </div>
        <!-- color-customizer END -->
        <!-- Optional JavaScript -->
        <script>
            function deleteAccount(uId) {
                $.ajax({
                    type: 'POST',
                    data: {uid: uId},
                    url: 'delete-user',
                    success: function (response) {
                        window.location.reload();
                    }
                });
            }
            function loadUid(uid) {
                document.querySelector('#u-id').value = uid;
            }
        </script>
       <script src="https://kit.fontawesome.com/ff0d738c65.js" crossorigin="anonymous"></script>
            <!-- jQuery first, then Popper.js, then Bootstrap JS -->
            <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/dataTables.bootstrap4.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.appear.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/countdown.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.counterup.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/wow.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/apexcharts.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/slick.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/select2.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.magnific-popup.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/smooth-scrollbar.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/lottie.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/core.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/charts.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/animated.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/kelly.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/maps.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/worldLow.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/raphael-min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/morris.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/morris.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/flatpickr.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/style-customizer.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/chart-custom.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/custom.js"></script>
         <script>
            $(document).ready(function() {
                $('#user-list-table').DataTable({
                    "paging": true,
                    "searching": true,
                    "info": true,
                    "lengthChange": true,
                    "language": {
                        "search": "Search:",
                        "lengthMenu": "Show _MENU_ entries",
                        "info": "Showing _START_ to _END_ of _TOTAL_ entries",
                        "infoEmpty": "No entries available",
                        "infoFiltered": "(filtered from _MAX_ total entries)",
                        "paginate": {
                            "first": "First",
                            "last": "Last",
                            "next": "Next",
                            "previous": "Previous"
                        }
                    }
                });
            });

            function deleteAccount(uId) {
                $.ajax({
                    type: 'POST',
                    data: {uid: uId},
                    url: 'delete-user',
                    success: function (response) {
                        window.location.reload();
                    }
                });
            }

            function loadUid(uid) {
                document.querySelector('#u-id').value = uid;
            }
        </script>
    </body>

    <!-- Mirrored from templates.iqonic.design/booksto/html/user-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:19:34 GMT -->
</html>