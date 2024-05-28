/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

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

    public User() {
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

    public User(int id, String fullName, String gender, String phone, String address) {
        this.id = id;
        this.fullName = fullName;
        this.gender = gender;
        this.phone = phone;
        this.address = address;
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
