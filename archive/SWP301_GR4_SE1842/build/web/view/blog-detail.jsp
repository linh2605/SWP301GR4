<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
  <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Angara - Organic Sports Store HTML Template </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/meanmenu.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/material-design-iconic-font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chosen.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flexslider.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">

    </head>
    <body class="home-3">
        <header>
            <jsp:include page= "common/header-top-area.jsp"></jsp:include>
            <jsp:include page= "common/header-min-area.jsp"></jsp:include>
            <jsp:include page= "common/mobile-menu-area.jsp"></jsp:include>
             <jsp:include page= "common/header-bottom-area.jsp"></jsp:include>
        </header>
     

    <div class="blog-details-area mtb-50">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="single-post">
                         <div class="newsletter-text ">
                             <h2 style="text-align: center">${blog.title}</h2>
                         </div>
                        <div class="post-img">
                          <img src="${pageContext.request.contextPath}/img/blog/${blog.image}.jpg" alt="post" />
                        </div>
                        <br>
                        <p style="text-align: center" class="post-meta">Posted by <span style=" color: red">${blog.creatorName}</span> ${blog.createAt}</p>
                        <div class=" ">
                            
                            <p style="margin-left: 30px">${blog.content}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

      <footer>
            <jsp:include page= "common/footer.jsp"></jsp:include>
        </footer>
        <script src="${pageContext.request.contextPath}/js/vendor/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendor/jquery-migrate-3.3.2.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.meanmenu.js"></script>
        <script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.counterup.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/chosen.jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.flexslider.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendor/modernizr-3.11.2.min.js"></script>
    </body>

</html>
