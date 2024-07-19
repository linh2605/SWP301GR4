<%-- 
    Document   : header
    Created on : Sep 28, 2023, 10:25:50 PM
    Author     : ACER
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .header-top-list li {
        display: flex;
        align-items: center;
    }
</style>
<div class="container">
    <div class="row">
        <div class="col-lg-4">
        </div>
        <div class="col-lg-8 flex-lg-right">
            <ul class="header-top-list">
                <c:if test="${sessionScope.usersession ne null}">
                    <li class="dropdown-trigger language-dropdown"><a href="${pageContext.request.contextPath}/wishlist"><i class="icons-left fas fa-heart"></i>
                            <span id="wishlist-icon-text__container">wishlist (${sessionScope.usersession.wishListSize()})</span></a>
                    </li>
                    <li class="dropdown-trigger language-dropdown">
                        <a style="display: flex; align-items: center;" href="#">
                            <div style="width: 2.4rem; margin-right: .32rem">
                                <img style="border-radius: 50%; border: .04rem solid #000" src="${sessionScope.usersession.avatar}" >
                            </div>
                            My Account
                            <i class="fas fa-chevron-down dropdown-arrow"></i>
                        </a>

                        <ul class="dropdown-box">
                            <li> <a href="my-account">My Account</a></li>
                          
                            
                            <li> <a href="${pageContext.request.contextPath}/logout">Logout</a></li>
                        </ul>
                    </li>
                </c:if>
                <c:if test="${sessionScope.usersession.roleID != 4 && sessionScope.usersession ne null}">
                    <li><a href="${pageContext.request.contextPath}/dashboard"><i class="fa-solid fa-chalkboard-user"></i> Dashboard</a>
                    </li>
                </c:if>
                <li><a href="${pageContext.request.contextPath}/Contact"><i class="icons-left fas fa-phone"></i> Contact</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/checkOut"><i class="icons-left fas fa-share"></i> Checkout</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="header-middle pt--10 pb--10">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-3">
                <a href="${pageContext.request.contextPath}/homepage" class="site-brand">
                    <img src="${pageContext.request.contextPath}\assets\sportshoplogo.png" alt="">
                </a>
            </div>
            <div class="col-lg-5">
                <div class="header-search-block">
                    <div>
                        <form action="loadBookBySearch" method="post">
                            <input type="text" id="searchInput" name="searchInput" placeholder="Search Here">
                            <button class="search-btn" type="submit"><i class="ion-ios-search-strong"></i></button>
                        </form>
                    </div>
                    <div class="dropdown-menu" id="suggestions">
                        <div id="suggestions-content">Loading...</div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="main-navigation flex-lg-right">
                    <div class="cart-widget">
                        <c:if test="${sessionScope.usersession eq null}">
                            <div class="login-block">
                                <a href="${pageContext.request.contextPath}/auth/login" class="font-weight-bold">Login</a> <br>
                                <span>or</span><a href="${pageContext.request.contextPath}/auth/signup">Register</a>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.usersession eq null}">
                            <div class="cart-block" id="cartShow">
                                <div class="cart-total">
                                    <c:if test="${sessionScope.cart ne null && sessionScope.cart.getQuantity() != 0}">
                                        <span class="text-number">
                                            ${sessionScope.cart.getQuantity()}
                                        </span>
                                    </c:if>
                                    <span class="text-item">
                                        Shopping Cart
                                    </span>
                                    <span class="price">
                                        $ <c:if test="${sessionScope.cart.getQuantity() eq null}">0</c:if>
                                        <fmt:formatNumber value="${sessionScope.cart.getTotalWithDiscount()}" pattern="0.00" var="totalprice" />
                                                                ${totalprice}
                                            <i class="fas fa-chevron-down"></i>
                                        </span>
                                    </div>
                                    <div class="cart-dropdown-block" style="text-align: center">
                                    <c:if test="${sessionScope.cart eq null || sessionScope.cart.getQuantity() == 0}">
                                        <span style="margin-bottom: 1rem">There is no item in cart!</span>
                                    </c:if>
                                    <c:if test="${sessionScope.cart.getQuantity() ne null}">
                                        <div style="height: 10rem ;overflow-y: auto">
                                            <c:forEach items="${sessionScope.cart.items}" var="cart">
                                                <div class=" single-cart-block ">
                                                    <div class="cart-product">
                                                        <a href="detail?bid=${cart.book.id}" class="image">
                                                            <img src="${cart.book.img0}?ran=<%= Math.random() %>">
                                                        </a>
                                                        <div class="content">
                                                            <h3 class="title"><a href="detail?bid=${cart.book.id}">${cart.book.title}</a></h3>
                                                            <p class="price">
                                                                <span class="qty">
                                                                    ${cart.quantity} book(s)
                                                                </span> 
                                                                <fmt:formatNumber value="${cart.book.getFinalCost() * cart.quantity}" pattern="0.00" var="totalprice" />
                                                                $${totalprice}
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach> 
                                        </div>
                                    </c:if>

                                    <div class=" single-cart-block ">
                                        <div class="btn-block">
                                            <a href="${pageContext.request.contextPath}/viewCart" class="btn">View Cart <i class="fas fa-chevron-right"></i></a>
                                            <a href="${pageContext.request.contextPath}/checkOut" class="btn btn--primary">Check Out <i class="fas fa-chevron-right"></i></a>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </c:if>
                        <c:if test="${sessionScope.usersession ne null}">
                            <div class="cart-block" id="cartShow">
                                <div class="cart-total">
                                    <c:if test="${sessionScope.usersession.getBookQuantityInCart() != 0}">
                                        <span class="text-number">
                                            ${sessionScope.usersession.getBookQuantityInCart()}
                                        </span>
                                    </c:if>
                                    <span class="text-item">
                                        Shopping Cart
                                    </span>
                                    <span class="price">
                                        $${sessionScope.usersession.getTotalPriceInCart()}
                                            <i class="fas fa-chevron-down"></i>
                                        </span>
                                    </div>
                                    <div class="cart-dropdown-block" style="text-align: center">
                                    <c:if test="${sessionScope.usersession.getCartQuantity() == 0}">
                                        <span style="margin-bottom: 1rem">There is no cart!</span>
                                    </c:if>
                                    <c:if test="${sessionScope.usersession.getCartQuantity() != 0}">
                                        <div style="height: 10rem ;overflow-y: auto">
                                            <c:forEach items="${sessionScope.usersession.carts}" var="cart">
                                                <div class=" single-cart-block ">
                                                    <div class="cart-product">
                                                        <a href="product-details.html" class="image">
                                                            <img src="${cart.book.img0}">
                                                        </a>
                                                        <div class="content">
                                                            <h3 class="title"><a href="product-details.html">${cart.book.title}</a></h3>
                                                            <p class="price">
                                                                <span class="qty">
                                                                    ${cart.quantity} book(s)
                                                                </span> 
                                                                <fmt:formatNumber value="${cart.book.getFinalCost() * cart.quantity}" pattern="0.00" var="totalprice" />
                                                                $${totalprice}
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach> 
                                        </div>
                                    </c:if>
                                    <div class=" single-cart-block ">
                                        <div class="btn-block">
                                            <a href="viewCart" class="btn">View Cart <i class="fas fa-chevron-right"></i></a>
                                            <a href="checkOut" class="btn btn--primary">Check Out <i class="fas fa-chevron-right"></i></a>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </c:if>
                    </div>
                    <!-- @include('menu.htm') -->
                </div>
            </div>
        </div>
    </div>
</div>
<div class="header-bottom">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-3">
                <nav class="category-nav   ">
                    <div>
                        <a href="javascript:void(0)" class="category-trigger"><i class="fa fa-bars"></i>Browse
                            categories</a>
                        <ul class="category-menu">

                            <c:forEach items="${listC}" var="c">
                                <li class="cat-item has-children">

                                    <a href="shop?cid=${c.id}">${c.name}</a>
                                    <ul class="sub-menu">
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
            <div class="col-lg-3">
                <div class="header-phone ">
                    <div class="icon">
                        <i class="fas fa-headphones-alt"></i>
                    </div>
                    <div class="text">
                        <p>Free Support 24/7</p>
                        <p class="font-weight-bold number">0987654321</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="main-navigation flex-lg-right">
                    <ul class="main-menu menu-right li-last-0">
                        <li class="menu-item">
                            <a href="homepage">Home</a>      
                        </li>
                        <!-- Shop -->
                        <li class="menu-item">
                            <a href="shop">shop</a>
                        </li>
                        <li class="menu-item">
                            <a href="Blog">Blog</a>
                        </li>
                        <li class="menu-item">
                            <a href="${pageContext.request.contextPath}/Contact">Contact</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://kit.fontawesome.com/ff0d738c65.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
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
    $(document).ready(function () {

        const inputField = $("#searchInput");
        const suggestionsMenu = $("#suggestions");

        // Hide the suggestions menu by default
        suggestionsMenu.hide();

        // When the input in cart-block changes
        inputField.on("input", function () {
            const inputValue = inputField.val();

            if (inputValue.trim() !== "") {
                // If the input has content, show the suggestions menu
                suggestionsMenu.show();
            } else {
                // If the input is empty, hide the suggestions menu
                suggestionsMenu.hide();
            }
        });

        $("#searchInput").on("input", function () {
            const searchQuery = $(this).val();
            if (searchQuery.trim() !== "") {
                $.ajax({
                    url: "loadBookBySearch", // Replace with your servlet URL
                    method: "GET",
                    data: {query: searchQuery},
                    success: function (data) {
                        console.log("Error: " + data);
                        $("#suggestions").html(data);
                    },
                    error: function (error) {
                        console.log("Error: " + error);
                    }
                });
            } else {
                $("#suggestions").html(""); // Clear suggestions when the input is empty
            }
        });
    });

</script>

