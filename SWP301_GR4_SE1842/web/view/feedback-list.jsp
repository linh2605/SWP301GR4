<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Feedback List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <header>
        <%@ include file="../common/header-top-area.jsp" %>
    </header>

    <div class="container mt-5">
        <h1>User Feedback List</h1>
        
        <c:if test="${not empty feedbacks}">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Feedback ID</th>
                        <th>Product ID</th>
                        <th>Comment</th>
                        <th>Rating</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="feedback" items="${feedbacks}">
                        <tr>
                            <td>${feedback.id}</td>
                            <td>${feedback.productId}</td>
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
        <%@ include file="../common/footer.jsp" %>
    </footer>

    <!-- all js here -->
    <script src="${pageContext.request.contextPath}/js/vendor/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/vendor/bootstrap.bundle.min.js"></script>
</body>
</html>
