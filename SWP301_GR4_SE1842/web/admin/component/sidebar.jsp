
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Sidebar  -->
<div class="iq-sidebar">
    <div class="iq-sidebar-logo d-flex justify-content-between">
        <a href="dashboard" class="header-logo">
            <img src="images/logo.png" class="img-fluid rounded-normal" alt="">
            <div class="logo-title">
                <span class="text-primary text-uppercase">Booksto</span>
            </div>
        </a>
        <div class="iq-menu-bt-sidebar">
            <div class="iq-menu-bt align-self-center">
                <div class="wrapper-menu">
                    <div class="main-circle"><i class="las la-bars"></i></div>
                </div>
            </div>
        </div>
    </div>
    <div id="sidebar-scrollbar">
        <nav class="iq-sidebar-menu">
            <ul id="iq-sidebar-toggle" class="iq-menu">
                <li <c:if test="${currentmenu eq 'Management'}">class="active active-menu"</c:if>>
                        <a href="#admin" class="iq-waves-effect" data-toggle="collapse" aria-expanded="false"><span class="ripple rippleEffect"></span><i class="las la-home iq-arrow-left"></i><span>Management</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                        <ul id="admin" class="iq-submenu collapse <c:if test="${currentmenu eq 'Management'}">show</c:if>" data-parent="#iq-sidebar-toggle">
                        <li <c:if test="${currentpage eq 'Dashboard'}">class="active"</c:if>><a href="dashboard"><i class="las la-house-damage"></i>Dashboard</a></li>
                            <c:if test="${sessionScope.usersession.roleID != 2}">
                            <li <c:if test="${currentpage eq 'Books'}">class="active"</c:if>><a href="products"><i class="ri-file-pdf-line"></i>Products</a></li>
                            <li <c:if test="${currentpage eq 'Books Category'}">class="active"</c:if>><a href="categories"><i class="ri-function-line"></i>Product Category</a></li>
                            <li <c:if test="${currentpage eq 'Author'}">class="active"</c:if>><a href="authors"><i class="ri-book-line"></i>Author</a></li>
                            <li <c:if test="${currentpage eq 'Publisher'}">class="active"</c:if>><a href="publishers"><i class="ri-book-line"></i>Publisher</a></li>
                            </c:if>
                        <li <c:if test="${currentpage eq 'FeedbackList'}">class="active"</c:if>><a href="FeedbacksList"><i class="las la-th-list"></i>Marketing site</a></li>

                        </ul>
                    </li>
                    <li <c:if test="${currentmenu eq 'User'}">class="active active-menu"</c:if>>
                        <a href="#userinfo" class="iq-waves-effect" data-toggle="collapse" aria-expanded="false"><span class="ripple rippleEffect"></span><i class="las la-user-tie iq-arrow-left"></i><span>User</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                        <ul id="userinfo" class="iq-submenu collapse <c:if test="${currentmenu eq 'User'}">show</c:if>" data-parent="#iq-sidebar-toggle" style="">
                        <c:if test="${sessionScope.usersession.roleID == 1}">
                            <li <c:if test="${currentpage eq 'User Add'}">class="active"</c:if>><a href="users?action=add"><i class="las la-plus-circle"></i>User Add</a></li>
                            </c:if>
                        <li <c:if test="${currentpage eq 'Users'}">class="active"</c:if>><a href="users"><i class="las la-th-list"></i>User List</a></li>
                        <li <c:if test="${currentpage eq 'Orders'}">class="active"</c:if>><a href="orders"><i class="las la-th-list"></i>Orders</a></li>
                        <li <c:if test="${currentpage eq 'All refund books'}">class="active"</c:if>><a href="refunds"><i class="las la-th-list"></i>All refund books</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>