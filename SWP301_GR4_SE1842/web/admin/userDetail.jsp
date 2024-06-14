<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User Details</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .profile-pic {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                object-fit: cover;
            }
            .user-info {
                text-align: center;
                margin-bottom: 20px;
            }
            .user-details {
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <div class="card">
                <div class="card-body">
                    <div class="user-info">
                        <img src="${user.avatar}" alt="Profile Picture" class="profile-pic img-thumbnail">
                        <h2>${user.fullName}</h2>
                        <p class="text-muted">@${user.username}</p>
                    </div>
                    <div class="user-details">
                        <form action="userDetail" method="post">
                            <input type="hidden" name="userId" value="${user.id}">
                            <input type="hidden" name="action" value="edit">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="email" name="email" value="${user.email}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone</label>
                                <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="gender">Gender</label>
                                <input type="text" class="form-control" id="gender" name="gender" value="${user.gender}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="address">Address</label>
                                <input type="text" class="form-control" id="address" name="address" value="${user.address}" readonly>
                            </div>
                            <c:if test="${sessionScope.user.role.role_name == 'Admin'}">
                            </c:if>
                            <div class="form-group">
                                <label for="role">Role</label>
                                <select class="form-control" id="role" name="role">
                                    <c:forEach var="role" items="${roles}">
                                        <option value="${role.role_id}" ${role.role_id == user.role.role_id ? 'selected' : ''}>${role.role_name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="status">Status</label>
                                <select class="form-control" id="status" name="status">
                                    <option value="Active" ${user.status == 'Active' ? 'selected' : ''}>Active</option>
                                    <option value="InActive" ${user.status == 'InActive' ? 'selected' : ''}>InActive</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </form>
                        <c:if test="${sessionScope.user.role.role_name == 'Admin'}">
                        </c:if>
                        <form action="userDetail" method="post" class="mt-3">
                            <input type="hidden" name="userId" value="${user.id}">
                            <input type="hidden" name="action" value="generatePassword">
                            <button type="submit" class="btn btn-warning">Generate New Password</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
