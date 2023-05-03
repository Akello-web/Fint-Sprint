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
  <div class="row">
    <div class="col-6 mx-auto">
      <%@include file="addForm.jsp"%>
    </div>
  </div>
</div>
</body>
</html>
