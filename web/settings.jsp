<%@ page import="java.util.ArrayList" %>
<%@ page import="tasks.bitlab.db.Category" %>
<%@ page import="tasks.bitlab.db.DBConnection" %>
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
      <form action="/change_acc" method="post">
        <input type="hidden" name="user_email" value="<%=currentUser.getEmail()%>">
        <div class="row">
          <div class="col-12">
            <h5>CHANGE USERNAME AND PASSWORD</h5>
            <label>Your username: </label>
            <input class="form-control" type="text" name="userName" value="<%=currentUser.getFullName()%>">
          </div>
        </div>
        <div class="row mt-2">
          <div class="col-12">
            <label>Your Password: </label>
            <input class="form-control" type="text" name="userPassword" value="<%=currentUser.getPassword()%>">
          </div>
        </div>
        <div class="row mt-2">
          <div class="col-12">
            <button class="btn btn-primary btn-sm">
              CHANGE
            </button>
          </div>
        </div>
      </form>

      <div class="bg-dark" style="height: 1px"></div>

        <div class="row mt-3">
          <div class="col-12">
            <h5>DELETE ACCOUNT</h5>
          </div>
        </div>
        <div class="row mt-2">
          <div class="col-12">
            <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteUser">
              DELETE
            </button>
          </div>
        </div>

        <div class="modal fade" id="deleteUser" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <form action="/delete_acc" method="post">
                <input type="hidden" name="user_id" value="<%=currentUser.getId()%>">
                <div class="modal-header">
                  <h1 class="modal-title fs-5">Confirm Delete</h1>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <h3 class="text-center">Are you sure?</h3>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                  <button class="btn btn-danger">Yes</button>
                </div>
              </form>
            </div>
          </div>
        </div>
    </div>
  </div>
</div>
</body>
</html>
