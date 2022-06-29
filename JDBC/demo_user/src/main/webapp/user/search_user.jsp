<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Users</title>
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/style.css">
    <script src="/assets/bootstrap/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">

    </div>
    <div class="row">
        <div class="col-4">
            <h1>Search User</h1>
        </div>

        <div class="col-4">
            <a href="/users">
                <button type="button" class="btn btn-danger">User List</button>
            </a>
        </div>
    </div>

    <table class="table table-hover">
        <thead>
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Phone</th>
            <th>Address</th>
            <th>Age</th>
            <th>City Name</th>
            <th>Action</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope['userList']}" var="item">
            <tr>
                <td>
                    <c:out value="${item.getId()}"/>
                </td>
                <td>
                    <c:out value="${item.getFullName()}"/>
                </td>
                <td>
                    <c:out value="${item.getPhone()}"/>
                </td>
                <td>
                    <c:out value="${item.getAddress()}"/>
                </td>
                <td>
                    <c:out value="${item.getAge()}"/>
                </td>
                <td>${item.getCityName()}</td>
                <td>
                    <a href="/users?action=update&id=${item.getId()}">Update</a>

                    <c:choose>
                        <c:when test = "${item.getStatus() == 'active'}">
                            <a href="/users?action=disable&id=${item.getId()}">Disable</a>
                        </c:when>
                        <c:otherwise>
                            <a href="/users?action=active&id=${item.getId()}">Active</a>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>${item.getStatus()}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
</body>
</html>
