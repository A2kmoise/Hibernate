<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management</title>
    <style>
        body {
            background-color: #ffffff;
            color: #000000;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            width: 100%;
            max-width: 400px;
            padding: 40px;
            border: 2px solid #000000;
        }
        h1 {
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 30px;
            text-transform: uppercase;
            letter-spacing: 2px;
            text-align: center;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            text-transform: uppercase;
            font-size: 12px;
        }
        input[type="text"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #000000;
            background-color: #ffffff;
            color: #000000;
            box-sizing: border-box;
            outline: none;
        }
        input[type="text"]:focus {
            background-color: #000000;
            color: #ffffff;
        }
        button {
            width: 100%;
            padding: 15px;
            background-color: #000000;
            color: #ffffff;
            border: none;
            cursor: pointer;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
        }
        button:hover {
            background-color: #ffffff;
            color: #000000;
            border: 1px solid #000000;
        }
        .message {
            margin-top: 20px;
            font-size: 14px;
            text-align: center;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add Student</h1>
        <form action="addStudent" method="post">
            <div class="form-group">
                <label for="name">Student Name</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="studentClass">Class</label>
                <input type="text" id="studentClass" name="studentClass" required>
            </div>
            <button type="submit">Store in DB</button>
        </form>

        <% if ("true".equals(request.getParameter("success"))) { %>
            <div class="message">Student saved successfully.</div>
        <% } %>
        <% if ("missing_fields".equals(request.getParameter("error"))) { %>
            <div class="message" style="color: grey;">Error: Please fill all fields.</div>
        <% } %>
    </div>
</body>
</html>