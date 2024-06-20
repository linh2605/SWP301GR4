package model;

import java.math.BigDecimal;

public class ProductDetails {
    private int productID;
    private String productName;
    private BigDecimal productPrice;
    private int stock;
    private int productRating;
    private String productDesc;
    private int brandID;
    private int supplierID;

    private String image;

    // Constructors
    public ProductDetails() {}

    public ProductDetails(int productID, String productName, BigDecimal productPrice, int stock, int productRating, String productDesc, int brandID, int supplierID, String image) {
        this.productID = productID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.stock = stock;
        this.productRating = productRating;
        this.productDesc = productDesc;
        this.brandID = brandID;
        this.supplierID = supplierID;
        this.image = image;
    }

    // Getters and Setters
    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public BigDecimal getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(BigDecimal productPrice) {
        this.productPrice = productPrice;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getProductRating() {
        return productRating;
    }

    public void setProductRating(int productRating) {
        this.productRating = productRating;
    }

    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    public int getBrandID() {
        return brandID;
    }

    public void setBrandID(int brandID) {
        this.brandID = brandID;
    }

    public int getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(int supplierID) {
        this.supplierID = supplierID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
