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
                <div class="col-12">
                    <div class="row">
                        <h3 class="text-center">Welcome to <%=nameStore%>!</h3>
                    </div>

                    <%
                        if(currentUser!=null && currentUser.getRole()==1){
                    %>
                    <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#add_book">
                        + Add Book
                    </button>

                    <div class="modal fade" id="add_book" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <%@include file="addForm.jsp"%>
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
                                <th>Name</th>
                                <th>AUTHOR</th>
                                <th>Genre</th>
                                <th>PRICE</th>
                                <th style="width: 10%">DETAILS</th>
                            </tr>
                        </thead>
                        <tbody>

                                <%
                                    ArrayList<Book> kitap = (ArrayList<Book>) request.getAttribute("buks");
                                    if(kitap!=null){
                                    for (Book k : kitap){
                                %>
                                <tr>
                                    <td><%=k.getId()%></td>
                                    <td><%=k.getName()%></td>
                                    <td><%=k.getAuthor().getFirstName() + " " + k.getAuthor().getLastName()%></td>
                                    <td><%=k.getGenre()%></td>
                                    <td><%=k.getPrice()%> KZT</td>
                                    <td>
                                        <a href="/details?book_id=<%=k.getId()%>" class="btn btn-success btn-small">Details</a>
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
