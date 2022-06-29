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
        <div class="col-2">
            <h1>User List</h1>
        </div>
        <div class="col-6">
            <form action="/users/search">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <select class="form-control" name="field_name" id="field_name">
                            <option value="full_name">Full Name</option>
                            <option value="phone">Phone</option>
                            <option value="address">Address</option>
                            <option value="age">Age</option>
                            <option value="city">City Name</option>
                            <option value="status">Status</option>
                        </select>
                    </div>
                    <input type="search" class="form-control" name="search" placeholder="search">
                    <button type="submit" class="btn btn-primary">Search</button>
<%--                    <a href="/users?action=search"><button type="submit" class="btn btn-primary">Search</button></a>--%>
                </div>
            </form>
        </div>
        <div class="col-4">
            <a href="/users?action=create">
                <button type="button" class="btn btn-danger">Create User</button>
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
                        <c:choose>
                            <c:when test = "${item.getStatus() == 'active'}">
                                <a href="/users?action=update&id=${item.getId()}">Update</a>
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
