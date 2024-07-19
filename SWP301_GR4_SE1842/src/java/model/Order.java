/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.OrderDetailDAO;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ACER
 */
public class Order {
    private String id;
    private User user;
    private String cusFullname;
    private Date orderDate;
    private Date deliverDate;
    private String phone;
    private String cusEmail;
    private String address;
    private PayMethod paymethod;
    private float totalPrice;
    private OrderStatus status;
    private List<OrderDetail> odList;
    public Order() {
    }

    public Order(String id, User user, Date orderDate, String phone, String Address, PayMethod paymethod, float totalPrice, OrderStatus status, Date deliverDate, String cusFullname, String email) {
        this.id = id;
        this.user = user;
        this.orderDate = orderDate;
        this.phone = phone;
        this.address = Address;
        this.paymethod = paymethod;
        this.totalPrice = totalPrice;
        this.status = status;
        this.deliverDate = deliverDate;
        this.cusFullname = cusFullname;
        this.cusEmail = email;
        this.odList = new OrderDetailDAO().getByOrder(this.id);
    }

    public String getCusFullname() {
        return cusFullname;
    }

    public void setCusFullname(String cusFullname) {
        this.cusFullname = cusFullname;
    }

    public String getCusEmail() {
        return cusEmail;
    }

    public void setCusEmail(String cusEmail) {
        this.cusEmail = cusEmail;
    }


    public Date getDeliverDate() {
        return deliverDate;
    }

    public void setDeliverDate(Date deliverDate) {
        this.deliverDate = deliverDate;
    }

    
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String Address) {
        this.address = Address;
    }

    public PayMethod getPaymethod() {
        return paymethod;
    }

    public void setPaymethod(PayMethod paymethod) {
        this.paymethod = paymethod;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
    }

    public List<OrderDetail> getOdList() {
        return odList;
    }

    public void setOdList(List<OrderDetail> odList) {
        this.odList = odList;
    }
    
    
    
    
    
}
