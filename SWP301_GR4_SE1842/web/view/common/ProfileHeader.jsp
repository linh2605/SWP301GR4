<%-- 
    Document   : ProfileHeader
    Created on : May 23, 2024, 9:02:45 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
        <c:if test="${sessionScope.usersession != null}">
            <div class="d-flex border container justify-content-end">
                <!--                <h1>
                                    <button type="button" class="btn btn-primary ml-5 text-secondary bg-white textFullName" data-toggle="modal" data-target="#myModalProfile">
                ${sessionScope.usersession.fullName}
            </button>
        </h1>-->
                <!--                <button type="button" class="btn btn-primary" onclick="logout()"> Logout </button>-->

                <!-- Modal -->
                <div class="modal fade" id="myModalProfile" tabindex="-1" role="dialog" aria-labelledby="myModalProfileLabel" aria-hidden="true">
                    <div class="modal-dialog" style="max-width: 50vw !important;" role="document">
                        <div class="modal-content border rounded-5 p-3 bg-white shadow box-area">
                            <div class="modal-header">
                                <h5 class="modal-title" id="myModalProfileLabel">Profile</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="d-flex flex-column align-items-center text-center">
                                                        <img src="${sessionScope.usersession.avatar}" alt="Admin" class="rounded-circle p-1 bg-primary" width="110">
                                                        <div class="mt-3">
                                                            <h4 class="textFullName">${sessionScope.usersession.fullName}</h4>
                                                            <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#ModalChangePass">
                                                                Change Password
                                                            </button>
                                                            <!-- Modal -->
                                                            <div class="modal fade" id="ModalChangePass" tabindex="-1" role="dialog" aria-labelledby="ModalChangePassLabel" aria-hidden="true">
                                                                <div class="modal-dialog" role="document">
                                                                    <div class="modal-content border rounded-5 p-3 bg-white shadow box-area">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="ModalChangePassLabel">Change Password</h5>
                                                                        </div>
                                                                        <div class="modal-body ">
                                                                            <div class="row mb-3">
                                                                                <div class="col-sm-3">
                                                                                    <h6 class="mb-0">Old password</h6>
                                                                                </div>
                                                                                <div class="col-sm-9 text-secondary">
                                                                                    <input type="password" id="OldPass" class="form-control" value="" placeholder="Old password" onblur="togglePasswordVisibility(false, this)" onfocus="togglePasswordVisibility(true, this)">
                                                                                </div>
                                                                            </div>
                                                                            <div class="row mb-3">
                                                                                <div class="col-sm-3">
                                                                                    <h6 class="mb-0">New Password</h6>
                                                                                </div>
                                                                                <div class="col-sm-9 text-secondary">
                                                                                    <input type="password" id="NewPass" class="form-control" value="" placeholder="New password" onblur="togglePasswordVisibility(false, this)" onfocus="togglePasswordVisibility(true, this)">
                                                                                </div>
                                                                            </div>
                                                                            <div class="row mb-3">
                                                                                <div class="col-sm-3">
                                                                                    <h6 class="mb-0">Confirm Password</h6>
                                                                                </div>
                                                                                <div class="col-sm-9 text-secondary">
                                                                                    <input type="password" id="CFPassrs" class="form-control" value="" placeholder="Confirm password" onblur="togglePasswordVisibility(false, this)" onfocus="togglePasswordVisibility(true, this)">
                                                                                </div>
                                                                            </div>
                                                                            <div class="row mb-3 fade bg-success" id="changePassMessageBox">
                                                                                <div class="col-sm-12 text-secondary">
                                                                                    <p class="text-white text-center" id="changePassMessage">Change Password success</p>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer ">
                                                                            <div class="modal-footer">
                                                                                <button type="button" onclick="ChangePass()" class="btn btn-primary">Save change</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="row mb-3">
                                                        <div class="col-sm-3">
                                                            <h6 class="mb-0">Full Name</h6>
                                                        </div>
                                                        <div class="col-sm-9 text-secondary">
                                                            <input id="fullName" type="text" class="form-control" value="${sessionScope.usersession.fullName}">
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-sm-3">
                                                            <h6 class="mb-0">Email</h6>
                                                        </div>
                                                        <div class="col-sm-9 text-secondary">
                                                            <input disabled="true" id="email" type="email" class="form-control" value="${sessionScope.usersession.email}" readonly>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-sm-3">
                                                            <h6 class="mb-0">Phone</h6>
                                                        </div>
                                                        <div class="col-sm-9 text-secondary">
                                                            <input id="phone" oninput="validateNumberInput(event)" pattern="\d{3}-\d{3}-\d{4}" title="Format: 444-555-6666" type="text" class="form-control" value="${sessionScope.usersession.phone}">
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3 d-flex">
                                                        <div class="col-sm-3">
                                                            <h6 class="mb-0">Gender</h6>
                                                        </div>
                                                        <div class="form-check col-sm-9 ">
                                                            <select class="form-select-lg w-100" id="Gender">
                                                                <option <c:if test="${sessionScope.usersession.gender == 'Male'}">selected=""</c:if> value="Male">Male</option>
                                                                <option <c:if test="${sessionScope.usersession.gender == 'Female'}">selected=""</c:if> value="Female">Female</option>
                                                                <option <c:if test="${sessionScope.usersession.gender == 'Other'}">selected=""</c:if> value="Other">Other</option>
                                                                </select>
                                                            </div>
                                                        </div>                        
                                                        <div class="row mb-3">
                                                            <div class="col-sm-3">
                                                                <h6 class="mb-0">Address</h6>
                                                            </div>
                                                            <div class="col-sm-9 text-secondary">
                                                                <input id="address" type="text" class="form-control" value="${sessionScope.usersession.address}">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-7">
                                                            <div class="row mb-3 fade bg-success" id="profileMessageBox">
                                                                <div class="col-sm-12 text-secondary">
                                                                    <p class="text-white text-center" id="profileMessage">Update success</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-5 text-secondary">
                                                            <input type="button" class="btn btn-primary px-4" onclick="updateProfile()" value="Save Changes">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> <!-- thư viện hỗ trợ js -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script> <!-- thư viện hỗ trợ js -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> <!-- thư viện css boostrap -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="../js/profile.js"></script>
        <script>
                                                                function ValidatePassword(pass) {
                                                                    const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
                                                                    return passwordPattern.test(pass);
                                                                }

                                                                function validateNumberInput(event) {
                                                                    const input = event.target;
                                                                    let value = input.value.replace(/\D/g, '');
                                                                    if (value.length > 3 && value.length <= 6) {
                                                                        value = value.replace(/(\d{3})(\d+)/, '$1-$2');
                                                                    } else if (value.length > 6) {
                                                                        value = value.replace(/(\d{3})(\d{3})(\d+)/, '$1-$2-$3');
                                                                    }
                                                                    if (value.length > 12) {
                                                                        value = value.substring(0, 12)
                                                                    }
                                                                    input.value = value;
                                                                }

                                                                function togglePasswordVisibility(isFocused, passwordInput) {
                                                                    if (isFocused) {
                                                                        passwordInput.type = 'text';
                                                                    } else {
                                                                        passwordInput.type = 'password';
                                                                    }
                                                                }
        </script>
    </body>
</html>
