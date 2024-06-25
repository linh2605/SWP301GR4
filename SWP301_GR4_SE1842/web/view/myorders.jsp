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

        <!-- Custom CSS for hover effects and action icons -->
        <style>
            .product-item {
                position: relative;
                overflow: hidden;
                transition: transform 0.3s ease, opacity 0.3s ease;
                background: #fff;
                border: 1px solid #e1e1e1;
                margin-bottom: 20px;
                text-align: center;
                padding: 10px;
            }

            .product-item img {
                transition: transform 0.3s ease;
                width: 100%;
                height: auto;
            }

            .product-item:hover img {
                transform: scale(1.1);
            }

            .product-item:hover {
                z-index: 1;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            }

            .product-overlay {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.75);
                opacity: 0;
                transition: opacity 0.3s ease;
                z-index: 2;
            }

            .product-item:hover .product-overlay {
                opacity: 1;
            }

            .product-actions {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                opacity: 0;
                transition: opacity 0.3s ease;
                z-index: 3;
            }

            .product-item:hover .product-actions {
                opacity: 1;
            }

            .product-actions .action-row {
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 5px 0;
            }

            .product-actions .action-icon {
                cursor: pointer;
                font-size: 1.5em;
                margin: 0 10px;
                color: #fff;
                background: rgba(0, 0, 0, 0.6);
                padding: 10px;
                border-radius: 50%;
                transition: background 0.3s ease;
            }

            .product-actions .action-icon:hover {
                background: #ff6f61;
            }

            .product-item.fade {
                opacity: 0.3;
            }

            .product-price,
            .product-name {
                transition: opacity 0.3s ease;
            }

            .product-item:hover .product-price,
            .product-item:hover .product-name {
                opacity: 0.5;
            }
        </style>

        <!-- jQuery CDN -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <!-- Custom JS for Ajax -->
        <script>
            $(document).ready(function () {
                // Function to handle brand and category filter clicks
                $(".sidebar-link").on("click", function (e) {
                    e.preventDefault(); // Prevent default link behavior
                    var url = $(this).attr("href");
                    $.ajax({
                        url: url,
                        method: "GET",
                        success: function (data) {
                            $("#productList").html($(data).find("#productList").html());
                        }
                    });
                });

                // Function to handle clear filter button
                $("#clearFilterBtn").on("click", function (e) {
                    e.preventDefault(); // Prevent default button behavior
                    var url = window.location.protocol + "//" + window.location.host + window.location.pathname;
                    $.ajax({
                        url: url,
                        method: "GET",
                        success: function (data) {
                            $("#productList").html($(data).find("#productList").html());
                        }
                    });
                });
            });
        </script>
    </head>

    <body class="home-3">
        <header>
            <!-- header-top-area-start -->
            <jsp:include page="common/header-top-area.jsp"></jsp:include>
                <!-- header-top-area-end -->
            <jsp:include page="common/ProfileHeader.jsp"></jsp:include>
                <!-- header-min-area-start -->
            <jsp:include page="common/header-min-area.jsp"></jsp:include>
                <!-- header-min-area-start -->
                <!-- mobile-menu-area-start -->
            <jsp:include page="common/mobile-menu-area.jsp"></jsp:include>
                <!-- mobile-menu-area-end -->
                <!-- header-bottom-area-start -->
            <jsp:include page="common/header-bottom-area.jsp"></jsp:include>
                <!-- header-bottom-area-end -->
            </header>
            <div class="row">
                <div class="container col-md-2">
                    <form method="post" action="./MyOrder">
                        <div class="mt-5">
                            <div class="mb-3">
                                <label for="dateOrder" class="form-label">Order Date:</label>
                                <input id="dateOrder" name="orderDate" type="date" class="form-control" value="${orderDate}" required/>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="dateDeliver" class="form-label">Deliver Date:</label>
                        <input id="dateDeliver" name="deleverDate" type="date" class="form-control" value="${deliverDate}" required/>
                    </div>
                    <div class="mb-3">
                        <label for="dateDeliver" class="form-label">Status:</label>
                        <select class="form-control" name="status">
                            <option value="0" ${selectStatus == 0 ? 'selected' : ''}>All</option>
                            <option value="1" ${selectStatus == 1 ? 'selected' : ''}>Pending</option>
                            <option value="2" ${selectStatus == 2 ? 'selected' : ''}>Shipped</option>
                            <option value="3" ${selectStatus == 3 ? 'selected' : ''}>Cancelled</option>
                        </select>
                        <button type="submit" class="btn btn-info w-100">Search</button>
                    </div>
                </form>
            </div>
            <div class="container col-md-10">
                <div class="row pt-5">
                    <div id="productList" class="row col-md-12">
                        <c:if test="${orders == null || orders.size() == 0}">
                            <div class="alert alert-warning" role="alert">
                                Empty!
                            </div>
                        </c:if>
                        <c:forEach items="${orders}" var="p">
                            <div class="col-md-3 mb-3">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <h5 class="card-title">Order ID: ${p.orderId}</h5>
                                        <p class="card-text" style="color: #febd69;">Order Date: ${p.orderDateString}</p>
                                        <p class="card-text">$ ${p.totalPrice}</p>
                                        <p class="card-text" style="color: #febd69;">Deliver Date: ${p.deliverDateString}</p>
                                        <p class="card-text">Status: ${p.statusName}</p>
                                        <p class="card-text">Payment Method: ${p.paymentName}</p>
                                        <div class="d-flex justify-content-end">
                                            <a href="./OrderDetail?orderID=${p.orderId}" class="btn btn-info"><i class="fa-solid fa-info-circle"></i> Details</a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                    <div class="banner-area-2">
                        <div class="container">
                            <div class="row border-b">
                                <div class="col-lg-4 col-md-4 col-12">
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
                                <div class="col-lg-4 col-md-4 col-12">
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
                                <div class="col-lg-4 col-md-4 col-12">
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
                </div>
            </div>
        </div>

        <footer>
            <jsp:include page="common/footer.jsp"></jsp:include>
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

    </body>

</html>
