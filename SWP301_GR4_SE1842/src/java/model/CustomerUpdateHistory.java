/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


import java.util.Date;


import java.util.Date;

public class CustomerUpdateHistory {

    private int updateId;
    private int customerId;
    private Date updateDate;
    private String updateDetails;

    // Getters and setters
    public int getUpdateId() {
        return updateId;
    }

    public void setUpdateId(int updateId) {
        this.updateId = updateId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getUpdateDetails() {
        return updateDetails;
    }

    public void setUpdateDetails(String updateDetails) {
        this.updateDetails = updateDetails;
    }
}