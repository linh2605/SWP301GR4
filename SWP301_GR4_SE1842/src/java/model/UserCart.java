/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;

/**
 *
 * @author auiri
 */
public class UserCart {
    private int userCartId;
    private User user;
    private Product product;
    private int quantity;
    private BigDecimal totalPrice;

    public UserCart() {
    }

    public UserCart(int userCartId, User user, Product product, int quantity) {
        this.userCartId = userCartId;
        this.user = user;
        this.product = product;
        this.quantity = quantity;
        this.totalPrice = product.getProductPrice().multiply(new BigDecimal(quantity));
    }

    public int getUserCartId() {
        return userCartId;
    }

    public void setUserCartId(int userCartId) {
        this.userCartId = userCartId;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof UserCart) {
            UserCart cart = (UserCart) obj;
            return this.product.getProductID() == cart.product.getProductID();
        }
        return false;
    }
    
    
}
