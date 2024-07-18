<%-- 
    Document   : category_list
    Created on : Oct 27, 2023, 6:53:55 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <!-- Mirrored from templates.iqonic.design/booksto/html/admin-category.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:19:31 GMT -->
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Booksto - Responsive Bootstrap 4 Admin Dashboard Template</title>
        <!-- Favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/admin/assets/images/favicon.ico" />
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/dataTables.bootstrap4.min.css">
        <!-- Typography CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/typography.css">
        <!-- Style CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/style.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/responsive.css">

        <style>
            .form-group span {
                font-size: .8rem;
                color: tomato;
            }
        </style>
        <script defer>
            document.addEventListener('DOMContentLoaded', function () {
                Validator({
                    form: '#author__form',
                    formGroupSelector: '.form-group',
                    errorSelector: '.form-message',
                    rules: [
                        Validator.isRequired('#a-name', 'Please enter name of author!'),
                        Validator.isRequired('#a-bio', 'Please enter bio of author!'),
                    ]
                });
               
            });
        </script>
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
                                    <div class="iq-card-header d-flex justify-content-between">
                                        <div class="iq-header-title">
                                            <h4 class="card-title">Author information</h4>
                                        </div>
                                    </div>
                                    <div class="iq-card-body">
                                        <form id="author__form"  action="update_author" method="post">
                                                <input hidden value="${a.id}"  name="a-id">
                                            <div class="form-group">
                                                <label>Author Name:</label>
                                                <input value="${a.name}"  name="a-name" id="a-name"  type="text" class="form-control">
                                                <span class="form-message"></span>
                                            </div>
                                            <div class="form-group">
                                                <label>Author Bio:</label>
                                                <textarea name="a-bio" id="a-bio" class="form-control" rows="4">${a.bio}</textarea>
                                                <span class="form-message"></span>
                                            </div>
                                        <button type="submit" class="btn btn-primary">Save</button>
                                        <button type="reset" class="btn btn-danger">Reset</button>
                                    </form>
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
                    <a target="_blank" class="btn btn-primary d-block mt-3" href="${pageContext.request.contextPath}/admin/assets/#">Purchase Now</a>
                </div>
            </div>
        </div>

        <script>
            function loadSubCategoryDetail(subCatId) {
                console.log(subCatId);
                $.ajax({
                    type: 'POST',
                    data: {scid: subCatId},
                    url: 'sub-category-detail',
                    success: function (subcat) {
                        changeAction('update');
                        document.querySelector('#sc-id').value = subcat.id;
                        document.querySelector('#sc-name').value = subcat.name;
                        document.querySelector('#sc-desc').value = subcat.desc;
                    }
                });
            }
            function changeAction(action) {
                document.querySelector('#sc-action').value = action;
                document.querySelector('#sc-id').value = '';
                document.querySelector('#sc-name').value = '';
                document.querySelector('#sc-desc').value = '';
            }
            function deleteSubCat(scatId) {
                $.ajax({
                    type: 'POST',
                    data: {scid: scatId},
                    url: 'delete-subcategory',
                    success: function (response) {
                        window.location.reload();
                    }
                });
            }
            function loadSubCid(cid) {
                document.querySelector('#sc-id').value = cid;
            }
        </script>
        <!-- color-customizer END -->
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/dataTables.bootstrap4.min.js"></script>
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
    </body>

    <!-- Mirrored from templates.iqonic.design/booksto/html/admin-category.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:19:32 GMT -->
</html>