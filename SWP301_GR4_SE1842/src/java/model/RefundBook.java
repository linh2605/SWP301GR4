/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;
import java.util.Date;

/**
 *
 * @author ACER
 */
public class RefundBook {
    private OrderDetail orderDetail;
    private LocalDateTime refundDate;
    private String reason;
    private String image;
    private int refundStatus;
    private String declineReason;

    public RefundBook() {
    }

    public RefundBook(OrderDetail orderDetail, LocalDateTime refundDate, String reason, String image, int refundStatus) {
        this.orderDetail = orderDetail;
        this.refundDate = refundDate;
        this.reason = reason;
        this.image = image;
        this.refundStatus = refundStatus;
    }
    
    public RefundBook(OrderDetail orderDetail, LocalDateTime refundDate, String reason, String image, int refundStatus, String declineReason) {
        this.orderDetail = orderDetail;
        this.refundDate = refundDate;
        this.reason = reason;
        this.image = image;
        this.refundStatus = refundStatus;
        this.declineReason = declineReason;
    }
    

    public String getDeclineReason() {
        return declineReason;
    }

    public void setDeclineReason(String declineReason) {
        this.declineReason = declineReason;
    }
    
    

    public OrderDetail getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(OrderDetail orderDetail) {
        this.orderDetail = orderDetail;
    }

    public LocalDateTime getRefundDate() {
        return refundDate;
    }

    public void setRefundDate(LocalDateTime refundDate) {
        this.refundDate = refundDate;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getRefundStatus() {
        return refundStatus;
    }

    public void setRefundStatus(int isRead) {
        this.refundStatus = isRead;
    }
    
    
    
}
