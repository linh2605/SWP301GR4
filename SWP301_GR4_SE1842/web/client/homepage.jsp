<%-- 
    Document   : homepage
    Created on : Sep 28, 2023, 10:11:09 PM
    Author     : ACER
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Bookaholic - Homepage</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Use Minified Plugins Version For Fast Page Load -->
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/plugins.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/main.css" />
        <link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
        <style>
            * {
                box-sizing: border-box;
            }
            .product-card .card-image1 {
                width: 221px;
                height: 352.25px;
            }
            .product-card .card-image1 img {
                object-fit: cover;
                width: 221px;
                height: 352.25px;
                padding: .8rem
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
                <!--=================================
                Hero Area
            ===================================== -->
                <section class="hero-area hero-slider-3">
                    <div class="sb-slick-slider" data-slick-setting='{
                         "autoplay": true,
                         "autoplaySpeed": 8000,
                         "slidesToShow": 1,
                         "dots":true
                         }'>
                        <div class="single-slide bg-image  bg-overlay--dark" data-bg="${pageContext.request.contextPath}/client/assets/image/bg-images/home-6-slider-1.png">
                        <div class="container">
                            <div class="home-content text-center">
                                <div class="row justify-content-end">
                                    <div class="col-lg-6">
                                        <h1>Beautifully Designed</h1>
                                        <h2>Cover up front of product and
                                            <br>leave summary</h2>
                                        <a href="${pageContext.request.contextPath}/shop" class="btn btn--yellow">
                                            Shop Now
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="single-slide bg-image  bg-overlay--dark" data-bg="${pageContext.request.contextPath}/client/assets/image/bg-images/home-6-slider-2.png">
                        <div class="container">
                            <div class="home-content pl--30">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <h1>I Love This Idea!</h1>
                                        <h2>Cover up front of product  and
                                            <br>leave summary</h2>
                                        <a href="${pageContext.request.contextPath}/shop" class="btn btn--yellow">
                                            Shop Now
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--=================================
            Home Category Gallery
        ===================================== -->
            <section class="pt--30 section-margin">
                <h2 class="sr-only">Category Gallery Section</h2>

            </section>
            <!--=================================
        ARTS & PHOTOGRAPHY BOOKS
    ===================================== -->
            <section class="section-margin">
                <div class="container">
                    <div class="section-title section-title--bordered">
                        <h2>CLOTHES</h2>
                    </div>
                    <div class="product-slider sb-slick-slider slider-border-single-row" data-slick-setting='{
                         "autoplay": true,
                         "autoplaySpeed": 8000,
                         "slidesToShow": 5,
                         "dots":true
                         }' data-slick-responsive='[
                         {"breakpoint":1200, "settings": {"slidesToShow": 4} },
                         {"breakpoint":992, "settings": {"slidesToShow": 3} },
                         {"breakpoint":768, "settings": {"slidesToShow": 2} },
                         {"breakpoint":480, "settings": {"slidesToShow": 1} },
                         {"breakpoint":320, "settings": {"slidesToShow": 1} }
                         ]'>                            
                        <c:forEach var="b" items="${list1}" begin="0" end="6">
                            <c:if test="${b.status == 1}">
                                <div class="single-slide">
                                    <div class="product-card">
                                        <div class="product-card--body">
                                            <div class="card-image1">
                                                <img src="${b.img0}?ran=<%= Math.random() %>">
                                                <div class="hover-contents">
                                                    <a href="detail?bid=${b.id}" class="hover-image">
                                                        <div class="img-hover-minh__container">
                                                            <img class="img-hover-minh" src="${b.img1}?ran=<%= Math.random() %>">
                                                        </div>
                                                    </a>
                                                    <div class="hover-btns">
                                                        <c:if test="${sessionScope.usersession ne null}">
                                                            <div onclick="controlCart(${b.id})" class="single-btn">
                                                                <i class="fas fa-shopping-basket"></i>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${sessionScope.usersession eq null}">
                                                            <a href="${pageContext.request.contextPath}/auth/login" class="single-btn">
                                                                <i class="fas fa-shopping-basket"></i>
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${sessionScope.usersession ne null}">
                                                            <div onclick="toggleWishList(${b.id}, this)" class="single-btn">
                                                                <i <c:if test="${sessionScope.usersession.wishList.contains(b)}">style="color:tomato"</c:if> class="fas fa-heart"></i>
                                                                </div>
                                                        </c:if>
                                                        <c:if test="${sessionScope.usersession eq null}">
                                                            <a href="${pageContext.request.contextPath}/auth/login" class="single-btn">
                                                                <i class="fas fa-heart"></i>
                                                            </a>
                                                        </c:if>
                                                        <a href="#" data-bs-toggle="modal" data-bs-target="#bookdetailmodel"
                                                           class="single-btn">
                                                            <i id="view-bookdetail__btn" onclick="loadBookDetail(${b.id})" class="fas fa-eye"></i>
                                                            <input id="bookid__input__${b.id}" type="text" value="${b.id}" hidden>
                                                        </a>
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
                                                <fmt:formatNumber value="${finalCost}" pattern="0.00" var="fmtfinalCost" />
                                                <span class="price">$${fmtfinalCost}</span>
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
                        </c:forEach>
                    </div>
                </div>
            </section>
            <!--=================================
        CHILDREN’S BOOKS
    ===================================== -->
            <section class="section-margin">
                <div class="container">
                    <div class="section-title section-title--bordered">
                        <h2>SHOES</h2>
                    </div>
                    <div class="product-slider sb-slick-slider slider-border-single-row" data-slick-setting='{
                         "autoplay": true,
                         "autoplaySpeed": 8000,
                         "slidesToShow": 5,
                         "dots":true
                         }' data-slick-responsive='[
                         {"breakpoint":1200, "settings": {"slidesToShow": 4} },
                         {"breakpoint":992, "settings": {"slidesToShow": 3} },
                         {"breakpoint":768, "settings": {"slidesToShow": 2} },
                         {"breakpoint":480, "settings": {"slidesToShow": 1} },
                         {"breakpoint":320, "settings": {"slidesToShow": 1} }
                         ]'>
                        <c:forEach var="b" items="${list2}"  begin="0" end="6">
                            <c:if test="${b.status == 1}">
                                <div class="single-slide">
                                    <div class="product-card">
                                        <div class="product-card--body">
                                            <div class="card-image1">
                                                <img src="${b.img0}?ran=<%= Math.random() %>">
                                                <div class="hover-contents">
                                                    <a href="detail?bid=${b.id}" class="hover-image">
                                                        <div class="img-hover-minh__container">
                                                            <img class="img-hover-minh" src="${b.img1}?ran=<%= Math.random() %>">
                                                        </div>
                                                    </a>
                                                    <div class="hover-btns">
                                                        <c:if test="${sessionScope.usersession ne null}">
                                                            <div onclick="controlCart(${b.id})" class="single-btn">
                                                                <i class="fas fa-shopping-basket"></i>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${sessionScope.usersession eq null}">
                                                            <a href="${pageContext.request.contextPath}/auth/login" class="single-btn">
                                                                <i class="fas fa-shopping-basket"></i>
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${sessionScope.usersession ne null}">
                                                            <div onclick="toggleWishList(${b.id}, this)" class="single-btn">
                                                                <i <c:if test="${sessionScope.usersession.wishList.contains(b)}">style="color:tomato"</c:if> class="fas fa-heart"></i>
                                                                </div>
                                                        </c:if>
                                                        <c:if test="${sessionScope.usersession eq null}">
                                                            <a href="${pageContext.request.contextPath}/auth/login" class="single-btn">
                                                                <i class="fas fa-heart"></i>
                                                            </a>
                                                        </c:if>
                                                        <a href="#" data-bs-toggle="modal" data-bs-target="#bookdetailmodel"
                                                           class="single-btn">
                                                            <i id="view-bookdetail__btn" onclick="loadBookDetail(${b.id})" class="fas fa-eye"></i>
                                                            <input id="bookid__input__${b.id}" type="text" value="${b.id}" hidden>
                                                        </a>
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
                                                <fmt:formatNumber value="${finalCost}" pattern="0.00" var="fmtfinalCost" />
                                                <span class="price">$${fmtfinalCost}</span>
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
                        </c:forEach>
                    </div>
                </div>
            </section>
            <!--=================================
        BIOGRAPHIES BOOKS
    ===================================== -->
            <section class="section-margin">
                <div class="container">
                    <div class="section-title section-title--bordered">
                        <h2>BALL</h2>
                    </div>
                    <div class="product-slider sb-slick-slider slider-border-single-row" data-slick-setting='{
                         "autoplay": true,
                         "autoplaySpeed": 8000,
                         "slidesToShow": 5,
                         "dots":true
                         }' data-slick-responsive='[
                         {"breakpoint":1200, "settings": {"slidesToShow": 4} },
                         {"breakpoint":992, "settings": {"slidesToShow": 3} },
                         {"breakpoint":768, "settings": {"slidesToShow": 2} },
                         {"breakpoint":480, "settings": {"slidesToShow": 1} },
                         {"breakpoint":320, "settings": {"slidesToShow": 1} }
                         ]'>
                        <c:forEach var="b" items="${list3}" begin="0" end="6">
                            <c:if test="${b.status == 1}">
                                <div class="single-slide">
                                    <div class="product-card">
                                        <div class="product-card--body">
                                            <div class="card-image1">
                                                <img src="${b.img0}?ran=<%= Math.random() %>">
                                                <div class="hover-contents">
                                                    <a href="detail?bid=${b.id}" class="hover-image">
                                                        <div class="img-hover-minh__container">
                                                            <img class="img-hover-minh" src="${b.img1}?ran=<%= Math.random() %>">
                                                        </div>
                                                    </a>
                                                    <div class="hover-btns">
                                                        <c:if test="${sessionScope.usersession ne null}">
                                                            <div onclick="controlCart(${b.id})" class="single-btn">
                                                                <i class="fas fa-shopping-basket"></i>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${sessionScope.usersession eq null}">
                                                            <a href="${pageContext.request.contextPath}/auth/login" class="single-btn">
                                                                <i class="fas fa-shopping-basket"></i>
                                                            </a>
                                                        </c:if>
                                                        <c:if test="${sessionScope.usersession ne null}">
                                                            <div onclick="toggleWishList(${b.id}, this)" class="single-btn">
                                                                <i <c:if test="${sessionScope.usersession.wishList.contains(b)}">style="color:tomato"</c:if> class="fas fa-heart"></i>
                                                                </div>
                                                        </c:if>
                                                        <c:if test="${sessionScope.usersession eq null}">
                                                            <a href="${pageContext.request.contextPath}/auth/login" class="single-btn">
                                                                <i class="fas fa-heart"></i>
                                                            </a>
                                                        </c:if>
                                                        <a href="#" data-bs-toggle="modal" data-bs-target="#bookdetailmodel"
                                                           class="single-btn">
                                                            <i id="view-bookdetail__btn" onclick="loadBookDetail(${b.id})" class="fas fa-eye"></i>
                                                            <input id="bookid__input__${b.id}" type="text" value="${b.id}" hidden>
                                                        </a>
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
                                                <fmt:formatNumber value="${finalCost}" pattern="0.00" var="fmtfinalCost" />
                                                <span class="price">$${fmtfinalCost}</span>
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
                        </c:forEach>
                    </div>
                </div>
            </section>
            <!--=================================
            Home Features Section
        ===================================== -->
            <section class="mb--30 space-dt--30">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-3 col-md-6 mt--30">
                            <div class="feature-box h-100">
                                <div class="icon">
                                    <i class="fas fa-shipping-fast"></i>
                                </div>
                                <div class="text">
                                    <h5>Free Shipping Item</h5>
                                    <p> Orders over $500</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 mt--30">
                            <div class="feature-box h-100">
                                <div class="icon">
                                    <i class="fas fa-redo-alt"></i>
                                </div>
                                <div class="text">
                                    <h5>Money Back Guarantee</h5>
                                    <p>100% money back</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 mt--30">
                            <div class="feature-box h-100">
                                <div class="icon">
                                    <i class="fas fa-piggy-bank"></i>
                                </div>
                                <div class="text">
                                    <h5>Cash On Delivery</h5>
                                    <p>Lorem ipsum dolor amet</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 mt--30">
                            <div class="feature-box h-100">
                                <div class="icon">
                                    <i class="fas fa-life-ring"></i>
                                </div>
                                <div class="text">
                                    <h5>Help & Support</h5>
                                    <p>Call us : + 0942850163</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--=================================
            Promotion Section One
        ===================================== -->
            <section class="section-margin">
                <h1 class="sr-only">Promotion Section</h1>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <a href="${pageContext.request.contextPath}/shop" class="promo-image promo-overlay">
                                <img src="${pageContext.request.contextPath}/client/assets/image/bg-images/promo-banner-with-text-3.png" alt="">
                            </a>
                        </div>
                        <div class="col-lg-6">
                            <a href="${pageContext.request.contextPath}/shop" class="promo-image promo-overlay">
                                <img src="${pageContext.request.contextPath}/client/assets/image/bg-images/promo-banner-with-text-2.png" alt="">
                            </a>
                        </div>
                    </div>
                </div>
            </section>
            <!--=================================
            Home Two Column Section
        ===================================== -->
            <section class="bg-gray section-padding-top section-padding-bottom section-margin">
                <h1 class="sr-only">Promotion Section</h1>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="home-left-sidebar">
                                <div class="single-side  bg-white">
                                    <h2 class="home-sidebar-title">
                                        Special offer
                                    </h2>
                                    <c:if test="${soBook == null || soBook.status == 0}" >
                                        <span style="width: 100%; text-align: center">No special offer!</span>
                                    </c:if>
                                    <c:if test="${soBook != null && soBook.status == 1}" >
                                        <div class="product-slider countdown-single with-countdown sb-slick-slider product-border-reset"
                                             data-slick-setting='{
                                             "autoplay": true,
                                             "autoplaySpeed": 8000,
                                             "slidesToShow": 1,
                                             "dots":true
                                             }' data-slick-responsive='[
                                             {"breakpoint":992, "settings": {"slidesToShow": 2} },
                                             {"breakpoint":575, "settings": {"slidesToShow": 2} },
                                             {"breakpoint":480, "settings": {"slidesToShow": 1} }
                                             ]'>
                                            <div class="single-slide">
                                                <div class="product-card">
                                                    <div class="product-header">
                                                        <a href="#" class="author">
                                                            ${soBook.author.name}
                                                        </a>
                                                        <h3><a href="detail?bid=${soBook.id}">${soBook.title}</a></h3>
                                                    </div>
                                                    <div class="product-card--body">
                                                        <div class="card-image">
                                                            <img src="${soBook.img0}?ran=<%= Math.random() %>" alt="">
                                                            <div class="hover-contents">
                                                                <div class="hover-btns">
                                                                    <div onclick="controlCart(${soBook.id})" class="single-btn">
                                                                        <i class="fas fa-shopping-basket"></i>
                                                                    </div>
                                                                    <c:if test="${sessionScope.usersession ne null}">
                                                                        <div onclick="toggleWishList(${soBook.id}, this)" class="single-btn">
                                                                            <i <c:if test="${sessionScope.usersession.wishList.contains(b)}">style="color:tomato"</c:if> class="fas fa-heart"></i>
                                                                            </div>
                                                                    </c:if>
                                                                    <c:if test="${sessionScope.usersession eq null}">
                                                                        <a href="${pageContext.request.contextPath}/auth/login" class="single-btn">
                                                                            <i class="fas fa-heart"></i>
                                                                        </a>
                                                                    </c:if>
                                                                    <a href="#" data-bs-toggle="modal" data-bs-target="#bookdetailmodel"
                                                                       class="single-btn">
                                                                        <i id="view-bookdetail__btn" onclick="loadBookDetail(${soBook.id})" class="fas fa-eye"></i>
                                                                        <input id="bookid__input__${soBook.id}" type="text" value="${soBook.id}" hidden>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="price-block">
                                                            <a href="#" class="author">
                                                                ${soBook.getAuthor().getName()}
                                                            </a>
                                                            <c:if test="${soBook.getDiscount() != 0}">
                                                                <c:set var="finalCost" value="${soBook.getFinalCost()}" />
                                                            </c:if>
                                                            <c:if test="${soBook.getDiscount() == 0}">
                                                                <c:set var="finalCost" value="${soBook.getCost()}" />
                                                            </c:if>
                                                            <fmt:formatNumber value="${finalCost}" pattern="0.00" var="fmtfinalCost" />
                                                            <span class="price">$${fmtfinalCost}</span>
                                                            <c:if test="${soBook.getDiscount() != 0}">
                                                                <del class="price-old">${soBook.getCost()}</del>
                                                                <span class="price-discount">-${soBook.getDiscount()}%</span>
                                                            </c:if>
                                                        </div>

                                                        <div class="count-down-block">
                                                            <div class="product-countdown" data-countdown="${soBook.getDiscountObject().endDate}"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>

                                </div>
                                <div class="single-side">
                                    <a href="${pageContext.request.contextPath}/shop" class="promo-image promo-overlay">
                                        <img src="${pageContext.request.contextPath}/client/assets/image/bg-images/promo-banner-small-with-text-1.png" alt="">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="home-right-block bg-white">
                                <div class="sb-custom-tab   pt--30 pb--30">
                                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="shop-tab" data-bs-toggle="tab" href="#shop"
                                               role="tab" aria-controls="shop" aria-selected="true">
                                                New Arrivals
                                            </a>
                                            <span class="arrow-icon"></span>
                                        </li>

                                        <li class="nav-item">
                                            <a class="nav-link" id="woman-tab" data-bs-toggle="tab" href="#woman" role="tab"
                                               aria-controls="woman" aria-selected="false">
                                                Most rate products
                                            </a>
                                            <span class="arrow-icon"></span>
                                        </li>
                                    </ul>
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane show active" id="shop" role="tabpanel"
                                             aria-labelledby="shop-tab">
                                            <div class="product-slider product-list-slider multiple-row slider-border-multiple-row  sb-slick-slider"
                                                 data-slick-setting='{
                                                 "autoplay": true,
                                                 "autoplaySpeed": 8000,
                                                 "slidesToShow": 2,
                                                 "rows":4,
                                                 "dots":true
                                                 }' data-slick-responsive='[
                                                 {"breakpoint":992, "settings": {"slidesToShow": 2,"rows": 3} },

                                                 {"breakpoint":768, "settings": {"slidesToShow": 1} }
                                                 ]'>

                                                <c:forEach var="b" items="${list}" begin="0" end="10">
                                                    <c:if test="${b.status == 1}">
                                                        <div class="single-slide">
                                                            <div class="product-card card-style-list">
                                                                <div class="card-image">
                                                                    <img  src="${b.img0}?ran=<%= Math.random() %>" alt="">
                                                                </div>
                                                                <div class="product-card--body">
                                                                    <div class="product-header">
                                                                        <a href="#" class="author">
                                                                            ${b.getAuthor().getName()}
                                                                        </a>
                                                                        <h3><a  href="detail?bid=${b.id}">${b.getTitle()}</a></h3>
                                                                    </div>
                                                                    <div class="price-block">
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
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>                
                                                </c:forEach>
                                            </div>
                                        </div>

                                        <div class="tab-pane" id="woman" role="tabpanel" aria-labelledby="woman-tab">
                                            <div class="product-slider product-list-slider multiple-row slider-border-multiple-row  sb-slick-slider"
                                                 data-slick-setting='{
                                                 "autoplay": true,
                                                 "autoplaySpeed": 8000,
                                                 "slidesToShow": 2,
                                                 "rows":4,
                                                 "dots":true
                                                 }'
                                                 data-slick-responsive='[
                                                 {"breakpoint":992, "settings": {"slidesToShow": 1,"rows": 3} },

                                                 {"breakpoint":768, "settings": {"slidesToShow": 1} }
                                                 ]'>
                                                <c:forEach var="b" items="${sortedRate}" begin="0" end="10">
                                                    <c:if test="${b.status == 1}">
                                                        <div class="single-slide">
                                                            <div class="product-card card-style-list">
                                                                <div class="card-image">
                                                                    <img src="${b.img0}?ran=<%= Math.random() %>" alt="">
                                                                </div>
                                                                <div class="product-card--body">
                                                                    <div class="product-header">
                                                                        <a href="#" class="author">
                                                                            ${b.getAuthor().getName()}
                                                                        </a>
                                                                        <h3><a href="detail?bid=${b.id}">${b.getTitle()}</a></h3>
                                                                    </div>
                                                                    <div class="price-block">
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
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>                
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--=================================
            CLIENT TESTIMONIALS
        ===================================== -->

            <!-- Modal -->

            <div class="modal fade modal-quick-view" id="bookdetailmodel" tabindex="-1" role="dialog"

                 aria-labelledby="quickModal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" id="book-detail__container">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        <div class="product-details-modal">
                            <div class="row">
                                <div class="col-lg-5">
                                    <!-- Product Details Slider Big Image-->
                                    <div class="product-details-slider sb-slick-slider arrow-type-two" data-slick-setting='{
                                         "slidesToShow": 1,
                                         "arrows": false,
                                         "fade": true,
                                         "draggable": false,
                                         "swipe": false,
                                         "asNavFor": ".product-slider-nav"
                                         }'>
                                        <div class="single-slide">
                                            <img src="" alt="">
                                        </div>
                                        <div class="single-slide">
                                            <img src="" alt="">
                                        </div>
                                        <div class="single-slide">
                                            <img src="" alt="">
                                        </div>
                                        <div class="single-slide">
                                            <img src="" alt="">
                                        </div>
                                        <div class="single-slide">
                                            <img src="" alt="">
                                        </div>
                                    </div>
                                    <!-- Product Details Slider Nav -->
                                    <div class="mt--30 product-slider-nav sb-slick-slider arrow-type-two"
                                         data-slick-setting='{
                                         "infinite":true,
                                         "autoplay": true,
                                         "autoplaySpeed": 8000,
                                         "slidesToShow": 4,
                                         "arrows": true,
                                         "prevArrow":{"buttonClass": "slick-prev","iconClass":"fa fa-chevron-left"},
                                         "nextArrow":{"buttonClass": "slick-next","iconClass":"fa fa-chevron-right"},
                                         "asNavFor": ".product-details-slider",
                                         "focusOnSelect": true
                                         }'>
                                        <div class="single-slide">
                                            <img src="" alt="">
                                        </div>
                                        <div class="single-slide">
                                            <img src="" alt="">
                                        </div>
                                        <div class="single-slide">
                                            <img src="" alt="">
                                        </div>
                                        <div class="single-slide">
                                            <img src="" alt="">
                                        </div>
                                        <div class="single-slide">
                                            <img src="" alt="">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-7 mt--30 mt-lg--30">
                                    <div class="product-details-info pl-lg--30 ">

                                        <p class="tag-block">Tags: <a href="#">Movado</a>, <a href="#">Omega</a></p>
                                        <h3 class="product-title">${b.title}</h3>
                                        <ul class="list-unstyled">
                                            <li>Ex Tax: <span class="list-value"> £60.24</span></li>
                                            <li>Brands: <a href="#" class="list-value font-weight-bold"> Canon</a></li>
                                            <li>Product Code: <span class="list-value"> model1</span></li>
                                            <li>Reward Points: <span class="list-value"> 200</span></li>
                                            <li>Availability: <span class="list-value"> In Stock</span></li>
                                        </ul>
                                        <div class="price-block">
                                            <span class="price-new">£73.79</span>
                                            <del class="price-old">£91.86</del>
                                        </div>
                                        <div class="rating-widget">
                                            <div class="rating-block">
                                                <span class="fas fa-star star_on"></span>
                                                <span class="fas fa-star star_on"></span>
                                                <span class="fas fa-star star_on"></span>
                                                <span class="fas fa-star star_on"></span>
                                                <span class="fas fa-star "></span>
                                            </div>
                                            <div class="review-widget">
                                                <a href="#">(1 Reviews)</a> <span>|</span>
                                                <a href="#">Write a review</a>
                                            </div>
                                        </div>
                                        <article class="product-details-article">
                                            <h4 class="sr-only">Product Summery</h4>
                                            <p>Long printed dress with thin adjustable straps. V-neckline and wiring under
                                                the Dust with ruffles
                                                at the bottom
                                                of the
                                                dress.</p>
                                        </article>
                                        <div class="add-to-cart-row">
                                            <div class="count-input-block">
                                                <span class="widget-label">Qty</span>
                                                <input type="number" class="form-control text-center" value="1">
                                            </div>
                                            <div class="add-cart-btn">
                                                <a href="#" class="btn btn-outlined--primary"><span
                                                        class="plus-icon">+</span>Add to Cart</a>
                                            </div>
                                        </div>
                                        <div class="compare-wishlist-row">
                                            <a href="#" class="add-link"><i class="fas fa-heart"></i>Add to Wish List</a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="widget-social-share">
                                <span class="widget-label">Share:</span>
                                <div class="modal-social-share">
                                    <a href="#" class="single-icon"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#" class="single-icon"><i class="fab fa-twitter"></i></a>
                                    <a href="#" class="single-icon"><i class="fab fa-youtube"></i></a>
                                    <a href="#" class="single-icon"><i class="fab fa-google-plus-g"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--=================================
        Footer
    ===================================== -->
        </div>
        <!--=================================
      Brands Slider
    ===================================== -->

        <!--=================================
        Footer Area
    ===================================== -->
        <jsp:include page="./component/footer.jsp"></jsp:include>
            <script>
//                function loadScript(src) {
//                    return new Promise((resolve, reject) => {
//                        var script = document.createElement('script');
//                        script.src = src;
//                        script.onload = resolve;
//                        script.onerror = reject;
//                        document.body.appendChild(script);
//                    });
//                }
                function loadBookDetail(bookid) {
                    var id_input = '#bookid__input__' + bookid;
                    var bookid = document.querySelector(id_input).value;
                    $.ajax({
                        type: 'POST',
                        data: {bookid: bookid},
                        url: 'LoadBookDetail',
                        success: function (result) {
                            document.querySelector('#book-detail__container').innerHTML = result;
                        }
                    });
                }
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
        <script src="${pageContext.request.contextPath}/client/assets/js/custom.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/ajax-mail.js"></script>
    </body>


    <!-- Mirrored from htmldemo.net/pustok/pustok/index-3.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:17:05 GMT -->
</html>
