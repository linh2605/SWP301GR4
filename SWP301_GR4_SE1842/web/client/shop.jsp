<%-- 
    Document   : shop
    Created on : Sep 28, 2023, 10:45:17 PM
    Author     : ACER
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                    <li class="breadcrumb-item ">  Shop </li>
                                    <c:if test="${filter != null && filter != ''}">
                                    <input type="hidden" value="${filter}" name="txtfilter">
                                    <li class="breadcrumb-item "> ${filter} </li>
                                    </c:if>

                            </ol>
                        </nav>
                    </div>
                </div>
            </section>
            <main class="inner-page-sec-padding-bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-9 order-lg-2">
                            <div class="shop-toolbar with-sidebar mb--30">
                                <div class="row align-items-center">
                                    <div class="col-lg-2 col-md-2 col-sm-6">
                                        <!-- Product View Mode -->
                                        <div class="product-view-mode">
                                            <a href="#" class="sorting-btn active" data-target="grid"><i
                                                    class="fas fa-th"></i></a>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-md-4 col-sm-6  mt--10 mt-sm--0">
                                        <span class="toolbar-status">
                                            Showing 1 to 8 of 14 (2 Pages)
                                        </span>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-6  mt--10 mt-md--0">
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 mt--10 mt-md--0 ">
                                        <div class="sorting-selection">
                                            <span>Sort By:</span>
                                            <select id="sort-book__select" onchange="sortBooks(this)" class="form-control nice-select sort-select mr-0">
                                                <option value="0" selected="selected">Default Sorting</option>
                                                <option value="1">Sort By: Name (A - Z)</option>
                                                <option value="2">Sort By: Name (Z - A)</option>
                                                <option value="3">Sort By: Price (Low &gt; High)</option>
                                                <option value="4">Sort By: Price (High &gt; Low)</option>
                                                <option value="5">Sort By: Rating (Highest)</option>
                                                <option value="6">Sort By: Rating (Lowest)</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="shop-toolbar d-none">
                                <div class="row align-items-center">
                                    <div class="col-lg-2 col-md-2 col-sm-6">
                                        <!-- Product View Mode -->
                                        <div class="product-view-mode">
                                            <a href="#" class="sorting-btn active" data-target="grid"><i
                                                    class="fas fa-th"></i></a>
                                            <a href="#" class="sorting-btn" data-target="grid-four">
                                                <span class="grid-four-icon">
                                                    <i class="fas fa-grip-vertical"></i><i class="fas fa-grip-vertical"></i>
                                                </span>
                                            </a>
                                            <a href="#" class="sorting-btn" data-target="list "><i
                                                    class="fas fa-list"></i></a>
                                        </div>
                                    </div>
                                    <div class="col-xl-5 col-md-4 col-sm-6  mt--10 mt-sm--0">
                                        <span class="toolbar-status">
                                            Showing 1 to 9 of 14 (2 Pages)
                                        </span>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-6  mt--10 mt-md--0">
                                        <div class="sorting-selection">

                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6 mt--10 mt-md--0 ">
                                        <div class="sorting-selection">

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <input id="cid__sendfromServlet" type="text" value="${cid}" hidden>
                            <input id="scid__sendfromServlet" type="text" value="${scid}" hidden>
                            <div id="product-cart__container" class="shop-product-wrap grid with-pagination row space-db--30 shop-border">
                                <input id="indexPage__sendfromServlet" type="text" value="1" hidden>

                                <c:forEach var="b" items="${listP}">  
                                    <c:if test="${b.status == 1}">
                                        <div class="col-lg-4 col-sm-6">
                                            <div class="product-card">
                                                <div class="product-card--body">
                                                    <div class="card-image">
                                                        <img src="${b.img0}?ran=123">
                                                        <div class="hover-contents">
                                                            <a href="detail?bid=${b.id}" class="hover-image">
                                                                <div class="img-hover-minh__container">
                                                                    <img class="img-hover-minh" src="${b.img1}?ran=123">
                                                                </div>
                                                            </a>
                                                            <div class="hover-btns">
                                                                <div onclick="controlCart(${b.id})" class="single-btn">
                                                                    <i class="fas fa-shopping-basket"></i>
                                                                </div>
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
                            <!-- Pagination Block -->
                            <div class="row pt--30">
                                <div class="col-md-12">
                                    <div class="pagination-block">
                                        <ul class="pagination-btns flex-center">
                                            <li><a href="#" class="single-btn prev-btn ">|<i
                                                        class="zmdi zmdi-chevron-left"></i> </a></li>
                                            <li><a href="#" class="single-btn prev-btn "><i
                                                        class="zmdi zmdi-chevron-left"></i> </a></li>




                                            <c:forEach begin="1" end="${endP}" var="i">
                                                <li <c:if test="${i == 1}">
                                                        class="active"
                                                    </c:if> 
                                                    id="page__button" 
                                                    onclick="loadBooksOfAPage(${i}, this, ${cid})">
                                                    <div class="single-btn">${i}</div>
                                                </li>
                                            </c:forEach>


                                            <li><a href="#" class="single-btn next-btn"><i
                                                        class="zmdi zmdi-chevron-right"></i></a></li>
                                            <li><a href="#" class="single-btn next-btn"><i
                                                        class="zmdi zmdi-chevron-right"></i>|</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <div class="col-lg-3  mt--40 mt-lg--0">
                            <div class="inner-page-sidebar">
                                <!-- Accordion -->

                                <div class="single-block">
                                    <h3 class="sidebar-title">Categories</h3>
                                    <ul class="sidebar-menu--shop active" style="max-height: 500px; overflow-y: auto;">
                                        <li>
                                            <a href="shop?cid=${-1}">All Product</a>

                                        </li>
                                        <c:forEach items="${listC}" var="c">
                                            <li>
                                                <a href="shop?cid=${c.id}">${c.name}</a>
                                                <ul class="inner-cat-items">
                                                    <c:forEach items="${c.scList}" var="s">
                                                        <li><a href="shop?scid=${s.id}">${s.name}</a></li>
                                                        </c:forEach>
                                                </ul>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>

                                <!-- Price -->
                                <div class="single-block">
                                    <h3 class="sidebar-title">Filter By Price</h3>
                                    <div class="range-slider pt--30">
                                        <div class="sb-range-slider" id="price-slider"></div>
                                        <div class="slider-price">
                                            <p>
                                                <input type="text" id="amount" readonly>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <!-- Size -->

                                <div class="single-block">
                                    <h3 class="sidebar-title">Designer</h3>
                                    <div class="sidebar-menu-wrapper">
                                        <ul class="sidebar-menu--shop menu-type-2">
                                            <c:forEach items="${listA}" var="a">
                                                <li><a href="shop?aid=${a.id}">${a.name}</a></li>
                                                </c:forEach>
                                        </ul>
                                    </div>
                                </div>

                                <!-- Color -->

                                <!-- Promotion Block -->
                                <div class="single-block">
                                    <a href="#" class="promo-image sidebar">
                                        <img src="image/others/home-side-promo.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                        </div>
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
                        <img src="image/others/brand-1.jpg" alt="">
                    </div>
                    <div class="single-slide">
                        <img src="image/others/brand-2.jpg" alt="">
                    </div>
                    <div class="single-slide">
                        <img src="image/others/brand-3.jpg" alt="">
                    </div>
                    <div class="single-slide">
                        <img src="image/others/brand-4.jpg" alt="">
                    </div>
                    <div class="single-slide">
                        <img src="image/others/brand-5.jpg" alt="">
                    </div>
                    <div class="single-slide">
                        <img src="image/others/brand-6.jpg" alt="">
                    </div>
                    <div class="single-slide">
                        <img src="image/others/brand-1.jpg" alt="">
                    </div>
                    <div class="single-slide">
                        <img src="image/others/brand-2.jpg" alt="">
                    </div>
                </div>
            </div>
        </section>
        <!--=================================
    Footer Area
===================================== -->

        <jsp:include page="./component/footer.jsp"></jsp:include>
            <script>
                function loadBooksOfAPage(index, param, cid) {
                    var page_buttons = document.querySelectorAll('#page__button');
                    page_buttons.forEach(function (button) {
                        button.classList.remove('active');
                    });
                    console.log(document.getElementById('sort-book__select').value);
                    param.classList.add('active');
                    var additionalData = {
                        index: index,
                        cid: cid,
                        orderType: document.getElementById('sort-book__select').value
                    };
                    $.ajax({
                        type: 'POST',
                        data: additionalData,
                        url: 'LoadBooksOfAShopPage',
                        success: function (result) {
                            document.querySelector('#product-cart__container').innerHTML = result;
                        }
                    });
                }
                function sortBooks(param) {
                    $.ajax({
                        type: 'POST',
                        data: {
                            orderType: param.value,
                            index: document.getElementById('indexPage__sendfromServlet').value,
                            cid: document.getElementById('cid__sendfromServlet').value,
                            scid: document.getElementById('scid__sendfromServlet').value
                        },
                        url: 'LoadBooksOfAShopPage',
                        success: function (result) {
                            document.querySelector('#product-cart__container').innerHTML = result;
                        }
                    });
                }
                function controlCart(param) {
                    $.ajax({
                        type: 'POST',
                        data: {id: param},
                        url: 'AddCart',
                        success: function (result) {
                            document.querySelector('#cartShow').innerHTML = result;
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
        <script src="${pageContext.request.contextPath}/client/assets/js/ajax-mail.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/custom.js"></script>
        <script>
                $(document).ready(function () {
                    // Initialize the price range slider



                    // Make an AJAX call when the slider values change
                    $("#price-slider").slider({
                        range: true,
                        min: 0, // Set your minimum price
                        max: 1000, // Set your maximum price
                        values: [0, 100], // Set the initial range

                        slide: function (event, ui) {
                            $("#price-range").val("$" + ui.values[0] + " - $" + ui.values[1]);
                            $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
                            var minPrice = ui.values[0];
                            var maxPrice = ui.values[1];
                            filterByPrice(minPrice, maxPrice);
                        },

                    });
                    filterByPrice(0, 100);
                    $("#price-range").val("$" + 0 + " - $" + 100);
                    $("#amount").val("$" + 0 + " - $" + 100);
                    // Initial filter

                });
                var isAjaxRunning = false;

                function filterByPrice(minPrice, maxPrice) {
                    if (isAjaxRunning) {
                        // A request is already in progress, so do nothing
                        return;
                    }

                    isAjaxRunning = true;
                    $.ajax({
                        type: 'POST', // Use 'GET' or 'POST' depending on your server implementation
                        url: 'filterByPriceServlet', // Replace with the URL of your server endpoint
                        data: {
                            minPrice: minPrice,
                            maxPrice: maxPrice

                        },
                        success: function (data) {
                            document.querySelector('#product-cart__container').innerHTML = data;
                        },
                        complete: function () {
                            // Reset the flag when the AJAX request is complete
                            isAjaxRunning = false;
                        }
                    });
                }

        </script>
    </body>


    <!-- Mirrored from htmldemo.net/pustok/pustok/shop-grid-left-sidebar.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:17:16 GMT -->
</html>
