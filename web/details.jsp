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
    Book book = (Book)request.getAttribute("kniga");
    if (book!=null){
  %>
  <div class="row">
    <div class="col-6 mx-auto">
        <div class="row mt-3">
          <div class="col-12">
            <label>NAME: </label>
          </div>
        </div>
        <div class="row mt-1" >
          <div class="col-12">
            <input type="text" class="form-control " readonly value="<%=book.getName()%>">
          </div>
        </div>
        <div class="row mt-3">
          <div class="col-12">
            <label>AUTHOR: </label>
          </div>
        </div>
        <div class="row mt-1" >
          <div class="col-12">
            <input type="text" class="form-control" readonly value="<%=book.getAuthor().getFirstName() + " " + book.getAuthor().getLastName()%>">
          </div>
        </div>
        <div class="row mt-3">
          <div class="col-12">
            <label>GENRE: </label>
          </div>
        </div>
        <div class="row mt-1" >
          <div class="col-12">
            <input type="text" class="form-control" readonly value="<%=book.getGenre()%>">
          </div>
        </div>
        <div class="row mt-3">
          <div class="col-12">
            <label>Price: </label>
          </div>
        </div>
        <div class="row mt-1" >
          <div class="col-12">
            <input type="text" class="form-control" readonly value="<%=book.getPrice()%> KZT">
          </div>
        </div>
      <div class="row mt-3">
        <div class="col-12">
          <label>DESCRIPTION: </label>
        </div>
      </div>
      <div class="row mt-1" >
        <div class="col-12">
          <textarea class="form-control" readonly rows="5"><%=book.getDescription()%></textarea>
        </div>
      </div>
        <%
            if(currentUser!=null && currentUser.getRole()==1){
        %>
        <div class="row mt-3">
            <div class="col-12">
                <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editBook">
                    EDIT BOOK
                </button>
                <button type="button" class="btn btn-danger btn-sm ms-2" data-bs-toggle="modal" data-bs-target="#deleteBook">
                    DELETE BOOK
                </button>
            </div>
        </div>


        <div class="modal fade" id="editBook" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="/save-book" method="POST">
                            <input type="hidden" name="book_id" value="<%=book.getId()%>">
                            <div class="row mt-3">
                                <div class="col-12">
                                    <label>NAME: </label>
                                </div>
                            </div>
                            <div class="row mt-1" >
                                <div class="col-12">
                                    <input type="text" class="form-control " name="book_name"
                                           value="<%=book.getName()%>">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-12">
                                    <label>AUTHOR: </label>
                                </div>
                            </div>
                            <div class="row mt-1" >
                                <div class="col-12">
                                    <select class="form-select" name="book_author" required>
                                        <%
                                            ArrayList<Author> authors = (ArrayList<Author>) request.getAttribute("avtorlar");
                                            if(authors!=null){
                                                for (Author auths : authors){
                                        %>

                                        <option <%=(auths.getId()==book.getAuthor().getId()?"selected":"")%> value="<%=auths.getId()%>"><%=auths.getFirstName() + " " + auths.getLastName()%></option>

                                        <%
                                                }}
                                        %>
                                    </select>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-12">
                                    <label>GENRE: </label>
                                </div>
                            </div>
                            <div class="row mt-1" >
                                <div class="col-12">
                                    <select class="form-select" name="book_genre" required>
                                        <option <%=(book.getGenre().equals("Fantasy")?"selected":"")%>
                                        >Fantasy</option>
                                        <option <%=(book.getGenre().equals("Politics")?"selected":"")%>
                                        >Politics</option>
                                        <option <%=(book.getGenre().equals("Philosophy")?"selected":"")%>
                                        >Philosophy</option>
                                        <option <%=(book.getGenre().equals("Roman")?"selected":"")%>
                                        >Roman</option>
                                        <option <%=(book.getGenre().equals("History")?"selected":"")%>
                                        >History</option>
                                        <option <%=(book.getGenre().equals("Science")?"selected":"")%>
                                        >Science</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-12">
                                    <label>Price: </label>
                                </div>
                            </div>
                            <div class="row mt-1" >
                                <div class="col-12">
                                    <select class="form-select" name="book_price" required>
                                        <%
                                            for (int i = 0; i <= 10000; i=i+500) {
                                        %>
                                        <option <%=(i==book.getPrice()?"selected":"")%>><%=i%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-12">
                                    <label>DESCRIPTION: </label>
                                </div>
                            </div>
                            <div class="row mt-1" >
                                <div class="col-12">
                                    <textarea class="form-control" name="book_description" rows="5"><%=book.getDescription()%></textarea>
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

        <div class="modal fade" id="deleteBook" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="/delete-book" method="post">
                        <input type="hidden" name="id" value="<%=book.getId()%>">
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
  <h3 class="text-center mt-5">Unfortunately, there is no such a book that corresponds to your parameters</h3>
  <%
    }
  %>
</div>
</body>
</html>
