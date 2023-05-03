package tasks.bitlab.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBConnection {
    private static Connection connection;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bitlab_jdbc",
                    "root",
                    "root");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<Book> getBooks(){

        ArrayList<Book> books = new ArrayList<>();

        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT tb.id, tb.name, tb.genre, tb.price,tb.description, tb.author_id, tau.first_name, tau.last_name " +
                            "FROM table_books AS tb " +
                            "INNER JOIN table_authors AS tau ON tb.author_id = tau.id " +
                            "ORDER BY tb.price DESC");

            ResultSet resultSet = statement.executeQuery();//Подтягиваем данные на переменную
            while (resultSet.next()){
                Book book = new Book();
                book.setId(resultSet.getInt("id"));
                book.setName(resultSet.getString("name"));
                book.setGenre(resultSet.getString("genre"));
                book.setDescription(resultSet.getString("description"));
                book.setPrice(resultSet.getDouble("price"));

                Author author = new Author();
                author.setId(resultSet.getInt("author_id"));
                author.setFirstName(resultSet.getString("first_name"));
                author.setLastName(resultSet.getString("last_name"));

                book.setAuthor(author);

                books.add(book);
            }
            statement.close();//закрываем запрос
        }catch (Exception e){
            e.printStackTrace();
        }

        return books;
    }

    public static void addBook(Book book){
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "INSERT INTO table_books (name, price, author_id, genre, description) " +
                    "VALUES (?, ?, ?, ?, ?)");

            statement.setString(1, book.getName());
            statement.setDouble(2, book.getPrice());
            statement.setInt(3, book.getAuthor().getId());
            statement.setString(4, book.getGenre());
            statement.setString(5, book.getDescription());

            statement.executeUpdate();//отправляем данные
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static Book getBook(int id){
        Book book = null;

        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT tb.id, tb.name, tb.genre, tb.price,tb.description, tb.author_id, tau.first_name, tau.last_name " +
                    "FROM table_books AS tb " +
                    "INNER JOIN table_authors AS tau ON tb.author_id = tau.id " +
                    "WHERE tb.id = ?");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()){
                book = new Book();

                book.setId(resultSet.getInt("id"));
                book.setName(resultSet.getString("name"));
                book.setGenre(resultSet.getString("genre"));
                book.setDescription(resultSet.getString("description"));
                book.setPrice(resultSet.getDouble("price"));

                Author author = new Author();
                author.setId(resultSet.getInt("id"));
                author.setFirstName(resultSet.getString("first_name"));
                author.setLastName(resultSet.getString("last_name"));

                book.setAuthor(author);
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return book;
    }

    public static void updateBook(Book book){
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "UPDATE table_books " +
                    "SET " +
                    "name = ?, " +
                    "price = ?, " +
                    "genre = ?, " +
                    "description = ?, " +
                    "author_id = ? " +
                    "WHERE id = ?");

            statement.setString(1, book.getName());
            statement.setDouble(2, book.getPrice());
            statement.setString(3, book.getGenre());
            statement.setString(4, book.getDescription());
            statement.setInt(5, book.getAuthor().getId());
            statement.setInt(6, book.getId());

            statement.executeUpdate();
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void deleteBook(int id){
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "DELETE FROM table_books WHERE id = ?");
            statement.setInt(1, id) ;


            statement.executeUpdate();
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<Author> getAuthors(){

        ArrayList<Author> authors = new ArrayList<>();

        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT * FROM table_authors");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Author author = new Author();
                author.setId(resultSet.getInt("id"));
                author.setFirstName(resultSet.getString("first_name"));
                author.setLastName(resultSet.getString("last_name"));

                authors.add(author);
            }

            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return authors;
    }

    public static Author getAuthor(int id) {

        Author author = null;

        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT * FROM table_authors WHERE id = ?");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if(resultSet.next()){
                author = new Author();
                author.setId(resultSet.getInt("id"));
                author.setFirstName(resultSet.getString("first_name"));
                author.setLastName(resultSet.getString("last_name"));
                author.setDescription(resultSet.getString("author_description"));
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return author;
    }

    public static void addAuthor(Author author){
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "INSERT INTO table_authors (first_name, last_name, author_description) " +
                    "VALUES (?, ?, ?)");

            statement.setString(1, author.getFirstName());
            statement.setString(2, author.getLastName());
            statement.setString(3, author.getDescription());

            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void updateAuthor(Author author){
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "UPDATE table_authors " +
                    "SET " +
                    "first_name = ?, " +
                    "last_name = ?, " +
                    "author_description = ? " +
                    "WHERE id = ?");

            statement.setString(1, author.getFirstName());
            statement.setString(2, author.getLastName());
            statement.setString(3, author.getDescription());
            statement.setInt(4, author.getId());

            statement.executeUpdate();
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void deleteAuthor(int id){
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "DELETE FROM table_authors WHERE id = ?");
            statement.setInt(1, id) ;


            statement.executeUpdate();
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static User getUser(String email) {

        User user = null;

        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT * FROM table_users WHERE email = ?");
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();

            if(resultSet.next()){
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setFullName(resultSet.getString("full_name"));
                user.setRole(resultSet.getInt("role_id"));
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }

    public static void addUser(User user){
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "INSERT INTO table_users (email, password, full_name, role_id) " +
                    "VALUES (?, ?, ?, ?)");

            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFullName());
            statement.setInt(3, user.getRole());

            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void addNews(News news){
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "INSERT INTO news (title, content, post_date, user_id) " +
                    "VALUES (?, ?, NOW(), ?)");

            statement.setString(1, news.getTitle());
            statement.setString(2, news.getContent());
            statement.setInt(3, news.getUser().getId());

            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<News> getNews(){
        ArrayList<News> news = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT n.id, n.title, n.content, n.user_id, tu.full_name, n.post_date "+
                    "FROM news AS n " +
                    "INNER JOIN table_users AS tu ON tu.id = n.user_id " +
                    "ORDER BY n.post_date DESC");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                News n = new News();
                n.setId(resultSet.getInt("id"));
                n.setTitle(resultSet.getString("title"));
                n.setContent(resultSet.getString("content"));
                n.setPostDate(resultSet.getTimestamp("post_date"));

                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setFullName(resultSet.getString("full_name"));

                n.setUser(user);

                news.add(n);
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return news;
    }

    public static News getNewsById(int id){
        News news = null;
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT n.id, n.title, n.content, n.user_id, tu.full_name, n.post_date "+
                    "FROM news AS n " +
                    "INNER JOIN table_users AS tu ON tu.id = n.user_id " +
                    "WHERE n.id = ?");

            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()){
                news = new News();
                news.setId(resultSet.getInt("id"));
                news.setTitle(resultSet.getString("title"));
                news.setContent(resultSet.getString("content"));
                news.setPostDate(resultSet.getTimestamp("post_date"));

                User user = new User();
                user.setId(resultSet.getInt("user_id"));
                user.setFullName(resultSet.getString("full_name"));
                news.setUser(user);
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return news;
    }

    public static void updateNews(News news){
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "UPDATE news SET title = ?, content = ? " +
                    "WHERE id = ?");

            statement.setString(1, news.getTitle());
            statement.setString(2, news.getContent());
            statement.setInt(3, news.getId());

            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void deleteNews(int id){
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "DELETE FROM news WHERE id = ?");
            statement.setInt(1, id) ;

            statement.executeUpdate();
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void addComment(Comment comment){
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "INSERT INTO comments (comment, user_id, news_id, post_date) " +
                    "VALUES (?, ?, ?, NOW())");

            statement.setString(1, comment.getComment());
            statement.setInt(2, comment.getUser().getId());
            statement.setInt(3, comment.getNews().getId());

            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<Comment> getComment(int newsId){
        ArrayList<Comment> comments = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT co.id, co.comment, co.post_date, co.news_id, co.user_id, tu.full_name " +
                    "FROM comments AS co " +
                    "INNER JOIN table_users AS tu ON tu.id = co.user_id " +
                    "WHERE co.news_id = ? " +
                    "ORDER BY co.post_date DESC ");

            statement.setInt(1, newsId);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Comment comment = new Comment();
                comment.setId(resultSet.getInt("id"));
                comment.setComment(resultSet.getString("comment"));
                comment.setPostDate(resultSet.getTimestamp("post_date"));
                User user = new User();
                user.setId(resultSet.getInt("user_id"));
                user.setFullName(resultSet.getString("full_name"));
                comment.setUser(user);
                News news = new News();
                news.setId(resultSet.getInt("news_id"));
                comment.setNews(news);

                comments.add(comment);
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return comments;
    }

    public static ArrayList<Book> searchBooks(String key){

        ArrayList<Book> books = new ArrayList<>();

        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT tb.id, tb.name, tb.genre, tb.price,tb.description, tb.author_id, tau.first_name, tau.last_name " +
                    "FROM table_books AS tb " +
                    "INNER JOIN table_authors AS tau ON tb.author_id = tau.id " +
                    "WHERE LOWER(tb.name) LIKE LOWER(?) " +
                    "ORDER BY tb.price DESC");

            statement.setString(1, key);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Book book = new Book();
                book.setId(resultSet.getInt("id"));
                book.setName(resultSet.getString("name"));
                book.setGenre(resultSet.getString("genre"));
                book.setDescription(resultSet.getString("description"));
                book.setPrice(resultSet.getDouble("price"));

                Author author = new Author();
                author.setId(resultSet.getInt("author_id"));
                author.setFirstName(resultSet.getString("first_name"));
                author.setLastName(resultSet.getString("last_name"));

                book.setAuthor(author);

                books.add(book);
            }
            statement.close();//закрываем запрос
        }catch (Exception e){
            e.printStackTrace();
        }

        return books;
    }
}
