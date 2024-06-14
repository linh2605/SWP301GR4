<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">      
        <title>Admin Dashboard</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .stat-card {
                margin-bottom: 20px;
            }
            .stat-card .card-body {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                color: #fff;
                height: 200px; /* Đảm bảo các khối có chiều cao bằng nhau */
            }
            .stat-card .card-body h5 {
                margin-bottom: 15px;
                font-size: 1.25rem;
            }
            .stat-card .card-body p {
                margin: 0;
                font-size: 1rem;
            }
            .bg-success {
                background-color: #28a745 !important;
            }
            .bg-danger {
                background-color: #dc3545 !important;
            }
            .bg-info {
                background-color: #17a2b8 !important;
            }
            .bg-warning {
                background-color: #ffc107 !important;
            }
            .bg-primary {
                background-color: #007bff !important;
            }
        </style>
    </head>
    <body>
<div class="container mt-5">
                <div class="d-flex justify-content-between mb-4">
                <h1>Admin Dashboard</h1>
                <a href="http://localhost:8080/SWP301_GR4_SE1842/view/home" class="btn btn-info">Home</a>
            </div>
            <form method="get" action="adminDashboard">
                <div class="form-row">
                    <div class="form-group col-md-5">
                        <label for="startDate">Start Date</label>
                        <input type="date" class="form-control" id="startDate" name="startDate" value="${startDate}">
                    </div>
                    <div class="form-group col-md-5">
                        <label for="endDate">End Date</label>
                        <input type="date" class="form-control" id="endDate" name="endDate" value="${endDate}">
                    </div>
                    <div class="form-group col-md-2 align-self-end">
                        <button type="submit" class="btn btn-primary">Filter</button>
                    </div>
                    <div class="form-group col-md-2 align-self-end">
                        <a href="http://localhost:8080/SWP301_GR4_SE1842/admin/userManager" class="btn btn-secondary btn-wider">UserList</a>
                    </div>
                </div>
            </form>

            <div class="row">
                <div class="col-md-3 stat-card">
                    <div class="card bg-success">
                        <div class="card-body">
                            <h5 class="card-title">New Orders</h5>
                            <p class="card-text">Success: ${stats.successOrders}</p>
                            <p class="card-text">Cancelled: ${stats.cancelledOrders}</p>
                            <p class="card-text">Submitted: ${stats.submittedOrders}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 stat-card">
                    <div class="card bg-primary">
                        <div class="card-body">
                            <h5 class="card-title">Revenues</h5>
                            <p class="card-text">Total: ${stats.totalRevenue}</p>
                            <p class="card-text">By Category:</p>
                            <ul class="list-unstyled">
                                <c:forEach var="categoryRevenue" items="${stats.revenueByCategory}">
                                    <li>${categoryRevenue.categoryName}: ${categoryRevenue.revenue}</li>
                                    </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 stat-card">
                    <div class="card bg-warning">
                        <div class="card-body">
                            <h5 class="card-title">Customers</h5>
                            <p class="card-text">Newly Registered: ${stats.newCustomers}</p>
                            <p class="card-text">Newly Bought: ${stats.newBoughtCustomers}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 stat-card">
                    <div class="card bg-info">
                        <div class="card-body">
                            <h5 class="card-title">Feedbacks</h5>
                            <p class="card-text">Average Rating: ${stats.averageRating}</p>
                            <p class="card-text">Total Feedbacks: ${stats.totalFeedbacks}</p>
                        </div>
                    </div>
                </div>
            </div>

            <h3 class="mt-5">Top Products</h3>
            <div class="row">
                <div class="col-md-12">
                    <ul class="list-group">
                        <c:forEach var="product" items="${topProducts}">
                            <li class="list-group-item">
                                ${product.productName} - Total Quantity: ${product.totalQuantity}
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            const ctx = document.getElementById('orderTrendChart').getContext('2d');
            const orderTrendChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: [<c:forEach var="date" items="${stats.orderTrendDates}">${date}, </c:forEach>],
                    datasets: [{
                            label: 'Total Orders',
                            data: [<c:forEach var="count" items="${stats.orderTrendCounts}">${count}, </c:forEach>],
                            borderColor: 'rgba(75, 192, 192, 1)',
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                            borderWidth: 2
                        }]
                },
                options: {
                    scales: {
                        x: {
                            type: 'time',
                            time: {
                                unit: 'day'
                            }
                        },
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        </script>
    </body>
</html>
