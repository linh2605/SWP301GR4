/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER
 */
public class SubCategory {
    private int id;
    private String name;
    private String desc;
    private Category category;

    public SubCategory() {
    }

    @Override
    public String toString() {
        return "SubCategory{" + "id=" + id + ", name=" + name + ", desc=" + desc + ", category=" + category + '}';
    }

    public SubCategory(String name, String desc, Category category) {
        this.name = name;
        this.desc = desc;
        this.category = category;
    }

    public SubCategory(int id, String name, String desc) {
        this.id = id;
        this.name = name;
        this.desc = desc;
    }

    public SubCategory(int id, String name, String desc, Category category) {
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.category = category;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    
    
    @Override
    public boolean equals(Object obj) {
        SubCategory s = (SubCategory) obj;
        return this.id == s.id;
    }
    
    
    
}
