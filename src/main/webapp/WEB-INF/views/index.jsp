<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.devtam.DevShop.Entity.User" %>
<%@ page import ="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type"  content="text/html charset=UTF-8">
<title>Twitter Bootstrap shopping cart</title>
</head>
<body>
        <%
            List<User> users = (List) session.getAttribute("users");
            for(User u:users) {
        %>
            <h1>Id: <%= u.getId() %> and Name: <%= u.getName() %></h1>
        <% } %>
 	<h1> username: <%= users.get(0) %> </h1>

</body>
</html>