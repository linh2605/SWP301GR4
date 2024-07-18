/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author THTP
 */
public class Discount {

    private int discountId;
    private int bookId;
    private float amount;
    private Date startDate;
    private Date endDate;
    private boolean status;

    public Discount() {
    }

    public Discount(int discountId, int bookId, float amount, Date startDate, Date endDate) {
        this.discountId = discountId;
        this.bookId = bookId;
        this.amount = amount;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public Discount(int discountId, int bookId, float amount, Date startDate, Date endDate, boolean status) {
        this.discountId = discountId;
        this.bookId = bookId;
        this.amount = amount;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
    }

    public Discount(int discountId, int bookId, float amount) {
        this.discountId = discountId;
        this.bookId = bookId;
        this.amount = amount;
    }

    public int getDiscountId() {
        return discountId;
    }

    public void setDiscountId(int discountId) {
        this.discountId = discountId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    

    @Override
    public String toString() {
        return "Discount{" + "discountId=" + discountId + ", bookId=" + bookId + ", amount=" + amount + ", startDate=" + startDate + ", endDate=" + endDate + '}';
    }
}
