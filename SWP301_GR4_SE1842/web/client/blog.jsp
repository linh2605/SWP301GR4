<%-- 
    Document   : shop
    Created on : Sep 28, 2023, 10:45:17 PM
    Author     : ACER
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="zxx">


    <!-- Mirrored from htmldemo.net/pustok/pustok/shop-grid-left-sidebar.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:17:16 GMT -->
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Bookaholic</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Use Minified Plugins Version For Fast Page Load -->
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/plugins.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/main.css" />
        <link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
        <link rel="stylesheet" href="./css/main.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <style>
            .sidebar-menu--shop.menu-type-2 {
                max-height: 300px;
                overflow-y: auto;
            }
            .product-card .card-image {
                width: 255px;
                height: 406.5px;
            }
            .product-card .card-image img {
                object-fit: cover;
                width: 100%;
                height: 406.5px;
            }
            @media (max-width: 1200px) {
                .product-card .card-image {
                    width: 209.99px;
                    height: 400px;
                }
            }
            @media (max-width: 992px) {
                .product-card .card-image {
                    position: relative;
                    width: 100%;
                    display: flex;
                    align-items: center; /* Vertical centering */
                    justify-content: center; /* Horizontal centering */
                }
                .product-card .card-image img {
                    max-width: 100%; /* Ensures the image doesn't exceed the container's width */
                    max-height: 100%;
                }
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
                                    <li class="breadcrumb-item ">  Blog </li>
                                    <c:if test="${filter != null && filter != ''}">
                                    <input type="hidden" value="${filter}" name="txtfilter">
                                    <li class="breadcrumb-item "> ${filter} </li>
                                    </c:if>

                            </ol>
                        </nav>
                    </div>
                </div>
            </section>
            <main class="inner-page-sec-padding-bottom">
                <div class="container">
                    <div class="main-section-content row">
                        <div class="sider col-md-3">
                            <div class="search">
                                <div class="side-item">
                                    <h5>Category</h5>
                                    <form action="Blog">
                                        <ul class="cat-list">
                                            <c:forEach var="i" begin="0" end="${catList.size()-1}">
                                                <input type="checkbox" name="value" value="${catList.get(i)}" ${checkValue[i]?"checked":""}/>
                                                ${catList.get(i)}


                                                <br>
                                            </c:forEach>
                                            <br>
                                            <input checked type="radio" name="order" value="NTO" ${NTO} >New To Old<br>

                                            <input type="radio" name="order" value="OTN" ${OTN}>Old To New<br>
                                            <br>

                                            <button type="submit" class="btn btn-success" value="Find" id="submit_pfilter">Find</button>
                                        </ul>
                                    </form>



                                </div>

                                <div class="latest-product">
                                    <h5>Latest  Post</h5>
                                    <c:forEach var="pro" items="${reList}">
                                        <div style="box-shadow: 0px 0px 5px 5px lightgray; margin: 15px;padding: 5px;">

                                            <h5 class="latest-product-title" style="text-align: center;"  ><a href="BlogDetail?id=${pro.blog_id}" class="product-name" style="font-weight: bold;text-decoration: none; color: black">${pro.blog_title}</a></h5>
                                            <div class="latest-product-item">
                                                <a href="BlogDetail?id=${pro.blog_id}" title="product thumbnail" style="width: 55%; margin-left: 20%;">
                                                    <img src="${pro.image}" alt="" width="100%"></a>
                                                <div class="latest-product-info">
                                                    <p class="latest-product-title product-description" style="padding-left: 8px;" ><a href="BlogDetail?id=${pro.blog_id}" class="product-name" style="font-size: 12px; text-decoration: none; color: black;">${pro.description}....</a></p>

                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="display-list col-md-9">
                            <div class="section-title section-title--bordered">
                                <h2>Blog list</h2>
                            </div>
                            <div class="product-list row">
                                <c:forEach var="p" items="${bloList}">
                                    <div class="product-item col-md-4" style="padding: 15px;">
                                        <a href="BlogDetail?id=${p.blog_id}" style="width: 100%" title="product thumbnail" ><img src="${p.image}" alt="" width="100%"></a>
                                        <div class="product-info">
                                            <h4 class="product-title"><a href="BlogDetail?id=${p.blog_id}" class="product-name">${p.blog_title}</a></h4>
                                            <div class="product-description">
                                                <p>${p.description}....</p>
                                            </div>

                                        </div>
                                        <div class="btn-list" style="margin-top: 15px;">
                                            <a href="BlogDetail?id=${p.blog_id}" class="product-btn" style="color: white; background-color: #e73918;border-radius: 10px;padding: 5px; text-align: center;"> Show</a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination">
                                                <li class="page-item">
                                                    <a class="page-link" href="#" aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>
                                                <c:forEach begin="1" end="${totalPage}" var="i">
                                                    <li class="${i==param['page']?"page-item active":"page-item"}"><a class="page-link" href="Blog?page=${i}&value=${value[0]}&value=${value[1]}&value=${value[2]}&order=${order}">${i}</a></li>
                                                    </c:forEach>
                                                <li class="page-item">
                                                    <a class="page-link" href="#" aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
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
                function loadBooksOfAPage(index, param, cid) {
                    var page_buttons = document.querySelectorAll('#page__button');
                    page_buttons.forEach(function (button) {
                        button.classList.remove('active');
                    });
                    console.log(document.getElementById('sort-book__select').value);
                    param.classList.add('active');
                    var additionalData = {
                        index: index,
                        cid: cid,
                        orderType: document.getElementById('sort-book__select').value
                    };
                    $.ajax({
                        type: 'POST',
                        data: additionalData,
                        url: 'LoadBooksOfAShopPage',
                        success: function (result) {
                            document.querySelector('#product-cart__container').innerHTML = result;
                        }
                    });
                }
                function sortBooks(param) {
                    $.ajax({
                        type: 'POST',
                        data: {
                            orderType: param.value,
                            index: document.getElementById('indexPage__sendfromServlet').value,
                            cid: document.getElementById('cid__sendfromServlet').value,
                            scid: document.getElementById('scid__sendfromServlet').value
                        },
                        url: 'LoadBooksOfAShopPage',
                        success: function (result) {
                            document.querySelector('#product-cart__container').innerHTML = result;
                        }
                    });
                }
                function controlCart(param) {
                    $.ajax({
                        type: 'POST',
                        data: {id: param},
                        url: 'AddCart',
                        success: function (result) {
                            document.querySelector('#cartShow').innerHTML = result;
                        }
                    });
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
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <!-- Use Minified Plugins Version For Fast Page Load -->
            <script src="${pageContext.request.contextPath}/client/assets/js/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/ajax-mail.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/custom.js"></script>
        <script>
                $(document).ready(function () {
                    // Initialize the price range slider



                    // Make an AJAX call when the slider values change
                    $("#price-slider").slider({
                        range: true,
                        min: 0, // Set your minimum price
                        max: 1000, // Set your maximum price
                        values: [0, 100], // Set the initial range

                        slide: function (event, ui) {
                            $("#price-range").val("$" + ui.values[0] + " - $" + ui.values[1]);
                            $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
                            var minPrice = ui.values[0];
                            var maxPrice = ui.values[1];
                            filterByPrice(minPrice, maxPrice);
                        },

                    });
                    filterByPrice(0, 100);
                    $("#price-range").val("$" + 0 + " - $" + 100);
                    $("#amount").val("$" + 0 + " - $" + 100);
                    // Initial filter

                });
                var isAjaxRunning = false;

                function filterByPrice(minPrice, maxPrice) {
                    if (isAjaxRunning) {
                        // A request is already in progress, so do nothing
                        return;
                    }

                    isAjaxRunning = true;
                    $.ajax({
                        type: 'POST', // Use 'GET' or 'POST' depending on your server implementation
                        url: 'filterByPriceServlet', // Replace with the URL of your server endpoint
                        data: {
                            minPrice: minPrice,
                            maxPrice: maxPrice

                        },
                        success: function (data) {
                            document.querySelector('#product-cart__container').innerHTML = data;
                        },
                        complete: function () {
                            // Reset the flag when the AJAX request is complete
                            isAjaxRunning = false;
                        }
                    });
                }

        </script>
    </body>


    <!-- Mirrored from htmldemo.net/pustok/pustok/shop-grid-left-sidebar.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:17:16 GMT -->
</html>
