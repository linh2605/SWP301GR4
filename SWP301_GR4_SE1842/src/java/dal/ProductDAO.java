/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author ADMIN
 */
public class ProductDAO extends DBContext {

    public void createProduct(Product product) {
        String sql = "INSERT INTO Product (ProductName, ProductPrice, Stock, ProductRating, ProductDesc, BrandID, SupplierID) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, product.getProductName());
            ps.setBigDecimal(2, product.getProductPrice());
            ps.setInt(3, product.getStock());
            ps.setInt(4, product.getProductRating());
            ps.setString(5, product.getProductDesc());
            ps.setInt(6, product.getBrandID());
            ps.setInt(7, product.getSupplierID());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Read a product by its ID
    public Product getProductById(int productID) {
        String sql = "SELECT * FROM Product\n"
                + ",images where Product.ProductID = images.ProductID and Product.ProductID = ?";
        try (PreparedStatement ps = new DBContext().getConnection().prepareStatement(sql)) {
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setProductPrice(rs.getBigDecimal("ProductPrice"));
                product.setStock(rs.getInt("Stock"));
                product.setProductRating(rs.getInt("ProductRating"));
                product.setProductDesc(rs.getString("ProductDesc"));
                product.setBrandID(rs.getInt("BrandID"));
                product.setSupplierID(rs.getInt("SupplierID"));
                product.setImage(rs.getString("Image"));
                return product;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Read all products
    public List<Product> getAllProducts(String searchParam, Integer categoryId) {
        List<Product> products = new ArrayList<>();
        List<Object> list = new ArrayList<>();
        try {
            StringBuilder query = new StringBuilder();
            query.append("""
                         Select p.*, c.CategoryName, i.Image from Product p
                         JOIN ProductCategory pc ON p.ProductID = pc.ProductID
                         JOIN Category c ON c.CategoryID = pc.CategoryID
                         JOIN Images i ON i.ProductID = P.ProductID  where 1=1""");
            if (searchParam != null && !searchParam.trim().isEmpty()) {
                query.append(" AND productName LIKE ? ");
                list.add("%" + searchParam + "%");
            }
            if (categoryId != null && categoryId != 0) {
                query.append(" AND c.CategoryID = ? ");
                list.add(categoryId);
            }
            query.append(" ORDER BY p.ProductID DESC");
            PreparedStatement preparedStatement;
            preparedStatement = new DBContext().getConnection().prepareStatement(query.toString());
            mapParams(preparedStatement, list);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    Product product = new Product();
                    product.setProductID(rs.getInt("ProductID"));
                    product.setProductName(rs.getString("ProductName"));
                    product.setProductPrice(rs.getBigDecimal("ProductPrice"));
                    product.setStock(rs.getInt("Stock"));
                    product.setProductRating(rs.getInt("ProductRating"));
                    product.setProductDesc(rs.getString("ProductDesc"));
                    product.setBrandID(rs.getInt("BrandID"));
                    product.setSupplierID(rs.getInt("SupplierID"));
                    product.setImage(rs.getString("Image"));
                    products.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }
    // Update a product

    public void updateProduct(Product product) {
        String sql = "UPDATE Product SET ProductName = ?, ProductPrice = ?, Stock = ?, ProductRating = ?, ProductDesc = ?, BrandID = ?, SupplierID = ? WHERE ProductID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, product.getProductName());
            ps.setBigDecimal(2, product.getProductPrice());
            ps.setInt(3, product.getStock());
            ps.setInt(4, product.getProductRating());
            ps.setString(5, product.getProductDesc());
            ps.setInt(6, product.getBrandID());
            ps.setInt(7, product.getSupplierID());
            ps.setInt(8, product.getProductID());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Delete a product
    public void deleteProduct(int productID) {
        String sql = "DELETE FROM Product WHERE ProductID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, productID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void mapParams(PreparedStatement ps, List<Object> args) throws SQLException {
        int i = 1;
        for (Object arg : args) {
            if (arg instanceof Date) {
                ps.setTimestamp(i++, new Timestamp(((Date) arg).getTime()));
            } else if (arg instanceof Integer) {
                ps.setInt(i++, (Integer) arg);
            } else if (arg instanceof Long) {
                ps.setLong(i++, (Long) arg);
            } else if (arg instanceof Double) {
                ps.setDouble(i++, (Double) arg);
            } else if (arg instanceof Float) {
                ps.setFloat(i++, (Float) arg);
            } else {
                ps.setString(i++, (String) arg);
            }

        }
    }

    public List<Product> Paging(List<Product> products, int page, int pageSize) {
        int fromIndex = (page - 1) * pageSize;
        int toIndex = Math.min(fromIndex + pageSize, products.size());

        if (fromIndex > toIndex) {
            // Handle the case where fromIndex is greater than toIndex
            fromIndex = toIndex;
        }

        return products.subList(fromIndex, toIndex);
    }

    public static void main(String[] args) {
        ProductDAO pdao = new ProductDAO();
        List<Product> l = pdao.getAllProducts("", null);
        for (Product p : l) {
            System.out.println(p);
        }
    }
}
