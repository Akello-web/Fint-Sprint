package tasks.bitlab.db;

import java.sql.Timestamp;

public class Comment {
    private int id;
    private User user;
    private News news;
    private String comment;
    private Timestamp postDate;

    public Comment() {
    }

    public Comment(int id, User user, News news, String comment, Timestamp postDate) {
        this.id = id;
        this.user = user;
        this.news = news;
        this.comment = comment;
        this.postDate = postDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getPostDate() {
        return postDate;
    }

    public void setPostDate(Timestamp postDate) {
        this.postDate = postDate;
    }
}

