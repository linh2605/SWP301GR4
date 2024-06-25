<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Management</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .sortable {
                cursor: pointer;
            }
            .sort-icon {
                margin-left: 5px;
            }
        </style>
    </style>
</head>
<body>

    <div class="container mt-5">
    <div class="d-flex justify-content-between mb-3">
                <div>
                    <h2>User Management</h2>
                </div>
                <div>
                    <a href="adminDashboard" class="btn btn-secondary mr-2">Back</a>
                    <a href="http://localhost:8080/SWP301_GR4_SE1842/view/home" class="btn btn-info">Home</a>
                </div>
            </div>
        <!-- Filter Form -->
        <form action="userManager" method="get" class="form-inline mb-3">
            <div class="form-group mr-2">
                <label for="role" class="mr-2">Role:</label>
                <select id="role" name="role" class="form-control">
                    <option value="">All</option>
                    <c:forEach var="r" items="${roles}">
                        <option value="${r.role_id}" <c:if test="${param.role == r.role_id}">selected</c:if>>${r.role_name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group mr-2">
                <label for="gender" class="mr-2">Gender:</label>
                <select id="gender" name="gender" class="form-control">
                    <option value="">All</option>
                    <option value="Other" <c:if test="${param.gender == 'Other'}">selected</c:if>>Other</option>
                    <option value="Male" <c:if test="${param.gender == 'Male'}">selected</c:if>>Male</option>
                    <option value="Female" <c:if test="${param.gender == 'Female'}">selected</c:if>>Female</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Filter</button>
            </form>

            <!-- User Table -->
            <table id="tableFilter" class="table table-bordered">
                <thead class="bg-info bg-opacity-50 text-white">
                    <tr>
                        <th class="sortable"  onclick="sortTable(0)">ID</th>
                        <th class="sortable"  onclick="sortTable(1)">Username</th>
                        <th class="sortable"  onclick="sortTable(2)">Full Name</th>
                        <th class="sortable"  onclick="sortTable(3)">Gender</th>
                        <th class="sortable"  onclick="sortTable(4)">Phone</th>
                        <th class="sortable"  onclick="sortTable(5)">Email</th>
                        <th class="sortable"  onclick="sortTable(6)">Address</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${userList}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.fullName}</td>
                        <td>${user.gender}</td>
                        <td>${user.phone}</td>
                        <td>${user.email}</td>
                        <td>${user.address}</td>
                        <c:choose>
                            <c:when test="${user.status == 'Active'}">
                                <td class="text-success">${user.status}</td>
                            </c:when>
                            <c:otherwise>
                                <td class="text-danger">${user.status}</td>
                            </c:otherwise>
                        </c:choose>
                        <td>
                            <a href="userDetail?userId=${user.id}">
                                <button class="btn btn-sm btn-warning">Edit</button>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <jsp:include page="common/pagination.jsp"/>

    </div>

    <script>
        let sortDirection = false;

        function sortTable(columnIndex) {
            const table = document.getElementById("tableFilter");
            const tbody = table.tBodies[0];
            const rows = Array.from(tbody.querySelectorAll("tr"));
            sortDirection = !sortDirection;

            rows.sort((rowA, rowB) => {
                const cellA = rowA.children[columnIndex].textContent.trim();
                const cellB = rowB.children[columnIndex].textContent.trim();

                if (!isNaN(cellA) && !isNaN(cellB)) {
                    return sortDirection ? cellA - cellB : cellB - cellA;
                }

                return sortDirection ? cellA.localeCompare(cellB) : cellB.localeCompare(cellA);
            });

            rows.forEach(row => tbody.appendChild(row));
        }
    </script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
