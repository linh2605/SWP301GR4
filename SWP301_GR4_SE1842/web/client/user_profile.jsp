<%-- 
    Document   : user_profile
    Created on : Sep 28, 2023, 11:59:33 PM
    Author     : ACER
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="zxx">


    <!-- Mirrored from htmldemo.net/pustok/pustok/my-account.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:17:16 GMT -->
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>RonaldoSportShop - Profile</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Use Minified Plugins Version For Fast Page Load -->
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/plugins.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/client/assets/css/main.css" />
        <link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
        <style>
            .profile-image__container {
                width: 100%;
                display: flex;
                flex-direction: column;
                align-items: center;
                margin-bottom: 1rem;
            }
            .profile-image__container img {

            }
            .profile-image__container .button {
                width: 3rem;
                height: 3rem;
                display: flex;
                align-items: center;
                justify-content: center;
                border: .04rem solid #000;
                padding: 1rem;
                margin: .4rem;
                cursor: pointer;
            }
            .profile-image__buttons {
                display: flex;
                margin-top: .4rem;
            }
            .form-group span {
                font-size: .8rem;
                color: tomato;
            }
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
                                    <li class="breadcrumb-item active">My Account</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </section>

                <div class="page-section inner-page-sec-padding">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <div class="row">
                                    <!-- My Account Tab Menu Start -->
                                    <div class="col-lg-3 col-12">
                                        <div class="myaccount-tab-menu nav" role="tablist">
                                            <a class="active" href="#account-info" data-bs-toggle="tab"><i class="fa fa-user"></i> Account
                                                Details</a>
                                            <a href="#orders" data-bs-toggle="tab"><i class="fa fa-cart-arrow-down"></i> Orders</a>

                                            <a href="login-register.html"><i class="fas fa-sign-out-alt"></i> Logout</a>
                                        </div>
                                    </div>
                                    <!-- My Account Tab Menu End -->
                                    <!-- My Account Tab Content Start -->
                                    <div class="col-lg-9 col-12 mt--30 mt-lg--0">
                                        <div class="tab-content" id="myaccountContent">
                                            <!-- Single Tab Content Start -->
                                            <div class="tab-pane fade" id="orders" role="tabpanel">
                                                <div class="myaccount-content">
                                                    <h3>Orders</h3>
                                                    <div class="myaccount-table table-responsive text-center">
                                                    <c:if test="${oList eq null}">You don't have any order!</c:if>
                                                    <c:if test="${oList ne null}">
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
                                                                        Action</th></tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach items="${oList}" var="o">
                                                                    <tr role="row" class="odd">
                                                                        <td class="sorting_1">BaH${o.id}</td>
                                                                        <c:if test="${o.cusFullname eq null}">
                                                                            <td>${o.user.fullName}</td>
                                                                        </c:if>
                                                                        <c:if test="${o.cusFullname ne null}">
                                                                            <td>${o.cusFullname}</td>
                                                                        </c:if>
                                                                        <td>${o.orderDate}</td>
                                                                        <td>${o.phone}</td>
                                                                        <td>${o.address}</td>
                                                                        <td>${o.paymethod.name}</td>
                                                                        <td>$ ${o.totalPrice}</td>
                                                                        <td>${o.status.name}</td>                                        
                                                                        <td>
                                                                            <div class="flex align-items-center list-user-action">
                                                                                <div onclick="loadOrderDetail(${o.id})" data-toggle="tooltip" data-original-title="View detail" data-placement="bottom">
                                                                                    <button style="background: #62ab00" type="button" class="btn btn-primary" data-toggle="modal" data-target="#orderdetail">
                                                                                        Order Detail
                                                                                    </button>
                                                                                    <c:if test="${o.status.id == 1}">
                                                                                        <a href="${pageContext.request.contextPath}/cancel-order?oid=${o.id}" style="padding:1rem 3rem;;cursor: pointer; margin-top: 2rem" class="btn--primary">Cancel order</a>
                                                                                    </c:if>
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
                                                                        Book</th>
                                                                    <th style="width: 123.2px;" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Book Name: activate to sort column ascending">
                                                                        Book name</th>
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
                                                            <input type="file" name="image" id="imageUpload_addrefund" style="display:none;">
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

                                        <!-- Single Tab Content End -->
                                        <!-- Single Tab Content Start -->
                                        <div class="tab-pane fade show active" id="account-info" role="tabpanel">
                                            <div class="myaccount-content">
                                                <h3>Account Details</h3>
                                                <c:if test="${errmsgemail ne null || errmsgpass ne null }">
                                                    <div style="margin-bottom: 1rem" class="feature-box h-100">
                                                        <div class="icon">
                                                            <i style="color: tomato" class="fa-regular fa-circle-xmark"></i>
                                                        </div>
                                                        <div class="text">
                                                            <h5>Update fail</h5>
                                                            <p style="color:tomato"> ${errmsgemail}${errmsgpass}</p>
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${successmsg ne null}">
                                                    <div style="margin-bottom: 1rem" class="feature-box h-100">
                                                        <div class="icon">
                                                            <i class="fa-regular fa-circle-check"></i>
                                                        </div>
                                                        <div class="text">
                                                            <h5>Update status:</h5>
                                                            <p style="color:green"> ${successmsg}</p>
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <div class="account-details-form">
                                                    <script defer>
                                                        document.addEventListener('DOMContentLoaded', function () {
                                                            // Mong muốn của chúng ta
                                                            Validator({
                                                                form: '#profile__form',
                                                                formGroupSelector: '.form-group',
                                                                errorSelector: '.form-message',
                                                                rules: [
                                                                    Validator.isRequired('#full-name', 'Please enter your full name!'),
                                                                    Validator.isRequired('#phone', 'Please enter your phone number!'),
                                                                    Validator.isRequired('#email', 'Please enter your email address!'),
                                                                    Validator.isRequired('#address', 'Please enter your address!'),
                                                                    Validator.isRequired('#current-pwd', 'Current password is required to change information!'),
                                                                    Validator.minLengthAllowNull('#new-pwd', 8),
                                                                    Validator.isPhone('#phone', 'Invalid phone number format!'),
                                                                    Validator.isEmail('#email', 'Invalid email format!'),
                                                                    Validator.isConfirmed('#confirm-pwd', function () {
                                                                        return document.querySelector('#profile__form #new-pwd').value
                                                                    }, 'Password does not match!'),
                                                                ]
                                                            });
                                                        });
                                                    </script>
                                                    <form action="my-account" method="POST" id="profile__form">

                                                        <div class="row">
                                                            <div class="col-12 profile-image__container">
                                                                <div style="width: 5rem;height:5rem;border-radius: 50%;overflow: hidden;">
                                                                    <img style="object-fit: cover;" id="preview-avatar" 
                                                                         src="${sessionScope.usersession.avatar}"
                                                                         alt="user avatar" >
                                                                </div>
                                                                <div class="profile-image__buttons">
                                                                    <label for="imageUpload" class="button">
                                                                        <i class="fa-solid fa-upload"></i>
                                                                    </label>
                                                                    <div id="removeButton" class="button">
                                                                        <i class="fa-solid fa-trash-can"></i>
                                                                    </div>
                                                                </div>
                                                                <input type="file" name="image" id="imageUpload" style="display:none;">
                                                            </div>
                                                            <input value="${sessionScope.usersession.avatar}"                                              
                                                                   name="imageBase64" id="imageBase64" hidden=""> 
                                                            <div class="form-group col-12  mb--30">
                                                                <input name="fullname" value="${sessionScope.usersession.fullName}" id="full-name" placeholder="Full Name" type="text">
                                                                <span class="form-message"></span>
                                                            </div>
                                                            <div class="form-group col-12  mb--30">
                                                                <input name="phone" value="${sessionScope.usersession.phone}" id="phone" placeholder="Phone Number"
                                                                       type="text">
                                                                <span class="form-message"></span>
                                                            </div>
                                                            <div class="form-group col-12  mb--30">
                                                                <input name="email" value="${sessionScope.usersession.email}"
                                                                       id="email" placeholder="Email" type="email">
                                                                <span class="form-message">${errmsgemail}</span>
                                                            </div>
                                                            <div class="form-group col-12  mb--30">
                                                                <input name="address" value="${sessionScope.usersession.address}"
                                                                       id="address" placeholder="Address" type="text">
                                                                <span class="form-message"></span>
                                                            </div>
                                                            <div class="form-group col-12  mb--30">
                                                                <label for="gender">Gender</label>
                                                                <select name="gender" style="width:20%; height:2.8rem;margin-top: .4rem;" id="gender" class="custom-select btn--primary d-lg-block">
                                                                    <c:if test="${sessionScope.usersession.gender == 'Male'}">
                                                                        <c:set var="ms" value="selected" />
                                                                    </c:if>
                                                                    <c:if test="${sessionScope.usersession.gender == 'Female'}">
                                                                        <c:set var="fs" value="selected" />
                                                                    </c:if>
                                                                    <c:if test="${sessionScope.usersession.gender == 'Other'}">
                                                                        <c:set var="os" value="selected" />
                                                                    </c:if>
                                                                    <option ${ms} value="Male">Male</option>
                                                                    <option ${fs} value="Female">Female</option>
                                                                    <option ${os} value="Other">Other</option>
                                                                </select>
                                                                <span class="form-message"></span>
                                                            </div>
                                                            <div class="form-group col-12  mb--30">
                                                                <input name="crpass" id="current-pwd" placeholder="Current Password"
                                                                       type="password">
                                                                <span class="form-message">${errmsgpass}</span>
                                                            </div>
                                                            <div class="col-12  mb--30">
                                                                <h4>Password change (optional)</h4>
                                                            </div>
                                                            <div class="form-group col-lg-6 col-12  mb--30">
                                                                <input name="newpass" id="new-pwd" placeholder="New Password"
                                                                       type="password">
                                                                <span class="form-message">${errmsgnewpass}</span>
                                                            </div>
                                                            <div class="form-group col-lg-6 col-12  mb--30">
                                                                <input name="repass" id="confirm-pwd" placeholder="Confirm Password"
                                                                       type="password">
                                                                <span class="form-message"></span>
                                                            </div>
                                                            <div class="col-12">
                                                                <button type="submit" class="btn btn--primary">Save Changes</button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Single Tab Content End -->
                                    </div>
                                </div>
                                <!-- My Account Tab Content End -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
            <script src="${pageContext.request.contextPath}/admin/assets/js/form-validator.js"></script>
        <script src="https://kit.fontawesome.com/ff0d738c65.js" crossorigin="anonymous"></script>
        <!-- Use Minified Plugins Version For Fast Page Load -->
        <script src="${pageContext.request.contextPath}/client/assets/js/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/ajax-mail.js"></script>
        <script src="${pageContext.request.contextPath}/client/assets/js/custom.js"></script>



        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/bootstrap.min.js"></script>

    </body>


    <!-- Mirrored from htmldemo.net/pustok/pustok/my-account.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:17:16 GMT -->
</html>
