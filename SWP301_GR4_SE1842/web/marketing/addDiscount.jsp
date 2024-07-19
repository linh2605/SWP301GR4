<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Discount | E-Shopper</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="./marketing/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="./marketing/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="./marketing/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Morris chart -->
        <link href="./marketing/css/morris/morris.css" rel="stylesheet" type="text/css" />
        <link href="./marketing/css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <link href="./marketing/css/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
        <link href="./marketing/css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <link href="./marketing/css/iCheck/all.css" rel="stylesheet" type="text/css" />
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!-- Theme style -->
        <link href="./marketing/css/style.css" rel="stylesheet" type="text/css" />

        <style type="text/css">
            td{
                padding: 5px;
            }
            th{
                padding: 5px;
            }
        </style>
        <script>
    function validateDateRange() {
        var fromDate = document.getElementsByName("fromdate")[0].value;
        var toDate = document.getElementsByName("todate")[0].value;

        // Convert string dates to Date objects
        var fromDateObj = new Date(fromDate);
        var toDateObj = new Date(toDate);

        // Check if from date is after to date
        if (fromDateObj > toDateObj) {
            alert("From date cannot be after To date. Please choose a valid date range.");
            // You can also reset the from date to the to date or take other actions.
            document.getElementsByName("fromdate")[0].value = toDate;
        }
    }
</script>
    </head>
    <body class="skin-black">
        <c:if test="${param['index']==null }">   
            <c:set var = "index" scope = "page" value = "1"/>
        </c:if>
        <c:if test="${param['index']!=null}">
            <c:set var = "index" scope = "page" value = "${param['index']}"/>
        </c:if>
        <!-- header logo: style can be found in header.less -->
        <div class="left-side sidebar-offcanvas"  style="height: 1200px;position: fixed; width: 220px; background-color: #39435c;left: 0; top:0;">
        </div>
        <header class="header">
            <a href="" class="logo">
                Marketing
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-right">
                    <a href="logout" class="btn btn-outline-primary" style="text-decoration: none;  font-weight: 100;" >
                        <i class="fa fa-sign-out" style="font-size: 35px;" aria-hidden="true"></i>
                    </a>
                </div>
            </nav>
        </header>

        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas" id="left-aside" style="height: 100%;">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <c:if test="${sessionScope.u.getAvartar()==null}">
                                <img src="https://dvdn247.net/wp-content/uploads/2020/07/avatar-mac-dinh-1.png" class="img-circle" alt="User Image" />
                            </c:if>
                            <c:if test="${sessionScope.u.getAvartar()!=null}">
                                <img src="${sessionScope.u.getAvartar()}" class="img-circle" alt="User Image" />
                            </c:if>
                        </div>
                        <div class="pull-left info">
                            <p>Hello, ${username}</p>

                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="">
                            <a href="DiscountList">
                                <i class="fa fa-circle"></i> <span>Discount List</span>
                            </a>
                        </li>
                        <li class="">
                            <a href="FeedbacksList">
                                <i class="fa fa-circle"></i> <span>Feedback List</span>
                            </a>
                        </li>
<!--                        <li class="">
                            <a href="CustomerList">
                                <i class="fa fa-circle"></i> <span>Customer List</span>
                            </a>
                        </li>-->
                         <li class="">
                            <a href="ContactList">
                                <i class="fa fa-circle"></i> <span>Contact List</span>
                            </a>
                        </li>
                        <li class="">
                            <a href="homepage">
                                <i class="fa fa-circle"></i> <span>Go Home</span>
                            </a>
                        </li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <h1 style="text-align: center;">Add discount </h1>
                        <form method="post" action="AddDiscount">
<!--                            <div class="col-md-6">
                                <span>ID:</span>
                                <input type="text" class="form-control" name="" value="" readonly="">
                            </div>-->
                            <div class="col-md-6">
                                <span>Book:</span>
                                <select class="form-control" name="bookId">
                                    <c:forEach var="b" items="${lb}">
                                        <option value="${b.id}">${b.title}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <span>Amount(%):</span>
                                <input type="number" class="form-control" name="amount" required value="" min="1" max="99">
                            </div>
                            <div class="col-md-6">
                                <span>From date:</span>
                                <input type="date" class="form-control" name="fromdate" value="" onchange="validateDateRange()">
                            </div><!-- comment -->
                            <div class="col-md-6">
                                <span>To Date:</span>
                                <input type="date" class="form-control" name="todate" value="" onchange="validateDateRange()">
                            </div>
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-primary">Add</button>
                            </div>

                        </form>
                    </div>

                </section><!-- /.content -->
                <div class="footer-main">
                    Copyright &copy Director, 2014
                </div>
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>

        <script>

        </script>
        <!-- Bootstrap -->
        <script src="./marketing/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="./marketing/js/Director/app.js" type="text/javascript"></script>
    </body>
</html>


