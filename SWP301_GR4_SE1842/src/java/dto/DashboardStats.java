/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.util.List;

/**
 *
 * @author Admin
 */
public class DashboardStats {

    private int successOrders;
    private int cancelledOrders;
    private int submittedOrders;
    private double totalRevenue;
    private List<CategoryRevenue> revenueByCategory;
    private int newCustomers;
    private int newBoughtCustomers;
    private double averageRating;
    private int totalFeedbacks;
    private List<String> orderTrendDates;
    private List<Integer> orderTrendCounts;

    // Getters and setters for all fields
    public int getSuccessOrders() {
        return successOrders;
    }

    public void setSuccessOrders(int successOrders) {
        this.successOrders = successOrders;
    }

    public int getCancelledOrders() {
        return cancelledOrders;
    }

    public void setCancelledOrders(int cancelledOrders) {
        this.cancelledOrders = cancelledOrders;
    }

    public int getSubmittedOrders() {
        return submittedOrders;
    }

    public void setSubmittedOrders(int submittedOrders) {
        this.submittedOrders = submittedOrders;
    }

    public double getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(double totalRevenue) {
        this.totalRevenue = totalRevenue;
    }

    public List<CategoryRevenue> getRevenueByCategory() {
        return revenueByCategory;
    }

    public void setRevenueByCategory(List<CategoryRevenue> revenueByCategory) {
        this.revenueByCategory = revenueByCategory;
    }

    public int getNewCustomers() {
        return newCustomers;
    }

    public void setNewCustomers(int newCustomers) {
        this.newCustomers = newCustomers;
    }

    public int getNewBoughtCustomers() {
        return newBoughtCustomers;
    }

    public void setNewBoughtCustomers(int newBoughtCustomers) {
        this.newBoughtCustomers = newBoughtCustomers;
    }

    public double getAverageRating() {
        return averageRating;
    }

    public void setAverageRating(double averageRating) {
        this.averageRating = averageRating;
    }

    public int getTotalFeedbacks() {
        return totalFeedbacks;
    }

    public void setTotalFeedbacks(int totalFeedbacks) {
        this.totalFeedbacks = totalFeedbacks;
    }

    public List<String> getOrderTrendDates() {
        return orderTrendDates;
    }

    public void setOrderTrendDates(List<String> orderTrendDates) {
        this.orderTrendDates = orderTrendDates;
    }

    public List<Integer> getOrderTrendCounts() {
        return orderTrendCounts;
    }

    public void setOrderTrendCounts(List<Integer> orderTrendCounts) {
        this.orderTrendCounts = orderTrendCounts;
    }
}

