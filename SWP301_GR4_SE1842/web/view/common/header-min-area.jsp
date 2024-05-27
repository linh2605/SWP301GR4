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
                    <form action="home" method="get">
                        <div class="input-group" style="width: 80%">
                            <input style="width: 80%" type="text" class="form-control" name="search" placeholder="Enter name to search" value="${param.search}">
                            <input type="hidden" name="page" value="${currentPage}">
                        </div>
                    </form>
                </div>
                <div class="shopping-area">
                    <ul>
                        <li class="number"><a href="#"><i class="fa fa-shopping-cart"></i>My Cart</a><span>2</span>
                            <div class="shopping-cart">
                                <div class="cart-list">
                                    <div class="cart-img">
                                        <a href="#" title="Apple Iphone 5s"><img src="${pageContext.request.contextPath}/img/product/1.jpg" alt="mobile" /></a>
                                    </div>
                                    <div class="cart-info">
                                        <h4><a href="#">Standin AC1</a></h4>
                                        <div class="cart-price">
                                            <span class="price">$60.00</span>
                                        </div>
                                    </div>
                                    <div class="pro-del">
                                        <a href="#"><i class="fa fa-times-circle-o"></i></a>
                                    </div>
                                </div>
                                <div class="cart-list">
                                    <div class="cart-img">
                                        <a href="#" title="Apple Iphone 5s"><img src="${pageContext.request.contextPath}/img/product/4.jpg" alt="mobile" /></a>
                                    </div>
                                    <div class="cart-info">
                                        <h4><a href="#">Impulse Duffle</a></h4>
                                        <div class="cart-price">
                                            <span class="price">$50.00</span>
                                        </div>
                                    </div>
                                    <div class="pro-del">
                                        <a href="#"><i class="fa fa-times-circle-o"></i></a>
                                    </div>
                                </div>
                                <div class="mini-cart-total">
                                    <span>Subtotal</span>
                                    <span class="total-price">$598.00</span>
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