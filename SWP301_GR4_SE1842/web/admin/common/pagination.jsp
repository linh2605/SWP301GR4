<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Pagination Controls -->
<nav>
    <ul class="pagination">
        <c:choose>
            <c:when test="${currentPage == 1}">
                <li class="page-item disabled">
                    <a class="page-link" href="#">First</a>
                </li>
                <li class="page-item active">
                    <a class="page-link" href="#">1</a>
                </li>
                <c:if test="${noOfPages > 1}">
                    <li class="page-item">
                        <a class="page-link" href="userManager?currentPage=2&role=${param.role}&gender=${param.gender}">2</a>
                    </li>
                </c:if>
                <c:if test="${noOfPages > 2}">
                    <li class="page-item">
                        <a class="page-link" href="userManager?currentPage=${noOfPages}&role=${param.role}&gender=${param.gender}">${noOfPages}</a>
                    </li>
                </c:if>
                <li class="page-item">
                    <a class="page-link" href="userManager?currentPage=${noOfPages}&role=${param.role}&gender=${param.gender}">Last</a>
                </li>
            </c:when>

            <c:when test="${currentPage == noOfPages && noOfPages > 1}">
                <li class="page-item">
                    <a class="page-link" href="userManager?currentPage=1&role=${param.role}&gender=${param.gender}">First</a>
                </li>
                <c:if test="${noOfPages > 2}">
                    <li class="page-item">
                        <a class="page-link" href="userManager?currentPage=1&role=${param.role}&gender=${param.gender}">1</a>
                    </li>
                </c:if>
                <li class="page-item">
                    <a class="page-link" href="userManager?currentPage=${noOfPages-1}&role=${param.role}&gender=${param.gender}">${noOfPages-1}</a>
                </li>
                <li class="page-item active">
                    <a class="page-link" href="#">${noOfPages}</a>
                </li>
                <li class="page-item disabled">
                    <a class="page-link" href="#">Last</a>
                </li>
            </c:when>

            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="userManager?currentPage=1&role=${param.role}&gender=${param.gender}">First</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="userManager?currentPage=${currentPage-1}&role=${param.role}&gender=${param.gender}">${currentPage-1}</a>
                </li>
                <li class="page-item active">
                    <a class="page-link" href="#">${currentPage}</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="userManager?currentPage=${currentPage+1}&role=${param.role}&gender=${param.gender}">${currentPage+1}</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="userManager?currentPage=${noOfPages}&role=${param.role}&gender=${param.gender}">Last</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</nav>
