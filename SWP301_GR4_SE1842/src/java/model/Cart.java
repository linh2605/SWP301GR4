/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author Admin
 */
public class Cart {

    private List<CartItem> items;
    private float totalPrice;

    public Cart() {
    }

    public Cart(List<CartItem> items, float totalPrice) {
        this.items = items;
        this.totalPrice = totalPrice;
    }

    public List<CartItem> getItems() {
        return items;
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public boolean checkExist(int id) {
        for (CartItem item : items) {
            if (item.getBook().getId() == id) {
                return true;
            }
        }
        return false;
    }

    private CartItem getItemByID(int id) {
        for (CartItem item : items) {
            if (item.getBook().getId() == id) {
                return item;
            }
        }
        return null;
    }

    public void addItem(CartItem newItem) {
        if (checkExist(newItem.getBook().getId())) {
            CartItem oldItem = getItemByID(newItem.getBook().getId());
            oldItem.setQuantity(oldItem.getQuantity() + newItem.getQuantity());
        } else {
            items.add(newItem);
        }
    }

    public void removeItem(int id) {
        if (getItemByID(id) != null) {
            items.remove(getItemByID(id));
        }
    }

    public void changeQuantity(int id, int quantity) {
        CartItem item = getItemByID(id);
        item.setQuantity(quantity);
        if (quantity == 0) {
            removeItem(id);
        }
    }

    public float getTotal() {
        float total = 0;
        for (CartItem item : items) {
            total += (float) (item.getQuantity() * item.getBook().getCost());
        }
        return total;
    }
      public float getTotalWithDiscount() {
        float total = 0;
        for (CartItem item : items) {
            total += (float) (item.getQuantity() * item.getBook().getFinalCost());
        }
        return total;
    }

    public float getPrice() {
        float price = 0;
        for (CartItem item : items) {
            price = (float) (item.getQuantity() * item.getBook().getCost());
        }
        return price;
    }

    public int getQuantity() {
        int quantity = 0;
        if (items != null) {
            for (CartItem item : items) {
                quantity += item.getQuantity();
            }
        }
        return quantity;
    }
}
