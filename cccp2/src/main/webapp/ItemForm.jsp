<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   
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
                <c:if test="${Item != null}">
                    <form action="ServletUpdateItem" method="post">
                </c:if>
                <c:if test="${Item == null}">
                    <form action="ServletInsertItem" method="post">
                </c:if>

                <caption>
                    <h2>
                        <c:if test="${Item != null}">
                            Edit Item
                        </c:if>
                        <c:if test="${Item == null}">
                            Add New Item
                        </c:if>
                    </h2>
                </caption>

                <c:if test="${Item != null}">
                    <input type="hidden" name="id" value="<c:out value='${Item.id}' />" />
                </c:if>

                <fieldset class="form-group">
                    <label>Item ID</label>
                    <input type="text" value="<c:out value='${Item.item_id}' />" class="form-control" name="Item_id"
                        required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Item Name</label>
                    <input type="text" value="<c:out value='${Item.name}' />" class="form-control" name="name"
                        required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Quantity of Items</label>
                    <input type="text" value="<c:out value='${Item.quantity}' />" class="form-control" name="quantity">
                </fieldset>

                <fieldset class="form-group">
                    <label>Price</label>
                    <input type="text" value="<c:out value='${Item.price}' />" class="form-control" name="price">
                </fieldset>

                <fieldset class="form-group">
                    <label>Name of Employee</label>
                    <input type="text" value="<c:out value='${Item.employee}' />" class="form-control" name="employee">
                </fieldset>

                <c:if test="${not empty error}">
                    <div class="alert alert-danger">
                        <strong>Error:</strong> ${error}
                    </div>
                </c:if>

                <button type="submit" class="btn btn-success">Save</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
