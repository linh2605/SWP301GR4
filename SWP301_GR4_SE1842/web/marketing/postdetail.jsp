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

                <div class="container">
                    <header>Post Detail</header>

                    <form action="actionPost" method="post">
                        <div class="form first">
                            <div class="details personal">


                                <div class="fields" style="display: flex;">
                                    <div class="input-field" >
                                        <label>Title</label>
                                        <textarea type="text" required style="height: 100px;" name="title" >${title}</textarea>
                                    </div>

                                    <div>
                                        <div class="input-field">
                                            <label>Status</label>
                                            <select name="status2" style="width: 200px;">
                                                <option value="1" ${status2 == true?'selected':''} >Active</option>
                                                <option value="0" ${status2 == false?'selected':''}>Inactive</option>
                                            </select>
                                        </div>
                                        <div class="input-field">
                                            <label>Category</label>
                                            <select name="categoryEdit" style="width: 200px;">

                                                <option value="Review" ${categoryEdit eq "Review" ?'selected':''}>Review</option>
                                                <option value="Promoted" ${categoryEdit eq "Promoted" ?'selected':''}>Promoted</option>
                                                <option value="experience" ${categoryEdit eq "experience" ?'selected':''}>experience</option>
                                            </select>
                                        </div>

                                    </div>

                                    <div class="input-field">
                                        <label>Description</label>
                                        <textarea type="text" name="description" required style="height: 100px;">${description}</textarea>
                                    </div>

                                    <div class="row">
                                        <div class="input-field col-md-12"  style="width: 100%;">
                                            <label class="control-label" >Image</label>
                                            <input class="form-control" id="img" onchange="changeimg()" name="image" type="file" accept=".jpg, .jpeg, .png" >
                                            <input name="postimage" id="postimage" value="${image}" type="hidden" >
                                            <image style="height: 320px;width: 600px;" src="${image}" id="demoimg" style="margin-top: 5px;" width="100%">


                                        </div>
                                    </div>




                                </div>
                                <div style="display: flex;justify-content: space-around;">
                                    <div><button class="btn btn-danger" style="background-color:  red;" type="submit">Save To Edit Post</button></div>

                                    <div ><button style="background-color:  yellow;" ><a href="PostList" style="text-decoration: none;color: white;">Back To Post List</a></button></div>
                                </div>




                            </div>


                        </div>
                        <input type="hidden" name="action" value="editLink">
                        <input type="hidden" name="id" value="${id}">
                    </form>
                </div>
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
                                                    $("#tablepro").DataTable({bFilter: false, bInfo: false, paging: true, lengthChange: false});
                                                });
        </script>
        <script>

        </script>
        <!-- Bootstrap -->
        <script src="./marketing/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="./marketing/js/Director/app.js" type="text/javascript"></script>
    </body>
</html>


