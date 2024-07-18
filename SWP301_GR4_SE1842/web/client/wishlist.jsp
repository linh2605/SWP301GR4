<%-- 
    Document   : shop
    Created on : Sep 28, 2023, 10:45:17 PM
    Author     : ACER
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="zxx">


    <!-- Mirrored from htmldemo.net/pustok/pustok/shop-grid-left-sidebar.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:17:16 GMT -->
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Bookaholic</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Use Minified Plugins Version For Fast Page Load -->
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/plugins.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/main.css" />
        <link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">

        <style>
            .sidebar-menu--shop.menu-type-2 {
                max-height: 300px;
                overflow-y: auto;
            }
            .product-card .card-image {
                width: 255px;
                height: 406.5px;
            }
            .product-card .card-image img {
                object-fit: cover;
                width: 100%;
                height: 406.5px;
            }
            @media (max-width: 1200px) {
                .product-card .card-image {
                    width: 209.99px;
                    height: 400px;
                }
            }
            @media (max-width: 992px) {
                .product-card .card-image {
                    position: relative;
                    width: 100%;
                    display: flex;
                    align-items: center; /* Vertical centering */
                    justify-content: center; /* Horizontal centering */
                }
                .product-card .card-image img {
                    max-width: 100%; /* Ensures the image doesn't exceed the container's width */
                    max-height: 100%;
                }
            }
        </style>
    </head>

    <body>
        <div class="site-wrapper" id="top">

            <div class="site-header header-3  d-none d-lg-block">
                <jsp:include page="./component/header_0.jsp"></jsp:include>
                </div>
                <div class="site-mobile-menu">
                <jsp:include page="./component/header_1.jsp"></jsp:include>
                </div>
                <div class="sticky-init fixed-header common-sticky">
                <jsp:include page="./component/header_2.jsp"></jsp:include>
                </div>




                <section class="breadcrumb-section">
                    <h2 class="sr-only">Site Breadcrumb</h2>
                    <div class="container">
                        <div class="breadcrumb-contents">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="homepage">Home</a></li>
                                    <li class="breadcrumb-item ">Wishlist</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </section>
                <main class="inner-page-sec-padding-bottom">
                    <div class="container">
                        <div class="shop-toolbar d-none">
                            <div class="row align-items-center">
                                <div class="col-lg-2 col-md-2 col-sm-6">
                                    <!-- Product View Mode -->
                                    <div class="product-view-mode">
                                        <a href="#" class="sorting-btn active" data-target="grid"><i class="fas fa-th"></i></a>
                                        <a href="#" class="sorting-btn" data-target="grid-four">
                                            <span class="grid-four-icon">
                                                <i class="fas fa-grip-vertical"></i><i class="fas fa-grip-vertical"></i>
                                            </span>
                                        </a>
                                        <a href="#" class="sorting-btn" data-target="list "><i class="fas fa-list"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="shop-product-wrap grid with-pagination row space-db--30 shop-border">

                        <c:forEach var="b" items="${listP}"> 
                            <c:if test="${sessionScope.usersession.wishListSize() == 0}">
                                <span style="width: 100%;text-align: center">No books in your wishlist!</span>
                            </c:if>
                            <c:if test="${sessionScope.usersession.wishListSize() > 0}">
                                <c:if test="${b.status == 1}">
                                    <div class="col-lg-4 col-sm-6">
                                        <div class="product-card">
                                            <div class="product-card--body">
                                                <div class="card-image">
                                                    <img src="${b.img0}">
                                                    <div class="hover-contents">
                                                        <a href="detail?bid=${b.id}" class="hover-image">
                                                            <div class="img-hover-minh__container">
                                                                <img class="img-hover-minh" src="${b.img1}">
                                                            </div>
                                                        </a>
                                                        <div class="hover-btns">
                                                            <div onclick="controlCart(${b.id})" class="single-btn">
                                                                <i class="fas fa-shopping-basket"></i>
                                                            </div>
                                                            <div onclick="toggleWishList(${b.id}, this)" class="single-btn">
                                                                <i <c:if test="${sessionScope.usersession.wishList.contains(b)}">style="color:tomato"</c:if> class="fas fa-heart"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="price-block">
                                                        <a href="#" class="author">
                                                        ${b.getAuthor().getName()}
                                                    </a>
                                                    <c:if test="${b.getDiscount() != 0}">
                                                        <c:set var="finalCost" value="${b.getFinalCost()}" />
                                                    </c:if>
                                                    <c:if test="${b.getDiscount() == 0}">
                                                        <c:set var="finalCost" value="${b.getCost()}" />
                                                    </c:if>
                                                    <span class="price">$${finalCost}</span>
                                                    <c:if test="${b.getDiscount() != 0}">
                                                        <del class="price-old">${b.getCost()}</del>
                                                        <span class="price-discount">-${b.getDiscount()}%</span>
                                                    </c:if>
                                                </div>
                                                <div class="product-header">
                                                    <h3><a href="detail?bid=${b.id}">${b.getTitle()}</a></h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </main>
        </div>
        <!--=================================
  Brands Slider
===================================== -->
        <section class="section-margin">
            <h2 class="sr-only">Brand Slider</h2>
            <div class="container">
                <div class="brand-slider sb-slick-slider border-top border-bottom" data-slick-setting='{
                     "autoplay": true,
                     "autoplaySpeed": 8000,
                     "slidesToShow": 6
                     }' data-slick-responsive='[
                     {"breakpoint":992, "settings": {"slidesToShow": 4} },
                     {"breakpoint":768, "settings": {"slidesToShow": 3} },
                     {"breakpoint":575, "settings": {"slidesToShow": 3} },
                     {"breakpoint":480, "settings": {"slidesToShow": 2} },
                     {"breakpoint":320, "settings": {"slidesToShow": 1} }
                     ]'>
                    <div class="single-slide">
                        <img src="${pageContext.request.contextPath}/client/assets/image/others/brand-1.jpg" alt="">
                    </div>
                    <div class="single-slide">
                        <img src="${pageContext.request.contextPath}/client/assets/image/others/brand-2.jpg" alt="">
                    </div>
                    <div class="single-slide">
                        <img src="${pageContext.request.contextPath}/client/assets/image/others/brand-3.jpg" alt="">
                    </div>
                    <div class="single-slide">
                        <img src="${pageContext.request.contextPath}/client/assets/image/others/brand-4.jpg" alt="">
                    </div>
                    <div class="single-slide">
                        <img src="image/others/brand-5.jpg" alt="">
                    </div>
                    <div class="single-slide">
                        <img src="${pageContext.request.contextPath}/client/assets/image/others/brand-6.jpg" alt="">
                    </div>
                    <div class="single-slide">
                        <img src="${pageContext.request.contextPath}/client/assets/image/others/brand-1.jpg" alt="">
                    </div>
                    <div class="single-slide">
                        <img src="${pageContext.request.contextPath}/client/assets/image/others/brand-2.jpg" alt="">
                    </div>
                </div>
            </div>
        </section>
        <!--=================================
    Footer Area
===================================== -->

        <jsp:include page="./component/footer.jsp"></jsp:include>
            <script>
                function toggleWishList(bookid, param) {
                    $.ajax({
                        type: 'POST',
                        data: {bookid: bookid},
                        url: 'add-to-wishlist',
                        success: function (result) {
                            document.querySelector('#wishlist-icon-text__container').innerHTML = result;
                            // Toggle color of the heart icon
                            var currentColor = $(param).children('i').css('color');
                            if (currentColor === 'rgb(255, 99, 71)') {  // 'rgb(255, 99, 71)' corresponds to 'tomato'
                                $(param).children('i').css('color', '#6c757d');  // Change to default or any other color you like
                            } else {
                                $(param).children('i').css('color', 'tomato');
                            }
                        }
                    });
                }
            </script>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <!-- Use Minified Plugins Version For Fast Page Load -->
            <script src="${pageContext.request.contextPath}/client/assets/js/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/ajax-mail.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/custom.js"></script>
    </body>


    <!-- Mirrored from htmldemo.net/pustok/pustok/shop-grid-left-sidebar.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:17:16 GMT -->
</html>
