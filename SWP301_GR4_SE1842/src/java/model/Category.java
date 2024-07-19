/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author ACER
 */
public class Category {

    private int id;
    private String name;
    private String desc;
    private List<SubCategory> scList;

    public Category(String name) {
        this.name = name;
    }
    
    public Category(int id) {
        this.id = id;
    }
    
    public Category() {
    }

    @Override
    public String toString() {
        return "Category{" + "id=" + id + ", name=" + name + ", desc=" + desc + ", scList=" + scList + '}';
    }

    public Category(int id, String name, String desc, List<SubCategory> scList) {
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.scList = scList;
    }

    public Category(int id, String name, String desc) {
        this.id = id;
        this.name = name;
        this.desc = desc;
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

    public List<SubCategory> getScList() {
        return scList;
    }

    public void setScList(List<SubCategory> scList) {
        this.scList = scList;
    }

    @Override
    public boolean equals(Object obj) {
        Category c = (Category) obj;
        return this.id == c.id;
    }

}
