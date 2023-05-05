<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Books JSP</title>
  <%@include file="styles.jsp"%>
</head>
<body>
<div class="container mt-3">
  <%@include file="navbar.jsp"%>
  <div class="row mt-3">
    <div class="col-12 text-center">
      <h3 class="mt-4"><%=currentUser!=null?currentUser.getFullName():"Who the fuck are you?"%> in the house!</h3>
    </div>
  </div>
  <form action="/settings" method="post">
    <div class="row">
      <div class="col-12">
        <%
          if(currentUser.getRole()==1){
        %>
        <h3>YOU ARE AN ADMIN! ACT LIKE IT!</h3>
        <%
          }
        %>
        <label>Your username: </label>
        <input class="form-control" type="text" name="userName" value="<%=currentUser.getFullName()%>" readonly>
      </div>
    </div>
    <div class="row mt-2">
      <div class="col-12">
        <label>Your Password: </label>
        <input class="form-control" type="password" id="passwordField" name="userName" value="<%=currentUser.getPassword()%>" readonly>
        Show password <input class="checkboxes" type="checkbox" onclick="togglePassword()" id="showPassword" name="showPassword">
      </div>
    </div>
    <script>
      function togglePassword() {
        var passwordField = document.getElementById("passwordField");
        var showPassword = document.getElementById("showPassword");
        if (showPassword.checked) {
          passwordField.type = "text";
        } else {
          passwordField.type = "password";
        }
      }
    </script>
  </form>
</div>
</body>
</html>
