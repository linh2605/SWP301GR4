package dal;

import model.Slider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SliderDAO {

    private Connection connection;

    public SliderDAO() {
        this.connection = new DBContext().getConnection();
    }

    public List<Slider> getAllSliders() {
        List<Slider> sliders = new ArrayList<>();
        try {
            String sql = "SELECT * FROM sliders";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Slider slider = new Slider(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("imageUrl"),
                        rs.getString("description"),
                        rs.getInt("status")
                );
                sliders.add(slider);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sliders;
    }

    public Slider getSliderById(int id) {
        Slider slider = null;
        try {
            String sql = "SELECT * FROM sliders WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                slider = new Slider(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("imageUrl"),
                        rs.getString("description"),
                        rs.getInt("status")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return slider;
    }

    public void addSlider(Slider slider) {
        try {
            String sql = "INSERT INTO sliders (title, imageUrl, description, status) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, slider.getTitle());
            ps.setString(2, slider.getImageUrl());
            ps.setString(3, slider.getDescription());
            ps.setInt(4, slider.getStatus());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateSlider(Slider slider) {
        try {
            String sql = "UPDATE sliders SET title = ?, imageUrl = ?, description = ?, status = ? WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, slider.getTitle());
            ps.setString(2, slider.getImageUrl());
            ps.setString(3, slider.getDescription());
            ps.setInt(4, slider.getStatus());
            ps.setInt(5, slider.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteSlider(int id) {
        try {
            String sql = "DELETE FROM sliders WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void toggleStatus(int id, int status) {
        try {
            String sql = "UPDATE sliders SET status = ? WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<Slider> getActiveSliders() {
        List<Slider> sliders = new ArrayList<>();
        try {
            String sql = "SELECT * FROM sliders WHERE status = 1";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Slider slider = new Slider(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("imageUrl"),
                        rs.getString("description"),
                        rs.getInt("status")
                );
                sliders.add(slider);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sliders;
    }
}
