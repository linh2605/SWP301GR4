package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.ProductDetails;

public class ProductDetailsDao extends DBContext {

    private static final String SELECT_PRODUCT_BY_ID = 
        "SELECT p.*, i.Image FROM Product p " +
        "JOIN Images i ON p.ProductID = i.ProductID " +
        "WHERE p.ProductID = ?";

    public ProductDetails selectProduct(int productID) {
        ProductDetails product = null;
        try (PreparedStatement ps = connection.prepareStatement(SELECT_PRODUCT_BY_ID)) {
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                product = new ProductDetails();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setProductPrice(rs.getBigDecimal("ProductPrice"));
                product.setStock(rs.getInt("Stock"));
                product.setProductRating(rs.getInt("ProductRating"));
                product.setProductDesc(rs.getString("ProductDesc"));
                product.setBrandID(rs.getInt("BrandID"));
                product.setSupplierID(rs.getInt("SupplierID"));
                product.setImage(rs.getString("Image"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }
}
