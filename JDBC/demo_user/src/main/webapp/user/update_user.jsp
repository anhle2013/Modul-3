<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update User</title>
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/style.css">
    <script src="/assets/bootstrap/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-6">
            <h1>Update user</h1>
        </div>
        <div class="col-6">
            <a href="/users">
                <button type="button" class="btn btn-danger">User List</button>
            </a>
        </div>
    </div>

    <div class="row">
        <form method="post">
            <div class="mb-3">
                <label for="full_name" class="form-label">Full Name *</label>
                <input type="text" class="form-control" id="full_name" name="full_name" placeholder="${requestScope['user.getFullName()']}" required>
            </div>
            <div class="mb-3">
                <label for="phone" class="form-label">Phone</label>
                <input type="text" class="form-control" id="phone" name="phone" placeholder="${requestScope['user.getPhone()']}" >
            </div>
            <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <input type="text" class="form-control" id="address" name="address" placeholder="${requestScope['user.getAddress()']}" >
            </div>
            <div class="mb-3">
                <label for="address" class="form-label">Age</label>
                <input type="number" class="form-control" id="age" name="age" placeholder="${requestScope['user.getAge()']}" >
            </div>
            <div class="mb-3">
                <label for="city_id" class="form-label">City</label>
                <select class="form-control" name="city_id" id="city_id">
                    <c:forEach items="${requestScope['cityList']}" var="item">
                        <option value="${item.getId()}">${item.getName()}</option>
                    </c:forEach>
                </select>
            </div>

            <button type="submit" class="btn btn-outline-primary">Update</button>
        </form>
    </div>
    <div class="footer">
        <c:if test="${requestScope['success'] == true}">
            <ul class="success">
                <li>Successfull</li>
            </ul>
        </c:if>
        <c:if test="${requestScope['error'] == true}">
            <ul class="error">
                <li>Error</li>
            </ul>
        </c:if>
    </div>
</div>

</body>
</html>
