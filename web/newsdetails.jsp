<%@ page import="java.util.ArrayList" %>
<%@ page import="tasks.bitlab.db.*" %>
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
  <div class="row mt-3 ">
    <div class="col-12">
      <%
        News news = (News) request.getAttribute("news");
        if(news!=null){
      %>
      <div class="card mx-auto w-75">
        <div class="card-body">
          <h5 class="card-title mb-0"><%=news.getTitle()%></h5>
          <div class="bg-secondary mb-2" style="height: 1px"></div>
          <h6 class="card-text"><%=news.getContent()%></h6>
          <p class="card-text mb-0">CATEGORY: <strong><%=news.getCategory().getName()%></strong></p>
          <p class="card-text">Date: <%=news.getPostDate()%></p>
          <%
            if(currentUser!=null && currentUser.getId() == 1){
          %>
          <div class="row mt-3">
            <div class="col-12">
              <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editNews">
                EDIT
              </button>
              <button type="button" class="btn btn-danger btn-sm ms-2" data-bs-toggle="modal" data-bs-target="#deleteNews">
                DELETE
              </button>
            </div>
          </div>

        <div class="modal fade" id="editNews" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <form action="/save-news" method="post">
                <input type="hidden" name="id" value="<%=news.getId()%>">
              <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Edit News</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <div class="row">
                  <div class="col-12">
                    <label>TITLE: </label>
                  </div>
                </div>
                <div class="row mt-1" >
                  <div class="col-12">
                    <input type="text" class="form-control " name="title" required value="<%=news.getTitle()%>">
                  </div>
                </div>
              <div class="row">
                <div class="col-12">
                  <label>CONTENT: </label>
                </div>
              </div>
              <div class="row mt-1" >
                <div class="col-12">
                  <textarea class="form-control " name="content" required rows="5"><%=news.getContent()%></textarea>
                </div>
              </div>
                <div class="row">
                  <div class="col-12">
                    <label>CATEGORY: </label>
                  </div>
                </div>
                <div class="row mt-1" >
                  <div class="col-12">
                    <select class="form-select" name="news_category" required>
                      <%
                        ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categoryler");
                        if(categories!=null){
                          for (Category cs : categories){
                      %>
                      <option <%=(Objects.equals(cs.getName(), news.getCategory().getName()) ?"selected":"")%> value="<%=cs.getId()%>"><%=cs.getName()%></option>
                      <%
                          }
                        }
                      %>
                    </select>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button class="btn btn-primary">UPDATE</button>
              </div>
              </form>
            </div>
          </div>
        </div>

        <div class="modal fade" id="deleteNews" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <form action="/delete-news" method="post">
                <input type="hidden" name="id" value="<%=news.getId()%>">
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
      <div class="row mt-4 mx-auto w-75">
        <div class="col-12 ">
          <h5>COMMENT SECTION:</h5>
        </div>
      </div>
      <%
        if(currentUser!=null){
      %>
      <div class="row mt-4 mx-auto w-75">
        <div class="col-12 ">
          <form action="/add-comment" method="post">
            <input type="hidden" name="news_id" value="<%=news.getId()%>">
            <textarea class="form-control" name="comment" placeholder="add a comment..."></textarea>
            <div class="row mt-1">
              <div class="col-3 ">
                <button class="btn btn-success btn-sm">ADD COMMENT</button>
              </div>
            </div>
          </form>
        </div>
      </div>
      <%
          }
        %>
      <div class="row mt-2 mx-auto w-75">
        <div class="col-12">
          <%
            ArrayList<Comment> comments = (ArrayList<Comment>) request.getAttribute("comments");
            if(comments!=null){
              for (Comment comment : comments){
          %>
          <div class="list-group mt-1">
            <a href="JavaScript:void(0)" class="list-group-item list-group-item-action flex-column align-items-start">
              <div class="d-flex w-100 justify-content-between">
                <h6 class="mb-1"><%=comment.getUser().getFullName()%></h6>
                <small class="text-muted"><%=comment.getPostDate()%></small>
              </div>
              <div class="d-flex w-100 justify-content-between">
                <p class="mb-1 text-decoration-underline"><%=comment.getComment()%></p>
                <%
                  if(currentUser!=null){
                  if(comment.getUser().getId()==currentUser.getId() || currentUser.getId()==1){
                %>
                <form action="/delete-comment" method="post">
                  <input type="hidden" name="comment_id" value="<%=comment.getId()%>">
                  <input type="hidden" name="news_id" value="<%=news.getId()%>">
                  <button class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteComment">delete</button>
                </form>
                <%
                    }
                  }
                %>
              </div>
            </a>
          </div>
        <%
            }
          }
        %>
        </div>
      </div>
        <%
        }
      %>

    </div>
  </div>
</div>
</body>
</html>
