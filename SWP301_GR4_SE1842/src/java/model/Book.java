/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.BookDAO;
import dal.BookImagesDAO;
import dal.CategoryDAO;
import dal.DiscountDAO;
import dal.SubCategoryDAO;
import java.util.List;
import java.util.Objects;

/**
 *
 * @author Admin
 */
/**
 *
 * @author ACER
 */
public class Book {

    private int id;
    private String title;
    private float cost;
    private int stock;
    private int rate;
    private String desc;
    private int publisherID;
    private Author author;
    private String authorname;
    private Publisher publisher;
    private List<Category> cList;
    private List<SubCategory> scList;
    private List<BookImage> iList;
    private Discount discount;
    private float finalCost;
    private String img0;
    private String img1;
    private int amountInWishLists;
    private int status;

    public Book() {
    }

    public List<SubCategory> getScList() {
        return scList;
    }

    public void setScList(List<SubCategory> scList) {
        this.scList = scList;
    }

    public int getPublisherID() {
        return publisherID;
    }

    public void setPublisherID(int publisherID) {
        this.publisherID = publisherID;
    }

    @Override
    public String toString() {
        return "Book{" + "id=" + id + ", title=" + title + ", cost=" + cost + ", stock=" + stock + ", rate=" + rate + ", desc=" + desc + ", publisherID=" + publisherID + ", author=" + author + ", publisher=" + publisher + ", cList=" + cList + ", scList=" + scList + ", iList=" + iList + '}';
    }

    public Book(int id, String title, float cost, int stock, int rate, String desc, Author author, Publisher publisher, int status) {
        this.id = id;
        this.title = title;
        this.cost = cost;
        this.stock = stock;
        this.rate = rate;
        this.desc = desc;
        this.author = author;
        this.publisher = publisher;
        this.iList = new BookImagesDAO().getImagesOfBook(this.id);
        this.cList = new CategoryDAO().getByBook(this.id);
        this.scList = new SubCategoryDAO().getByBook(this.id);
        this.discount = new DiscountDAO().getDiscountByBookId(this.id + "");
        this.status = status;
        img0 = "";
        img1 = "";
        if (iList != null) {
            try {
                img0 = iList.get(0).getImage();
                img1 = iList.get(1).getImage();
            } catch (IndexOutOfBoundsException ex) {
            }
        }
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    

    public String getAuthorname() {
        return authorname;
    }

    public void setAuthorname(String authorname) {
        this.authorname = authorname;
    }
    
    

    public String getImg0() {
        return img0;
    }

    public void setImg0(String img0) {
        this.img0 = img0;
    }

    public String getImg1() {
        return img1;
    }

    public void setImg1(String img1) {
        this.img1 = img1;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getRate() {
        return rate;
    }

    public float getFinalCost() {
        DiscountDAO dd = new DiscountDAO();
        Discount d = dd.getDiscountByBookId(String.valueOf(this.id));
        if (d != null) {
            return this.getCost() * (100 - this.getDiscount()) / 100;
        }
        return this.cost;
    }

    public float getDiscount() {
        DiscountDAO dd = new DiscountDAO();
        Discount d = dd.getDiscountByBookId(String.valueOf(this.id));
        if (d != null) {
            return d.getAmount();
        }
        return 0;
    }
    public Discount getDiscountObject() {
        return this.discount;
    }
    public void setRate(int rate) {
        this.rate = rate;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public Publisher getPublisher() {
        return publisher;
    }

    public void setPublisher(Publisher publisher) {
        this.publisher = publisher;
    }

    public List<Category> getcList() {
        return cList;
    }

    public void setcList(List<Category> cList) {
        this.cList = cList;
    }

    public List<BookImage> getiList() {
        return iList;
    }

    public void setiList(List<BookImage> iList) {
        this.iList = iList;
    }

    public int getAmountInWishLists() {
        return amountInWishLists;
    }

    public void setAmountInWishLists(int amountInWishLists) {
        this.amountInWishLists = amountInWishLists;
    }
    
    

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof Book) {
            Book b = (Book) obj;
                return this.id == b.id && Objects.equals(this.title, b.title);

        }
        return false;
    }

    public int hashCode() {
     return Objects.hash(id);
    }
    
   
}
