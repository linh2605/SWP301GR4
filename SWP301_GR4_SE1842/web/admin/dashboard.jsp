<%-- 
    Document   : dashboard
    Created on : Sep 28, 2023, 11:09:57 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

    <!-- Mirrored from templates.iqonic.design/booksto/html/admin-dashboard.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:18:26 GMT -->
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Booksto - Responsive Bootstrap 4 Admin Dashboard Template</title>
        <!-- Favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/admin/assets/images/favicon.ico" />
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/bootstrap.min.css">
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
                            <div class="col-md-6 col-lg-3">
                                <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                                    <div class="iq-card-body">
                                        <div class="d-flex align-items-center">
                                            <div class="rounded-circle iq-card-icon bg-primary"><i class="ri-user-line"></i></div>
                                            <div class="text-left ml-3">                                 
                                                <h2 class="mb-0"><span class="counter">${usercnt}</span></h2>
                                            <h5 class="">Users</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                                <div class="iq-card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="rounded-circle iq-card-icon bg-danger"><i class="ri-book-line"></i></div>
                                        <div class="text-left ml-3">                                 
                                            <h2 class="mb-0"><span class="counter">${bookcnt}</span></h2>
                                            <h5 class="">Books</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                                <div class="iq-card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="rounded-circle iq-card-icon bg-warning"><i class="ri-shopping-cart-2-line"></i></div>
                                        <div class="text-left ml-3">                                 
                                            <h2 class="mb-0"><span class="counter">${salecnt}</span></h2>
                                            <h5 class="">Sale</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                                <div class="iq-card-body">
                                    <div class="d-flex align-items-center">
                                        <div class="rounded-circle iq-card-icon bg-info"><i class="ri-radar-line"></i></div>
                                        <div class="text-left ml-3">                                 
                                            <h2 class="mb-0"><span class="counter">${ordercnt}</span></h2>
                                            <h5 class="">Orders</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                                <div class="iq-card-header d-flex justify-content-between align-items-center">
                                    <div class="iq-header-title">
                                        <h4 class="card-title mb-0">Summary</h4>
                                    </div>
                                </div>
                                <div class="iq-card-body">
                                    <ul class="list-inline p-0 mb-0">
                                        <li>
                                            <div class="iq-details mb-2">
                                                <span class="title">Income</span>
                                                <div class="float-right text-primary">${income} <span>$</span></div>
                                            </div>                                       
                                        </li>
                                        <li>
                                            <div class="iq-details mb-2">
                                                <span class="title">Lost</span>
                                                <div class="float-right text-warning">${lost} <span>$</span></div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="iq-card">
                                <div class="iq-card-header d-flex justify-content-between">
                                    <div class="iq-header-title">
                                        <h4 class="card-title">New Orders</h4>
                                    </div>
                                </div>
                                <div class="iq-card-body">
                                    <ul class="iq-timeline">
                                        <c:set var="count" value="0" />

                                        <c:forEach items="${oList}" var="o">
                                            <c:if test="${count lt 5}"> <li> <div class="timeline-dots border-warning"><i class="ri-pantone-line"></i></div> <h6 class="float-left mb-1">${o.user.fullName}</h6> <small class="float-right mt-1">${o.orderDate}</small> <div class="d-inline-block w-100"> <p>Place an order</p> </div> </li>
                                                        <c:set var="count" value="${count + 1}" />
                                                    </c:if>
                                                </c:forEach>
                                    </ul>
                                    <c:if test="${count ge 5}"> <button>View more</button>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="iq-card">
                                <div class="iq-card-header d-flex justify-content-between">
                                    <div class="iq-header-title">
                                        <h4 class="card-title">Most Wished For</h4>
                                    </div>
                                </div>
                                <div class="iq-card-body">
                                    <ul class="iq-timeline">
                                        <c:set var="count" value="0" />
                                        <c:forEach items="${wList}" var="b">
                                            <c:if test="${count lt 5}">
                                                <li> <div class="timeline-dots border-info"><i class="ri-pantone-line"></i></div> <h6 class="float-left mb-1">${b.title}</h6> <div class="d-inline-block w-100"> <p>There is (are) ${b.amountInWishLists} book(s) was in customer's wishlist!</p> </div> </li>
                                                        <c:set var="count" value="${count + 1}" />
                                                    </c:if>
                                                </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Wrapper END -->

        <jsp:include page="./component/footer.jsp"></jsp:include>




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
            <!-- jQuery first, then Popper.js, then Bootstrap JS -->
            <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/bootstrap.min.js"></script>
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
        <script src="${pageContext.request.contextPath}/admin/assets/js/chart-custom.js">

        </script>
        <!-- Custom JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/custom.js"></script>
    </body>

    <!-- Mirrored from templates.iqonic.design/booksto/html/admin-dashboard.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:19:01 GMT -->
</html>