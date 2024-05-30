<%-- 
    Document   : product-list
    Created on : 27 thg 5, 2024, 21:20:09
    Author     : auiri
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Angara - Organic Sports Store HTML Template </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
            </header>

            <div class="container">
                <div class="row pt-5">
                    <div class="col-md-4">
                        <div>
                            <h5>CATEGORIES</h5>
                            <div>
                                <ul>
                                <c:forEach items="${cList}" var="c">
                                    <c:set var="cateActive" value="${(sessionScope.currCate != null && sessionScope.currCate != 0 && c.categoryID == sessionScope.currCate) ? 'active' : ''}" />
                                    <li>
                                        <a class="text-decoration-none sidebar-link ${cateActive}" href="?catId=${c.categoryID}&&brandId=${sessionScope.currBrand}&&search=${sessionScope.currSearch}">
                                            <p>${c.categoryName}</p>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div>
                        <h5>BRANDS</h5>
                        <div>
                            <ul>
                                <c:forEach items="${brList}" var="b">
                                    <c:set var="brandActive" value="${(sessionScope.currBrand != null && sessionScope.currBrand != 0 && b.brandID == sessionScope.currBrand) ? 'active' : ''}" />
                                    <li>
                                        <a class="text-decoration-none sidebar-link ${brandActive}" href="?brandId=${b.brandID}&&catId=${sessionScope.currCate}&&search=${sessionScope.currSearch}">
                                            <p>${b.brandName}</p>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div>
                        <button id="clearFilterBtn" class="btn btn-danger">Clear Filter</button>
                    </div>
                </div>
                <div class="row col-md-8">
                    <c:if test="${pList == null || pList.size() == 0}">
                        Empty!
                    </c:if>
                    <c:forEach items="${pList}" var="p">
                        <div class="border col-md-3">
                            <div>
                                <img style="width: 158px; height: 182.64px; object-fit: contain" src="${p.image}" alt="alt"/>
                            </div>
                            <div>
                                <p>${p.productName}</p>
                            </div>
                            <div>
                                <div style="color: #febd69">
                                    ${p.productRating}<i class="fa-solid fa-star"></i>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between">
                                <p>$ ${p.productPrice}</p>
                                <form action="AddToCartController" method="POST">
                                    <input type="text" value="${p.productID}" name="pId" hidden  />
                                    <button><i style="cursor: pointer" class="fa-solid fa-cart-plus"></i></button>
                                </form>
                            </div>
                        </div>
                    </c:forEach>

                    <nav class="mt-3" aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <!-- Display the page numbers as links -->
                            <c:forEach var="pageNum" begin="1" end="${totalPages}">
                                <li class="page-item <c:if test='${pageNum == currentPage}'>active</c:if>">
                                    <a class="page-link" href="?brandId=${sessionScope.currBrand}&&catId=${sessionScope.currCate}&&search=${sessionScope.currSearch}&amp;page=${pageNum}">${pageNum}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </nav>
                </div>
            </div>

        </div>

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

        <footer>
            <jsp:include page= "common/footer.jsp"></jsp:include>
            </footer>
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




        <script>
            document.getElementById('clearFilterBtn').addEventListener('click', function () {
                // Remove all query parameters from the URL
                var url = window.location.protocol + "//" + window.location.host + window.location.pathname;
                window.location.href = url;
            });
        </script>


    </body>

    <!-- Mirrored from htmldemo.net/angara/angara/index-3.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 13 May 2024 15:30:41 GMT -->
</html>
