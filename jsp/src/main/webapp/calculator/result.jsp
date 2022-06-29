<%--
  Created by IntelliJ IDEA.
  User: anh lee
  Date: 6/11/2022
  Time: 8:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Result</title>
</head>
<body>
<h1>Result: </h1>
<p>
    <c:out value="${requestScope['firstOperand']}"/> <c:out value="${requestScope['operator']}"/> <c:out value="${requestScope['secondOperand']}"/>
    = <c:out value="${requestScope['result']}"/>
</p>
</body>
</html>
