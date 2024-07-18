<%-- 
    Document   : contact
    Created on : Oct 25, 2023, 11:01:53 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">


    <!-- Mirrored from htmldemo.net/pustok/pustok/contact-2.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:17:17 GMT -->
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Bookaholic - Homepage</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Use Minified Plugins Version For Fast Page Load -->
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/plugins.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/main.css" />
        <link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <style>
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

                <!-- contact area Start -->
                <main class="contact_area inner-page-sec-padding-bottom">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="contact_form">
                                    <h3 class="ct_title">Send Us a Message</h3>
                                    <form  action="SendContact" method="post" class="contact-form" id="send-contact-email">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <label>Your Name <span class="required">*</span></label>
                                                    <input type="text" id="con_name" name="con_name" class="form-control"
                                                           required>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <label>Your Email <span class="required">*</span></label>
                                                    <input type="email" id="con_email" name="con_email" class="form-control"
                                                           required>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <label>Your Message</label>
                                                    <textarea id="con_message" name="con_message"
                                                              class="form-control"></textarea>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <p style="color: green;">${messFin}</p>
                                        </div>

                                        <div class="col-lg-12">
                                            <div class="form-btn">
                                                <button type="submit" value="submit" id="submit" class="btn btn-black w-100"
                                                        name="submit">send</button>
                                            </div>
                                            <div class="form__output"></div>
                                        </div>
                                    </div>
                                </form>
                                <div class="form-output">
                                    <p class="form-messege"></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div id="google-map"></div>
                        </div>
                    </div>
                </div>
            </main>
            <!-- contact area End -->
            <div class="contact-bottom-info inner-page-sec-padding-bottom">
                <div class="container">
                    <div class="row">
                        <!--Contact Information Start-->
                        <div class="col-lg-3 col-sm-6 col-12 mb-30">
                            <div class="contact-info">
                                <span class="icon"><i class="fa fa-phone"></i></span>
                                <div class="content">
                                    <h3 class="title">Contact By Phone</h3>
                                    <p>0942850163</p>
                                </div>
                            </div>
                        </div>
                        <!--Contact Information End-->

                        <!--Contact Information Start-->
                        <div class="col-lg-3 col-sm-6 col-12 mb-30">
                            <div class="contact-info">
                                <span class="icon"><i class="fa fa-envelope"></i></span>
                                <div class="content">
                                    <h3 class="title">Contact By Email</h3>
                                    <p>bookaholic@gmail.com </p>
                                </div>
                            </div>
                        </div>
                        <!--Contact Information End-->

                        <!--Contact Information Start-->
                        <div class="col-lg-3 col-sm-6 col-12 mb-30">
                            <div class="contact-info">
                                <span class="icon"><i class="fa fa-map-marker"></i></span>
                                <div class="content">
                                    <h3 class="title">Come To See Us</h3>
                                    <p> Ha Noi, Viet Nam </p>
                                </div>
                            </div>
                        </div>
                        <!--Contact Information End-->

                        <!--Contact Information Start-->
                        <div class="col-lg-3 col-sm-6 col-12 mb-30">
                            <div class="contact-info">
                                <span class="icon"><i class="fa fa-users"></i></span>
                                <div class="content">
                                    <h3 class="title">Bookaholic Social</h3>
                                    <ul class="social-list list-inline">
                                        <li class="single-social facebook"><a href="#"><i class="ion ion-social-facebook"></i></a></li>
                                        <li class="single-social twitter"><a href="#"><i class="ion ion-social-twitter"></i></a></li>
                                        <li class="single-social google"><a href="#"><i class="ion ion-social-googleplus-outline"></i></a></li>
                                        <li class="single-social youtube"><a href="#"><i class="ion ion-social-youtube"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!--Contact Information End-->
                    </div>
                </div>
            </div>
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
        <footer class="site-footer">
            <div class="container">
                <div class="row justify-content-between  section-padding">
                    <div class=" col-xl-3 col-lg-4 col-sm-6">
                        <div class="single-footer pb--50">
                            <div class="brand-footer footer-title">
                                <img src="image/logo--footer.png" alt="">
                            </div>
                            <div class="footer-contact">
                                <p><span class="label">Address:</span><span class="text">Example Street 98, HH2 BacHa, New
                                        York,
                                        USA</span></p>
                                <p><span class="label">Phone:</span><span class="text">+18088 234 5678</span></p>
                                <p><span class="label">Email:</span><span class="text">suport@plazathemes.com</span></p>
                            </div>
                        </div>
                    </div>
                    <div class=" col-xl-3 col-lg-2 col-sm-6">
                        <div class="single-footer pb--50">
                            <div class="footer-title">
                                <h3>Information</h3>
                            </div>
                            <ul class="footer-list normal-list">
                                <li><a href="#">Prices drop</a></li>
                                <li><a href="#">New products</a></li>
                                <li><a href="#">Best sales</a></li>
                                <li><a href="#">Contact us</a></li>
                                <li><a href="#">Sitemap</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class=" col-xl-3 col-lg-2 col-sm-6">
                        <div class="single-footer pb--50">
                            <div class="footer-title">
                                <h3>Extras</h3>
                            </div>
                            <ul class="footer-list normal-list">
                                <li><a href="#">Delivery</a></li>
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Stores</a></li>
                                <li><a href="#">Contact us</a></li>
                                <li><a href="#">Sitemap</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class=" col-xl-3 col-lg-4 col-sm-6">
                        <div class="footer-title">
                            <h3>Newsletter Subscribe</h3>
                        </div>
                        <div class="newsletter-form mb--30">
                            <form action="https://htmldemo.net/pustok/pustok/php/mail.php">
                                <input type="email" class="form-control" placeholder="Enter Your Email Address Here...">
                                <button class="btn btn--primary w-100">Subscribe</button>
                            </form>
                        </div>
                        <div class="social-block">
                            <h3 class="title">STAY CONNECTED</h3>
                            <ul class="social-list list-inline">
                                <li class="single-social facebook"><a href="#"><i class="ion ion-social-facebook"></i></a>
                                </li>
                                <li class="single-social twitter"><a href="#"><i class="ion ion-social-twitter"></i></a></li>
                                <li class="single-social google"><a href="#"><i
                                            class="ion ion-social-googleplus-outline"></i></a></li>
                                <li class="single-social youtube"><a href="#"><i class="ion ion-social-youtube"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <div class="container">
                    <p class="copyright-heading">Suspendisse in auctor augue. Cras fermentum est ac fermentum tempor. Etiam
                        vel
                        magna volutpat, posuere eros</p>
                    <a href="#" class="payment-block">
                        <img src="image/icon/payment.png" alt="">
                    </a>
                    <p class="copyright-text">Copyright © 2022 <a href="#" class="author">Pustok</a>. All Right Reserved.
                        <br>
                        Design By Pustok</p>
                </div>
            </div>
        </footer>
        <script src="js/plugins.js"></script>
        <script src="js/ajax-mail.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2D8wrWMY3XZnuHO6C31uq90JiuaFzGws"></script>
        <script src="js/custom.js"></script>
    </body>

    <script>
        console.log($("#send-contact-email"));
        $(document).ready(function () {
    $("#send-contact-email").submit(function (event) {
        event.preventDefault();
        var formData = $(this).serialize();

        $.ajax({
            type: "POST",
            url: "SendContact",
            data: formData,
            success: function (response) {
                
                
                $("#con_email").val("");
                $("#con_name").val("");
                $("#con_message").val("");
                alert('Dữ liệu đã được gửi thành công!');
            },
            error: function () {
                alert('Có lỗi xảy ra khi gửi dữ liệu.');
            }
        });
    });
});

    </script>

</html>