package model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Feedback {
    private int feedbackID;
    private int productID;
    private String userName;
    private BigDecimal rating;
    private String comment;
    private Timestamp feedbackDate;
    private Product product;
    private String status;
    
    // Constructors
    public Feedback() {}

    public Feedback(int feedbackID, int productID, String userName, BigDecimal rating, String comment, Timestamp feedbackDate) {
        this.feedbackID = feedbackID;
        this.productID = productID;
        this.userName = userName;
        this.rating = rating;
        this.comment = comment;
        this.feedbackDate = feedbackDate;
    }

    public Feedback(int feedbackID, int productID, String userName, BigDecimal rating, String comment, Timestamp feedbackDate, Product product) {
        this(feedbackID, productID, userName, rating, comment, feedbackDate);
        this.product = product;
    }

    public Feedback(int feedbackID, int productID, String userName, BigDecimal rating, String comment, String status, Timestamp feedbackDate, Product product) {
        this(feedbackID, productID, userName, rating, comment, feedbackDate, product);
        this.status = status;
    }

    // Getters and Setters
    public int getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public BigDecimal getRating() {
        return rating;
    }

    public void setRating(BigDecimal rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getFeedbackDate() {
        return feedbackDate;
    }

    public void setFeedbackDate(Timestamp feedbackDate) {
        this.feedbackDate = feedbackDate;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
