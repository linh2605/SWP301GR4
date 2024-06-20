/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

public class Orders {
    private int orderID;
    private User user;
    private Date orderDate;
    private Date deliverDate;
    private String phone;
    private String address;
    private int paymentMethodID;
    private String paymentMethodName;
    private float price;
    private int quantity;
    private int statusID;
    private String productName;
    private String statusName;
    public Orders() {
    }

    public Orders(int orderID, User user, Date orderDate, Date deliverDate, String phone, String address, int paymentMethodID, String paymentMethodName, float price, int quantity, int statusID, String productName, String statusName) {
        this.orderID = orderID;
        this.user = user;
        this.orderDate = orderDate;
        this.deliverDate = deliverDate;
        this.phone = phone;
        this.address = address;
        this.paymentMethodID = paymentMethodID;
        this.paymentMethodName = paymentMethodName;
        this.price = price;
        this.quantity = quantity;
        this.statusID = statusID;
        this.productName = productName;
        this.statusName = statusName;
    }

   

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPaymentMethodID() {
        return paymentMethodID;
    }

    public void setPaymentMethodID(int paymentMethodID) {
        this.paymentMethodID = paymentMethodID;
    }

    public String getPaymentMethodName() {
        return paymentMethodName;
    }

    public void setPaymentMethodName(String paymentMethodName) {
        this.paymentMethodName = paymentMethodName;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }
    

    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", user=" + user + ", orderDate=" + orderDate + ", deliverDate=" + deliverDate + ", phone=" + phone + ", address=" + address + ", paymentMethodID=" + paymentMethodID + ", paymentMethodName=" + paymentMethodName + ", price=" + price + ", quantity=" + quantity + ", productName=" + productName + ", statusName=" + statusName + '}';
    }

    
    
}
