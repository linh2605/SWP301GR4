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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
            <jsp:include page= "common/ProfileHeader.jsp"></jsp:include>                
                <!-- header-min-area-start -->
            <jsp:include page= "common/header-min-area.jsp"></jsp:include>
                <!-- header-min-area-start -->
                <!-- mobile-menu-area-start -->
            <jsp:include page= "common/mobile-menu-area.jsp"></jsp:include>
                <!-- mobile-menu-area-end -->
                <!-- header-bottom-area-start -->
            <jsp:include page= "common/header-bottom-area.jsp"></jsp:include>
                <!-- header-bottom-area-end -->


                <div class="mobile-menu-area d-block d-lg-none ">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="mobile-menu">
                                    <nav id="mobile-menu-active">
                                        <ul id="nav">
                                            <li><a href="shop.html">Category</a>
                                                <ul>
                                                    <li><a href="shop.html">Cardio</a>
                                                        <ul>
                                                            <li><a href="shop.html">Dresses</a>
                                                                <ul>
                                                                    <li><a href="product-details.html">Cocktail</a></li>
                                                                    <li><a href="product-details.html">Day</a></li>
                                                                    <li><a href="product-details.html">Evening</a></li>
                                                                    <li><a href="product-details.html">Sports new</a></li>
                                                                    <li><a href="product-details.html">Bootees Bags</a></li>
                                                                </ul>
                                                            </li>
                                                            <li><a href="shop.html">shoes</a>
                                                                <ul>
                                                                    <li><a href="product-details.html">Bootees Bags</a></li>
                                                                    <li><a href="product-details.html">Blazers</a></li>
                                                                    <li><a href="product-details.html">Boy Cloth</a></li>
                                                                    <li><a href="product-details.html">Action</a></li>
                                                                    <li><a href="product-details.html">mackets</a></li>
                                                                </ul>
                                                            </li>
                                                            <li><a href="shop.html">Handbags</a>
                                                                <ul>
                                                                    <li><a href="product-details.html">Rain Wear</a></li>
                                                                    <li><a href="product-details.html">Tops  shirt</a></li>
                                                                    <li><a href="product-details.html">shop men</a></li>
                                                                    <li><a href="product-details.html">Flat</a></li>
                                                                    <li><a href="product-details.html">Sport Games</a></li>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="shop.html">Boxing</a>
                                                        <ul>
                                                            <li><a href="shop.html">Bags</a>
                                                                <ul>
                                                                    <li><a href="product-details.html">Ankle Boots</a></li>
                                                                    <li><a href="product-details.html">Footwear </a></li>
                                                                    <li><a href="product-details.html">Clog sandals</a></li>
                                                                    <li><a href="product-details.html">Combat Boots</a></li>
                                                                </ul>
                                                            </li>
                                                            <li><a href="shop.html">Clothing</a>
                                                                <ul>
                                                                    <li><a href="product-details.html">Platinum Rings</a></li>
                                                                    <li><a href="product-details.html">Silver Ring</a></li>
                                                                    <li><a href="product-details.html">Tungsten Ring</a></li>
                                                                    <li><a href="product-details.html">Bands Gold</a></li>
                                                                </ul>
                                                            </li>
                                                            <li><a href="shop.html">Shirts</a>
                                                                <ul>
                                                                    <li><a href="product-details.html">Platinum Bands</a></li>
                                                                    <li><a href="product-details.html">Briefs</a></li>
                                                                    <li><a href="product-details.html">Camis</a></li>
                                                                    <li><a href="product-details.html">Nightwear</a></li>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="shop.html">Strength</a>
                                                        <ul>
                                                            <li><a href="shop.html">Shapewear</a>
                                                                <ul>
                                                                    <li><a href="product-details.html">Bands</a></li>
                                                                    <li><a href="product-details.html">Furniture</a></li>
                                                                </ul>
                                                            </li>
                                                            <li><a href="shop.html">Footwear Man</a>
                                                                <ul>
                                                                    <li><a href="product-details.html">coats</a></li>
                                                                    <li><a href="product-details.html">T-shirts</a></li>
                                                                </ul>
                                                            </li>
                                                            <li><a href="shop.html">Footwear Womens</a>
                                                                <ul>
                                                                    <li><a href="product-details.html">Bootees  Bags</a></li>
                                                                    <li><a href="product-details.html">Blazers</a></li>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="shop.html">Tennis</a></li>
                                                    <li><a href="shop.html">Soccer</a></li>
                                                    <li><a href="shop.html">basketball</a></li>
                                                    <li><a href="shop.html"> golf </a></li>
                                                    <li><a href="shop.htmlshop.html">volleyball </a></li>
                                                    <li><a href="shop.html">Ping pong</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="index.html">Home</a>
                                                <ul>
                                                    <li><a href="index.html">Home-1</a></li>
                                                    <li><a href="index-2.html">Home-2</a></li>
                                                    <li><a href="index-3.html">Home-3</a></li>
                                                    <li><a href="index-4.html">Home-4</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">page<i class="fa fa-angle-down"></i></a>
                                                <div class="sub-menu">
                                                    <ul>
                                                        <li><a href="shop.html">shop</a></li>
                                                        <li><a href="product-details.html">product-details</a></li>
                                                        <li><a href="blog.html">blog</a></li>
                                                        <li><a href="blog-details.html">blog-details</a></li>
                                                        <li><a href="contact.html">contact</a></li>
                                                        <li><a href="about.html">about</a></li>
                                                        <li><a href="login.html">login</a></li>
                                                        <li><a href="register.html">register</a></li>
                                                        <li><a href="cart.html">cart</a></li>
                                                        <li><a href="checkout.html">checkout</a></li>
                                                        <li><a href="wishlist.html">wishlist</a></li>
                                                        <li><a href="404.html">404 page</a></li>
                                                    </ul>
                                                </div>
                                            </li>
                                            <li><a href="contact.html">Blog</a>
                                                <ul>
                                                    <li><a href="blog.html">blog</a></li>
                                                    <li><a href="blog-details.html">blog-details</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="about.html">About us</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- mobile-menu-area-end -->
                <!-- header-bottom-area-start -->
                <div class="header-bottom-area" id="sticky-header">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-3 col-md-12  col-12 d-none d-lg-block">
                                <div class="Category-area">
                                    <h3><i class="fa fa-bars"></i>Category</h3>
                                    <div class="category-menu">
                                        <nav>
                                            <ul>
                                                <li class="angle"><a href="shop.html">Fashion Baby</a>
                                                    <div class="category-submenu">
                                                        <span>
                                                            <a href="#" class="title">weaters</a>
                                                            <a href="product-details.html">Sleep Shop</a>
                                                            <a href="product-details.html">Sport Shoes</a>
                                                            <a href="product-details.html">Bath Toy</a>
                                                            <a href="product-details.html">Boy Cloth</a>
                                                            <a href="product-details.html">new</a>
                                                        </span>
                                                        <span>
                                                            <a href="#" class="title color-2">shop</a>
                                                            <a href="product-details.html">Action Figure</a>
                                                            <a href="product-details.html">Toy Shop</a>
                                                            <a href="product-details.html">Rain Wear</a>
                                                            <a href="product-details.html">Tops & shirt</a>
                                                            <a href="product-details.html">men</a>
                                                        </span>
                                                        <span>
                                                            <a href="#" class="title color-3">Flat</a>
                                                            <a href="product-details.html">Sport Games</a>
                                                            <a href="product-details.html">Sport Cloth</a>
                                                            <a href="product-details.html">Sport toy</a>
                                                            <a href="product-details.html">Sport Shoes</a>
                                                            <a href="product-details.html">kist</a>
                                                        </span>
                                                    </div>
                                                </li>
                                                <li class="angle"><a href="shop.html">Toys</a>
                                                    <div class="category-submenu">
                                                        <span>
                                                            <a href="#" class="title">Blazers</a>
                                                            <a href="product-details.html">Designer</a>
                                                            <a href="product-details.html">Purses</a>
                                                            <a href="product-details.html">Shoulder</a>
                                                            <a href="product-details.html">Tunics</a>
                                                            <a href="product-details.html">coats</a>
                                                        </span>
                                                        <span>
                                                            <a href="#" class="title color-2">Shirts</a>
                                                            <a href="product-details.html">Sweaters</a>
                                                            <a href="product-details.html">Suits</a>
                                                            <a href="product-details.html">Swim</a>
                                                            <a href="product-details.html">jeans</a>
                                                            <a href="product-details.html">Lifestyle</a>
                                                        </span>
                                                        <span>
                                                            <a href="#" class="title color-3">Stripes</a>
                                                            <a href="product-details.html">Platinum Rings</a>
                                                            <a href="product-details.html">Silver Ring</a>
                                                            <a href="product-details.html">Tungsten Ring</a>
                                                            <a href="product-details.html">Bands Gold</a>
                                                            <a href="product-details.html">Platinum Bands</a>
                                                        </span>
                                                    </div>
                                                </li>
                                                <li class="angle"><a href="shop.html">Electronics</a>
                                                    <div class="category-submenu category-submenu-2">
                                                        <span>
                                                            <a href="#" class="title">Hoodies </a>
                                                            <a href="product-details.html">Silver Bands</a>
                                                            <a href="product-details.html">T-shirts</a>
                                                            <a href="product-details.html">Vests</a>
                                                        </span>
                                                        <span>
                                                            <a href="#" class="title color-2">Coats</a>
                                                            <a href="product-details.html">Casual Shirts</a>
                                                            <a href="product-details.html">Denim</a>
                                                            <a href="product-details.html">days</a>
                                                        </span>
                                                    </div>
                                                </li>
                                                <li><a href="shop.html">Kitchenware</a></li>
                                                <li><a href="shop.html">Shop Food</a></li>
                                                <li><a href="shop.html">Furniture</a></li>
                                                <li><a href="shop.html">Lightings</a></li>
                                                <li><a href="shop.html">Laptop & Computer</a></li>
                                                <li id="side-hide"><a href="shop.html">Camera</a></li>
                                                <li id="side-show"><a href="#"><i class="fa fa-plus-circle"></i>More Categories</a></li>
                                            </ul>
                                        </nav>	
                                    </div>
                                </div>
                            </div>                                                     
                            </div>
                        </div>
                    </div>
            
                <!-- header-bottom-area-end -->
            </header>
            <!-- header-area-end -->
            <!-- slider-area-start -->
            <div class="slider-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-12 d-none  d-lg-block"></div>
                        <div class="col-lg-9 col-md-12  col-12">
                            <!-- slider-main-start -->
                            <div class="slider-main mt-20">
                                <div class="slider-active owl-carousel">
                                    <div class="single-slider">
                                        <div class="slider-img">
                                            <a href="#"><img src="${pageContext.request.contextPath}/img/slider/5.jpg" alt="slider" /></a>
                                        </div>
                                        <div class="slider-text">
                                            <h1>Top baby <br />  strollers 2021</h1>
                                            <p>Your First Stop Before <br />Buying a Stroller for Your Baby</p>
                                            <a href="#">shop now</a>
                                        </div>
                                    </div>
                                    <div class="single-slider">
                                        <div class="slider-img">
                                            <a href="#"><img src="${pageContext.request.contextPath}/img/slider/6.jpg" alt="slider" /></a>
                                        </div>
                                        <div class="slider-text slider-text-2">
                                            <h1>Smart baby & <br />  Toddler Toys</h1>
                                            <h2>Up to 53% off</h2>
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
                                    <a href="#"><i class="fa fa-refresh"></i></a>
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
                                    <a href="#"><i class="fa fa-free-code-camp"></i></a>
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
                                    <a href="#"><i class="fa fa-phone-square"></i></a>
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
                                                                      <a href="product?pId=${p.productID}">${p.productName}<img style="width: 270px;height: 270px; object-fit: contain" src="${p.image}" alt="img" /></a>
                                                                    </div>
                                                                    <div class="product-text">
                                                                        <h3><a href="product?pId=${p.productID}">${p.productName}</a></h3>
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
                                <a href="#"><i class="fa fa-phone-square"></i></a>
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
                                <a href="#"><i class="fa fa-mail-reply-all"></i></a>
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
                                <a href="#"><i class="fa fa-dollar"></i></a>
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
