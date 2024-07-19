<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Feedback List | E-Shopper</title>
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
  <li class="">
                            <a href="PostList">
                                <i class="fa fa-circle"></i> <span>Blog List</span>
                            </a>
                        </li>
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
                        <div class="col-xs-12">
                            <div class="panel">
                                <header class="panel-heading">
                                    Discount List
                                </header>
                                <!-- <div class="box-header"> -->
                                <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

                                <!-- </div> -->
                                <div class="panel-body table-responsive">
                                    <div class="sliderList">
                                        <a href="AddDiscount" class="btn btn-primary">Add</a>
                                        <div class="input-group" style="margin-bottom: 10px;width: 100%; ">
                                            <form class="search-slider"
                                                  style="width: 100%; display: flex; justify-content: space-between; position: relative;"
                                                  method="get" action="FeedbacksList">
                                                <div class="left-search"></div>
                                                <div class="right-search">
                                                    <input type="text" name="search"  class="form-control"
                                                           style="width: 250px;" placeholder="Search" value="${param['search']}"/>
                                                    <button class="btn btn-default">Go</button>
                                                </div>
                                            </form>
                                        </div>
                                        <table class="panel-body table-responsive" id="slidetable" cellspacing="0" style="width: 100%;">
                                            <thead>
                                                <tr style="cursor: pointer; font-size: 15px; border-bottom: 1px solid #ccc; text-align: center;">
                                                    <th>DiscountID <i class="fa fa-caret-down" aria-hidden="true"></i></th>
                                                    <th>Product Name<i class="fa fa-caret-down" aria-hidden="true"></i></th>
                                                    <th>Amount</th>
                                                    <th>Start Date <i class="fa fa-caret-down" aria-hidden="true"></i></th>
                                                    <th>End Date</th>
                                                    <th>Status</th>
                                                    <th>Change</th>

                                                    <th>Edit</th>
                                                    <th>Delete</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="d" items="${discountList}">
                                                    <tr>
                                                        <td>${d.getDiscountId()}</td>
                                                        <td>${bDAO.getById(d.getBookId()).getTitle()}</td>
                                                        <td>${d.getAmount()}%</td>
                                                        <td>${d.getStartDate()}</td>
                                                        <td>${d.getEndDate()}</td>
                                                        <c:if test="${d.isStatus()}">
                                                            <td>Active</td>
                                                            <td><a href="ChangeStatusDiscount?id=${d.getDiscountId()}&status=0"  class="btn btn-danger">In-Active</a></td>
                                                        </c:if>
                                                        <c:if test="${!d.isStatus()}">
                                                            <td>De-Active</td>
                                                            <td><a href="ChangeStatusDiscount?id=${d.getDiscountId()}&status=1" class="btn btn-success">Active</a></td>
                                                        </c:if>
                                                        <td><a href="EditDiscount?did=${d.getDiscountId()}" class="btn btn-warning">Edit</a></td>
                                                        <td><a href="DeleteDiscount?id=${d.getDiscountId()}" class="btn btn-warning">Delete</a></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <!--                                        <div class="pagination-arena " style="margin-left: 40%">
                                                                                    <ul class="pagination">
                                                                                        <li class="page-item"><a href="./FeedbacksList?star=${param['star']}&status=${param['status']}&search=${param['search']}&type-search=${param['type-search']}&index=1"" class="page-link"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
                                                                                        <li class="page-item">
                                                                                            <a href="./FeedbacksList?star=${param['star']}&status=${param['status']}&search=${param['search']}&type-search=${param['type-search']}&index=${index-2}"" class="page-link " style="${index-2<1?"display:none;":""}">${index-2}</a></li>
                                                                                        <li class="page-item">
                                                                                            <a href="./FeedbacksList?star=${param['star']}&status=${param['status']}&search=${param['search']}&type-search=${param['type-search']}&index=${index-1}"" class="page-link " style="${index-1<1?"display:none;":""}">${index-1}</a></li>
                                                                                        <li class="page-item active">
                                                                                            <a href="./FeedbacksList?star=${param['star']}&status=${param['status']}&search=${param['search']}&type-search=${param['type-search']}&index=${index}"" class="page-link">${index}</a></li>
                                                                                        <li class="page-item">
                                                                                            <a href="./FeedbacksList?star=${param['star']}&status=${param['status']}&search=${param['search']}&type-search=${param['type-search']}&index=${index+1}"" class="page-link " style="${index+1>numberPage?"display:none;":""}" >${index+1}</a></li>
                                                                                        <li class="page-item">
                                                                                            <a href="./FeedbacksList?star=${param['star']}&status=${param['status']}&search=${param['search']}&type-search=${param['type-search']}&index=${index+2}"" class="page-link " style="${index+2>numberPage?"display:none;":""}">${index+2}</a></li>
                                                                                        <li><a href="./FeedbacksList?star=${param['star']}&status=${param['status']}&search=${param['search']}&type-search=${param['type-search']}&index=${numberPage}"" class="page-link"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
                                                                                    </ul>
                                                                                </div> -->
                                    </div><!-- /.box-body -->
                                </div><!-- /.box -->
                            </div>
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


