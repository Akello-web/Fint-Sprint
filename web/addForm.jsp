<%@ page import="tasks.bitlab.db.Author" %>
<form action="/add-book" method="POST">
  <div class="row mt">
    <div class="col-12">
      <label>NAME: </label>
    </div>
  </div>
  <div class="row mt-1" >
    <div class="col-12">
      <input type="text" class="form-control " name="book_name" required>
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
          ArrayList<Author> author = (ArrayList<Author>) request.getAttribute("avtorlar");
          if(author!=null){
            for (Author auth : author){
        %>
        <option value="<%=auth.getId()%>"><%=auth.getFirstName() + " " + auth.getLastName()%></option>
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
        <option>Fantasy</option>
        <option>Politics</option>
        <option>Philosophy</option>
        <option>BestSeller</option>
        <option>Science</option>
        <option>Roman</option>
        <option>History</option>
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
        <option><%=i%></option>
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
      <textarea class="form-control" name="book_description" rows="5"></textarea>
    </div>
  </div>
  <div class="row mt-3">
    <div class="col-12">
      <button class="btn btn-success">ADD THE BOOK</button>
    </div>
  </div>
</form>