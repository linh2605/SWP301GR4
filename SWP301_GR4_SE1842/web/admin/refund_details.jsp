<%-- 
    Document   : user_list
    Created on : Oct 6, 2023, 1:38:44 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <!-- Mirrored from templates.iqonic.design/booksto/html/user-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:19:34 GMT -->
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Booksto - Responsive Bootstrap 4 Admin Dashboard Template</title>
        <!-- Favicon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/admin/assets/images/favicon.ico" />
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/bootstrap.min.css">
        <!-- Typography CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/typography.css">
        <!-- Style CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/style.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/responsive.css"><!-- Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            #image-refund__img {
                width: 100%;
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

            <jsp:include page="./component/header.jsp"></jsp:include>

                <!-- Page Content  -->
                <div id="content-page" class="content-page">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="iq-card">
                                    <div class="iq-card-header d-flex justify-content-between">
                                        <div class="iq-header-title">
                                            <h4 class="card-title">Order Information</h4>
                                        </div>
                                    </div>
                                    <div class="iq-card-body row">
                                        <div class="col-lg-12">
                                            <div class="table-responsive-sm">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Customer</th>
                                                            <th scope="col">Order Date</th>
                                                            <th scope="col">Shipping Address</th>
                                                            <th scope="col"></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                        <c:if test="${order.user eq null}">
                                                            <c:set var="customer" value="${order.cusFullname}" />
                                                        </c:if>
                                                        <c:if test="${order.user ne null}">
                                                            <c:set var="customer" value="${order.user.fullName}" />
                                                        </c:if>
                                                        <td>${customer}</td>
                                                        <td>${order.orderDate}</td>
                                                        <td>
                                                            <p class="mb-0">
                                                                ${order.address}<br>
                                                                Phone: ${order.phone}<br>
                                                                Email: ${order.cusEmail}<br>
                                                            </p>`
                                                        </td>
                                                        <td>
                                                            <div class="flex align-items-center list-user-action">
                                                                <div onclick="loadOrderDetail(${order.id})" data-toggle="tooltip" data-original-title="View detail" data-placement="bottom">
                                                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#orderdetail">
                                                                        <i class="fa-solid fa-circle-info"></i>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <!-- Modal -->
                                    <div id="orderdetail" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
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
                                                                <th style="width: 123.2px;" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Book Catrgory: activate to sort column ascending">
                                                                    Note</th>
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
                                    <div class="col-sm-12">
                                        <h5>Refund Book(s)</h5>
                                        <div class="table-responsive-sm">
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th class="text-center" scope="col">#</th>
                                                        <th scope="col">Book</th>
                                                        <th class="text-center" scope="col">Quantity</th>
                                                        <th style="width: 123.2px;" class="text-center" scope="col">Price</th>
                                                        <th style="width: 123.2px;" class="text-center" scope="col">Totals</th>
                                                        <th style="width: 123.2px;" class="text-center" scope="col">Reason</th>
                                                        <th class="text-center" scope="col">Defect image</th>
                                                        <th class="text-center" scope="col"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${refunds}" var="refund" varStatus="loopStatus">
                                                        <tr>
                                                            <th class="text-center" scope="row">${loopStatus.count}</th>
                                                            <td>
                                                                <div style="display:flex">
                                                                    <img style="width:5rem;margin-right: .8rem" src="${refund.orderDetail.book.img0}?ran=<%= Math.random() %>" >
                                                                    <h6 class="mb-0">${refund.orderDetail.book.title}</h6>
                                                                </div>
                                                            </td>
                                                            <td class="text-center">${refund.orderDetail.quantity}</td>
                                                            <td class="text-center">$ ${refund.orderDetail.book.cost}</td>
                                                            <td class="text-center"><b>$ ${refund.orderDetail.price}</b></td>
                                                            <td class="text-center">${refund.reason}</td>
                                                            <td class="text-center">
                                                                <c:if test="${refund.image eq ''}">
                                                                    <i>No image!</i>
                                                                </c:if>
                                                                <c:if test="${refund.image ne ''}">
                                                                    <div 
                                                                        style="width: 100%;height:100%; border-radius: .8rem; border: solid .1rem #000;overflow: hidden">
                                                                        <img style="object-fit: cover;width: 100%" id="myImg" 
                                                                             src="${refund.image}" 
                                                                             alt="DefectBook" 
                                                                             style="width: 100%; cursor: pointer;">
                                                                    </div>
                                                                </c:if>
                                                            </td>
                                                            <td class="text-center" id="refund-detail-action__container">
                                                                <button onclick="loadRefundDetail(${refund.orderDetail.id})"
                                                                        data-toggle="modal" data-target="#refundBookDetail" 
                                                                        type="button" 
                                                                        class="btn mb-3 btn-light">
                                                                    <i class="ri-bill-fill"></i> 
                                                                    Detail
                                                                </button>
                                                                <div id="button-refund__container${refund.orderDetail.id}">
                                                                    <c:if test="${refund.refundStatus == 1}">
                                                                        <br><button disabled type="button" class="btn mb-3 btn-primary"><i class="ri-check-line"></i>Approved</button>
                                                                    </c:if>
                                                                    <c:if test="${refund.refundStatus == 0}">
                                                                        <button data-toggle="modal" data-target="#approve-comfirmation${refund.orderDetail.id}" type="button" class="btn mb-3 btn-primary"><i class="ri-check-line"></i>Approve</button>
                                                                        <button data-toggle="modal" data-target="#decline-comfirmation${refund.orderDetail.id}" type="button" class="btn mb-3 btn-danger"><i class="ri-close-line"></i>Decline</button>
                                                                    </c:if>
                                                                    <c:if test="${refund.refundStatus == -1}">
                                                                        <button data-toggle="modal" data-target="#decline-comfirmation${refund.orderDetail.id}" type="button" class="btn mb-3 btn-danger"><i class="ri-close-line"></i>Declined</button>
                                                                    </c:if>
                                                                    <div class="modal fade" id="approve-comfirmation${refund.orderDetail.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="display: none;">
                                                                        <div class="modal-dialog" role="document">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header">
                                                                                    <h5 class="modal-title" id="exampleModalLabel">Approving refund request</h5>
                                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                        <span aria-hidden="true">×</span>
                                                                                    </button>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    By click on 'Approve' button, you will send an email to customer email to notice her/him!
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                                                    <button onclick="approveRefund(${refund.orderDetail.id}, ${order.id})" data-dismiss="modal" type="button" class="btn btn-primary">Approve</button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="modal fade" id="decline-comfirmation${refund.orderDetail.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="display: none;">
                                                                        <div class="modal-dialog" role="document">
                                                                            <form class="modal-content" action="DeclineRefund" method="POST">
                                                                                <div class="modal-header">
                                                                                    <h5 class="modal-title" id="exampleModalLabel">Approving refund request</h5>
                                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                        <span aria-hidden="true">×</span>
                                                                                    </button>
                                                                                </div>
                                                                                <div class="modal-body" style="display: flex;flex-direction: column">
                                                                                    <c:if test="${refund.refundStatus == 0}">
                                                                                        <p>Enter reason you decline this refund request!</p>
                                                                                        <input name="odid" hidden="" type="text" value="${refund.orderDetail.id}">
                                                                                        <input name="oid" hidden="" type="text" value="${order.id}">
                                                                                        <textarea name="reasonDecline" required placeholder="Reason"></textarea>
                                                                                        <input type="text" value="${order.user.id}" hidden name="uid">
                                                                                        <span style="margin-top: 1rem">This reason will be sent to this customer!</span>
                                                                                    </c:if>
                                                                                    <c:if test="${refund.refundStatus == -1}">
                                                                                        <p>Reason you decline this refund request:</p>
                                                                                        <input name="odid" hidden="" type="text" value="${refund.orderDetail.id}">
                                                                                        <textarea disabled name="reasonDecline" required placeholder="Reason">${refund.declineReason}</textarea>
                                                                                        <span style="margin-top: 1rem">This reason has been sent to customer!</span>
                                                                                    </c:if>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <c:if test="${refund.refundStatus == 0}">
                                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                                                        <button type="submit" class="btn btn-primary">Decline</button>
                                                                                    </c:if>
                                                                                    <c:if test="${refund.refundStatus == -1}">
                                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                                    </c:if>
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>

                                            <div id="refundBookDetail" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Refund detail</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">×</span>
                                                            </button>
                                                        </div>
                                                        <div style="height:30rem;overflow-y: auto" class="modal-body" id="refund-detail__container">
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
            </div>
        </div>
        <!-- Wrapper END -->
        <!-- Footer -->
        <footer class="iq-footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
                        <ul class="list-inline mb-0">
                            <li class="list-inline-item"><a href="${pageContext.request.contextPath}/admin/assets/privacy-policy.html">Privacy Policy</a></li>
                            <li class="list-inline-item"><a href="${pageContext.request.contextPath}/admin/assets/terms-of-service.html">Terms of Use</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-6 text-right">
                        Copyright 2020 <a href="${pageContext.request.contextPath}/admin/assets/#">Booksto</a> All Rights Reserved.
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer END -->
        <!-- color-customizer -->
        <div class="iq-colorbox color-fix">
            <div class="buy-button"> <a class="color-full" href="${pageContext.request.contextPath}/admin/assets/#"><i class="fa fa-spinner fa-spin"></i></a> </div>
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
                <a target="_blank" class="btn btn-primary d-block mt-3" href="${pageContext.request.contextPath}/admin/assets/#">Purchase Now</a>
            </div>
        </div>
        <!-- color-customizer END -->
        <!-- Optional JavaScript -->
        <script src="https://kit.fontawesome.com/ff0d738c65.js" crossorigin="anonymous"></script>
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/bootstrap.min.js"></script>
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

                                                                                        function loadRefundDetail(oid) {
                                                                                            $.ajax({
                                                                                                type: 'POST',
                                                                                                data: {orderdetailid: oid},
                                                                                                url: 'refund-detail',
                                                                                                success: function (result) {
                                                                                                    document.querySelector('#refund-detail__container').innerHTML = result;
                                                                                                }
                                                                                            });
                                                                                        }

                                                                                        function approveRefund(odid, oid) {
                                                                                            $.ajax({
                                                                                                type: 'POST',
                                                                                                data: {orderdetailid: odid,
                                                                                                    oid: oid},
                                                                                                url: 'refund-approving',
                                                                                                success: function (result) {
                                                                                                    window.location.reload();
                                                                                                }
                                                                                            });
                                                                                        }
        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- jQuery first, then Popper.js (for Bootstrap 4), then Bootstrap JS -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>

    <!-- Mirrored from templates.iqonic.design/booksto/html/user-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:19:34 GMT -->
</html>