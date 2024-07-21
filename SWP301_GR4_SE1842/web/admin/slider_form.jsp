<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Slider Management</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/admin/assets/images/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/typography.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/responsive.css">
    <style>
        .form-group span {
            color: red;
            font-size: .8rem;
        }
        .form-group.invalid input,
        .form-group.invalid textarea {
            border: 1px solid red;
        }
        #imagePreview img {
            max-width: 100%;
            width: 20%;
            padding: 1rem;
            margin: 1rem;
            box-shadow: .2rem .2rem .2rem #000000;
        }
        .custom-file-upload {
            padding: 10px;
            border: 1px solid #ccc;
            display: inline-block;
            cursor: pointer;
            background-color: var(--iq-primary);
            color: #fff;
            border-radius: 5px;
        }
        .custom-file-upload:hover {
            background-color: var(--iq-primary);
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <jsp:include page="./component/sidebar.jsp"></jsp:include>
        <jsp:include page="./component/header.jsp"></jsp:include>
        <div id="content-page" class="content-page">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="iq-card">
                            <div class="iq-card-header d-flex justify-content-between">
                                <div class="iq-header-title">
                                    <h4 class="card-title">${slider == null ? 'Add New Slider' : 'Edit Slider'}</h4>
                                </div>
                            </div>

                            <c:if test="${msg != null}">
                                <div class="alert text-white bg-primary" role="alert">
                                    <div class="iq-alert-text">${msg}</div>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <i class="ri-close-line"></i>
                                    </button>
                                </div>
                            </c:if>
                            <c:if test="${errmsg != null}">
                                <div class="alert text-white bg-danger" role="alert">
                                    <div class="iq-alert-icon">
                                        <i class="ri-information-line"></i>
                                    </div>
                                    <div class="iq-alert-text">${errmsg}</div>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <i class="ri-close-line"></i>
                                    </button>
                                </div>
                            </c:if>
                            <div class="iq-card-body">
                                <form enctype="multipart/form-data" action="${pageContext.request.contextPath}/admin/slider" method="POST" id="slider_form" class="needs-validation" novalidate="">
                                    <input type="hidden" name="action" value="save">
                                    <input id="id" type="hidden" class="form-control" name="id" value="${slider != null ? slider.id : ''}">
                                    <div class="form-group">
                                        <label for="title">Slider Title</label>
                                        <input name="title" value="${slider != null ? slider.title : ''}" type="text" class="form-control" id="title" required="">
                                        <span class="form-message"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="description">Slider Description</label>
                                        <textarea name="description" class="form-control" id="description" required="">${slider != null ? slider.description : ''}</textarea>
                                        <span class="form-message"></span>
                                    </div>
                                    <div class="form-group">
                                        <div class="custom-file">
                                            <label for="imageFile" class="custom-file-upload">
                                                Upload Image
                                            </label>
                                            <input style="display: none" id="imageFile" type="file" name="imageFile" ${slider == null ? 'required=""' : ''} onchange="previewImages(event)">
                                            <span class="form-message"></span>
                                        </div>
                                        <div style="display: flex; width: 100%; overflow-y: auto" id="imagePreview">
                                            <c:if test="${slider != null && slider.imageUrl != null && !slider.imageUrl.isEmpty()}">
                                                <img src="${pageContext.request.contextPath}/${slider.imageUrl}" alt="Slider Image">
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="status">Status</label>
                                        <select name="status" class="form-control" id="status">
                                            <option value="1" ${slider != null && slider.status == 1 ? 'selected' : ''}>Active</option>
                                            <option value="0" ${slider != null && slider.status == 0 ? 'selected' : ''}>Deactive</option>
                                        </select>
                                        <span class="form-message"></span>
                                    </div>
                                    <input class="btn btn-primary" type="submit" value="Save"></input>
                                    <a href="${pageContext.request.contextPath}/admin/sliders" class="btn btn-danger">Cancel</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function previewImages(event) {
            var previewContainer = document.getElementById('imagePreview');
            previewContainer.innerHTML = ''; // Clear any previous previews
            var files = event.target.files;

            for (var i = 0; i < files.length; i++) {
                var file = files[i];
                var reader = new FileReader();

                reader.onload = function (e) {
                    var image = document.createElement('img');
                    image.src = e.target.result;
                    image.style.maxWidth = '200px';
                    previewContainer.appendChild(image);
                };

                reader.readAsDataURL(file);
            }
        }
    </script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/dataTables.bootstrap4.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/form-validator.js"></script>
    <script src="https://kit.fontawesome.com/ff0d738c65.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.appear.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.counterup.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/apexcharts.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/slick.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/smooth-scrollbar.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/lottie.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/core.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/charts.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/animated.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/kelly.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/maps.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/worldLow.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/raphael-min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/morris.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/morris.min.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/flatpickr.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/style-customizer.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/chart-custom.js"></script>
    <script src="${pageContext.request.contextPath}/admin/assets/js/custom.js"></script>
</body>
</html>
