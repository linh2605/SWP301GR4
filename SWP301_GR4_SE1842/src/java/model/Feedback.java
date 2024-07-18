/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.Date;

/**
 *
 * @author 84375
 */
public class Feedback {
    private int fbId;
    private int fbCusId;
    private int fbProId;
    private int fbStar;
    private String fbContent;
    private String fbImage;
    private Date fbDate;
    private int fbStatus;
    private User user;
    private Book book;

    public Feedback() {
    }

    public Feedback(int fbId, int fbCusId, int fbProId, int fbStar, String fbContent, String fbImage, Date fbDate, int fbStatus) {
        this.fbId = fbId;
        this.fbCusId = fbCusId;
        this.fbProId = fbProId;
        this.fbStar = fbStar;
        this.fbContent = fbContent;
        this.fbImage = fbImage;
        this.fbDate = fbDate;
        this.fbStatus = fbStatus;
    }

 

    public int getFbId() {
        return fbId;
    }

    public int getFbCusId() {
        return fbCusId;
    }

    public int getFbProId() {
        return fbProId;
    }

    public int getFbStar() {
        return fbStar;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }


    public String getFbContent() {
        return fbContent;
    }

    public String getFbImage() {
        return fbImage;
    }

    public Date getFbDate() {
        return fbDate;
    }

    public int getFbStatus() {
        return fbStatus;
    }

    public void setFbId(int fbId) {
        this.fbId = fbId;
    }

    public void setFbCusId(int fbCusId) {
        this.fbCusId = fbCusId;
    }

    public void setFbProId(int fbProId) {
        this.fbProId = fbProId;
    }

    public void setFbStar(int fbStar) {
        this.fbStar = fbStar;
    }

    public void setFbContent(String fbContent) {
        this.fbContent = fbContent;
    }

    public void setFbImage(String fbImage) {
        this.fbImage = fbImage;
    }

    public void setFbDate(Date fbDate) {
        this.fbDate = fbDate;
    }

    public void setFbStatus(int fbStatus) {
        this.fbStatus = fbStatus;
    }
    
    @Override
    public String toString() {
        return "Feedback{" + "cfbId=" + fbId + ", fbCusId=" + fbCusId + ", fbProID=" + fbProId + ", fbStar=" + fbStar + ", fbContent=" + fbContent + ", fbImage=" + fbImage + ", fbDate=" + fbDate + ", fbStatus=" + fbStatus + '}';
    }
    
}
