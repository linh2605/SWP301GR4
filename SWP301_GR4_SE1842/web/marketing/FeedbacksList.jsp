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
        <!-- DataTables CSS -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">

        <!-- DataTables JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>

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
                                    Feedback List
                                </header>
                                <!-- <div class="box-header"> -->
                                <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

                                <!-- </div> -->
                                <div class="panel-body table-responsive">
                                    <div class="sliderList">
                                        <div class="row element-button">
                                            <div class="col-sm-2">
                                            </div>

                                            <div class="col-sm-10">
                                                <form style="display: flex; justify-content: space-around; align-items: center; width: 100%;" method="get" action="FeedbackList">
                                                    <!--                                                    <label style="margin-right: 5px;"> Status:</label> <select class="form-control" name="status">
                                                                                                            <option value="" ${param['status']==""?"selected":""}>All</option>     
                                                                                                            <option value="1" ${param['status']=="1"?"selected":""}>Active</option>
                                                                                                            <option value="0" ${param['status']=="0"?"selected":""}>Inactive</option>
                                                                                                        </select>
                                                                                                        <label style="margin-right: 5px;">Sort: </label>
                                                                                                        <select name="star" class="form-control">
                                                                                                            <option value="" ${param['star']==""?"selected":""}>All</option>     
                                                                                                            <option value="1" ${param['star']=="1"?"selected":""}>1</option>     
                                                                                                            <option value="2" ${param['star']=="2"?"selected":""}>2</option>     
                                                                                                            <option value="3" ${param['star']=="3"?"selected":""}>3</option>     
                                                                                                            <option value="4" ${param['star']=="4"?"selected":""}>4</option>     
                                                                                                            <option value="5" ${param['star']=="5"?"selected":""}>5</option>     
                                                                                                        </select>
                                                                                                        <label style="margin-right: 5px;"> Search:</label> 
                                                                                                        <input style="margin-right: 5px;" type="text" maxlength="50" value="${param['search']}"  placeholder="Search UserName or ProductName" name="search" class="form-control">
                                                                                                        <button type="submit" class="btn btn-primary">Search</button>-->
                                                </form>
                                            </div>
                                        </div>

                                        <table id="tablepro"  class="table table-hover table-bordered" >
                                            <thead>
                                                <tr>
                                                    <th>ID 	&#8645;</th>
                                                    <th>User Name 	&#8645;</th>
                                                    <th>Product Name 	&#8645;</th>
                                                    <th>Star 	&#8645;</th>
                                                    <th>Create Date 	&#8645;</th>
                                                    <th>Status 	&#8645; </th>
                                                    <th>Detail 	&#8645;</th>
                                                    <th>Delete 	&#8645;</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="f" items="${fl}">
                                                    <tr>
                                                        <td>${f.fbId}</td>
                                                        <td>${f.user.username}</td>
                                                        <td>${f.book.title}</td>
                                                        <td>${f.fbStar}&#11088;</td>
                                                        <td>${f.fbDate}</td>
                                                        <td>${f.fbStatus==1?"Active":"Inactive"}</td>
                                                        <td><a href="FeedbackDetail?fid=${f.fbId}" class="btn btn-primary">Detail</a></td>
                                                        <td><a href="DeleteFeedback?fid=${f.fbId}" class="btn btn-primary">Delete</a></td>       
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>

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
            $(document).ready(function () {
                $("#tablepro").DataTable({
                    bFilter: true,
                    bInfo: true,
                    paging: true,
                    lengthChange: true
                });
            });
        </script>
        <!-- Bootstrap -->
        <script src="./marketing/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="./marketing/js/Director/app.js" type="text/javascript"></script>
    </body>
</html>

