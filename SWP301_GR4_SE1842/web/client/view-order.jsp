<%-- 
    Document   : checkout
    Created on : Sep 28, 2023, 11:51:37 PM
    Author     : ACER
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="zxx">


    <!-- Mirrored from htmldemo.net/pustok/pustok/checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:17:16 GMT -->
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Bookaholic - Order</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Use Minified Plugins Version For Fast Page Load -->
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/plugins.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/main.css" />
        <link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
        <style>
            #order-detail__container #refund__btn {
                cursor: pointer
            }
            #order-detail__container #refund__btn:hover {
                color: var(--bs-link-hover-color);
            }
        </style>
    </head>

    <body>
        <div class="site-wrapper" id="top">

            <div class="site-header header-3  d-none d-lg-block">
                <jsp:include page="./component/header_0.jsp"></jsp:include>
                </div>
                <div class="site-mobile-menu">
                <jsp:include page="./component/header_1.jsp"></jsp:include>
                </div>
                <div class="sticky-init fixed-header common-sticky">
                <jsp:include page="./component/header_2.jsp"></jsp:include>
                </div>

                <section class="breadcrumb-section">
                    <h2 class="sr-only">Site Breadcrumb</h2>
                    <div class="container">
                        <div class="breadcrumb-contents">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li class="breadcrumb-item active">Checkout</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </section>
                <section class="order-complete inner-page-sec-padding-bottom">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <div class="order-complete-message text-center">
                                    <h1>Thank you !</h1>
                                    <p>Your order has been received.</p>
                                </div>
                                <ul class="order-details-list">
                                    <li>Order Number: <strong>BaH${order.id}</strong></li>
                                <li>Date: <strong>${order.orderDate}</strong></li>
                                    <fmt:formatNumber value="${order.totalPrice}" pattern="0.00" var="totalprice" />
                                <li>Total: <strong>$${totalprice}</strong></li>
                                <li>Payment Method: <strong>${order.paymethod.name} (${order.paymethod.desc})</strong></li>
                                <li>Order Status: <strong>${order.status.name}</strong></li>
                            </ul>
                            <h3 class="order-table-title">Order Details</h3>
                            <div class="table-responsive">
                                <table class="table order-details-table">
                                    <thead>
                                        <tr>
                                            <th>Product</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody><tr>
                                            <c:forEach items="${order.odList}" var="od">
                                            <tr>
                                                <td><a href="single-product.html">${od.book.title}</a> <strong>× ${od.quantity}</strong></td>
                                                <fmt:formatNumber value="${od.price}" pattern="0.00" var="totalprice" />
                                                <td><span>$${totalprice}</span></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Subtotal:</th>
                                                <fmt:formatNumber value="${order.totalPrice}" pattern="0.00" var="totalprice" />
                                            <td><span>$${totalprice}</span></td>
                                        </tr>
                                        <tr>
                                            <th>Payment Method:</th>
                                            <td>${order.paymethod.name}</td>
                                        </tr>
                                        <tr>
                                            <th>Total:</th>
                                            <td><span>$${totalprice}</span></td>
                                        </tr>
                                    </tfoot>
                                </table>
                                <c:if test="${order.status.id == 1}">
                                    <a href="${pageContext.request.contextPath}/cancel-order?oid=${order.id}" style="padding:1rem 3rem;;cursor: pointer; margin-top: 2rem" class="btn--primary">Cancel order</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div style="margin-top: 4rem;" class="row">
                        <div class="col-12">
                            <div class="row">
                                <div class="col-12">
                                    <div class="tab-content" id="myaccountContent">
                                        <h3>Your Order: </h3>
                                        <div class="myaccount-table table-responsive text-center">
                                            <table class="data-tables table table-striped table-bordered dataTable no-footer" style="width: 100%;" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info">
                                                <thead>
                                                    <tr role="row">
                                                        <th style="width: 21.2px;" class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="ascending" aria-label="No: activate to sort column descending">
                                                            #</th>
                                                        <th style="width: 90.2px;" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Book Image: activate to sort column ascending">
                                                            Customer</th>
                                                        <th style="width: 123.2px;" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Book Name: activate to sort column ascending">
                                                            Order Date</th>
                                                        <th style="width: 123.2px;" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Book Catrgory: activate to sort column ascending">
                                                            Phone number</th>
                                                        <th style="width: 121.2px;" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Book Author: activate to sort column ascending">
                                                            Address</th>
                                                        <th style="width: 155.2px;" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Book Description: activate to sort column ascending">
                                                            Payment method</th>
                                                        <th style="width: 38.2px;" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Book Price: activate to sort column ascending">
                                                            Total price</th>
                                                        <th style="width: 37.2px;" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Book pdf: activate to sort column ascending">
                                                            Status</th>
                                                        <th style="width: 48.2px;" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Action: activate to sort column ascending">
                                                            View Detail</th></tr>
                                                </thead>
                                                <tbody>
                                                    <tr role="row" class="odd">
                                                        <td class="sorting_1">BaH${order.id}</td>
                                                        <c:if test="${order.cusFullname eq null}">
                                                            <td>${order.user.fullName}</td>
                                                        </c:if>
                                                        <c:if test="${order.cusFullname ne null}">
                                                            <td>${order.cusFullname}</td>
                                                        </c:if>
                                                        <td>${order.orderDate}</td>
                                                        <td>${order.phone}</td>
                                                        <td>${order.address}</td>
                                                        <td>${order.paymethod.name}</td>
                                                        <td>$ ${order.totalPrice}</td>
                                                        <td>${order.status.name}</td>                                        
                                                        <td>
                                                            <div class="flex align-items-center list-user-action">
                                                                <div onclick="loadOrderDetail(${order.id})" data-toggle="tooltip" data-original-title="View detail" data-placement="bottom">
                                                                    <button style="background: #62ab00" type="button" class="btn btn-primary" data-toggle="modal" data-target="#orderdetail">
                                                                        Order Detail
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
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
                                                    <div style="height: 30rem; overflow-y: auto" class="modal-body">

                                                        <table class="data-tables table table-striped table-bordered dataTable no-footer" style="width: 100%;" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info">
                                                            <thead>
                                                                <tr role="row">
                                                                    <th style="width: 21.2px;" class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="ascending" aria-label="No: activate to sort column descending">
                                                                        #</th>
                                                                    <th style="width: 90.2px;" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Book Image: activate to sort column ascending">
                                                                        Product</th>
                                                                    <th style="width: 123.2px;" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Book Name: activate to sort column ascending">
                                                                        Product name</th>
                                                                    <th style="width: 123.2px;" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Book Name: activate to sort column ascending">
                                                                        Quantity</th>
                                                                    <th style="width: 121.2px;" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Book Author: activate to sort column ascending">
                                                                        Sub total</th>
                                                                    <th style="width: 121.2px;" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Book Author: activate to sort column ascending">
                                                                        Send  Feedback
                                                                    </th>
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

                                        <input id="refundingOrderDetail" type="text" value="" hidden>
                                        <div style="top: 10rem;" class="modal fade" id="refundConfirmation" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">
                                                            Why do you want to refund this product?</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">×</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body" style="height: 20rem; overflow-y: auto">
                                                        <div style="width: 100%">
                                                            <textarea required id="reasonRefundTA" style="width:100%;" placeholder="Reason"></textarea>
                                                            <span class="form-message"></span>
                                                        </div>
                                                        <div class="col-12 profile-image__container">
                                                            <div class="profile-image__buttons">
                                                                <label for="imageUpload_addrefund" class="button">
                                                                    <i class="fa-solid fa-upload"></i>
                                                                </label>
                                                            </div>
                                                            <div>
                                                                <img id="preview-image_addrefund" 
                                                                     src=""
                                                                     alt="Defect image" >
                                                            </div>
                                                            <input type="file" name="image" id="imageUpload_addrefund">
                                                        </div>
                                                        <input name="imageBase64" id="imageBase64_addrefund" hidden> 
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                        <button onclick="refundBook(document.getElementById('refundingOrderDetail').value)" type="button" class="btn btn-primary" data-dismiss="modal">Refund</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div style="top: 10rem;" class="modal fade" id="refundEdit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">
                                                            Editing refund</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">×</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body" id="refund-edit__container" style="height: 20rem; overflow-y: auto">

                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                        <button onclick="updateRefundReason(document.getElementById('refundingOrderDetail').value)" type="button" class="btn btn-primary" data-dismiss="modal">Save</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- My Account Tab Content End -->
                            </div>
                        </div>
                    </div>
                </div>

            </section>
        </div>
        <!--=================================
  Brands Slider
===================================== -->
        <section class="section-margin">
            <h2 class="sr-only">Brand Slider</h2>
            <div class="container">
                <div class="brand-slider sb-slick-slider border-top border-bottom" data-slick-setting='{
                     "autoplay": true,
                     "autoplaySpeed": 8000,
                     "slidesToShow": 6
                     }' data-slick-responsive='[
                     {"breakpoint":992, "settings": {"slidesToShow": 4} },
                     {"breakpoint":768, "settings": {"slidesToShow": 3} },
                     {"breakpoint":575, "settings": {"slidesToShow": 3} },
                     {"breakpoint":480, "settings": {"slidesToShow": 2} },
                     {"breakpoint":320, "settings": {"slidesToShow": 1} }
                     ]'>
                    <div class="single-slide">
                        <img src="image/others/brand-1.jpg" alt="">
                    </div>
                    <div class="single-slide">
                        <img src="image/others/brand-2.jpg" alt="">
                    </div>
                    <div class="single-slide">
                        <img src="image/others/brand-3.jpg" alt="">
                    </div>
                    <div class="single-slide">
                        <img src="image/others/brand-4.jpg" alt="">
                    </div>
                    <div class="single-slide">
                        <img src="image/others/brand-5.jpg" alt="">
                    </div>
                    <div class="single-slide">
                        <img src="image/others/brand-6.jpg" alt="">
                    </div>
                    <div class="single-slide">
                        <img src="image/others/brand-1.jpg" alt="">
                    </div>
                    <div class="single-slide">
                        <img src="image/others/brand-2.jpg" alt="">
                    </div>
                </div>
            </div>
        </section>
        <!--=================================
    Footer Area
===================================== -->

        <jsp:include page="./component/footer.jsp"></jsp:include>
            <script>
                document.body.addEventListener('change', function (event) {
                    // Check if the event target is one of the file inputs
                    if (event.target.matches('#imageUpload, #imageUpload_addrefund, #imageUpload-editrefund')) {
                        let previewImageId = '';
                        let imageBase64InputId = '';

                        // Identify the related preview image and hidden input based on the file input's id
                        switch (event.target.id) {
                            case 'imageUpload':
                                previewImageId = 'preview-avatar';
                                imageBase64InputId = '#imageBase64';
                                break;
                            case 'imageUpload_addrefund':
                                previewImageId = 'preview-image_addrefund';
                                imageBase64InputId = '#imageBase64_addrefund';
                                break;
                            case 'imageUpload-editrefund':
                                previewImageId = 'preview-image-editrefund';
                                imageBase64InputId = '#imageBase64-editrefund';
                                break;
                        }

                        const previewDiv = document.getElementById(previewImageId);
                        handleImageUpload(event, previewDiv, imageBase64InputId);
                    }
                });

                document.body.addEventListener('click', function (event) {
                    if (event.target.matches('#removeButton')) {
                        removeImage();
                    }
                });

                function handleImageUpload(event, previewDiv, imageBase64Input) {
                    const file = event.target.files[0];
                    const reader = new FileReader();

                    reader.onload = function (event) {
                        previewDiv.src = event.target.result;
                        document.querySelector(imageBase64Input).value = event.target.result;
                    };

                    if (file) {
                        reader.readAsDataURL(file);
                    }
                }

                function removeImage() {
                    // Update this function to cater for multiple previews and inputs if needed
                    const previewImage = document.getElementById('preview-avatar');
                    const uploadInput = document.getElementById('imageUpload');

                    previewImage.src = 'assets/profile.png';
                    uploadInput.value = null;
                    document.querySelector('#imageBase64').value = 'assets/profile.png';
                }

            </script>
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
                function refundBook(orderDetailId) {
                    $.ajax({
                        type: 'POST',
                        data: {
                            orderDetailId: orderDetailId,
                            reasonrefund: document.querySelector('#reasonRefundTA').value,
                            imageRefund: document.querySelector('#imageBase64_addrefund').value
                        },
                        url: 'refund',
                        success: function (result) {
                            alert("Request successfully!");
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert("An error occurred: " + errorThrown);
                        }
                    });
                    var modalElement = document.getElementById('orderdetail');
                    modalElement.classList.remove('show');
                    modalElement.style.display = 'none';
                    var backdrop = document.querySelector('.modal-backdrop');
                    if (backdrop) {
                        backdrop.parentNode.removeChild(backdrop);
                    }
                }
                function updateRefundReason(odid) {
                    $.ajax({
                        type: 'POST',
                        data: {
                            orderDetailId: odid,
                            reasonrefund: document.querySelector('#reasonRefundTA-edit').value,
                            imageRefund: document.querySelector('#imageBase64-editrefund').value
                        },
                        url: 'update-refund',
                        success: function (result) {
                            alert("Update successfully!");
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert("An error occurred: " + errorThrown);
                        }
                    });
                    var modalElement = document.getElementById('orderdetail');
                    modalElement.classList.remove('show');
                    modalElement.style.display = 'none';
                    var backdrop = document.querySelector('.modal-backdrop');
                    if (backdrop) {
                        backdrop.parentNode.removeChild(backdrop);
                    }
                }
                function loadRefundReason(odid) {
                    loadOrderDetailId(odid)
                    $.ajax({
                        type: 'POST',
                        data: {orderid: odid},
                        url: 'LoadRefundReason',
                        success: function (result) {
                            document.querySelector('#refund-edit__container').innerHTML = result;
                        }
                    });
                }
                function loadOrderDetailId(odid) {
                    document.querySelector('#refundingOrderDetail').value = odid;
                }
            </script>

            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <!-- Use Minified Plugins Version For Fast Page Load -->
            <script src="${pageContext.request.contextPath}/client/assets/js/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/ajax-mail.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/custom.js"></script>

        <script src="${pageContext.request.contextPath}/admin/assets/js/bootstrap.min.js"></script>
    </body>


    <!-- Mirrored from htmldemo.net/pustok/pustok/checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:17:16 GMT -->
</html>