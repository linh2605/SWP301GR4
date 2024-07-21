<%-- 
    Document   : checkout
    Created on : Sep 28, 2023, 11:51:37 PM
    Author     : ACER
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="zxx">


    <!-- Mirrored from htmldemo.net/pustok/pustok/checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:17:16 GMT -->
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>RonaldoSportShop - Check out</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Use Minified Plugins Version For Fast Page Load -->
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/plugins.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/main.css" />
        <link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
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
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li class="breadcrumb-item active">Checkout</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </section>
                <section class="order-complete inner-page-sec-padding-bottom">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <div class="order-complete-message text-center">
                                    <h1>Thank you !</h1>
                                    <p>Your order has been received.</p>
                                </div>
                                <ul class="order-details-list">
                                    <li>Order Number: <strong>BaH${order.id}</strong></li>
                                <li>Date: <strong>${order.orderDate}</strong></li>

                                <li>Total:  <fmt:formatNumber value="${Math.ceil(order.totalPrice * 25000)}" pattern="0" var="totalprice" />
                                    <strong>${totalprice} VNĐ</strong></li>

                                <li>Payment Method: <strong>${order.paymethod.name} (${order.paymethod.desc})</strong></li>
                                <li>Order Status: <strong>${order.status.name}</strong></li>
                            </ul>

                            <h3 class="order-table-title">Order Details</h3>
                            <div class="table-responsive">
                                <table class="table order-details-table">
                                    <thead>
                                        <tr>
                                            <th>Product</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${order.odList}" var="od">
                                            <tr>
                                                <td><a href="single-product.html">${od.book.title}</a> <strong>× ${od.quantity}</strong></td>
                                                <fmt:formatNumber value="${od.price}" pattern="0.00" var="totalprice" />
                                                <td><span>$${totalprice}</span></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Subtotal:</th>
                                                <fmt:formatNumber value="${Math.ceil(order.totalPrice * 25000)}" pattern="0" var="subtotal" />
                                            <td><span>${subtotal} VNĐ</span></td>
                                        </tr>
                                        <tr>
                                            <th>Payment Method:</th>
                                            <td>${order.paymethod.name}</td>
                                        </tr>
                                        <tr>
                                            <th>Total:</th>
                                            <td><span>${totalprice} VNĐ</span></td>
                                        </tr>
                                    </tfoot>

                                </table>
                                <c:if test="${order.status.id == 1}">
                                    <a href="${pageContext.request.contextPath}/cancel-order?oid=${order.id}" style="padding:1rem 3rem;;cursor: pointer; margin-top: 2rem" class="btn--primary">Cancel order</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
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

            <!-- Use Minified Plugins Version For Fast Page Load -->
            <script src="${pageContext.request.contextPath}/client/assets/js/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/ajax-mail.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/custom.js"></script>
    </body>


    <!-- Mirrored from htmldemo.net/pustok/pustok/checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:17:16 GMT -->
</html>