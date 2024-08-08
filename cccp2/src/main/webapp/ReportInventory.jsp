<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
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

            <div class="row">
                <div class="container">
                    <h3 class="text-center" style="font-weight: bold; font-size: 28px; margin-bottom: 20px;">INVENTORY REPORT</h3>
                    <hr>
                    <br>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Item ID</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Employee</th>
                               <!--<th>Actions</th>  --> 
                            </tr>
                        </thead>
                        <tbody>
                        	<!--   for (Todo todo: todos) {  -->
                            <c:forEach var="item" items="${listItem}">
                                <tr>
                                    <td>
                                        <c:out value="${item.id}" />
                                    </td>
                                    <td>
                                        <c:out value="${item.item_id}" />
                                    </td>
                                    <td>
                                        <c:out value="${item.name}" />
                                    </td>
                                    <td>
                                        <c:out value="${item.price}" />
                                    </td>
                                    <td>
                                        <c:out value="${item.quantity}" />
                                    </td>
                                    <td>
                                        <c:out value="${item.employee}" />
                                    </td>
                                    <!-- <td><a href="ServletEditItemForm?id=<c:out value='${item.id}' />">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="ServletDeleteItem?id=<c:out value='${item.id}' />">Delete</a></td> -->
                                </tr>
                            </c:forEach>
                            <!-- } -->
                        </tbody>

                    </table>
                </div>
            </div>
        </body>

        </html>