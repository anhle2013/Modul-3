<%--
  Created by IntelliJ IDEA.
  User: anh lee
  Date: 6/9/2022
  Time: 4:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<html>
<head>
    <title>Result</title>
</head>
<body>
    <h1>Result: </h1>
    <h3>USD to VND</h3>
    <p>
        <fmt:formatNumber type="currency" pattern ="#,##0" value ="${requestScope['usd']}"/> USD =
        <fmt:formatNumber type="currency" pattern ="#,##0" value ="${requestScope['vnd']}"/> VND
    </p>
</body>
</html>
