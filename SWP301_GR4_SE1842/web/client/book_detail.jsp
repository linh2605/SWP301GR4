<%-- 
    Document   : book_detail
    Created on : Sep 28, 2023, 10:23:34 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">


    <!-- Mirrored from htmldemo.net/pustok/pustok/product-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:17:07 GMT -->
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>RonaldoSportShop - ${detail.title}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Use Minified Plugins Version For Fast Page Load -->
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/plugins.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/main.css" />
        <link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
        <style>
            .small-image-bookdetail {
                padding: .4rem;
            }

            * {
                box-sizing: border-box;
            }
            .product-card .card-image {
                width: 221px;
                height: 352.25px;

            }
            .product-card .card-image img {
                object-fit: cover;
                width: 221px;
                height: 352.25px;
                padding: .8rem

            }
            .product-card--body{
                justify-content: center;
                align-items: center;
            }

        </style> 
        <style>
            *{
                margin: 0;
                padding: 0;
            }

            .rate {
                float: left;
                height: 46px;
                padding: 0 10px;
            }
            .rate:not(:checked) > input {
                position:absolute;
                top:-9999px;
            }
            .rate:not(:checked) > label {
                float:right;
                width:1em;
                overflow:hidden;
                white-space:nowrap;
                cursor:pointer;
                font-size:30px;
                color:#ccc;
            }
            .rate:not(:checked) > label:before {
                content: '★ ';
            }
            .rate > input:checked ~ label {
                color: #ffc700;
            }
            .rate:not(:checked) > label:hover,
            .rate:not(:checked) > label:hover ~ label {
                color: #deb217;
            }
            .rate > input:checked + label:hover,
            .rate > input:checked + label:hover ~ label,
            .rate > input:checked ~ label:hover,
            .rate > input:checked ~ label:hover ~ label,
            .rate > label:hover ~ input:checked ~ label {
                color: #c59b08;
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
                                    <li class="breadcrumb-item active">Product Details</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </section>
                <main class="inner-page-sec-padding-bottom">
                    <div class="container">
                        <div class="row  mb--60">
                            <div class="col-lg-5 mb--30">
                                <!-- Product Details Slider Big Image-->
                                <div class="product-details-slider sb-slick-slider arrow-type-two" data-slick-setting='{
                                     "slidesToShow": 1,
                                     "arrows": false,
                                     "fade": true,
                                     "draggable": false,
                                     "swipe": false,
                                     "asNavFor": ".product-slider-nav"
                                     }'>
                                <c:forEach items="${detail.iList}" var="i">
                                    <div class="single-slide">
                                        <img src="${i.image}?ran=<%= Math.random() %>" alt="">
                                    </div>
                                </c:forEach>


                            </div>
                            <!-- Product Details Slider Nav -->
                            <div class="mt--30 product-slider-nav sb-slick-slider arrow-type-two" data-slick-setting='{
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
                                <c:forEach items="${detail.iList}" var="i">
                                    <div class="single-slide">
                                        <img class="small-image-bookdetail" src="${i.image}?ran=<%= Math.random() %>" alt="">
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="col-lg-7">
                            <div class="product-details-info pl-lg--30 ">
                                <p class="tag-block">Tags: 
                                    <c:forEach items="${detail.scList}" var="scate" varStatus="status">
                                        <a href="${pageContext.request.contextPath}/shop?scid=${scate.id}">${scate.name}</a>
                                        <c:if test="${not status.last}">, </c:if>
                                    </c:forEach>
                                </p>
                                <h3 class="product-title">${detail.title}</h3>
                                <ul class="list-unstyled">

                                    <li>Brands: <a href="#" class="list-value font-weight-bold">${detail.publisher.name} </a></li>
                                        <c:if test="${sessionScope.usersession ne null && sessionScope.usersession.roleID != 4}">
                                        <li>Product Code: <span class="list-value">${detail.id} </span></li>
                                        </c:if>
                                    <li>Availability: <span class="list-value">${detail.stock}  </span></li>
                                </ul>
                                <div class="price-block">

                                    <c:if test="${detail.getDiscount() != 0}">
                                        <c:set var="finalCost" value="${detail.getFinalCost()}" />
                                    </c:if>
                                    <c:if test="${detail.getDiscount() == 0}">
                                        <c:set var="finalCost" value="${detail.getCost()}" />
                                    </c:if>
                                     <fmt:formatNumber value="${finalCost}" pattern="0.00" var="fmtfinalCost" />
                                                <span class="price">$${fmtfinalCost}</span>
                                    <c:if test="${detail.getDiscount() != 0}">
                                        <del class="price-old">${detail.getCost()}</del>
                                        <span class="price-discount">-${detail.getDiscount()}%</span>
                                    </c:if>
                                </div>
                                <div class="rating-widget">
                                    <div class="rating-block">
                                        ${avgFb}
                                        <span class="fas fa-star star_on"></span>
                                        /
                                        5<span class="fas fa-star star_on"></span>
                                       
                                    </div>
                                    <div class="review-widget">
                                        <a href="#">(${countFb} Reviews)</a> <span>|</span>

                                    </div>
                                </div>
                                <article class="product-details-article">
                                    <h4 class="sr-only">Product Summery</h4>
                                    <p>Long printed dress with thin adjustable straps. V-neckline and wiring under the Dust
                                        with ruffles at the bottom of the
                                        dress.</p>
                                </article>
                                <div style="margin-bottom: 1rem;" class="add-to-cart-row">
                                    <div class="add-cart-btn">
                                        <a onclick="controlCart(${detail.id})" class="btn btn-outlined--primary">
                                            <span class="plus-icon">+</span>Add to Cart</a>
                                    </div>
                                </div>
                                <div class="compare-wishlist-row">
                                    <c:if test="${sessionScope.usersession ne null}">
                                        <div onclick="toggleWishList(${detail.id}, this)" class="single-btn" style="cursor: pointer">
                                            <i <c:if test="${sessionScope.usersession.wishList.contains(detail)}">style="color:tomato"</c:if> class="fas fa-heart"></i>
                                                Add to Wish List
                                            </div>
                                    </c:if>
                                    <c:if test="${sessionScope.usersession eq null}">
                                        <a href="${pageContext.request.contextPath}/auth/login" class="single-btn">
                                            <i class="fas fa-heart"></i> Add to Wish List
                                        </a>
                                    </c:if>
                                </div>
                                <div class="compare-wishlist-row">
                                    <div class="add-cart-btn">
                                        <a href="SendFeedback?proID=${detail.id}" class="btn btn-outlined--primary">
                                            Send Feedback</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sb-custom-tab review-tab section-padding">
                        <ul class="nav nav-tabs nav-style-2" id="myTab2" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="tab1" data-bs-toggle="tab" href="#tab-1" role="tab"
                                   aria-controls="tab-1" aria-selected="true">
                                    DESCRIPTION
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="tab2" data-bs-toggle="tab" href="#tab-2" role="tab"
                                   aria-controls="tab-2" aria-selected="true">
                                    REVIEWS (${listFb.size()})
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content space-db--20" id="myTabContent">
                            <div class="tab-pane fade show active" id="tab-1" role="tabpanel" aria-labelledby="tab1">
                                <article class="review-article">
                                    <h1 class="sr-only">Tab Article</h1>
                                    <p>${detail.desc}</p>
                                </article>
                            </div>
                            <div class="tab-pane fade" id="tab-2" role="tabpanel" aria-labelledby="tab2">
                                <div class="review-wrapper">
                                    <h2>Product Feedbacks:</h2>
                                    <div class="image-gallery">
                                        <c:forEach items="${listFb}" var="fb">
                                            <div style="display: block !important; position: relative; height: 220px; width: 100% !important;padding: 20px;box-shadow: 0 0 5px 5px lightgray; border-radius: 10px; margin: 15px;">
                                                <h4 style="text-align: left;">Username: ${fb.user.username}</h4>
                                                <p style="text-align: left;">Feedback time: ${fb.fbDate}</p>
                                                <p style="text-align: left;">Content: ${fb.fbContent}</p>
                                                <div class="rate">
                                                    <input disabled type="radio" id="star5" name="rate${fb.fbId}" value="5" ${fb.fbStar==5?"checked":""}/>
                                                    <label for="star5" title="text">5 stars</label>
                                                    <input disabled type="radio" id="star4" name="rate${fb.fbId}" value="4" ${fb.fbStar==4?"checked":""}/>
                                                    <label for="star4" title="text">4 stars</label>
                                                    <input disabled type="radio" id="star3" name="rate${fb.fbId}" value="3" ${fb.fbStar==3?"checked":""}/>
                                                    <label for="star3" title="text">3 stars</label>
                                                    <input disabled type="radio" id="star2" name="rate${fb.fbId}" value="2" ${fb.fbStar==2?"checked":""} />
                                                    <label for="star2" title="text">2 stars</label>
                                                    <input disabled type="radio" id="star1" name="rate${fb.fbId}" value="1" ${fb.fbStar==1?"checked":""} />
                                                    <label for="star1" title="text">1 star</label>
                                                </div>
                                                    <img src="${fb.fbImage}" style="position: absolute; top: 20px; right: 20px" onclick="changeSize${fb.fbId}()" id="feedbackImg${fb.fbId}" width="120px"  >
                                            </div>
                                            <script>
                                                function changeSize${fb.fbId}() {
                                                    var curSize = document.getElementById("feedbackImg${fb.fbId}").width;
                                                    console.log(curSize)
                                                    if (curSize == 120) {
                                                        document.getElementById("feedbackImg${fb.fbId}").style.width = "300px";
                                                    } else {
                                                        document.getElementById("feedbackImg${fb.fbId}").style.width = "120px";


                                                    }
                                                }
                                            </script>
                                        </c:forEach>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--=================================
        RELATED PRODUCTS BOOKS
    ===================================== -->
                <section class="">
                    <div class="container">
                        <div class="section-title section-title--bordered">
                            <h2>RELATED PRODUCTS</h2>
                        </div>
                        <div class="product-slider sb-slick-slider slider-border-single-row" data-slick-setting='{
                             "autoplay": true,
                             "autoplaySpeed": 8000,
                             "slidesToShow": 4,
                             "dots":true
                             }' data-slick-responsive='[
                             {"breakpoint":1200, "settings": {"slidesToShow": 4} },
                             {"breakpoint":992, "settings": {"slidesToShow": 3} },
                             {"breakpoint":768, "settings": {"slidesToShow": 2} },
                             {"breakpoint":480, "settings": {"slidesToShow": 1} }
                             ]'>

                            <c:forEach var="b" items="${listB}" begin="0" end="6">

                                <div class="single-slide">
                                    <div class="product-card">

                                        <div class="product-card--body">
                                            <div class="card-image">
                                                <c:forEach items="${b.iList}" var="i" varStatus="loopI">
                                                    <c:if test="${loopI.index == 0}">
                                                        <img src="${i.image}?ran=<%= Math.random() %>">
                                                    </c:if>
                                                </c:forEach>
                                                <div class="hover-contents">
                                                    <a href="detail?bid=${b.id}" class="hover-image">
                                                        <c:forEach items="${b.iList}" var="i" varStatus="loopI">
                                                            <c:if test="${loopI.index == 1}">
                                                                <div class="img-hover-minh__container">
                                                                    <img class="img-hover-minh" src="${i.image}?ran=<%= Math.random() %>">
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>
                                                    </a>
                                                    <div class="hover-btns">
                                                        <div onclick="controlCart(${b.id})" class="single-btn">
                                                            <i class="fas fa-shopping-basket"></i>
                                                        </div>
                                                        <a href="wishlist.html" class="single-btn">
                                                            <i class="fas fa-heart"></i>
                                                        </a>
                                                        <a href="compare.html" class="single-btn">
                                                            <i class="fas fa-random"></i>
                                                        </a>
                                                        <a href="#" data-bs-toggle="modal" data-bs-target="#quickModal"
                                                           class="single-btn">
                                                            <i class="fas fa-eye"></i>
                                                        </a>
                                                    </div>
                                                </div>
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
                                            <div class="product-header">
                                                <h3><a href="detail?bid=${b.id}">${b.getTitle()}</a></h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                    </div>
                </section>
                <!-- Modal -->
                <div class="modal fade modal-quick-view" id="quickModal" tabindex="-1" role="dialog"
                     aria-labelledby="quickModal" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
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
                                                <img src="image/products/product-details-1.jpg" alt="">
                                            </div>
                                            <div class="single-slide">
                                                <img src="image/products/product-details-2.jpg" alt="">
                                            </div>
                                            <div class="single-slide">
                                                <img src="image/products/product-details-3.jpg" alt="">
                                            </div>
                                            <div class="single-slide">
                                                <img src="image/products/product-details-4.jpg" alt="">
                                            </div>
                                            <div class="single-slide">
                                                <img src="image/products/product-details-5.jpg" alt="">
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
                                                <img src="image/products/product-details-1.jpg" alt="">
                                            </div>
                                            <div class="single-slide">
                                                <img src="image/products/product-details-2.jpg" alt="">
                                            </div>
                                            <div class="single-slide">
                                                <img src="image/products/product-details-3.jpg" alt="">
                                            </div>
                                            <div class="single-slide">
                                                <img src="image/products/product-details-4.jpg" alt="">
                                            </div>
                                            <div class="single-slide">
                                                <img src="image/products/product-details-5.jpg" alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-7 mt--30 mt-lg--30">
                                        <div class="product-details-info pl-lg--30 ">
                                            <p class="tag-block">Tags: <a href="#">Movado</a>, <a href="#">Omega</a></p>
                                            <h3 class="product-title">Beats EP Wired On-Ear Headphone-Black</h3>
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
                                                <a href="#" class="add-link"><i class="fas fa-random"></i>Add to Compare</a>
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
                function controlCart(param) {
                    $.ajax({
                        type: 'POST',
                        data: {id: param},
                        url: 'AddCart',
                        success: function (result) {
                            document.querySelector('#cartShow').innerHTML = result;
                        }
                    }
                    );
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
            <!-- Use Minified Plugins Version For Fast Page Load -->
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="${pageContext.request.contextPath}/client/assets/js/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/ajax-mail.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/custom.js"></script>
    </body>


    <!-- Mirrored from htmldemo.net/pustok/pustok/product-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:17:07 GMT -->
</html>
