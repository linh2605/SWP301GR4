<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header-min-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3  col-12">
                <!-- logo-area-start -->
                <div class="logo-area">
                    <a href="home"><img src="${pageContext.request.contextPath}/img/logo/1.png" alt="logo" /></a>
                </div>
                <!-- logo-area-end -->
            </div>
            <div class="col-lg-9 col-md-9  ">
                <div class="header-search">
                    <form action="products" method="get">
                        <div class="input-group" style="width: 80%">
                            <input style="width: 80%" type="text" class="form-control" name="search" placeholder="Enter name to search" value="${param.search}">
                            <input type="hidden" name="page" value="${currentPage}">
                            <input type="hidden" name="brandId" value="${sessionScope.currBrand}" />
                            <input type="hidden" name="catId" value="${sessionScope.currCate}" />
                        </div>
                    </form>
                </div>
                <div class="shopping-area">
                    <ul>
                        <li class="number"><a href="#"><i class="fa fa-shopping-cart"></i>My Cart</a>
                            <c:if test="${sessionScope.carts != null}">
                                <span>
                                    ${sessionScope.carts.size()}
                                </span>
                            </c:if>
                            <div class="shopping-cart">
                                <c:set var="totalPrice" value="0" />
                                <c:if test="${sessionScope.carts != null}">
                                    <c:forEach items="${sessionScope.carts}" var="cart"  varStatus="status">
                                        <div class="cart-list">
                                            <div class="cart-img">
                                                <a href="#" title="${cart.product.productName}"><img src="${cart.product.image}" /></a>
                                            </div>
                                            <div class="cart-info">
                                                <h4><a href="#">${cart.product.productName}</a></h4>
                                                <div class="cart-price">
                                                    <span class="price">$${cart.product.productPrice}</span>
                                                </div>
                                            </div>
                                            <div class="pro-del">
                                                <form action="AddToCartController" method="POST">
                                                    <input type="text" hidden value="removeCart" name="isRemove" />
                                                    <input type="text" hidden value="${status.index}" name="index" />
                                                    <button>
                                                        <i class="fa fa-times-circle-o"></i>
                                                    </button>

                                                </form>
                                            </div>
                                        </div>
                                        <c:set var="totalPrice" value="${totalPrice + cart.product.productPrice}" />
                                    </c:forEach>
                                </c:if>

                                <div class="mini-cart-total">
                                    <span>Subtotal</span>
                                    <span class="total-price">$ ${totalPrice}</span>
                                </div>
                                <div class="cart-button">
                                    <a href="#" title="Cart">View Cart</a>
                                    <a href="#" title="Checkout" class="right">Checkout</a>
                                </div>
                            </div>
                        </li>
                        <li><a href="#"><i class="fa fa-heart-o"></i>Wishlist</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>