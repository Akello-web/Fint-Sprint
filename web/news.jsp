<%@ page import="java.util.ArrayList" %>
<%@ page import="tasks.bitlab.db.Book" %>
<%@ page import="tasks.bitlab.db.Author" %>
<%@ page import="tasks.bitlab.db.News" %>
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
    <div class="col-12 d-flex justify-content-between flex-wrap">
      <%
        ArrayList<News> news = (ArrayList<News>) request.getAttribute("news");
        if(news!=null){
          for(News n : news){
      %>
      <div class="card mt-3" style="width: 18rem;">
<%--        <div class="card-header">--%>
<%--        </div>--%>
        <div class="card-body">
          <h5 class="card-title mb-0"><%=n.getTitle()%></h5>
          <div class="bg-secondary mb-2" style="height: 1px"></div>
          <h6 class="card-text"><%=n.getContent()%></h6>
        </div>
        <div class="card-footer">
          <p class="card-text mb-0">Posted by <strong><%=n.getUser().getFullName()%></strong></p>
          <p class="card-text">Date: <%=n.getPostDate()%></p>
          <a href="/news-details?id=<%=n.getId()%>" class="btn btn-primary w-100">Details</a>
        </div>
      </div>

      <%
        }}
      %>
    </div>
  </div>
</div>
</div>
</body>
</html>
