/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class Feedbacks {
    private int feedbackID;
    private User user;
    private Product product;
    private int rating;
    private String content;
    private String image;
    private Date feedbackDate;
    private int status;

    public Feedbacks() {
    }

    @Override
    public String toString() {
        return "Feedbacks{" + "feedbackID=" + feedbackID + ", user=" + user + ", product=" + product + ", rating=" + rating + ", content=" + content + ", image=" + image + ", feedbackDate=" + feedbackDate + ", status=" + status + '}';
    }

    public Feedbacks(int feedbackID, User user, Product product, int rating, String content, String image, Date feedbackDate, int status) {
        this.feedbackID = feedbackID;
        this.user = user;
        this.product = product;
        this.rating = rating;
        this.content = content;
        this.image = image;
        this.feedbackDate = feedbackDate;
        this.status = status;
    }

    public int getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getFeedbackDate() {
        return feedbackDate;
    }

    public void setFeedbackDate(Date feedbackDate) {
        this.feedbackDate = feedbackDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
}
