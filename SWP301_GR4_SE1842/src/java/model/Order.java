/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class Order {
    int orderId;
    int userId;
    String fullName;
    Date orderDate;
    String orderDateString;
    Date deliverDate;
    String deliverDateString;
    String phone;
    String email;
    String address;
    int paymentMethodId;
    String  paymentName;
    double totalPrice;
    int statusId;
    String statusName;
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    public Order() {
    }

    public Order(int orderId, int userId, String fullName, Date orderDate, Date deliverDate, String phone, String email, String address, int paymentMethodId, String paymentName, double totalPrice, int statusId, String statusName) {
        this.orderId = orderId;
        this.userId = userId;
        this.fullName = fullName;
        this.orderDate = orderDate;
        this.deliverDate = deliverDate;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.paymentMethodId = paymentMethodId;
        this.paymentName = paymentName;
        this.totalPrice = totalPrice;
        this.statusId = statusId;
        this.statusName = statusName;
    }

    public Order(int orderId, int userId, String fullName, Date orderDate, Date deliverDate, String phone, String email, String address, String paymentName, double totalPrice, String statusName) {
        this.orderId = orderId;
        this.userId = userId;
        this.fullName = fullName;
        this.orderDate = orderDate;
        this.deliverDate = deliverDate;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.paymentName = paymentName;
        this.totalPrice = totalPrice;
        this.statusName = statusName;
    }

    public String getOrderDateString() {
        return orderDateString;
    }

    public void setOrderDateString(String orderDateString) {
        this.orderDateString = orderDateString;
    }

    public String getDeliverDateString() {
        return deliverDateString;
    }

    public void setDeliverDateString(String deliverDateString) {
        this.deliverDateString = deliverDateString;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Date getDeliverDate() {
        return deliverDate;
    }

    public void setDeliverDate(Date deliverDate) {
        this.deliverDate = deliverDate;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPaymentMethodId() {
        return paymentMethodId;
    }

    public void setPaymentMethodId(int paymentMethodId) {
        this.paymentMethodId = paymentMethodId;
    }

    public String getPaymentName() {
        return paymentName;
    }

    public void setPaymentName(String paymentName) {
        this.paymentName = paymentName;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", userId=" + userId + ", fullName=" + fullName + ", orderDate=" + orderDateString + ", deliverDate=" + deliverDateString + ", phone=" + phone + ", email=" + email + ", address=" + address + ", paymentMethodId=" + paymentMethodId + ", paymentName=" + paymentName + ", totalPrice=" + totalPrice + ", statusId=" + statusId + ", statusName=" + statusName + '}';
    }
    
    
}
