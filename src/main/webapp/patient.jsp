<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <html>

        <head>
            <title>patients</title>
        </head>

        <body>
            <form action="${pageContext.request.contextPath}/patients" method="post">
                <input aria-label="name" name="name" placeholder="Patient name" required />
                <button type="submit">Add</button>
            </form>
            <c:forEach items="${patients}" var="p">
                <p>${p.name}</p>
            </c:forEach>
        </body>

        </html>