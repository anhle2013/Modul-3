<%--
  Created by IntelliJ IDEA.
  User: anh lee
  Date: 6/10/2022
  Time: 9:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <style>
        table {
            border: 1px solid #000;
            font-size: 20px;
        }
        th, td {
            border: 1px dotted #555;
        }
        img {
            height: 75px;
        }
    </style>
</head>
<body>
    <table>
        <caption>Customers List</caption>
        <thead>
            <tr>
                <th>Tên</th>
                <th>Ngày sinh</th>
                <th>Địa chỉ</th>
                <th>Ảnh</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="customer" items="${requestScope.customersList}">
            <tr>
                <td>
                    <c:out value="${customer.getFullName()}"/>
                </td>
                <td>
                    <c:out value="${customer.getDateOfBirth()}"/>
                </td>
                <td>
                    <c:out value="${customer.getAddress()}"/>
                </td>
                <td><img src="<c:out value="${customer.getImgPath()}"/>"></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/customers/add">Add new Customer</a>
</body>
</html>
