<%@ page import="java.util.ArrayList" %>
<%@ page import="tasks.bitlab.db.Book" %>
<%@ page import="tasks.bitlab.db.Author" %>
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
    <div class="col-12">
      <%
        if(currentUser!=null && currentUser.getRole()==1){
      %>
      <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#add_author">
        + Add Author
      </button>

      <div class="modal fade" id="add_author" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <%@ page import="tasks.bitlab.db.Author" %>
              <form action="/add-author" method="POST">
                <div class="row mt-3">
                  <div class="col-12">
                    <label>First Name: </label>
                  </div>
                </div>
                <div class="row mt-1" >
                  <div class="col-12">
                    <input type="text" class="form-control " name="first_name" required>
                  </div>
                </div>
                <div class="row mt-3">
                  <div class="col-12">
                    <label>Last Name: </label>
                  </div>
                </div>
                <div class="row mt-1" >
                  <div class="col-12">
                    <input type="text" class="form-control " name="last_name" required>
                  </div>
                </div>
                <div class="row mt-3">
                  <div class="col-12">
                    <label>Author DESCRIPTION: </label>
                  </div>
                </div>
                <div class="row mt-1" >
                  <div class="col-12">
                    <textarea class="form-control" name="author_description" rows="5"></textarea>
                  </div>
                </div>
                <div class="row mt-3">
                  <div class="col-12">
                    <button class="btn btn-success">ADD AUTHOR</button>
                  </div>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <%
    }
  %>

  <div class="row mt-3">
    <div class="col-12">
      <table class="table table-striped table-hover">
        <thead>
        <tr>
          <th>ID</th>
          <th>First Name</th>
          <th>Last Name</th>
          <th style="width: 10%">DETAILS</th>
        </tr>
        </thead>
        <tbody>

        <%
          ArrayList<Author> avtor = (ArrayList<Author>) request.getAttribute("avtorlar");
          if(avtor!=null){
            for (Author a : avtor){
        %>
        <tr>
          <td><%=a.getId()%></td>
          <td><%=a.getFirstName()%></td>
          <td><%=a.getLastName()%></td>
          <td>
            <a href="/detailsAuthor?author_page_id=<%=a.getId()%>" class="btn btn-success btn-small">Details</a>
          </td>
        </tr>
        <%
            }
          }
        %>

        </tbody>
      </table>
    </div>
  </div>
</div>
</body>
</html>
