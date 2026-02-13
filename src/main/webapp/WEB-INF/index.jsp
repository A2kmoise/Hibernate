<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Student Dashboard | Minimalist</title>
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap"
                rel="stylesheet">
            <style>
                :root {
                    --bg: #ffffff;
                    --text: #000000;
                    --muted: #666666;
                    --border: #000000;
                    --hover-bg: #f5f5f5;
                }

                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                }

                body {
                    background-color: var(--bg);
                    color: var(--text);
                    font-family: 'Inter', sans-serif;
                    line-height: 1.6;
                    padding: 40px;
                }

                .dashboard {
                    max-width: 1000px;
                    margin: 0 auto;
                }

                header {
                    display: flex;
                    justify-content: space-between;
                    align-items: flex-end;
                    margin-bottom: 60px;
                    border-bottom: 4px solid var(--border);
                    padding-bottom: 20px;
                }

                h1 {
                    font-size: 32px;
                    font-weight: 800;
                    text-transform: uppercase;
                    letter-spacing: -1px;
                }

                .stats {
                    font-size: 12px;
                    font-weight: 600;
                    text-transform: uppercase;
                    letter-spacing: 2px;
                }

                .main-content {
                    display: grid;
                    grid-template-columns: 1fr 300px;
                    gap: 60px;
                }

                section h2 {
                    font-size: 14px;
                    font-weight: 800;
                    text-transform: uppercase;
                    letter-spacing: 2px;
                    margin-bottom: 20px;
                    display: flex;
                    align-items: center;
                }

                section h2::after {
                    content: '';
                    flex-grow: 1;
                    height: 1px;
                    background: var(--border);
                    margin-left: 20px;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-top: 10px;
                }

                th {
                    text-align: left;
                    font-size: 11px;
                    font-weight: 700;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    padding: 15px 10px;
                    border-bottom: 2px solid var(--border);
                    color: var(--muted);
                }

                td {
                    padding: 20px 10px;
                    border-bottom: 1px solid #eeeeee;
                    font-size: 14px;
                }

                tr:hover td {
                    background-color: var(--hover-bg);
                }

                .actions {
                    display: flex;
                    gap: 15px;
                }

                .actions a {
                    text-decoration: none;
                    color: var(--text);
                    font-size: 11px;
                    font-weight: 700;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    border-bottom: 1px solid transparent;
                    transition: all 0.2s;
                }

                .actions a:hover {
                    border-bottom-color: var(--border);
                }

                .actions a.delete {
                    color: #ff0000;
                }

                .actions a.delete:hover {
                    border-bottom-color: #ff0000;
                }

                .form-card {
                    border: 2px solid var(--border);
                    padding: 30px;
                    position: sticky;
                    top: 40px;
                }

                .form-group {
                    margin-bottom: 25px;
                }

                label {
                    display: block;
                    font-size: 10px;
                    font-weight: 800;
                    text-transform: uppercase;
                    letter-spacing: 2px;
                    margin-bottom: 8px;
                }

                input[type="text"] {
                    width: 100%;
                    padding: 12px;
                    border: 1px solid var(--border);
                    font-family: inherit;
                    font-weight: 600;
                    outline: none;
                    transition: all 0.2s;
                }

                input[type="text"]:focus {
                    background: var(--text);
                    color: var(--bg);
                }

                .btn {
                    display: inline-block;
                    width: 100%;
                    padding: 15px;
                    background: var(--text);
                    color: var(--bg);
                    border: 1px solid var(--text);
                    font-size: 11px;
                    font-weight: 800;
                    text-transform: uppercase;
                    letter-spacing: 2px;
                    cursor: pointer;
                    transition: all 0.3s;
                    text-align: center;
                    text-decoration: none;
                }

                .btn:hover {
                    background: var(--bg);
                    color: var(--text);
                }

                .btn-outline {
                    background: var(--bg);
                    color: var(--text);
                }

                .btn-outline:hover {
                    background: var(--text);
                    color: var(--bg);
                }

                .alert {
                    margin-bottom: 30px;
                    padding: 15px;
                    border: 1px solid var(--border);
                    font-size: 12px;
                    font-weight: 600;
                    text-transform: uppercase;
                    letter-spacing: 1px;
                    text-align: center;
                }

                .alert-success {
                    background: #f0f0f0;
                }

                .alert-error {
                    background: #ffeeee;
                    color: #ff0000;
                    border-color: #ff0000;
                }

                @media (max-width: 768px) {
                    .main-content {
                        grid-template-columns: 1fr;
                    }

                    body {
                        padding: 20px;
                    }
                }
            </style>
        </head>

        <body>
            <div class="dashboard">
                <header>
                    <h1>Students</h1>
                    <div class="stats">
                        Total:
                        <c:out value="${listStudent.size()}" />
                    </div>
                </header>

                <c:if test="${not empty param.success}">
                    <div class="alert alert-success">Student stored successfully.</div>
                </c:if>
                <c:if test="${not empty param.updated}">
                    <div class="alert alert-success">Student updated successfully.</div>
                </c:if>
                <c:if test="${not empty param.deleted}">
                    <div class="alert alert-success">Student removed from registry.</div>
                </c:if>
                <c:if test="${not empty param.error}">
                    <div class="alert alert-error">Error: Please verify all fields.</div>
                </c:if>

                <div class="main-content">
                    <section class="student-list">
                        <h2>Registry</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Class</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="student" items="${listStudent}">
                                    <tr>
                                        <td>
                                            <c:out value="${student.id}" />
                                        </td>
                                        <td><strong>
                                                <c:out value="${student.name}" />
                                            </strong></td>
                                        <td>
                                            <c:out value="${student.studentClass}" />
                                        </td>
                                        <td class="actions">
                                            <a href="edit?id=<c:out value='${student.id}'/>">Edit</a>
                                            <a href="delete?id=<c:out value='${student.id}'/>" class="delete"
                                                onclick="return confirm('Remove student permanently?')">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty listStudent}">
                                    <tr>
                                        <td colspan="4" style="text-align: center; color: var(--muted); padding: 40px;">
                                            No students records found.</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </section>

                    <aside>
                        <div class="form-card">
                            <c:choose>
                                <c:when test="${not empty student}">
                                    <h2>Update Student</h2>
                                    <form action="update" method="post">
                                        <input type="hidden" name="id" value="<c:out value='${student.id}'/>" />
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input type="text" name="name" value="<c:out value='${student.name}'/>"
                                                required>
                                        </div>
                                        <div class="form-group">
                                            <label>Class</label>
                                            <input type="text" name="studentClass"
                                                value="<c:out value='${student.studentClass}'/>" required>
                                        </div>
                                        <button type="submit" class="btn">Apply Changes</button>
                                        <a href="${pageContext.request.contextPath}/" class="btn btn-outline"
                                            style="margin-top: 10px;">Cancel</a>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <h2>Add Student</h2>
                                    <form action="add" method="post">
                                        <div class="form-group">
                                            <label>Full Name</label>
                                            <input type="text" name="name" placeholder="e.g. Moise" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Class</label>
                                            <input type="text" name="studentClass" placeholder="e.g. Y2A" required>
                                        </div>
                                        <button type="submit" class="btn">Store Student</button>
                                    </form>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </aside>
                </div>
            </div>
        </body>

        </html>