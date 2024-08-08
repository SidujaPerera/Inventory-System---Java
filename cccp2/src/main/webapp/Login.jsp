<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
    <title>Inventory Management System</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        .navbar {
            background-color: green;
        }

        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
            color: white;
            text-align: center;
            width: 100%;
        }

        .nav-link {
            display: none;
        }
    </style>
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: green">
        <div class="mx-auto">
            <a href="Home.jsp" class="navbar-brand">LOGIN</a>
        </div>
    </nav>
</header>

<br>

<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <form action="ServletCheckLogin" method="post" class="p-4 bg-light">
                <h2 class="text-center mb-4">User Verification</h2>

                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" id="username" name="name" required>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password">
                </div>

                <button type="submit" class="btn btn-primary btn-block">Login</button>
            </form>

            <c:if test="${not empty error}">
                <p class="error">${error}</p>
            </c:if>
        </div>
    </div>
</div>

</body>
</html>
