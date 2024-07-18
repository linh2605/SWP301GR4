
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<header class="mobile-header d-block d-lg-none pt--10 pb-md--10">
    <div class="container">
        <div class="row align-items-sm-end align-items-center">
            <div class="col-md-4 col-7">
                <a href="homepage" class="site-brand">
                    <img src="${pageContext.request.contextPath}/assets/sportshoplogo.png" alt="">
                </a>
            </div>
            <div class="col-md-5 order-3 order-md-2">
                <nav class="category-nav">
                    <div>
                        <a href="javascript:void(0)" class="category-trigger"><i class="fa fa-bars"></i>Browse
                            categories</a>
                        <ul class="category-menu">

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
                </nav>
            </div>
            <div class="col-md-3 col-5  order-md-3 text-right">
                <div class="mobile-header-btns header-top-widget">
                    <ul class="header-links">
                        <li class="sin-link">
                            <a href="${pageContext.request.contextPath}/viewCart" class="cart-link link-icon"><i class="ion-bag"></i></a>
                        </li>
                        <li class="sin-link">
                            <a href="javascript:" class="link-icon hamburgur-icon off-canvas-btn"><i
                                    class="ion-navicon"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</header>
<!--Off Canvas Navigation Start-->
<aside class="off-canvas-wrapper">
    <div class="btn-close-off-canvas">
        <i class="ion-android-close"></i>
    </div>
    <div class="off-canvas-inner">
        <!-- search box start -->
        <div class="search-box offcanvas">
            <form>
                <input type="text" placeholder="Search Here">
                <button class="search-btn"><i class="ion-ios-search-strong"></i></button>
            </form>

        </div>
        <!-- search box end -->
        <!-- mobile menu start -->
        <div class="mobile-navigation">
            <!-- mobile menu navigation start -->
            <nav class="off-canvas-nav">
                <ul class="mobile-menu main-mobile-menu">
                    <li class="menu-item">
                        <a href="${pageContext.request.contextPath}/homepage">Home</a>

                    </li>
                    <li class="menu-item">
                        <a href="${pageContext.request.contextPath}/Blog">Blog</a>
                    </li>
                    <li class="menu-item">
                        <a href="${pageContext.request.contextPath}/shop">Shop</a>

                    </li>
                    <li><a href="${pageContext.request.contextPath}/Contact">Contact</a></li>
                </ul>
            </nav>
            <!-- mobile menu navigation end -->
        </div>
        <!-- mobile menu end -->
        <nav class="off-canvas-nav">
            <ul class="mobile-menu menu-block-2">
                <c:if test="${sessionScope.usersession ne null}">
                    <li class="dropdown-trigger language-dropdown"><a href="#"><i class="icons-left fas fa-heart"></i>
                            wishlist (0)</a>
                    </li>
                    <li class="menu-item-has-children">
                        <a href="#">My Account <i class="fas fa-angle-down"></i></a>
                        <ul class="sub-menu">
                            <li><a href="my-account">My Account</a></li>


                        </ul>
                    </li>
                </c:if>
                <c:if test="${sessionScope.usersession eq null}">
                    <li>
                        <a href="${pageContext.request.contextPath}/auth/login" class="font-weight-bold">Login</a> <br>
                        <a href="${pageContext.request.contextPath}/auth/signup">Register</a>
                    </li>
                </c:if>
            </ul>
        </nav>
        <div class="off-canvas-bottom">
            <div class="contact-list mb--10">
                <a href="#" class="sin-contact"><i class="fas fa-mobile-alt"></i>(12345) 78790220</a>
                <a href="#" class="sin-contact"><i class="fas fa-envelope"></i>examle@handart.com</a>
            </div>
            <div class="off-canvas-social">
                <a href="#" class="single-icon"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="single-icon"><i class="fab fa-twitter"></i></a>
                <a href="#" class="single-icon"><i class="fas fa-rss"></i></a>
                <a href="#" class="single-icon"><i class="fab fa-youtube"></i></a>
                <a href="#" class="single-icon"><i class="fab fa-google-plus-g"></i></a>
                <a href="#" class="single-icon"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
    </div>
</aside>
<!--Off Canvas Navigation End-->