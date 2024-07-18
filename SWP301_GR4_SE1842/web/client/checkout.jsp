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
        <title>Bookaholic - Check out</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Use Minified Plugins Version For Fast Page Load -->
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/plugins.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/main.css" />

        <link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
        <style>
            #checkout__form .form-message {
                color: tomato;
                font-size: .8rem;
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
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li class="breadcrumb-item active">Checkout</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </section>
                <main id="content" class="page-section inner-page-sec-padding-bottom space-db--20">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <!-- Checkout Form s-->
                                <form id="checkout__form" action="place-an-order" method="post" class="checkout-form">
                                <c:if test="${(sessionScope.usersession eq null && (sessionScope.cart eq null || sessionScope.cart.getQuantity() == 0))
                                              || (sessionScope.usersession ne null && sessionScope.usersession.getCartQuantity() == 0)}">
                                      <div class="col-12">
                                          <h1 class="quick-title">Add some books to cart first!</h1>
                                      </div>
                                </c:if>
                                <c:if test="${(sessionScope.usersession eq null && (sessionScope.cart ne null && sessionScope.cart.getQuantity() != 0))
                                              || (sessionScope.usersession ne null && sessionScope.usersession.getCartQuantity() != 0)}">
                                      <div class="row row-40">
                                          <div class="col-12">
                                              <h1 class="quick-title">Checkout</h1>
                                          </div>

                                          <div class="col-lg-7 mb--20">
                                              <!-- Billing Address -->
                                              <div id="billing-form" class="mb-40">
                                                  <h4 class="checkout-title">Billing Address</h4>
                                                  <div class="row">
                                                      <div class="col-md-12 col-12 mb--20">
                                                          <label> Fullname </label>
                                                          <input id="fullname" name="fullname" value="${lastFullname}${sessionScope.usersession.fullName}" type="text" placeholder="Full Name">
                                                          <span class="form-message"></span>
                                                      </div>
                                                      <div class="col-md-12 col-12 mb--20">
                                                          <label>Phone number</label>
                                                          <input id="phone" name="phone" value="${lastPhone}${sessionScope.usersession.phone}" type="text" placeholder="Phone number">
                                                          <span class="form-message"></span>
                                                      </div>
                                                      <div class="col-md-12 col-12 mb--20">
                                                          <label>Email address</label>
                                                          <input id="email" name="email" value="${lastEmail}${sessionScope.usersession.email}" type="text" placeholder="Email">
                                                          <span class="form-message">${emailExistErr}</span>
                                                      </div>
                                                      <div class="col-12 mb--20">
                                                          <label>Delivery Address</label>
                                                          <input id="address" name="address" value="${lastAddress}${sessionScope.usersession.address}" type="text" placeholder="Address">
                                                          <span class="form-message"></span>
                                                      </div>

                                                    

                                                  </div>
                                              </div>
                                              <c:if test="${sessionScope.usersession eq null}">        
                                                  <!-- Shipping Address -->
                                                  <div id="shipping-form" class="mb--40" style="${displayBlock}">
                                                      <h4 class="checkout-title">Register</h4>
                                                      <div class="row">
                                                          <div class="col-md-6 col-12 mb--20">
                                                              <label>Username*</label>
                                                              <input value="${lastUsername}" id="username" name="username" type="text" placeholder="Username">
                                                              <span class="form-message">${usernameExistErr}</span>
                                                          </div>
                                                          <div class="col-md-6 col-12 mb--20">
                                                              <label>Password*</label>
                                                              <input id="pass" name="password" type="password" placeholder="Password">
                                                              <span class="form-message"></span>
                                                          </div>
                                                          <div class="col-md-6 col-12 mb--20">
                                                              <label>Confirm password*</label>
                                                              <input id="repass" type="password" placeholder="Confirm password">
                                                              <span class="form-message"></span>
                                                          </div>
                                                      </div>
                                                  </div>
                                              </c:if>    
                                          </div>

                                          <div class="col-lg-5">
                                              <div class="row">
                                                  <!-- Cart Total -->
                                                  <div class="col-12">
                                                      <c:if test="${sessionScope.usersession eq null}">
                                                          <div class="checkout-cart-total">
                                                              <h2 class="checkout-title">YOUR ORDER</h2>
                                                              <h4>Product <span>Total</span></h4>
                                                              <ul>
                                                                  <c:forEach items="${sessionScope.cart.items}" var="cart">    
                                                                      <li><span class="left">${cart.book.title} × 0${cart.quantity}</span> 
                                                                          <span class="right">$
                                                                              <fmt:formatNumber value="${cart.book.finalCost * cart.quantity}" pattern="0.00" var="totalprice" />
                                                                              ${totalprice}
                                                                          </span>
                                                                      </li>
                                                                  </c:forEach>
                                                              </ul>
                                                              <fmt:formatNumber value="${sessionScope.cart.getTotalWithDiscount()}" pattern="0.00" var="totalprice" />
                                                              <p>Sub Total <span>$${totalprice}</span></p>
                                                              <p>Shipping Fee <span>$00.00</span></p>
                                                              <h4>Grand Total <span>$${totalprice}</span></h4>
                                                              <div class="method-notice mt--25">
                                                                  <select name="paymethodid">
                                                                      <c:forEach items="${pmList}" var="pm">
                                                                          <option value="${pm.id}">${pm.name}</option>
                                                                      </c:forEach>
                                                                  </select>
                                                              </div>
                                                              <button class="place-order w-100"> <a></a> Place order</button>
                                                          </div>
                                                      </c:if> 
                                                      <c:if test="${sessionScope.usersession ne null}">
                                                          <div class="checkout-cart-total">
                                                              <h2 class="checkout-title">YOUR ORDER</h2>
                                                              <h4>Product <span>Total</span></h4>
                                                              <ul>
                                                                  <c:forEach items="${sessionScope.usersession.carts}" var="cart">    
                                                                      <li><span class="left">${cart.book.title} × 0${cart.quantity}</span> 
                                                                          <span class="right">$
                                                                              <fmt:formatNumber value="${cart.book.finalCost * cart.quantity}" pattern="0.00" var="totalprice" />
                                                                              ${totalprice}
                                                                          </span>
                                                                      </li>
                                                                  </c:forEach>
                                                              </ul>
                                                              <fmt:formatNumber value="${sessionScope.usersession.getTotalPriceInCart()}" pattern="0.00" var="totalprice" />
                                                              <p>Sub Total <span>$${totalprice}</span></p>
                                                              <p>Shipping Fee <span>$00.00</span></p>
                                                              <h4>Grand Total <span>$${totalprice}</span></h4>
                                                              <div class="method-notice mt--25">
                                                                  <select name="paymethodid">
                                                                      <c:forEach items="${pmList}" var="pm">
                                                                          <option value="${pm.id}">${pm.name}</option>
                                                                      </c:forEach>
                                                                  </select>
                                                              </div>
                                                              <button class="place-order w-100"> <a></a> Place order</button>
                                                          </div>
                                                      </c:if>
                                                  </div>
                                              </div>
                                          </div>
                                      </div>
                                </c:if>
                            </form>
                            <script defer>
                                document.addEventListener('DOMContentLoaded', function () {

                                    let commonRules = [
                                        Validator.isRequired('#fullname', 'Please enter your full name!'),
                                        Validator.isRequired('#phone', 'Please enter your phone number!'),
                                        Validator.isPhone('#phone', 'Invalid phone number format!'),
                                       
                                        Validator.isRequired('#email', 'Please enter your email address!'),
                                        Validator.isEmail('#email', 'Invalid email format!'),
                                        Validator.isRequired('#address', 'Please enter your address!')
                                    ];

                                    let accountRules = [
                                        Validator.isRequired('#username', 'Please enter your username!'),
                                        Validator.isRequired('#pass', 'Password is required!'),
                                        Validator.minLengthAllowNull('#pass', 8),
                                        Validator.isRequired('#repass', 'Please confirm your password!'),
                                        Validator.isConfirmed('#repass', function () {
                                            return document.querySelector('#checkout__form #pass').value;
                                        }, 'Password does not match!')
                                    ];

                                    function initValidator(rules) {
                                        return Validator({
                                            form: '#checkout__form',
                                            formGroupSelector: '.col-12.mb--20',
                                            errorSelector: '.form-message',
                                            rules: rules
                                        });
                                    }

                                    let currentRules = commonRules;
                                    let validator = initValidator(currentRules);

                                    // Event listener for the checkbox state change
                                    document.querySelector('#create_account[data-shipping]').addEventListener('change', function () {
                                        if (this.checked) {
                                            currentRules = commonRules.concat(accountRules);
                                        } else {
                                            currentRules = commonRules;
                                        }

                                        // Re-initialize the validator with the new set of rules
                                        validator = initValidator(currentRules);
                                    });
                                });
                            </script>



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

            <script src="${pageContext.request.contextPath}/admin/assets/js/form-validator.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Use Minified Plugins Version For Fast Page Load -->
        <script src="${pageContext.request.contextPath}/client/assets/js/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/ajax-mail.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/custom.js"></script>
    </body>


    <!-- Mirrored from htmldemo.net/pustok/pustok/checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:17:16 GMT -->
</html>