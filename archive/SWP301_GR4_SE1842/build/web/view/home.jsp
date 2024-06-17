<%-- 
    Document   : home
    Created on : May 13, 2024, 2:11:03 AM
    Author     : pcdau
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Angara - Organic Sports Store HTML Template </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

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
    <body class="home-3">
        <header>
            <!-- header-top-area-start -->
            <jsp:include page= "common/header-top-area.jsp"></jsp:include>
                <!-- header-top-area-end -->
                <!-- header-min-area-start -->
            <jsp:include page= "common/header-min-area.jsp"></jsp:include>
                <!-- header-min-area-start -->
                <!-- mobile-menu-area-start -->
            <jsp:include page= "common/mobile-menu-area.jsp"></jsp:include>
                <!-- mobile-menu-area-end -->
                <!-- header-bottom-area-start -->
            <jsp:include page= "common/header-bottom-area.jsp"></jsp:include>
                <!-- header-bottom-area-end -->
            </header>
            <!-- header-area-end -->
            <!-- slider-area-start -->
            <div class="slider-area">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-12 col-md-12  col-12">
                            <!-- slider-main-start -->
                            <div class="slider-main">
                                <div class="slider-active owl-carousel">
                                    <div class="single-slider">
                                        <div class="slider-img">
                                            <a href="#"><img src="${pageContext.request.contextPath}/img/slider/5.jpg" alt="slider" /></a>
                                    </div>
                                    <div class="slider-text">
                                        <h1 class="wow fadeInLeft" data-wow-delay="1s">Soccer Shoes</h1>
                                        <h2>25-75% OFF</h2>
                                        <h3>Evo Power 1 Tricks</h3>
                                        <a href="#">shop now</a>
                                    </div>
                                </div>
                                <div class="single-slider">
                                    <div class="slider-img">
                                        <a href="#"><img src="${pageContext.request.contextPath}/img/slider/6.jpg" alt="slider" /></a>
                                    </div>
                                    <div class="slider-text slider-text-2">
                                        <h1>sport equipment</h1>
                                        <h2>25-75% OFF</h2>
                                        <h3>Baseball, Soccer, Tennis, Boxing,<br />Golf, Field Hockey, Handball, Volleyball..</h3>
                                        <a href="#">shop now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- slider-main-end -->
                    </div>	
                </div>
            </div>
        </div>
        <!-- slider-area-end -->
        <!-- banner-area-start -->
        <div class="banner-area ptb-25">
            <div class="container">
                <div class="row bg-color">
                    <div class="col-lg-4 col-md-4  col-12">
                        <div class="single-banner box2">
                            <div class="banner-icon">
                                <a href="#"><i class="zmdi zmdi-refresh-sync zmdi-hc-fw"></i></a>
                            </div>
                            <div class="banner-text">
                                <h2>FREE RETURN</h2>
                                <p>30 days money back guarantee!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4  col-12">
                        <div class="single-banner box2">
                            <div class="banner-icon">
                                <a href="#"><i class="zmdi zmdi-local-shipping zmdi-hc-fw"></i></a>
                            </div>
                            <div class="banner-text">
                                <h2>FREE shipping</h2>
                                <p>30 days money back guarantee!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4  col-12">
                        <div class="single-banner">
                            <div class="banner-icon">
                                <a href="#"><i class="zmdi zmdi-phone-ring zmdi-hc-fw"></i></a>
                            </div>
                            <div class="banner-text">
                                <h2>Support 24/7</h2>
                                <p>We support online 24 hours a day</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- banner-area-end -->
        <!-- banner-area-start -->
        <div class="banner-area mt-25 mb-50">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6  col-12">
                        <div class="banner-img">
                            <a href="#"><img src="${pageContext.request.contextPath}/img/banner/24.jpg" alt="banner" /></a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6  col-12">
                        <div class="banner-img">
                            <a href="#"><img src="${pageContext.request.contextPath}/img/banner/25.jpg" alt="banner" /></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- banner-area-end -->
        <!-- product-cookware-area-start -->
        <div class="product-cookware-area mb-40">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product-header">
                            <div class="section-title">
                                <h2>Product</h2>
                            </div>

                        </div>
                        <!-- tab-area-start -->
                        <div class="tab-content">
                            <div class="tab-pane active" id="Dresses">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12  col-12">
                                        <div class="inner-box">
                                            <div class="row">
                                                <div class="col-lg-2 col-md-3  col-12">
                                                    <div class="left-menu">
                                                         <c:set var="searchQuery" value="${param.search != null ? param.search : ''}" />
                                                        <c:forEach items="${listC}" var="c">
                                                            <a href="?category=${c.categoryID}&search=${searchQuery}" class="mr">${c.categoryName}</a>
                                                        </c:forEach>


                                                    </div>
                                                </div>
                                                <div class="col-lg-10 col-md-9 col-12">
                                                    <div class="tab-active-2 owl-carousel">
                                                        <c:forEach items="${products}" var="p">
                                                            <div class="tab-total">
                                                                <!-- single-product-start -->
                                                                <div class="single-product">
                                                                    <div class="product-img">
                                                                        <a href="#"><img style="max-height: 270px" src="${pageContext.request.contextPath}/img/product/${p.image}.jpg" alt="img" /></a>
                                                                    </div>
                                                                    <div class="product-text">
                                                                        <h3><a href="product-details-2.html">${p.productName}</a></h3>
                                                                        <div class="price">
                                                                            <ul>
                                                                                <li><span class="new-price">${p.productPrice}</span></li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="link-button">
                                                                            <ul>
                                                                                <li><a href="#"><i class="fa fa-cart-plus"></i></a></li>
                                                                                <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                                                <li><a href="#"><i class="fa fa-refresh"></i></a></li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- tab-area-end -->
                    </div>
                </div>
            </div>
        </div>
        <nav class="mt-3" aria-label="Page navigation example">
       <c:set var="currentCategory" value="${param.category != null ? param.category : ''}" />

<ul class="pagination justify-content-center">
    <c:if test="${currentPage > 1}">
        <li class="page-item">
            <a class="page-link" href="?search=${param.search}&category=${currentCategory}&amp;page=${currentPage - 1}">Previous</a>
        </li>
    </c:if>

    <!-- Display the page numbers as links -->
    <c:forEach var="pageNum" begin="1" end="${totalPages}">
        <li class="page-item <c:if test='${pageNum == currentPage}'>active</c:if>">
            <a class="page-link" href="?search=${param.search}&category=${currentCategory}&amp;page=${pageNum}">${pageNum}</a>
        </li>
    </c:forEach>

    <!-- Disable the "Next" link if on the last page -->
    <c:if test="${currentPage < totalPages}">
        <li class="page-item">
            <a class="page-link" href="?search=${param.search}&category=${currentCategory}&amp;page=${currentPage + 1}">Next</a>
        </li>
    </c:if>
</ul>

        </nav>
        <div class="newsletter-area ptb-35">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6  col-12">
                        <div class="newsletter-text">
                            <h3>Sign Up for Newsletters</h3>
                            <p>Be the First to Know. Sign up for newsletter today</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6  col-12">
                        <div class="newsletter-form">
                            <form action="#">
                                <input type="text" placeholder="Enter your email address" />
                                <a href="#">Subscribe</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- newsletter-area-end -->
        <!-- banner-area-2-start -->
        <div class="banner-area-2">
            <div class="container">
                <div class="row border-b">
                    <div class="col-lg-4 col-md-4  col-12">
                        <div class="single-banner-2">
                            <div class="banner-2-img">
                                <a href="#"><i class="zmdi zmdi-remote-control-alt zmdi-hc-fw"></i></a>
                            </div>
                            <div class="banner-text-2">
                                <h2>888 345 6789</h2>
                                <p>Free support line!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4  col-12">
                        <div class="single-banner-2">
                            <div class="banner-2-img">
                                <a href="#"><i class="zmdi zmdi-email zmdi-hc-fw"></i></a>
                            </div>
                            <div class="banner-text-2">
                                <h2>info@example.com</h2>
                                <p>Orders Support!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4  col-12">
                        <div class="single-banner-2">
                            <div class="banner-2-img">
                                <a href="#"><i class="zmdi zmdi-time zmdi-hc-fw"></i></a>
                            </div>
                            <div class="banner-text-2">
                                <h2>Mon - Fri / 8:00 - 18:00</h2>
                                <p>Working Days/Hours!</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- banner-area-2-end -->
        <!-- footer-area-start -->
        <footer>
            <jsp:include page= "common/footer.jsp"></jsp:include>
            </footer>
            <!-- footer-area-end -->


            <!-- all js here -->
            <!-- jquery latest version -->
            <script src="${pageContext.request.contextPath}/js/vendor/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendor/jquery-migrate-3.3.2.min.js"></script>
        <!-- bootstrap js -->
        <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
        <!-- owl.carousel js -->
        <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
        <!-- meanmenu js -->
        <script src="${pageContext.request.contextPath}/js/jquery.meanmenu.js"></script>
        <!-- wow js -->
        <script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
        <!-- jquery.countdown.min.js -->
        <script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
        <!-- jquery.counterup.min.js -->
        <script src="${pageContext.request.contextPath}/js/jquery.counterup.min.js"></script>
        <!-- waypoints.min.js -->
        <script src="${pageContext.request.contextPath}/js/waypoints.min.js"></script>
        <!-- chosen. -->
        <script src="${pageContext.request.contextPath}/js/chosen.jquery.min.js"></script>
        <!-- jquery.flexslider.js -->
        <script src="${pageContext.request.contextPath}/js/jquery.flexslider.js"></script>
        <!-- plugins js -->
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <!-- main js -->
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
        <!-- modernizr css -->
        <script src="${pageContext.request.contextPath}/js/vendor/modernizr-3.11.2.min.js"></script>
    </body>

    <!-- Mirrored from htmldemo.net/angara/angara/index-3.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 May 2024 15:30:41 GMT -->
</html>
