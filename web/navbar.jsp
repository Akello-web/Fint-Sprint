<%@ page import="tasks.bitlab.db.User" %><%
  User currentUser = (User) session.getAttribute("currentUser");
%>
<div class="row mb-3">
  <div class="col-12">
    <nav class="navbar navbar-expand-lg bg-success navbar-dark">
      <div class="container-fluid">
        <a class="navbar-brand" href="/"><%=nameStore%></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0 align-items-center">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="/">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/add-page_author">All authors</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/news">All news</a>
            </li>

            <%
              if(currentUser!=null){
            %>
            <%
              if(currentUser.getRole()==1){
            %>
            <li class="nav-item">
              <a class="nav-link" href="/add-page_book">Add book</a>
            </li>
            <%
              }
            %>
            <li class="nav-item">
              <a class="nav-link" href="/add-page_news">Add news</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <%=currentUser.getFullName()%>
              </a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Profile</a></li>
                <li><a class="dropdown-item" href="#">Settings</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="/logout">Log out</a></li>
              </ul>
            </li>
            <%
              }else {
            %>
            <li class="nav-item">
              <a class="nav-link" href="/login">Log In</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/register">Sign Up</a>
            </li>
            <%
              }
            %>
          </ul>
          <form action="/" method="get" class="form-control-sm ml-auto w-25 d-flex m-0 me-4">
            <%
              String key = request.getParameter("key");
              if(key==null) key = "";
            %>
          <input class="form-control mr-sm-2" type="search" name="key" placeholder="search..." value="<%=key%>">
          <button class="ms-1 btn btn-primary my-2 my-sm-0">Search</button>
          </form>
        </div>
      </div>
    </nav>
  </div>
</div>