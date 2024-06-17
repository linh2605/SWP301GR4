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

        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/meanmenu.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/material-design-iconic-font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chosen.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flexslider.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">

    </head>
    <body class="home-3">
        <header>
            <jsp:include page= "common/header-top-area.jsp"></jsp:include>
            <jsp:include page= "common/header-min-area.jsp"></jsp:include>
            <jsp:include page= "common/mobile-menu-area.jsp"></jsp:include>
            <jsp:include page= "common/header-bottom-area.jsp"></jsp:include>
            </header>

            <div class="resent-post-area mtb-50">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="section-title mr-bttom">
                                <h2>Posts</h2>
                            </div>
                          

                    </div>
                         <div class="col-lg-8">
                             <form action="blog" method="get">
                                    <div class="input-group"  >
                                        <input style="width: 80%" type="text" class="form-control" name="search" placeholder="Enter name to search" value="${param.search}">
                                    <input type="hidden" name="page" value="${currentPage}">
                                </div>
                            </form>
                        </div>
                    <c:forEach var="blog" items="${blogs}">
                        <div class="col-lg-12">
                            <div class="single-post">
                                <div class="post-img">
                                    <a href="blog-details?id=${blog.id}"><img src="${pageContext.request.contextPath}/img/blog/${blog.image}.jpg" alt="post" /></a>
                                </div>
                                <div class="post-text">
                                    <h3><a href="blog-details?id=${blog.id}">${blog.title}</a></h3>

                                    <a href="blog-details?id=${blog.id}">Read more</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="pagination justify-content-center">
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="?search=${searchParam}&amp;page=${currentPage - 1}">Previous</a>
                                </li>
                            </c:if>
                            <c:forEach var="pageNum" begin="1" end="${totalPages}">
                                <li class="page-item <c:if test='${pageNum == currentPage}'>active</c:if>">
                                    <a class="page-link" href="?search=${searchParam}&amp;page=${pageNum}">${pageNum}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${currentPage < totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="?search=${searchParam}&amp;page=${currentPage + 1}">Next</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

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
        <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.meanmenu.js"></script>
        <script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.counterup.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/chosen.jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.flexslider.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendor/modernizr-3.11.2.min.js"></script>
    </body>

</html>
