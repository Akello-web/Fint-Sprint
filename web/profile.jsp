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
    <div class="col-12 text-center">
      <h3 class="mt-4"><%=currentUser!=null?currentUser.getFullName():"Who the fuck are you?"%> in the house!</h3>
    </div>
  </div>
</div>
</body>
</html>
