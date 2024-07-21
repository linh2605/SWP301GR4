
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
    .material-symbols-outlined {
        font-variation-settings:
            'FILL' 0,
            'wght' 400,
            'GRAD' 0,
            'opsz' 24
    }

</style>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<!DOCTYPE html>
<html lang="zxx">


    <!-- Mirrored from htmldemo.net/pustok/pustok/cart.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:17:16 GMT -->
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>RonaldoSportShop - Cart</title>
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
                                    <li class="breadcrumb-item active">Cart</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </section>
            <c:if test="${sessionScope.usersession eq null}">
                <main class="cart-page-main-block inner-page-sec-padding-bottom">
                    <div class="cart_area cart-area-padding  ">
                        <div class="container">
                            <div class="page-section-title">
                                <h1>Shopping Cart</h1>
                                <span style="color:tomato">${unablemsg}</span>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <form action="#" class="">
                                        <!-- Cart Table -->
                                        <div class="cart-table table-responsive mb--40">
                                            <c:if test="${sessionScope.cart eq null || sessionScope.cart.getQuantity() == 0}">
                                                <span style="color:#030303">Your cart is empty!</span>
                                            </c:if>
                                            <c:if test="${sessionScope.cart ne null && sessionScope.cart.getQuantity() != 0}">
                                                <table class="table">
                                                    <!-- Head Row -->
                                                    <thead>
                                                        <tr>
                                                            <th class="pro-remove">Delete</th>
                                                            <th class="pro-title">Product</th>
                                                            <th class="pro-price">Price</th>
                                                            <th class="pro-add">Re</th>
                                                            <th class="pro-quantity">Quantity</th>
                                                            <th class="pro-add">Add</th>
                                                            <th class="pro-subtotal">Total</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${sessionScope.cart.items}" var="cart">
                                                            <tr>
                                                                <td class="pro-remove">
                                                                    <a href="AddCart?service=del&quantity=${cart.quantity - 1}&id=${cart.book.id}">
                                                                        <span class="material-symbols-outlined">
                                                                            Delete
                                                                        </span>
                                                                    </a>
                                                                </td>
                                                                <td class="pro-title">
                                                                    <a href="#">${cart.book.title}</a>
                                                                </td>
                                                                <td class="pro-price">
                                                                    <span>$${cart.book.getFinalCost()}</span>
                                                                </td>
                                                                <td class="pro-remove">
                                                                    <a href="AddCart?service=add&quantity=${cart.quantity - 1}&id=${cart.book.id}">
                                                                        <span class="material-symbols-outlined">
                                                                            Remove
                                                                        </span>
                                                                    </a>
                                                                </td>
                                                                <td class="pro-quantity">
                                                                    <div class="pro-qty">
                                                                        <div class="count-input-block">
                                                                            <input onchange="updateCartQuantity(${cart.book.id}, this)" type="number" class="form-control text-center"
                                                                                   value="${cart.quantity}">
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td class="pro-add">
                                                                    <a href="AddCart?service=add&quantity=${cart.quantity + 1}&id=${cart.book.id}">
                                                                        <span class="material-symbols-outlined">
                                                                            Add
                                                                        </span>
                                                                    </a>
                                                                </td>
                                                                <td class="pro-subtotal">
                                                                    <span>
                                                                        <fmt:formatNumber value="${cart.book.getFinalCost() * cart.quantity}" pattern="0.00" var="SubTotal" />
                                                                        $${SubTotal}
                                                                    </span>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </c:if>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:if test="${sessionScope.cart ne null && sessionScope.cart.getQuantity() != 0}">
                        <div class="cart-section-2">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-6 col-12 d-flex">
                                        <div class="cart-summary">
                                            <div class="cart-summary-wrap">
                                                <h4><span>Cart Summary</span></h4>
                                                <p>Sub Total <span class="text-primary">$${sessionScope.cart.getTotal()}</span></p>
                                                <p>Shipping Cost <span class="text-primary">$00.00</span></p>
                                                <h2>Grand Total <span class="text-primary">$${sessionScope.cart.getTotal()}</span></h2>
                                            </div>
                                            <div class="cart-summary-button">
                                                <a href="checkOut" class="checkout-btn c-btn btn--primary">Checkout</a>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </c:if>
                </main>
            </c:if>
            <c:if test="${sessionScope.usersession ne null}">
                <main class="cart-page-main-block inner-page-sec-padding-bottom">
                    <div class="cart_area cart-area-padding  ">
                        <div class="container">
                            <div class="page-section-title">
                                <h1>Shopping Cart</h1>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <form action="#" class="">
                                        <!-- Cart Table -->
                                        <div class="cart-table table-responsive mb--40">
                                            <c:if test="${sessionScope.usersession.getCartQuantity() == 0}">
                                                <span style="color:#030303">Your cart is empty!</span>
                                            </c:if>
                                            <c:if test="${sessionScope.usersession.getCartQuantity() != 0}">
                                                <table class="table">
                                                    <!-- Head Row -->
                                                    <thead>
                                                        <tr>
                                                            <th class="pro-remove">Delete</th>
                                                            <th class="pro-title">Product</th>
                                                            <th class="pro-price">Price</th>
                                                            <th class="pro-add">Re</th>
                                                            <th class="pro-quantity">Quantity</th>
                                                            <th class="pro-add">Add</th>
                                                            <th class="pro-subtotal">Total</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${sessionScope.usersession.carts}" var="cart">
                                                            <tr>
                                                                <td class="pro-remove">
                                                                    <a href="AddCart?service=del&quantity=${cart.quantity - 1}&id=${cart.book.id}">
                                                                        <span class="material-symbols-outlined">
                                                                            Delete
                                                                        </span>
                                                                    </a>
                                                                </td>
                                                                <td class="pro-title">
                                                                    <a href="#">${cart.book.title}</a>
                                                                </td>
                                                                <td class="pro-price">
                                                                    <span>$${cart.book.getFinalCost()}</span>
                                                                </td>
                                                                <td class="pro-remove">
                                                                    <a href="AddCart?service=add&quantity=${cart.quantity - 1}&id=${cart.book.id}">
                                                                        <span class="material-symbols-outlined">
                                                                            Remove
                                                                        </span>
                                                                    </a>
                                                                </td>
                                                                <td class="pro-quantity">
                                                                    <div class="pro-qty">
                                                                        <div class="count-input-block">
                                                                            <input onchange="updateCartQuantity(${cart.book.id}, this)" type="number" class="form-control text-center"
                                                                                   value="${cart.quantity}">
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td class="pro-add">
                                                                    <a href="AddCart?service=add&quantity=${cart.quantity + 1}&id=${cart.book.id}">
                                                                        <span class="material-symbols-outlined">
                                                                            Add
                                                                        </span>
                                                                    </a>
                                                                </td>
                                                                <td class="pro-subtotal">
                                                                    <span>
                                                                        <fmt:formatNumber value="${cart.book.getFinalCost() * cart.quantity}" pattern="0.00" var="SubTotal" />
                                                                        $${SubTotal}
                                                                    </span>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </c:if>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:if test="${sessionScope.usersession.getCartQuantity() != 0}">
                        <div class="cart-section-2">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-6 col-12 d-flex">
                                        <div class="cart-summary">
                                            <div class="cart-summary-wrap">
                                                <h4><span>Cart Summary</span></h4>
                                                <p>Sub Total <span class="text-primary">$${sessionScope.usersession.getTotalPriceInCart()}</span></p>
                                                <p>Shipping Cost <span class="text-primary">$00.00</span></p>
                                                <h2>Grand Total <span class="text-primary">$${sessionScope.usersession.getTotalPriceInCart()}</span></h2>
                                            </div>
                                            <div class="cart-summary-button">
                                                <a href="checkOut" class="checkout-btn c-btn btn--primary">Checkout</a>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </c:if>
                </main>
            </c:if>
        </div>
        <jsp:include page="./component/footer.jsp"></jsp:include>
            <script>
                function updateCartQuantity(bookid, param) {
                    $.ajax({
                        type: 'POST',
                        data: {id: bookid,
                            quantity: param.value,
                            service: 'add'},
                        url: 'AddCart',
                        success: function (result) {
                            window.location.reload();
                        }
                    });
                }
            </script>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <!-- Use Minified Plugins Version For Fast Page Load -->
            <script src="${pageContext.request.contextPath}/client/assets/js/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/ajax-mail.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/custom.js"></script>
    </body>
</html>