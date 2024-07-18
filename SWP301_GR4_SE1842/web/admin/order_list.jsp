<%-- 
    Document   : book_list
    Created on : Sep 29, 2023, 3:39:38 AM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!doctype html>
<html lang="en">

    <!-- Mirrored from templates.iqonic.design/booksto/html/admin-books.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:19:32 GMT -->
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Bookaholic - List of books</title>
        <!-- Favicon -->
        <link rel="shortcut icon" href="images/favicon.ico" />
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/dataTables.bootstrap4.min.css">
        <!-- Typography CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/typography.css">
        <!-- Style CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/style.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/responsive.css">
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
                                            <h4 class="card-title">All orders</h4>
                                        </div>
                                    </div>
                                <c:if test="${msg ne null}">
                                    <div class="alert text-white bg-primary" role="alert">
                                        <div class="iq-alert-text">${msg}</div>
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <i class="ri-close-line"></i>
                                        </button>
                                    </div>
                                </c:if>
                                <c:if test="${errmsg ne null}">
                                    <div class="alert text-white bg-danger" role="alert">
                                        <div class="iq-alert-icon">
                                            <i class="ri-information-line"></i>
                                        </div>
                                        <div class="iq-alert-text">${errmsg}</div>
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <i class="ri-close-line"></i>
                                        </button>
                                    </div>
                                </c:if>

                                <div class="iq-card-body">
                                    <div class="table-responsive">
                                        <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">

                                            <div class="row">
                                                <div style="font-size: 15px" class="col-sm-12">
                                                    <c:if test="${oCount == 0}">
                                                        <span> There is no order </span>
                                                    </c:if>
                                                    <c:if test="${oCount != 0}">
                                                        <table class="data-tables table table-striped table-bordered dataTable no-footer" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info">
                                                            <thead>
                                                                <tr role="row">
                                                                    <th>#</th>
                                                                    <th>Customer</th>
                                                                    <th>Order Date</th>
                                                                    <th>Phone number</th>
                                                                    <th>Email</th>
                                                                    <th>Address</th>
                                                                    <th>Payment method</th>
                                                                    <th>Total price</th>
                                                                    <th>Status</th>
                                                                    <th>Delivered Date</th>
                                                                    <th>View order detail</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>

                                                                <c:forEach items="${oList}" var="o">
                                                                    <tr role="row" class="odd">
                                                                        <td class="sorting_1">${o.id}</td>
                                                                        <c:if test="${o.cusFullname ne null}">
                                                                            <td>${o.cusFullname}</td>
                                                                        </c:if>
                                                                        <c:if test="${o.cusFullname eq null}">
                                                                            <td>${o.user.fullName}</td>
                                                                        </c:if>
                                                                        <td>${o.orderDate}</td>
                                                                        <td>${o.phone}</td>
                                                                        <td>${o.cusEmail}</td>
                                                                        <td>${o.address}</td>
                                                                        <td>${o.paymethod.name}</td>
                                                                        <td>$ ${o.totalPrice}</td>
                                                                        <td>
                                                                            <c:if test="${o.status.id eq '3'}">
                                                                                <c:set var="disabled" value="disabled" />
                                                                            </c:if>
                                                                            <c:if test="${o.status.id ne '3'}">
                                                                                <c:set var="disabled" value="" />
                                                                            </c:if>
                                                                            <select onchange="updateOrderStatus(this, ${o.id})" ${disabled}>
                                                                                <c:forEach items="${sList}" var="p">
                                                                                    <c:if test="${o.status.id eq p.id}">
                                                                                        <c:set var="selected" value="selected" />
                                                                                    </c:if>
                                                                                    <c:if test="${o.status.id ne p.id}">
                                                                                        <c:set var="selected" value="" />
                                                                                    </c:if>
                                                                                    <option ${disabled} ${selected} value="${p.id}">${p.name}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </td> 
                                                                        <td>${o.deliverDate}</td>                                       
                                                                        <td>
                                                                            <div class="flex align-items-center list-user-action">
                                                                                <div onclick="loadOrderDetail(${o.id})" data-toggle="tooltip" data-original-title="View detail" data-placement="bottom">
                                                                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#orderdetail">
                                                                                        <i class="fa-solid fa-circle-info"></i>
                                                                                    </button>
                                                                                </div>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Modal -->
                                    <div id="orderdetail" class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog modal-xl">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Order detail</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">×</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">

                                                    <table class="data-tables table table-striped table-bordered dataTable no-footer" style="width: 100%;" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info">
                                                        <thead>
                                                            <tr role="row">
                                                                <th style="width: 21.2px;" class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="ascending" aria-label="No: activate to sort column descending">
                                                                    #</th>
                                                                <th style="width: 90.2px;" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Book Image: activate to sort column ascending">
                                                                    Book</th>
                                                                <th style="width: 123.2px;" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Book Name: activate to sort column ascending">
                                                                    Book name</th>
                                                                <th style="width: 123.2px;" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Book Name: activate to sort column ascending">
                                                                    Quantity</th>
                                                                <th style="width: 121.2px;" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Book Author: activate to sort column ascending">
                                                                    Sub total</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="order-detail__container">

                                                        </tbody>
                                                    </table>



                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                        </div>
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
                        <h3 class="iq-font-black">Booksto Awesome Color</h3>
                        <p>This color combo available inside whole template. You can change on your wish, Even you can create your own with limitless possibilities! </p>
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
            <script src="https://kit.fontawesome.com/ff0d738c65.js" crossorigin="anonymous"></script>
            <!-- jQuery first, then Popper.js, then Bootstrap JS -->
            <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/dataTables.bootstrap4.min.js"></script>
        <!-- Appear JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.appear.js"></script>
        <!-- Countdown JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/countdown.min.js"></script>
        <!-- Counterup JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.counterup.min.js"></script>
        <!-- Wow JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/wow.min.js"></script>
        <!-- Apexcharts JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/apexcharts.js"></script>
        <!-- Slick JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/slick.min.js"></script>
        <!-- Select2 JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/select2.min.js"></script>
        <!-- Owl Carousel JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/owl.carousel.min.js"></script>
        <!-- Magnific Popup JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.magnific-popup.min.js"></script>
        <!-- Smooth Scrollbar JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/smooth-scrollbar.js"></script>
        <!-- lottie JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/lottie.js"></script>
        <!-- am core JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/core.js"></script>
        <!-- am charts JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/charts.js"></script>
        <!-- am animated JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/animated.js"></script>
        <!-- am kelly JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/kelly.js"></script>
        <!-- am maps JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/maps.js"></script>
        <!-- am worldLow JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/worldLow.js"></script>
        <!-- Raphael-min JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/raphael-min.js"></script>
        <!-- Morris JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/morris.js"></script>
        <!-- Morris min JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/morris.min.js"></script>
        <!-- Flatpicker Js -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/flatpickr.js"></script>
        <!-- Style Customizer -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/style-customizer.js"></script>
        <!-- Chart Custom JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/chart-custom.js"></script>
        <!-- Custom JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/custom.js"></script>
        <script>
                                                                                function loadOrderDetail(param) {
                                                                                    $.ajax({
                                                                                        type: 'POST',
                                                                                        data: {orderid: param},
                                                                                        url: 'LoadOrderDetailJQuery',
                                                                                        success: function (result) {
                                                                                            document.querySelector('#order-detail__container').innerHTML = result;
                                                                                        }
                                                                                    });
                                                                                }
                                                                                function updateOrderStatus(select, oid) {
                                                                                    $.ajax({
                                                                                        type: 'POST',
                                                                                        data: {
                                                                                            oid: oid,
                                                                                            sid: select.value
                                                                                        },
                                                                                        url: 'UpdateOrderStatusJquery',
                                                                                        success: function (result) {
                                                                                            window.location.reload();
                                                                                        }
                                                                                    });
                                                                                }
        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </body>

    <!-- Mirrored from templates.iqonic.design/booksto/html/admin-books.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:19:33 GMT -->
</html>