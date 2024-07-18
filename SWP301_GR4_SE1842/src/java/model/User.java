/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.UserCartDAO;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author THTP
 */
public class User {
    
    private int id;
    private String username;
    private String password;
    private int roleID;
    private Role role;
    private String avatar;
    private String fullName;
    private String gender;
    private String phone;
    private String email;
    private String address;
    private List<Book> wishList;
    private List<CartItem> carts;

    public User() {
    }

      public User(int user_id, String fullname) {
        this.id = user_id;
        this.fullName = fullname;
    }
    
    public User(int id, String username, String password, Role role, String avatar, String fullName, String gender, String phone, String email, String address) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.avatar = avatar;
        this.fullName = fullName;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.address = address;
    }
 public int getUser_id() {
        return id;
    }
    public User(String username, String password, Role role, String avatar, String fullName, String gender, String phone, String email, String address) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.avatar = avatar;
        this.fullName = fullName;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.address = address;
    }

    public User(String username, String password, int roleID, String avatar, String fullName, String gender, String phone, String email, String address) {
        this.username = username;
        this.password = password;
        this.roleID = roleID;
        this.avatar = avatar;
        this.fullName = fullName;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.address = address;
    }

    public User(int id, String username, String password, int roleID, String avatar, String fullName, String gender, String phone, String email, String address) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.roleID = roleID;
        this.avatar = avatar;
        this.fullName = fullName;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.address = address;
    }
    
    public User(int id, String username, String password, int roleID, String avatar, String fullName, String gender, String phone, String email, String address, List<Book> wishList) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.roleID = roleID;
        this.avatar = avatar;
        this.fullName = fullName;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.wishList = wishList;
        this.carts = new UserCartDAO().getCarts(this.id + "");
        if (this.carts.isEmpty()) {
            this.carts = null;
        }
    }
    
    public int getCartQuantity() {
        if (this.carts == null) return 0;
        return this.carts.size();
    }
    
    public int getBookQuantityInCart() {
        if (this.carts == null) return 0;
        int sum = 0;
        for (CartItem c : this.carts) {
            sum += c.getQuantity();
        }
        return sum;
    }
    
    public String getTotalPriceInCart() {
        if (this.carts == null) return "0";
        float total = 0;
        for (CartItem c : this.carts) {
            total += (c.getBook().getFinalCost() * c.getQuantity());
        }
        return String.format("%.2f", total);
    }

    public List<CartItem> getCarts() {
        return carts;
    }

    public void setCarts(List<CartItem> carts) {
        this.carts = carts;
    }
    
    

    public List<Book> getWishList() {
        if (this.wishList == null) {
            return new ArrayList<>();
        }
        return wishList;
    }

    public void setWishList(List<Book> wishList) {
        this.wishList = wishList;
    }
    
    public int wishListSize() {
        if (this.wishList == null) {
            return 0;
        }
        return this.wishList.size();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getGender() {
        return gender ;
    }

    public void setGender(String gender) {
        this.gender = gender;
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

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }


    @Override
    public String toString() {
        return "User{" + "id=" + id + ", username=" + username + ", password=" + password + ", roleID=" + roleID + ", avatar=" + avatar + ", fullName=" + fullName + ", gender=" + gender + ", phone=" + phone + ", email=" + email + ", address=" + address + '}';
    }
    
    
}
