<%--
  Created by IntelliJ IDEA.
  User: anh lee
  Date: 6/10/2022
  Time: 2:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Customer</title>
</head>
<body>
<form action="/customers" method="get">
    <p>
        <label>Full Name: </label>
        <input type="text" name = "fullName">
    </p>
    <p>
        <label>Date Of Birth: </label>
        <input type="date" name = "dateOfBirth">
    </p>
    <p>
        <label>Address: </label>
        <input type="text" name = "address">
    </p>
    <p>
        <label>Image Path: </label>
        <input type="text" name = "imgPath">
    </p>
    <p>
        <button type="submit">Add new</button>
    </p>
    <a href="/customers">Show List</a>
</form>
</body>
</html>
