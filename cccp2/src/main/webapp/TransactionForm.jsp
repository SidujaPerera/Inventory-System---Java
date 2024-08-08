<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        }

        .nav-link {
            color: white;
            font-weight: bold;
        }

        .nav-link:hover {
            color: white;
            text-decoration: underline;
        }

        .welcome-message {
            font-size: 36px;
            font-weight: bold;
            text-align: center;
            margin-top: 200px;
        }
    </style>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark">
        <div class="container">
           <a href="Home.jsp" class="navbar-brand">Inventory Management System</a>

            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a href="<%=request.getContextPath()%>/ServletShowList" class="nav-link">USERS</a></li>
                <li class="nav-item"><a href="<%=request.getContextPath()%>/ServletShowListItem" class="nav-link">ITEMS AVAILABLE</a></li>
                <li class="nav-item"><a href="<%=request.getContextPath()%>/ShowTransactionForm" class="nav-link">ADD STOCK</a></li>
                <li class="nav-item"><a href="<%=request.getContextPath()%>/ShowGetFromStockForm" class="nav-link">GET FROM STOCK</a></li>
                <li class="nav-item"><a href="<%=request.getContextPath()%>/ServletInventoryReportList" class="nav-link">STOCK REPORT</a></li>
                <li class="nav-item"><a href="<%=request.getContextPath()%>/ServletFinancialReport" class="nav-link">FINANCIAL STATEMENT</a></li>
                <li class="nav-item"><a href="<%=request.getContextPath()%>/ServletShowPersonalUsageReportForm" class="nav-link">PERSONAL ACTIVITY REPORT</a></li>
                <li class="nav-item"><a href="<%=request.getContextPath()%>/ServletShowTransactionList" class="nav-link">TRANSACTION LOG</a></li>
                <li class="nav-item"><a href="<%=request.getContextPath()%>/ServletLogout" class="nav-link">LOGOUT</a></li>
            </ul>
        </div>
    </nav>
</header>
<br>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <form action="ServletInsertTransaction" method="post" onsubmit="return validateForm()">
                <caption>
                    <h2>Add Stock</h2>
                </caption>

                <fieldset class="form-group">
                    <label>Item ID</label>
                    <input type="text" value="" class="form-control" name="item_id" required="required">
                </fieldset>
                <fieldset class="form-group">
                    <label>Price</label>
                    <input type="text" value="" class="form-control" name="price" required="required">
                </fieldset>
                <fieldset class="form-group">
                    <label>Employee Name</label>
                    <input type="text" value="" class="form-control" name="employee_name" required="required">
                </fieldset>
                <fieldset class="form-group">
                    <label>Quantity</label>
                    <input type="text" value="" class="form-control" name="quantity" required="required">
                </fieldset>

                <button type="submit" class="btn btn-success">Save</button>
            </form>
        </div>
    </div>
</div>

<script>
    function validateForm() {
        var itemId = document.getElementsByName("item_id")[0].value;
        var price = document.getElementsByName("price")[0].value;
        var quantity = document.getElementsByName("quantity")[0].value;

        if (itemId < 0 || price < 0 || quantity < 0) {
            alert("Negative values are not allowed.");
            return false;
        }
        return true;
    }
</script>
</body>
</html>
