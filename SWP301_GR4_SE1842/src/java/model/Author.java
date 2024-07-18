/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER
 */
public class Author {
    private int id;
    private String name;
    private String bio;

    public Author() {
    }

    public Author(int id, String name, String bio) {
        this.id = id;
        this.name = name;
        this.bio = bio;
    }

    @Override
    public String toString() {
        return "Author{" + "id=" + id + ", name=" + name + ", bio=" + bio + '}';
    }

    public Author(String name, String bio) {
        this.name = name;
        this.bio = bio;
    }

    public Author(String name) {
        this.name = name;
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

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }
    
    
}
