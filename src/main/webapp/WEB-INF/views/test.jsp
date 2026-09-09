<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c"
           uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Test JSP</title>
</head>

<body>

<h1>Spring Boot 4 + JSP/JSTL chạy thành công!</h1>

<c:set var="framework" value="Spring Boot 4"/>

<p>
    Framework: ${framework}
</p>

<c:if test="${framework == 'Spring Boot 4'}">
    <p>JSTL hoạt động bình thường.</p>
</c:if>

</body>

</html>