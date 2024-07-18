<%-- 
    Document   : orderDetail
    Created on : Jun 13, 2024, 11:41:05 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Detail</title>
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
        <style>
            .gradient-custom {
                /* fallback for old browsers */
                background: #1486D8;

                /* Chrome 10-25, Safari 5.1-6 */
                background: -webkit-linear-gradient(to top left, rgba(205, 156, 242, 1), rgba(246, 243, 255, 1));

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                background: linear-gradient(to top left, rgba(179, 209, 255,1), rgba(211, 233, 245,1))
            }
        </style>
    </head>
    <body>
        <section class="h-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-lg-10 col-xl-8">
                        <div class="card" style="border-radius: 10px;">
                            <div class="card-header px-4 py-5">
                                <a class="btn btn-primary" href="./MyOrder">Back to Order</a>
                                <h5 class="text-muted mb-0">Thanks for your Order, <span style="color: #4894ff;">${order.fullName}</span>!</h5>
                            </div>
                            <div class="card-body p-4">
                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <p class="lead fw-normal mb-0" style="color: #4894ff;">Receipt</p>
                                </div>
                                <div class="card shadow-0 border mb-4">
                                    <table border="1" id="table">
                                        <thead>
                                            <tr>
                                                <th class="w-25">Image</th>
                                                <th>Name</th>
                                                <th>Category</th>
                                                <th>Quantity</th>
                                                <th>Unit Price</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${orderItems}">
                                                <tr>
                                                    <td><img src="${item.product.image}"
                                                             class="w-50" alt="Phone"></td>
                                                    <td><p class="text-muted mb-0">${item.product.productName}</p></td>
                                                    <td><p class="text-muted mb-0 small">${item.category}</p></td>
                                                    <td><p class="text-muted mb-0 small">QTY: ${item.quantity}</p></td>
                                                    <td> <p class="text-muted mb-0 small">$${item.product.productPrice}</p></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="d-flex justify-content-between pt-2">
                                    <p class="fw-bold mb-0">Order Details</p>
                                    <p class="text-muted mb-0"><span class="fw-bold me-4">Total</span> ${order.totalPrice}</p>
                                </div>

                                <div class="d-flex justify-content-between pt-2">
                                    <p class="text-muted mb-0">Invoice Number : ${order.phone}</p>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <p class="text-muted mb-0">Invoice Date : ${order.orderDateString}</p>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <p class="text-muted mb-0">Deliver Date : ${order.deliverDateString}</p>
                                    <p class="text-muted mb-0"><span class="fw-bold me-4">Status: </span>${order.statusName}</p>
                                </div>
                            </div>
                            <div class="card-footer border-0 px-4 py-5"
                                 style="background-color: #4c5ef6; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                <div class="d-flex align-items-center justify-content-between mb-0">
                                    <c:if test="${order.statusId == 1}">
                                        <form action="./OrderDetail" method="post" onsubmit=" return  CFCancel()">
                                            <input type="hidden" name="orderID" value="${order.orderId}">
                                            <button type="submit" class="btn btn-danger">Cancel</button>
                                        </form>
                                    </c:if>
                                    <h5 class="text-white text-uppercase ">Total pay: <span class="h2 mb-0 ms-2">$ ${order.totalPrice}</span></h5>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
        <script type="text/javascript" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
        <script>
                                            jQuery(document).ready(function ($) {
                                                $('#table').DataTable();
                                            });
                                            function CFCancel() {
                                                return confirm("Do you wanna cancel this order ?")
                                            }
        </script>
    </body>
</html>
