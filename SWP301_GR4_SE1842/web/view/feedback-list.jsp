<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Angara - Organic Sports Store HTML Template </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

    </head>
    <body class="home-3">
        <header>
            <!-- header-top-area-start -->
            <jsp:include page= "common/header-top-area.jsp"></jsp:include>
                <!-- header-top-area-end -->

    <div class="container mt-5">
        <h1>User Feedback List</h1>
        
        <c:if test="${not empty feedbacks}">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Feedback ID</th>
                        <th>Product</th>
                        <th>Comment</th>
                        <th>Rating</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="feedback" items="${feedbacks}">
                        <tr>
                            <td>${feedback.feedbackID}</td>
                            <td> 
                                <a href="${pageContext.request.contextPath}/view/product?pId=${feedback.product.productID}"> ${feedback.product.productName}</a>
                            </td>
                            <td>${feedback.comment}</td>
                            <td>${feedback.rating}</td>
                            <td>${feedback.feedbackDate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <c:if test="${currentPage > 1}">
                        <li class="page-item">
                            <a class="page-link" href="?page=${currentPage - 1}">Previous</a>
                        </li>
                    </c:if>
                    
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                            <a class="page-link" href="?page=${i}">${i}</a>
                        </li>
                    </c:forEach>
                    
                    <c:if test="${currentPage < totalPages}">
                        <li class="page-item">
                            <a class="page-link" href="?page=${currentPage + 1}">Next</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </c:if>
        
        <c:if test="${empty feedbacks}">
            <p>No feedback found.</p>
        </c:if>
    </div>

    <footer>
        <%@ include file="common/footer.jsp" %>
    </footer>

    <!-- all js here -->
    <script src="${pageContext.request.contextPath}/js/vendor/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/vendor/bootstrap.bundle.min.js"></script>
</body>
</html>
