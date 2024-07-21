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
        <title>RonaldoSportShop - Homepage</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Use Minified Plugins Version For Fast Page Load -->
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/plugins.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/main.css" />
        <link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
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

                <!-- contact area Start -->
                <main class="contact_area inner-page-sec-padding-bottom">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-3">
                            </div>
                            <div class="col-lg-6">
                                <div class="contact_form">
                                    <h1 style="text-align: center;margin-bottom: 25px;">Send feedback</h1>
                                    <h3 style="text-align: center;margin-bottom: 25px;">Book title: ${product.title}</h3>
                                  <form action="SendFeedback" method="post" onsubmit="return checkInput();">
                                    <span><b>Feedback content:</b></span>
                                    <input name="pid" value="${param["proID"]}" type="hidden">
                                    <textarea style="width: 100%; padding: 5px;" class="form-control" name="feedbackContent" id="feedbackContent"></textarea>
                                    <div><b>Feedback Rate: </b></div>
                                    <div style="margin-right: 20px">
                                        <div class="rate">
                                            <input type="radio" id="star5" name="rate" value="5" />
                                            <label for="star5" title="text">5 stars</label>
                                            <input type="radio" id="star4" name="rate" value="4" />
                                            <label for="star4" title="text">4 stars</label>
                                            <input type="radio" id="star3" name="rate" value="3" />
                                            <label for="star3" title="text">3 stars</label>
                                            <input type="radio" id="star2" name="rate" value="2" />
                                            <label for="star2" title="text">2 stars</label>
                                            <input type="radio" id="star1" name="rate" value="1"  />
                                            <label for="star1" title="text">1 star</label>
                                        </div>
                                    </div>
                                    <br>
                                    <div><b>Image: </b></div>
                                    <input class="form-control" id="imgadd" required onchange="changeimgadd()" name="image" type="file" >

                                    <input name="proimage" id="imageadd" value="" type="hidden" >
                                    <br><!-- comment -->
                                    <image  src="" id="demoimgadd" style="margin-top: 5px;" width="30%">

                                    <br><!-- comment -->
                                    <button type="submit" style="padding: 8px; font-size: 12px" class="btn btn-primary">Submit</button>
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
                                    <p>1800.123.4569<br> 1800.123.7777</p>
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
                                    <p>contact@yoursite.com <br> info@lawyersattorneys.com</p>
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
                                    <p>7/135 Saint St. London <br> 1130/5 Louis III St. New York</p>
                                </div>
                            </div>
                        </div>
                        <!--Contact Information End-->

                        <!--Contact Information Start-->
                        <div class="col-lg-3 col-sm-6 col-12 mb-30">
                            <div class="contact-info">
                                <span class="icon"><i class="fa fa-users"></i></span>
                                <div class="content">
                                    <h3 class="title">Pustok Social</h3>
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
        <script>
            function changeimgadd() {
                var file = document.getElementById("imgadd").files[0];
                if (file.name.match(/.+\.(jpg|png|jpeg)/i)) {
                    if (file.size / (1024 * 1024) < 5) {
                        var fileReader = new FileReader();
                        fileReader.readAsDataURL(file);
                        fileReader.onload = function () {
                            document.getElementById("imageadd").value = (fileReader.result);
                            document.getElementById("demoimgadd").src = (fileReader.result);
                            console.log(fileReader.result);
                        }
                    } else {
                        uploadError();
                    }
                } else {
                    uploadError();
                }
            }
            function uploadError() {
                alert('Please upload photo file < 5MB')
                document.getElementById("imgadd").files[0].value = ''
                document.getElementById("imgadd").type = '';
                document.getElementById("imgadd").type = 'file';
            }

        </script>
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



</html>