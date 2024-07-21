<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Sport Shop Online</title>
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
    <!-- loader Start -->
    <div id="loading">
        <div id="loading-center">
        </div>
    </div>
    <!-- loader END -->
    <!-- Wrapper Start -->
    <div class="wrapper">
        <jsp:include page="./component/sidebar.jsp"></jsp:include>
        <!-- TOP Nav Bar -->
        <jsp:include page="./component/header.jsp"></jsp:include>
        <!-- TOP Nav Bar END -->
        <!-- Page Content  -->
        <div id="content-page" class="content-page">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="iq-card">
                            <div class="iq-card-header d-flex justify-content-between">
                                <div class="iq-header-title">
                                    <h4 class="card-title">All products</h4>
                                </div>
                                <div class="iq-card-header-toolbar d-flex align-items-center">
                                    <a href="products?action=add" class="btn btn-primary">Add New Products</a>
                                </div>
                            </div>
                            <div class="iq-card-body">
                                <div class="table-responsive">
                                    <table class="data-tables table table-striped table-bordered" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th style="width: 3%;">#</th>
                                                <th style="width: 12%;">Product Img</th>
                                                <th style="width: 15%;">Product Name</th>
                                                <th style="width: 15%;">Product Category</th>
                                                <th style="width: 15%;">Product Designer</th>
                                                <th style="width: 15%;">Product Brands</th>
                                                <th style="width: 18%;">Product Description</th>
                                                <th style="width: 7%;">Product Price</th>
                                                <th style="width: 7%;">Product Stock</th>
                                                <th style="width: 7%;">Status</th>
                                                <th style="width: 15%;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${bList}" var="b">
                                                <tr>
                                                    <td>${b.id}</td>
                                                    <td>
                                                        <c:if test="${empty b.iList && b.img0 eq ''}">
                                                            <i style="color: grey;font-size:.8rem">No image!</i>
                                                        </c:if>
                                                        <img class="img-fluid rounded" src="${b.img0}?ran=${Math.random()}" alt="">
                                                    </td>
                                                    <td>${b.title}</td>
                                                    <td>
                                                        <c:forEach items="${b.scList}" var="sc">
                                                            ${sc.name}, 
                                                        </c:forEach>
                                                    </td>
                                                    <td>${b.author.name}</td>
                                                    <td>${b.publisher.name}</td>
                                                    <td>
                                                        <p class="mb-0">${b.desc}</p>
                                                    </td>
                                                    <td>${b.cost}</td>
                                                    <td>${b.stock}</td>  
                                                    <td>
                                                        <c:if test="${b.status == 1}">
                                                            Active
                                                        </c:if>
                                                        <c:if test="${b.status == 0}">
                                                            Deactive
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <div class="btn-container">
                                                            <div data-toggle="tooltip" data-original-title="Edit" data-placement="top">
                                                                <a href="products?action=view&bookid=${b.id}" title="">
                                                                    <button type="button" class="btn btn-primary">
                                                                        Edit
                                                                    </button>
                                                                </a>
                                                            </div>
                                                            <div data-toggle="tooltip" data-original-title="Change Status" data-placement="bottom">
                                                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#statusModal${b.id}">
                                                                    <c:if test="${b.status == 1}">
                                                                        Deactivate   
                                                                    </c:if>
                                                                    <c:if test="${b.status == 0}">
                                                                        Activate
                                                                    </c:if>
                                                                </button>
                                                                <!-- Modal -->
                                                                <div class="modal fade" id="statusModal${b.id}" tabindex="-1" role="dialog" aria-labelledby="statusLabel" aria-hidden="true">
                                                                    <div class="modal-dialog" role="document">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="statusLabel">Book: ${b.title}</h5>
                                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                    <span aria-hidden="true">×</span>
                                                                                </button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                Do you want to change the status of this product?
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                                                                <c:if test="${b.status == 1}">
                                                                                    <a class="btn btn-primary" href="products?action=delete&bookid=${b.id}">
                                                                                        Yes
                                                                                    </a>
                                                                                </c:if>
                                                                                <c:if test="${b.status == 0}">
                                                                                    <a class="btn btn-primary" href="products?action=reactivate&bookid=${b.id}">
                                                                                        Yes
                                                                                    </a>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>
                                                                    </div>
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
    <!-- Wrapper END -->
    <!-- Footer -->
    <jsp:include page="./component/footer.jsp"></jsp:include>
    <!-- Footer END -->
    <!-- color-customizer -->
    <div class="iq-colorbox color-fix">
        <div class="buy-button"> <a class="color-full" href="#"><i class="fa fa-spinner fa-spin"></i></a> </div>
        <div id="right-sidebar-scrollbar" class="iq-colorbox-inner">
            <div class="clearfix color-picker">
                <h3 class="iq-font-black">Sports to Awesome Color</h3>
                <p>This color combo available inside the whole template. You can change on your wish, Even you can create your own with limitless possibilities!</p>
                <ul class="iq-colorselect clearfix">
                    <li class="color-1 iq-colormark" data-style="color-1"></li>
                    <li class="color-2" data-style="iq-color-2"></li>
                    <li class="color-3" data-style="iq-color-3"></li>
                    <li class="color-4" data-style="iq-color-4"></li>
                    <li class="color-5" data-style="iq-color-5"></li>
                    <li class="color-6" data-style="iq-color-6"></li>
                    <li class="color-7" data-style="iq-color-7"></li>
                    <li class="color-8" data-style="iq-color-8"></li>
                    <li class="color-9" data-style="iq-color-9"></li>
                    <li class="color-10" data-style="iq-color-10"></li>
                    <li class="color-11" data-style="iq-color-11"></li>
                    <li class="color-12" data-style="iq-color-12"></li>
                    <li class="color-13" data-style="iq-color-13"></li>
                    <li class="color-14" data-style="iq-color-14"></li>
                    <li class="color-15" data-style="iq-color-15"></li>
                    <li class="color-16" data-style="iq-color-16"></li>
                    <li class="color-17" data-style="iq-color-17"></li>
                    <li class="color-18" data-style="iq-color-18"></li>
                    <li class="color-19" data-style="iq-color-19"></li>
                    <li class="color-20" data-style="iq-color-20"></li>
                </ul>
                <a target="_blank" class="btn btn-primary d-block mt-3" href="#">Purchase Now</a>
            </div>
        </div>
    </div>
    <!-- color-customizer END -->
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
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
