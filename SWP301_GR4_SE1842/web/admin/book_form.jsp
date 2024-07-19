<%-- 
    Document   : book_form
    Created on : Sep 29, 2023, 4:00:41 AM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

    <!-- Mirrored from templates.iqonic.design/booksto/html/admin-add-book.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:20:08 GMT -->
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Booksto - Responsive Bootstrap 4 Admin Dashboard Template</title>
        <!-- Favicon -->
        <link rel="shortcut icon" href="images/favicon.ico" />
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/dataTables.bootstrap4.min.css">
        <!-- Typography CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/typography.css">
        <!-- Style CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/css/style.css">
        <!-- Responsive CSS -->
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
            /* Style for the custom label */
            .custom-file-upload {
                padding: 10px;
                border: 1px solid #ccc;
                display: inline-block;
                cursor: pointer;
                background-color: var(--iq-primary); /* Or any color you prefer */
                color: #fff; /* Text color */
                border-radius: 5px; /* Optional for rounded corners */
            }

            .custom-file-upload:hover {
                background-color: var(--iq-primary); /* Color when hovered */
            }
            /* Container */
            .form-control.custom-select-minh {
                display: block;
                width: 100%; /* Adjust as necessary */
                height: auto; /* Adjust as necessary */
                padding: 10px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px; /* Optional for rounded corners */
                background-color: #fff;
                overflow-y: auto;
            }

            /* Options */
            .form-control option {
                padding: 8px 10px;
                cursor: pointer;
            }

            /* Optgroup label */
            .form-control optgroup[label] {
                font-weight: bold;
                background-color: #f0f0f0; /* Light grey background */
                cursor: default;
            }

            /* Highlight color for selected options */
            .form-control option:checked,
            .form-control option:hover {
                background-color: #e0e0e0;
            }

            /* Set a max-height and make it scrollable if the list is too long */
            .form-control {
                max-height: 200px;
                overflow-y: auto;
            }
            .alert.text-white {
                width: 50%;
                margin: 0 auto;
            }
            optgroup[label] {
                font-size: 1.2rem;
            }
            optgroup[label] option {
                font-size: .8rem;
            }
        </style>
    </head>
    <body>
        <!-- loader Start -->
        <div id="loading">
            <div id="loading-center">
            </div>
        </div>
        <!-- loader END -->
        <!-- Wrapper Start -->
        <div class="wrapper">
            <!-- Sidebar  -->
            <jsp:include page="./component/sidebar.jsp"></jsp:include>
                <!-- TOP Nav Bar -->
            <jsp:include page="./component/header.jsp"></jsp:include>
                <!-- TOP Nav Bar END -->
                <!-- Page Content  -->
                <div id="content-page" class="content-page">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="iq-card">
                                    <div class="iq-card-header d-flex justify-content-between">
                                        <div class="iq-header-title">
                                            <h4 class="card-title">${action} ${book.title}</h4>
                                    </div>
                                </div>

                                <c:if test="${msg ne null}">
                                    <div class="alert text-white bg-primary" role="alert">
                                        <div class="iq-alert-text">${msg}</div>
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <i class="ri-close-line"></i>
                                        </button>
                                    </div>
                                </c:if>
                                <c:if test="${errmsg ne null}">
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
                                    <form enctype="multipart/form-data" action="books" method="POST" id="book__form" class="needs-validation" novalidate="">
                                        <input id="action" type="text" class="form-control" name="action" value="${action}" hidden>
                                        <div style="display: none">
                                            <input type="text" class="form-control" name="bookid" value="${book.id}" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="title">Product name</label>
                                            <input name="title" value="${book.title}" type="text" class="form-control" id="title" required="">
                                            <span class="form-message"></span>
                                        </div>
                                        <div class="form-group custom-select-minh">
                                            <label for="category">Category</label>
                                            <select name="category" class="form-control" id="category" required="" multiple>
                                                <c:forEach items="${cList}" var="c">
                                                    <c:choose>
                                                        <c:when test="${empty c.scList}">
                                                            <c:set var="isSelected" value="false"/>
                                                            <c:forEach items="${cbList}" var="cb">
                                                                <c:if test="${cb.id == c.id}"><c:set var="isSelected" value="true"/></c:if>
                                                            </c:forEach>
                                                            <option style="font-weight: bold;font-size: 1.2rem" 
                                                                    value="${c.id}" ${isSelected ? 'selected="selected"' : ''}>
                                                                ${c.name}
                                                            </option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <optgroup label="${c.name}">
                                                                <c:forEach items="${c.scList}" var="sc">
                                                                    <c:set var="isSelected" value="false"/>
                                                                    <c:forEach items="${scbList}" var="scb">
                                                                        <c:if test="${scb.id == sc.id}">
                                                                            <c:set var="isSelected" value="true"/>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <option value="sub${sc.id}" ${isSelected ? 'selected="selected"' : ''}>
                                                                        ${sc.name}
                                                                    </option>
                                                                </c:forEach>
                                                            </optgroup>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                            <span class="form-message"></span>
                                        </div>
                                        <div class="form-group">
                                            <label for="author">Author</label>
                                            <div  id="author__input">
                                                <select name="author" class="form-control" id="author" required="">
                                                    <c:forEach items="${aList}" var="c">
                                                        <c:if test="${c.id eq book.author.id}">
                                                            <c:set var="selected" value="selected" />
                                                        </c:if>
                                                        <c:if test="${c.id ne book.author.id}">
                                                            <c:set var="selected" value="" />
                                                        </c:if>
                                                        <option ${selected} value="${c.id}">${c.id}. ${c.name}</option>
                                                    </c:forEach>
                                                </select>
                                                <span class="form-message"></span>
                                            </div>
                                            <div style="text-align: center;background: var(--iq-primary);color: #fff" id="new-author-btn">
                                                <i class="fa-solid fa-user-plus"></i>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="publisher">Publisher</label>
                                            <div id="publisher__input">
                                                <select name="publisher" class="form-control" id="publisher" required="">
                                                    <c:forEach items="${pList}" var="c">
                                                        <c:if test="${c.id eq book.publisher.id}">
                                                            <c:set var="selected" value="selected" />
                                                        </c:if>
                                                        <c:if test="${c.id ne book.publisher.id}">
                                                            <c:set var="selected" value="" />
                                                        </c:if>
                                                        <option ${selected} value="${c.id}">${c.id}. ${c.name}</option>
                                                    </c:forEach>
                                                </select>
                                                <span class="form-message"></span>
                                            </div>
                                            <div style="text-align: center;background: var(--iq-primary);color: #fff" id="new-publisher-btn">
                                                <i class="fa-solid fa-user-plus"></i>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="cost">Cost</label>
                                            <input name="cost" value="${book.cost}" type="text" class="form-control" id="cost">
                                            <span class="form-message"></span>
                                        </div>
                                        <div class="form-group">
                                            <label for="stock">Stock</label>
                                            <input name="stock" value="${book.stock}" type="text" class="form-control" id="stock">
                                            <span class="form-message"></span>
                                        </div>
                                        <div class="form-group">
                                            <label for="desc">Description</label>
                                            <textarea name="desc" class="form-control" id="desc" required="">${book.desc}</textarea>
                                            <span class="form-message"></span>
                                        </div> 
                                        <div class="form-group">
                                            <div class="custom-file">
                                                <label for="images" class="custom-file-upload">
                                                    Upload images
                                                </label>
                                                <input style="display: none" id="images" type="file" name="images" required="" multiple="" onchange="previewImages(event)">
                                                <span class="form-message"></span>
                                            </div>
                                            <div style="display: flex; width: 100%; overflow-y: auto" id="imagePreview">
                                                <c:forEach items="${book.iList}" var="image" varStatus="loop">
                                                    <img src="${image.image}?ran=<%= Math.random() %>" alt="image ${loop.index + 1} of the book">
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <input class="btn btn-primary" type="submit" value="Save"></input>
                                        <a href="books" class="btn btn-danger">Cancel</a>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Wrapper END -->
        <!-- Footer -->
        <jsp:include page="./component/footer.jsp"></jsp:include>
            <!-- Footer END -->
            <!-- color-customizer -->
            <div class="iq-colorbox color-fix">
                <div class="buy-button"> <a class="color-full" href="#"><i class="fa fa-spinner fa-spin"></i></a> </div>
                <div id="right-sidebar-scrollbar" class="iq-colorbox-inner">
                    <div class="clearfix color-picker">
                        <h3 class="iq-font-black">Booksto Awesome Color</h3>
                        <p>This color combo available inside whole template. You can change on your wish, Even you can create your own with limitless possibilities! </p>
                        <ul class="iq-colorselect clearfix">
                            <li class="color-1 iq-colormark" data-style="color-1"></li>
                            <li class="color-2" data-style="iq-color-2"></li>
                            <li class="color-3" data-style="iq-color-3"></li>
                            <li class="color-4" data-style="iq-color-4"></li>
                            <li class="color-5" data-style="iq-color-5"></li>
                            <li class="color-6" data-style="iq-color-6"></li>
                            <li class="color-7" data-style="iq-color-7"></li>
                            <li class="color-8" data-style="iq-color-8"></li>
                            <li class="color-9" data-style="iq-color-9"></li>
                            <li class="color-10" data-style="iq-color-10"></li>
                            <li class="color-11" data-style="iq-color-11"></li>
                            <li class="color-12" data-style="iq-color-12"></li>
                            <li class="color-13" data-style="iq-color-13"></li>
                            <li class="color-14" data-style="iq-color-14"></li>
                            <li class="color-15" data-style="iq-color-15"></li>
                            <li class="color-16" data-style="iq-color-16"></li>
                            <li class="color-17" data-style="iq-color-17"></li>
                            <li class="color-18" data-style="iq-color-18"></li>
                            <li class="color-19" data-style="iq-color-19"></li>
                            <li class="color-20" data-style="iq-color-20"></li>
                        </ul>
                        <a target="_blank" class="btn btn-primary d-block mt-3" href="#">Purchase Now</a>
                    </div>
                </div>
            </div>
            <!-- color-customizer END -->
            <!-- Optional JavaScript -->
            <script>
                function previewImages(event) {
                    var previewContainer = document.getElementById('imagePreview');
                    var form = document.getElementById('book__form'); // Changed from 'imageForm' to 'book__form' to match your form's ID
                    previewContainer.innerHTML = ''; // Clear any previous previews
                    var files = event.target.files;

                    if (files.length > 5) {
                        alert('You can only select a maximum of 5 images');
                        event.target.value = ''; // Clear the selected files
                        return;
                    }

                    for (var i = 0; i < files.length; i++) {
                        var file = files[i];
                        var reader = new FileReader();

                        reader.onload = function (e) {
                            var image = document.createElement('img');
                            image.src = e.target.result;
                            image.style.maxWidth = '200px';
                            previewContainer.appendChild(image);

                            var input = document.createElement('input');
                            input.type = 'hidden';
                            input.name = 'base64Images[]';
                            input.value = e.target.result.split(',')[1];
                            form.appendChild(input);
                        };

                        reader.readAsDataURL(file);
                    }
                }



                document.addEventListener('DOMContentLoaded', function () {
                    // Existing initialization of buttons, inputs, and states ...
                    var author__input = document.querySelector('#author__input');
                    var new_author_btn = document.querySelector('#new-author-btn');
                    var author__selector = author__input.innerHTML;
                    var statea = false;
                    var publisher__input = document.querySelector('#publisher__input');
                    var new_publisher_btn = document.querySelector('#new-publisher-btn');
                    var publisher__selector = publisher__input.innerHTML;
                    var statep = false;

                    // Initialization of Validator
                    let isAuthorRulesActive = false;
                    let isPublisherRulesActive = false;

                    const authorRules = [
                        Validator.isRequired('#authorname', 'Please enter author name!'),
                        Validator.isRequired('#authorBio', 'Please enter author bio!')
                    ];

                    const publisherRules = [
                        Validator.isRequired('#publisherName', 'Please enter publisher name!'),
                        Validator.isRequired('#publisherEmail', 'Please enter publisher email!'),
                        Validator.isRequired('#publisherPhone', 'Please enter publisher phone!'),
                        Validator.isEmail('#publisherEmail', 'Invalid email!'),
                        Validator.isPhone('#publisherPhone', 'Invalid phone!')
                    ];

                    const validatorConfig = {
                        form: '#book__form',
                        formGroupSelector: '.form-group',
                        errorSelector: '.form-message',
                        rules: [
                            Validator.isRequired('#cost', 'Please enter price!'),
                            Validator.isRequired('#stock', 'Please enter stock!'),
                            Validator.isRequired('#title', 'Please enter title!'),
                            Validator.isRequired('#category', 'Please enter category!'),
                            Validator.isRequired('#desc', 'Please enter description!'),
                            Validator.isDigitFloat('#cost', 'Cost must be a number!'),
                            Validator.isDigit('#stock', 'Stock must be an integer number! (0, 1, 2, 3,...)')
                        ]
                    };

                    function toggleRules(isRulesActive, rules) {
                        if (isRulesActive) {
                            validatorConfig.rules = validatorConfig.rules.filter(rule => !rules.includes(rule));
                        } else {
                            validatorConfig.rules.push(...rules);
                        }
                        return !isRulesActive; // Toggle the state and return the new state
                    }

                    function initializeValidator() {
                        Validator(validatorConfig);
                    }

                    initializeValidator(); // Initialize the Validator at the start

                    new_author_btn.addEventListener('click', function (event) {
                        event.preventDefault();
                        event.preventDefault();
                        if (statea) {
                            author__input.innerHTML = author__selector;
                            new_author_btn.innerHTML = `<i class="fa-solid fa-user-plus"></i>`;
                            statea = false;
                        } else {
                            author__input.innerHTML = `
                                               <input name="newauthoradding" type="text" class="form-control" value="true" hidden>
                                                <div class="form-group">
                                               <input required placeholder="Author Name" name="authorName" type="text" class="form-control" id="authorname" value="">
                                            <span class="form-message"></span>
            </div>
            <div class="form-group">
                                               <textarea required placeholder="Bio" name="authorBio" type="text" class="form-control" id="authorBio" value=""></textarea>
                                            <span class="form-message"></span>
            </div>
                                               
                                               `;
                            new_author_btn.innerHTML = `<i class="fa-solid fa-ban"></i>`;
                            statea = true;
                        }

                        // Toggle author rules and re-initialize the Validator
                        isAuthorRulesActive = toggleRules(isAuthorRulesActive, authorRules);
                        initializeValidator();
                    });

                    new_publisher_btn.addEventListener('click', function (event) {
                        event.preventDefault();
                        event.preventDefault(); // prevents the browser from following the link (if any)

                        if (statep) {
                            publisher__input.innerHTML = publisher__selector;
                            new_publisher_btn.innerHTML = `<i class="fa-solid fa-user-plus"></i>`;
                            statep = false;
                        } else {
                            publisher__input.innerHTML = `
                                                   <input name="newpublisheradding" type="text" class="form-control" value="true" hidden>
            <div class="form-group">
                                                   <input required placeholder="Publisher Name" name="publisherName" type="text" class="form-control" id="publisherName" value="">
                                            <span class="form-message"></span>
            </div>
            <div class="form-group">
                                                   <input required placeholder="Email" name="publisherEmail" type="email" class="form-control" id="publisherEmail" value="">
                                            <span class="form-message"></span>
            </div>
            <div class="form-group">
                                                   <input required placeholder="Phone number" name="publisherPhone" type="text" class="form-control" id="publisherPhone" value="">
                                            <span class="form-message"></span>
            </div>
                                                   `;
                            new_publisher_btn.innerHTML = `<i class="fa-solid fa-ban"></i>`;
                            statep = true;
                        }

                        // Toggle publisher rules and re-initialize the Validator
                        isPublisherRulesActive = toggleRules(isPublisherRulesActive, publisherRules);
                        initializeValidator();
                    });
                });
            </script>

            <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/dataTables.bootstrap4.min.js"></script>

        <script src="${pageContext.request.contextPath}/admin/assets/js/form-validator.js"></script>
        <!-- FontAwesome JavaScript -->
        <script src="https://kit.fontawesome.com/ff0d738c65.js" crossorigin="anonymous"></script>
        <!-- Appear JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.appear.js"></script>
        <!-- Countdown JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/countdown.min.js"></script>
        <!-- Counterup JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.counterup.min.js"></script>
        <!-- Wow JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/wow.min.js"></script>
        <!-- Apexcharts JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/apexcharts.js"></script>
        <!-- Slick JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/slick.min.js"></script>
        <!-- Select2 JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/select2.min.js"></script>
        <!-- Owl Carousel JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/owl.carousel.min.js"></script>
        <!-- Magnific Popup JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/jquery.magnific-popup.min.js"></script>
        <!-- Smooth Scrollbar JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/smooth-scrollbar.js"></script>
        <!-- lottie JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/lottie.js"></script>
        <!-- am core JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/core.js"></script>
        <!-- am charts JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/charts.js"></script>
        <!-- am animated JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/animated.js"></script>
        <!-- am kelly JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/kelly.js"></script>
        <!-- am maps JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/maps.js"></script>
        <!-- am worldLow JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/worldLow.js"></script>
        <!-- Raphael-min JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/raphael-min.js"></script>
        <!-- Morris JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/morris.js"></script>
        <!-- Morris min JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/morris.min.js"></script>
        <!-- Flatpicker Js -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/flatpickr.js"></script>
        <!-- Style Customizer -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/style-customizer.js"></script>
        <!-- Chart Custom JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/chart-custom.js"></script>
        <!-- Custom JavaScript -->
        <script src="${pageContext.request.contextPath}/admin/assets/js/custom.js"></script>
    </body>

    <!-- Mirrored from templates.iqonic.design/booksto/html/admin-add-book.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:20:08 GMT -->
</html>