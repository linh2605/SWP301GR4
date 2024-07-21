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
        <title>RonaldoSportShop</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Use Minified Plugins Version For Fast Page Load -->
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/plugins.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/main.css" />
        <link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

        <link rel="stylesheet" href="./css/main.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-LhjHdVW75K3M7NMDwvP1XeKb/c3QZOsf27ilJOP01aEJSde4T9vQF4OHFrk56gKXm8GHh4iA22bVl4Yt09+Qew==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
            .pagination {
                display: inline-block;
                margin-bottom: 20px; /* Khoảng cách giữa phân trang và nội dung khác */
            }

            .pagination li {
                display: inline;
                margin-right: 5px; /* Khoảng cách giữa các nút */
            }

            .pagination li a {
                color: #333; /* Màu chữ cho các nút */
                padding: 8px 12px; /* Kích thước nút */
                text-decoration: none;
                border: 1px solid #ccc; /* Viền nút */
                border-radius: 3px; /* Bo tròn viền */
            }

            .pagination li.active a {
                background-color: #337ab7; /* Màu nền cho trang hiện tại */
                color: #fff; /* Màu chữ cho trang hiện tại */
                border-color: #337ab7; /* Viền cho trang hiện tại */
            }

            .pagination li a:hover {
                background-color: #eee; /* Màu nền khi di chuột qua */
            }
            .custom-radio {
                cursor: pointer;
                border: none;
                padding: 0.75rem 1.25rem;
                margin-bottom: -1px;
                border-radius: 0;
                transition: background-color 0.3s ease;
            }

            .custom-radio:hover {
                background-color: #f9f9f9;
            }

            .custom-radio input[type="radio"] {
                display: none;
            }

            .custom-radio input[type="radio"]:checked + span.radio-text {
                font-weight: bold;
                color: #007bff;
            }

            .custom-radio label {
                display: block;
                position: relative;
                padding-left: 35px;
                margin-bottom: 0;
                cursor: pointer;
                font-size: 18px;
                line-height: 30px;
            }

            .custom-radio label:hover {
                color: #007bff;
            }

            .custom-radio label::before {
                content: "";
                display: inline-block;
                position: absolute;
                left: 0;
                top: 5px;
                width: 20px;
                height: 20px;
                border: 1px solid #ccc;
                border-radius: 50%;
                background-color: #fff;
                transition: border-color 0.3s ease;
            }

            .custom-radio input[type="radio"]:checked + span.radio-text::before {
                border-color: #007bff;
                background-color: #007bff;
            }

            .custom-radio label::after {
                content: "";
                display: inline-block;
                position: absolute;
                left: 7px;
                top: 12px;
                width: 8px;
                height: 8px;
                border-radius: 50%;
                background-color: #fff;
                transition: background-color 0.3s ease;
            }

            .custom-radio input[type="radio"]:checked + span.radio-text::after {
                background-color: #007bff;
            }
        </style>
    </head>

    <body class="bg-white-100">
        <div class="container mx-auto px-4">

            <div class="container mx-auto px-4">
                <jsp:include page="./component/header_0.jsp"></jsp:include>
                </div>
                <div class="site-mobile-menu">
                <jsp:include page="./component/header_1.jsp"></jsp:include>
                </div>
                <div class="sticky-init fixed-header common-sticky">
                <jsp:include page="./component/header_2.jsp"></jsp:include>
                </div>

                <!-- Breadcrumb -->
                <nav class="text-sm breadcrumbs py-4">
                    <ol class="flex">
                        <li><a href="homepage" class="text-blue-600 hover:underline">Home</a></li>
                        <li class="mx-2">/</li>
                        <li>Blog</li>
                        <c:if test="${filter != null && filter != ''}">
                        <li class="mx-2">/</li>
                        <li>${filter}</li>
                        <input type="hidden" value="${filter}" name="txtfilter">
                    </c:if>
                </ol>
            </nav>

            <!-- Main Content -->
            <main class="flex flex-col md:flex-row gap-8">
                <!-- Sidebar -->
                <!-- Category -->

                <aside class="w-full md:w-1/4">
                    <div class="mb-8 bg-gray-100 rounded-lg p-4">
                        <h5 class="font-bold text-lg mb-4">Search</h5>
                        <form action="search_action" method="GET">
                            <div class="relative flex">
                                <input type="text" name="search_query" placeholder="Enter..." class="w-full px-3 py-2 rounded-md border border-gray-300 focus:border-blue-500 focus:ring focus:ring-blue-500 focus:ring-opacity-50">
                                <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-md ml-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50">
                                    Find
                                </button>
                            </div>
                        </form>
                    </div>


                    <!-- Category -->
                    <div class="mb-8 bg-gray-100 rounded-lg p-4">
                        <h5 class="font-bold text-lg mb-4">Category</h5>
                        <ul class="space-y-2">
                            <c:forEach var="category" items="${categoryBlogs}">
                                <li>
                                    <label class="flex items-center space-x-2 cursor-pointer">
                                        <input type="radio" name="category_id" value="${category.categoryId}" 
                                               class="form-radio text-blue-600" ${categorySelected == category.categoryId ? 'checked' : ''}>
                                        <span class="text-gray-700 hover:text-blue-600">${category.categoryName}</span>
                                    </label>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <!-- Sort -->
                    <div class="mb-8 bg-gray-100 rounded-lg p-4">
                        <h5 class="font-bold text-lg mb-4">Sort</h5>
                        <form action="Blog">
                            <ul class="space-y-2">
                                <li>
                                    <label class="flex items-center space-x-2 cursor-pointer">
                                        <input type="radio" name="order" value="NTO" ${NTO} class="form-radio text-blue-600">
                                        <span class="text-gray-700"><i class="fas fa-sort-amount-down mr-2"></i>New To Old</span>
                                    </label>
                                </li>
                                <li>
                                    <label class="flex items-center space-x-2 cursor-pointer">
                                        <input type="radio" name="order" value="OTN" ${OTN} class="form-radio text-blue-600">
                                        <span class="text-gray-700"><i class="fas fa-sort-amount-up mr-2"></i>Old To New</span>
                                    </label>
                                </li>
                            </ul>
                        </form>
                    </div>

                    <!-- Latest Posts -->
                    <div class="swiper-container bg-gray-100 rounded-lg p-4">
                        <h5 class="font-bold text-lg mb-4">Latest Posts</h5>
                        <div class="swiper-wrapper">
                            <c:forEach var="lb" items="${latestBlogs}">
                                <div class="swiper-slide bg-white shadow-md rounded-lg p-4 mb-4">
                                    <h5 class="text-center mb-2">
                                        <a href="BlogDetail?id=${lb.blogId}" class="font-bold text-gray-800 hover:text-blue-600">
                                            ${lb.blogTitle}
                                        </a>
                                    </h5>
                                    <a href="BlogDetail?id=${lb.blogId}" class="block">
                                        <img src="${lb.img}" alt="${lb.blogTitle}" class="w-full h-auto rounded">
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                        <!-- Add Pagination -->
                        <div class="swiper-pagination"></div>
                    </div>

                </aside>


                <!-- Blog List -->
                <div class="w-full md:w-3/4">
                    <h2 class="text-2xl font-bold mb-6">Blog list</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        <c:forEach var="p" items="${bloList}">
                            <div class="bg-white shadow-md rounded-lg overflow-hidden">
                                <a href="BlogDetail?id=${p.blogId}">
                                    <img src="${p.img}" alt="" class="w-full h-48 object-cover">
                                </a>
                                <div class="p-4">
                                    <h4 class="font-bold mb-2">
                                        <a href="BlogDetail?id=${p.blogId}" class="text-gray-800 hover:text-blue-600">
                                            ${p.blogTitle}
                                        </a>
                                    </h4>
                                    <p class="text-gray-600 text-sm mb-4">${p.description}....</p>
                                    <a href="BlogDetail?id=${p.blogId}" 
                                       class="inline-block bg-red-600 text-white px-4 py-2 rounded-lg hover:bg-red-700">
                                        Show
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <!-- Pagination -->
                    <div class="flex justify-center mt-8">
                        <ul class="flex space-x-2">
                            <c:if test="${currentPage > 1}">
                                <li>
                                    <a href="?page=${currentPage - 1}" 
                                       class="px-3 py-2 bg-gray-200 text-gray-700 rounded-md hover:bg-gray-300">
                                        Previous
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <li>
                                    <a href="?page=${i}" 
                                       class="px-3 py-2 ${currentPage eq i ? 'bg-blue-500 text-white' : 'bg-gray-200 text-gray-700'} rounded-md hover:bg-gray-300">
                                        ${i}
                                    </a>
                                </li>
                            </c:forEach>
                            <c:if test="${currentPage < totalPages}">
                                <li>
                                    <a href="?page=${currentPage + 1}" 
                                       class="px-3 py-2 bg-gray-200 text-gray-700 rounded-md hover:bg-gray-300">
                                        Next
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </main>
        </div>

        <!-- Brand Slider Section -->
        <section class="py-12 bg-white">
            <div class="container mx-auto px-4">
                <h2 class="sr-only">Brand Slider</h2>
                <div class="flex overflow-x-auto space-x-8">
                    <div class="flex-none w-1/6"><img src="image/others/brand-1.jpg" alt="" class="w-full"></div>
                    <div class="flex-none w-1/6"><img src="image/others/brand-2.jpg" alt="" class="w-full"></div>
                    <div class="flex-none w-1/6"><img src="image/others/brand-3.jpg" alt="" class="w-full"></div>
                    <div class="flex-none w-1/6"><img src="image/others/brand-4.jpg" alt="" class="w-full"></div>
                    <div class="flex-none w-1/6"><img src="image/others/brand-5.jpg" alt="" class="w-full"></div>
                    <div class="flex-none w-1/6"><img src="image/others/brand-6.jpg" alt="" class="w-full"></div>
                </div>
            </div>
        </section>


        <jsp:include page="./component/footer.jsp"></jsp:include>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

            <script src="${pageContext.request.contextPath}/client/assets/js/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/ajax-mail.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/custom.js"></script>
        <script>
            var swiper = new Swiper('.swiper-container', {
                slidesPerView: 'auto',
                spaceBetween: 20,
                loop: true,
                pagination: {
                    el: '.swiper-pagination',
                    clickable: true,
                },
            });
        </script>
    </body>


    <!-- Mirrored from htmldemo.net/pustok/pustok/shop-grid-left-sidebar.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:17:16 GMT -->
</html>
