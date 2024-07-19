/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.OrderDetailDAO;

/**
 *
 * @author ACER
 */
public class OrderDetail {
    private String id;
    private Order order;
    private Book book;
    private int quantity;
    private float price;
    private boolean refund;

    public OrderDetail() {
    }

    public OrderDetail(String id, Book book, int quantity) {
        this.id = id;
        this.book = book;
        this.quantity = quantity;
        this.price = this.book.getFinalCost() * quantity;
    }

    public OrderDetail(String id, Order order, Book book, int quantity) {
        this.id = id;
        this.order = order;
        this.book = book;
        this.quantity = quantity;
        this.price = this.book.getCost() * quantity;
    }
    
    

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }


    public boolean isRefund() {
        RefundBook od = new OrderDetailDAO().getRefundById(this.id);
        if (od == null) {
            return false;
        } else {
            return true;
        }
    }

    public void setRefund(boolean refund) {
        this.refund = refund;
    }
}
