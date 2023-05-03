<%@ page import="java.util.ArrayList" %>
<%@ page import="tasks.bitlab.db.Book" %>
<%@ page import="tasks.bitlab.db.Author" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Books JSP</title>
  <%@include file="styles.jsp"%>
</head>
<body>
<div class="container mt-3">
  <%@include file="navbar.jsp"%>

  <%
    Author author = (Author)request.getAttribute("totAvtor");
    if (author!=null){
  %>
  <div class="row">
    <div class="col-6 mx-auto">
        <div class="row mt-3">
          <div class="col-12">
            <label>The first name of the Author: </label>
          </div>
        </div>
        <div class="row mt-1" >
          <div class="col-12">
            <input type="text" class="form-control " readonly value="<%=author.getFirstName()%>">
          </div>
        </div>
        <div class="row mt-3">
            <div class="col-12">
                <label>The last name of the Author: </label>
            </div>
        </div>
        <div class="row mt-1" >
            <div class="col-12">
                <input type="text" class="form-control " readonly value="<%=author.getLastName()%>">
            </div>
        </div>

      <div class="row mt-3">
        <div class="col-12">
          <label>DESCRIPTION: </label>
        </div>
      </div>
      <div class="row mt-1" >
        <div class="col-12">
          <textarea class="form-control" readonly rows="5"><%=author.getDescription()%></textarea>
        </div>
      </div>
        <%
            if(currentUser!=null && currentUser.getRole()==1){
        %>
        <div class="row mt-3">
            <div class="col-12">
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editAuthor">
                    EDIT AUTHOR
                </button>
                <button type="button" class="btn btn-danger btn-sm ms-2" data-bs-toggle="modal" data-bs-target="#deleteAuthor">
                    DELETE AUTHOR
                </button>
            </div>
        </div>


        <div class="modal fade" id="editAuthor" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="/save-author" method="POST">
                            <input type="hidden" name="author_page_id" value="<%=author.getId()%>">
                            <div class="row mt-3">
                                <div class="col-12">
                                    <label>FIRST NAME: </label>
                                </div>
                            </div>
                            <div class="row mt-1" >
                                <div class="col-12">
                                    <input type="text" class="form-control " name="first_name"
                                           value="<%=author.getFirstName()%>">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-12">
                                    <label>LAST NAME: </label>
                                </div>
                            </div>
                            <div class="row mt-1" >
                                <div class="col-12">
                                    <input type="text" class="form-control " name="last_name"
                                           value="<%=author.getLastName()%>">
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-12">
                                    <label>DESCRIPTION: </label>
                                </div>
                            </div>
                            <div class="row mt-1" >
                                <div class="col-12">
                                    <textarea class="form-control" name="author_description" rows="5"><%=author.getDescription()%></textarea>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-12">
                                    <button class="btn btn-primary">SAVE CHANGES</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="deleteAuthor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <form action="/delete-author" method="post">
                        <input type="hidden" name="id" value="<%=author.getId()%>">
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
        <%
            }
        %>

    </div>
  </div>
  <%
    } else{
  %>
  <h3 class="text-center mt-5">Unfortunately, there is no such an author that corresponds to your parameters</h3>
  <%
    }
  %>
</div>
</body>
</html>
