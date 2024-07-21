<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Slider Management</title>
    <link rel="shortcut icon" href="images/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/typography.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/responsive.css">
    <style>
        .btn-container {
            display: flex;
            justify-content: space-between;
        }
        .btn-container .btn {
            flex: 1;
            margin: 0 0.5rem;
        }
    </style>
</head>
<body>
    <div id="loading">
        <div id="loading-center">
        </div>
    </div>
    <div class="wrapper">
        <jsp:include page="./component/sidebar.jsp"></jsp:include>
        <jsp:include page="./component/header.jsp"></jsp:include>
        <div id="content-page" class="content-page">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="iq-card">
                            <div class="iq-card-header d-flex justify-content-between">
                                <div class="iq-header-title">
                                    <h4 class="card-title">All Sliders</h4>
                                </div>
                                <div class="iq-card-header-toolbar d-flex align-items-center">
                                    <a href="${pageContext.request.contextPath}/admin/slider?action=add" class="btn btn-primary">Add New Slider</a>
                                </div>
                            </div>
                            <div class="iq-card-body">
                                <div class="table-responsive">
                                    <table class="data-tables table table-striped table-bordered" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th style="width: 3%;">#</th>
                                                <th style="width: 12%;">Slider Img</th>
                                                <th style="width: 20%;">Slider Title</th>
                                                <th style="width: 30%;">Slider Description</th>
                                                <th style="width: 7%;">Status</th>
                                                <th style="width: 15%;">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${sliderList}" var="slider">
                                                <tr>
                                                    <td>${slider.id}</td>
                                                    <td>
                                                        <c:if test="${empty slider.imageUrl}">
                                                            <i style="color: grey;font-size:.8rem">No image!</i>
                                                        </c:if>
                                                        <c:if test="${not empty slider.imageUrl}">
                                                            <img class="img-fluid rounded" src="${pageContext.request.contextPath}/${slider.imageUrl}" alt="">
                                                        </c:if>
                                                    </td>
                                                    <td>${slider.title}</td>
                                                    <td>
                                                        <p class="mb-0">${slider.description}</p>
                                                    </td>
                                                    <td>
                                                        <c:if test="${slider.status == 1}">
                                                            Active
                                                        </c:if>
                                                        <c:if test="${slider.status == 0}">
                                                            Deactive
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <div class="btn-container">
                                                            <a href="${pageContext.request.contextPath}/admin/slider?action=edit&id=${slider.id}" class="btn btn-primary" data-toggle="tooltip" data-original-title="Edit" data-placement="top">
                                                                <i class="ri-pencil-line"></i>
                                                            </a>
                                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#toggleStatusModal${slider.id}" data-original-title="Toggle Status" data-placement="bottom">
                                                                <c:if test="${slider.status == 1}">
                                                                    Deactive
                                                                </c:if>
                                                                <c:if test="${slider.status == 0}">
                                                                    Active
                                                                </c:if>
                                                            </button>
                                                            <div class="modal fade" id="toggleStatusModal${slider.id}" tabindex="-1" role="dialog" aria-labelledby="toggleStatusLabel${slider.id}" aria-hidden="true">
                                                                <div class="modal-dialog" role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="toggleStatusLabel${slider.id}">Slider: ${slider.title}</h5>
                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">×</span>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            Do you want to change the status of this slider?
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                                                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/slider?action=toggle&id=${slider.id}&status=${slider.status == 1 ? 0 : 1}">
                                                                                Yes
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="./component/footer.jsp"></jsp:include>
    <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/dataTables.bootstrap4.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.appear.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.counterup.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/apexcharts.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/slick.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/smooth-scrollbar.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/lottie.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/core.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/charts.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/animated.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/kelly.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/maps.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/worldLow.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/raphael-min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/morris.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/morris.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/flatpickr.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/style-customizer.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/chart-custom.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/custom.js"></script>
</body>
</html>
