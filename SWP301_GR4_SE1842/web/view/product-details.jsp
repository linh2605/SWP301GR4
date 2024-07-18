<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Product Details</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" crossorigin="anonymous" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">

        <style>
            .product-details {
                margin-top: 20px;
            }

            .product-image {
                width: 100%;
                height: auto;
            }

            .product-info {
                margin-top: 20px;
            }

            .product-name {
                font-size: 1.5em;
                font-weight: bold;
            }

            .product-price {
                color: #febd69;
                font-size: 1.2em;
                margin: 10px 0;
            }

            .product-description {
                margin-top: 20px;
            }

            .feedback {
                margin-top: 40px;
            }

            .feedback-item {
                border-bottom: 1px solid #e1e1e1;
                padding: 10px 0;
            }

            .feedback-item:last-child {
                border-bottom: none;
            }

            .feedback-item h5 {
                margin: 0;
                font-weight: bold;
            }

            .feedback-item p {
                margin: 5px 0;
            }
            .star-rating {
                display: flex;
                flex-direction: row-reverse;
                justify-content: flex-end;
            }

            .star-rating input[type="radio"] {
                display: none;
            }

            .star-rating label {
                font-size: 2em;
                color: lightgray;
                cursor: pointer;
            }

            .star-rating input[type="radio"]:checked ~ label {
                color: gold;
            }

            .star-rating label:hover,
            .star-rating label:hover ~ label {
                color: gold;
            }
        </style>
    </head>

    <body>

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

            <div class="container product-details">
                <div class="row">
                    <div class="col-md-6">
                        <img class="product-image" src="${product.image}" alt="${product.productName}" />
                </div>
                <div class="col-md-6 product-info">
                    <div class="product-name">${product.productName}</div>
                    <div class="product-price">$ ${product.productPrice}</div>
                    <div class="product-rating">
                        ${product.productRating}<i class="fa-solid fa-star"></i>
                    </div>
                    <div class="product-description">
                        <p>${product.productDesc}</p>
                    </div>
                    <div class="product-actions">
                        <form action="AddToCartController" method="POST" style="display: inline;">
                            <input type="text" value="${product.productID}" name="pId" hidden />
                            <button type="submit" class="btn btn-primary">Add to Cart</button>
                        </form>
                        <form action="AddToWishlistController" method="POST" style="display: inline;">
                            <input type="text" value="${product.productID}" name="pId" hidden />
                            <button type="submit" class="btn btn-danger">Add to Wishlist</button>
                        </form> 
                    </div>
                </div>
            </div>

            <div class="row feedback">
                <h3>Feedback</h3>
                <c:if test="${not empty sessionScope.notification}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert" style="text-align: center">
                        ${sessionScope.notification}
                        <button type="button" class="btn-danger" data-dismiss="alert" aria-label="Close">x</button>
                    </div>
                    <%
                        // Clear the notification after displaying it
                        session.removeAttribute("notification");
                    %>
                </c:if>
                <c:if test="${not empty sessionScope.notificationErr}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert"  style="text-align: center">
                        ${sessionScope.notificationErr}
                        <button type="button" class="btn-danger" data-dismiss="alert" >x</button>
                    </div>
                    <%
                        // Clear the notification after displaying it
                        session.removeAttribute("notificationErr");
                    %>
                </c:if>
                <button class="btn btn-primary col-md-2"data-toggle="modal" data-target="#add">Add feedback</button>
                <c:if test="${feedbackList == null || feedbackList.size() == 0}">
                    <p>No feedback available for this product.</p>
                </c:if>
                <c:forEach items="${feedbackList}" var="feedback">
                    <div class="feedback-item">
                        <h5>${feedback.user.fullName}</h5>
                        <div class="feedback-rating">
                            ${feedback.rating}<i class="fa-solid fa-star"></i>
                        </div>
                        <p>${feedback.content}</p>
                    </div>
                </c:forEach>

            </div>
        </div>
        <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <c:if test="${usersession != null}">


                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addModalLabel">Add new Feedback</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <form name="taskForm" id="taskForm" action="product" method="POST" onsubmit="return validateForm()">
                            <div class="modal-body">
                                <input class="form-control" type="hidden" name="action" value="add">
                                <input class="form-control" type="hidden" name="pid" value="${param.pId}">
                                <label class="form-text">Rating</label>
                                <div class="star-rating">
                                    <input type="radio" id="5-stars" name="rating" value="5">
                                    <label for="5-stars" class="star">&#9733;</label>
                                    <input type="radio" id="4-stars" name="rating" value="4">
                                    <label for="4-stars" class="star">&#9733;</label>
                                    <input type="radio" id="3-stars" name="rating" value="3">
                                    <label for="3-stars" class="star">&#9733;</label>
                                    <input type="radio" id="2-stars" name="rating" value="2">
                                    <label for="2-stars" class="star">&#9733;</label>
                                    <input type="radio" id="1-star" name="rating" value="1">
                                    <label for="1-star" class="star">&#9733;</label>
                                </div>
                                <span id="ratingError" style="color: red; display: none">Please select a rating.</span>
                                <br
                                <label class="form-text">Content</label>
                                <textarea class="form-control" style="height: 200px" name="content" placeholder="Enter content description"></textarea>
                                <span id="descriptionError" style="color: red; font-size: smaller"></span>

                                <!-- Star Rating -->

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-success btn-sm">Add</button>
                            </div>
                        </form>
                    </div>
                </c:if>
                <c:if test="${usersession == null}">

                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addModalLabel">Add new Feedback</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>

                        <div class="modal-body">
                            <hp class="modal-title" id="addModalLabel">Please login to add new feedback</hp>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>

                        </div>


                    </div>
                </c:if>
            </div>
        </div>
        <footer>
            <jsp:include page="common/footer.jsp"></jsp:include>
            </footer>
            <script src="${pageContext.request.contextPath}/js/vendor/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
        <script>
                            function validateForm() {
                                const ratingChecked = document.querySelector('input[name="rating"]:checked');
                                const ratingError = document.getElementById('ratingError');

                                if (!ratingChecked) {
                                    ratingError.style.display = 'block';
                                    return false;
                                } else {
                                    ratingError.style.display = 'none';
                                }
                                return true;
                            }
        </script>
    </body>

</html>