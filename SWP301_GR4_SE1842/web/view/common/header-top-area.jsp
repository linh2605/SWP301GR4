<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="header-top-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4">
                <a href="${pageContext.request.contextPath}/view/home" class="header-top-left">
                    <p>Home</p>
                </a>
            </div>
            <div class="col-lg-8 col-md-8 col-12">
                <div class="header-link">
                    <ul>
                        <li><a href="#" data-toggle="modal" data-target="#myModalProfile">My Account</a></li>
                        <li><a href="wishlist.html">My Wish List</a></li>
                        <c:if test="${sessionScope.usersession != null}">
                            <li><a href="${pageContext.request.contextPath}/view/feedback-list">My Feedback</a></li>
                        </c:if>
                        <c:if test="${sessionScope.usersession == null}">
                            <li><a href="/SWP301_GR4_SE1842/auth/login">Sign In</a></li>
                        </c:if>
                        <c:if test="${sessionScope.usersession != null}">
                            <li><a href="#">Hello <strong>${sessionScope.usersession.fullName}</strong></a></li>
                            <li><a href="${pageContext.request.contextPath}/view/my-order">My Order</a></li>
                        </c:if>
                        <li><a href="#">US Dollar<i class="fa fa-angle-down"></i></a>
                            <div class="dollar-submenu">
                                <ul>
                                    <li><a href="#">EUR</a></li>
                                </ul>
                            </div>
                        </li>
                        <c:if test="${sessionScope.usersession != null}">
                            <li>
                                <button type="button" class="btn btn-primary" onclick="logout()">
                                    <a href="${pageContext.request.contextPath}/logout">Logout</a>
                                </button>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
