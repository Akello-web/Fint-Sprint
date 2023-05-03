<%@ page import="java.util.ArrayList" %>
<%@ page import="tasks.bitlab.db.Book" %>
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
    <div class="col-6 mx-auto">
      <%
        String error = request.getParameter("error");
        if (error != null) {
      %>
      <div class="alert alert-danger alert-dismissible fade show" role="alert">
        Wrong email or password, try again!
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
      <%
        }
      %>
      <form action="/login" method="post">
        <div class="row mt-3">
          <div class="col-12">
            <label>Email:</label>
          </div>
        </div>
        <div class="row mt-1">
          <div class="col-12">
            <input class="form-control" type="email" name="email" placeholder="Insert Email" required>
          </div>
        </div>
        <div class="row mt-3">
          <div class="col-12">
            <label>Password:</label>
          </div>
        </div>
        <div class="row mt-1">
          <div class="col-12">
            <input class="form-control" type="password" name="password" placeholder="Insert Password" required>
          </div>
        </div>
        <div class="row mt-3">
          <div class="col-12">
            <button class="btn btn-success">SIGN IN</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>
