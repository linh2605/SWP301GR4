/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.HTMLElements;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import model.Book;
import model.BookImage;
import model.User;

/**
 *
 * @author ACER
 */
public class Html {

    private static StringBuilder html;

    public static String getBookCardInHomepage(Book b) {
        html = new StringBuilder();
        html.append("<div class=\"single-slide\">");
        html.append("<div class=\"product-card\">");
        html.append("<div class=\"product-card--body\">");
        html.append("<div class=\"card-image\">");
        html.append("<img src=\"").append(b.getImg0()).append("?ran="+ Math.random() +"\">");
        html.append("<div class=\"hover-contents\">");
        html.append("<a href=\"detail?bid=").append(b.getId()).append("\" class=\"hover-image\">");
        html.append("<div class=\"img-hover-minh__container\">");
        html.append("<img class=\"img-hover-minh\" src=\"").append(b.getImg1()).append("?ran="+ Math.random() +"\">");
        html.append("</div>");
        html.append("</a>");
        html.append("<div class=\"hover-btns\">");
        html.append("<div onclick=\"controlCart(").append(b.getId()).append(")\" class=\"single-btn\">");
        html.append("<i class=\"fas fa-shopping-basket\"></i>");
        html.append("</div>");
        html.append("<a href=\"wishlist.html\" class=\"single-btn\">");
        html.append("<i class=\"fas fa-heart\"></i>");
        html.append("</a>");
        html.append("<a href=\"#\" data-bs-toggle=\"modal\" data-bs-target=\"#bookdetailmodel\" class=\"single-btn\">");
        html.append("<i onclick=\"loadBookDetail(").append(b.getId()).append(")\" class=\"fas fa-eye\"></i>");
        html.append("<input id=\"bookid__input__").append(b.getId()).append("\" type=\"text\" value=\"").append(b.getId()).append("\" hidden>");
        html.append("</a>");
        html.append("</div>");
        html.append("</div>");
        html.append("</div>");
        html.append("<div class=\"price-block\">");
        html.append("<a href=\"#\" class=\"author\">");
        html.append(b.getAuthor().getName());
        html.append("</a>");
        float finalCost = 0;
        if (b.getDiscount() != 0) {
            finalCost = b.getFinalCost();
        } else if (b.getDiscount() == 0) {
            finalCost = b.getCost();
        }
        html.append("<span class=\"price\">$").append(finalCost).append("</span>");
        if (b.getDiscount() != 0) {
            html.append("<del class=\"price-old\">").append(b.getCost()).append("</del>");
            html.append("<span class=\"price-discount\">-").append(b.getDiscount()).append("%</span>");
            html.append("");
            html.append("");
            html.append("");
        }
        html.append("</div>");
        html.append("<div class=\"product-header\">");
        html.append("<h3><a href=\"detail?bid=");
        html.append(b.getId());
        html.append("\">");
        html.append(b.getTitle());
        html.append("</a></h3>");
        html.append("</div>");
        html.append("</div>");
        html.append("</div>");
        html.append("</div>");
        return html.toString();
    }

    public static String getBookCardInShoppage(Book b, HttpServletRequest request) {
        html = new StringBuilder();
        html.append("<div class=\"col-lg-4 col-sm-6\">");
        html.append("<div class=\"product-card\">");
        html.append("<div class=\"product-card--body\">");
        html.append("<div class=\"card-image\">");
        html.append("<img src=\"").append(b.getImg0()).append("?ran="+ Math.random() +"\">");
        html.append("<div class=\"hover-contents\">");
        html.append("<a href=\"detail?bid=").append(b.getId()).append("\" class=\"hover-image\">");
        html.append("<div class=\"img-hover-minh__container\">");
        html.append("<img class=\"img-hover-minh\" src=\"").append(b.getImg1()).append("?ran="+ Math.random() +"\">");
        html.append("</div>");
        html.append("</a>");
        html.append("<div class=\"hover-btns\">");
        html.append("<div onclick=\"controlCart(").append(b.getId()).append(")\" class=\"single-btn\">");
        html.append("<i class=\"fas fa-shopping-basket\"></i>");
        html.append("</div>");
        User user = (User) request.getSession().getAttribute("usersession");
        if (user == null) {
            html.append("<a href=\"auth/login\" class=\"single-btn\">");
            html.append("<i class=\"fas fa-heart\"></i>");
            html.append("</a>");
        } else {
            html.append("<div onclick=\"toggleWishList(" + b.getId() + ", this)\" class=\"single-btn\">");
            if (user.getWishList().contains(b)) {
                html.append("<i style=\"color:tomato\" class=\"fas fa-heart\"></i>");
            } else {
                html.append("<i class=\"fas fa-heart\"></i>");
            }
            html.append("</div>");
        }
        html.append("<a href=\"#\" data-bs-toggle=\"modal\" data-bs-target=\"#bookdetailmodel\" class=\"single-btn\">");
        html.append("<i onclick=\"loadBookDetail(").append(b.getId()).append(")\" class=\"fas fa-eye\"></i>");
        html.append("<input id=\"bookid__input__").append(b.getId()).append("\" type=\"text\" value=\"").append(b.getId()).append("\" hidden>");
        html.append("</a>");
        html.append("</div>");
        html.append("</div>");
        html.append("</div>");
        html.append("<div class=\"price-block\">");
        html.append("<a href=\"#\" class=\"author\">");
        html.append(b.getAuthor().getName());
        html.append("</a>");
        float finalCost = 0;
        if (b.getDiscount() != 0) {
            finalCost = b.getFinalCost();
        } else if (b.getDiscount() == 0) {
            finalCost = b.getCost();
        }
        html.append("<span class=\"price\">$").append(String.format("%.2f", finalCost)).append("</span>");
        if (b.getDiscount() != 0) {
            html.append("<del class=\"price-old\">").append(b.getCost()).append("</del>");
            html.append("<span class=\"price-discount\">-").append(b.getDiscount()).append("%</span>");
            html.append("");
            html.append("");
            html.append("");
        }
        html.append("</div>");
        html.append("<div class=\"product-header\">");
        html.append("<h3><a href=\"detail?bid=");
        html.append(b.getId());
        html.append("\">");
        html.append(b.getTitle());
        html.append("</a></h3>");
        html.append("</div>");
        html.append("</div>");
        html.append("</div>");
        html.append("</div>");
        return html.toString();
    }

    public static String BookDetail(Book b, HttpSession session) {
        StringBuilder html = new StringBuilder();
        User user = (User) session.getAttribute("usersession");

        html.append("       <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>");
        html.append("       <div class=\"product-details-modal\">");
        html.append("           <div class=\"row\">");
        html.append("               <div class=\"col-lg-5\">");
        html.append("                   <div class=\"product-details-slider sb-slick-slider arrow-type-two\" data-slick-setting='{\n"
                + "                                             \"slidesToShow\": 1,\n"
                + "                                             \"arrows\": false,\n"
                + "                                             \"fade\": true,\n"
                + "                                             \"draggable\": false,\n"
                + "                                             \"swipe\": false,\n"
                + "                                             \"asNavFor\": \".product-slider-nav\"\n"
                + "                                             }'>");
        html.append("                   <div class=\"single-slide\">");
        html.append("                       <img src=\"");
        html.append(b.getiList().get(0).getImage());
        html.append("?ran="+ Math.random() +"\" alt=\"\">");
        html.append("               </div>");
        html.append("               </div>");
        html.append("           </div>");
        html.append("           <div class=\"col-lg-7 mt--30 mt-lg--30\">");
        html.append("               <div class=\"product-details-info pl-lg--30 \">");

        html.append("                   <h3 class=\"product-title\"> " + b.getTitle() + "</h3>");
        html.append("                   <ul class=\"list-unstyled\">");
        html.append("                       <li>Brands: <a href=\"#\" class=\"list-value font-weight-bold\"> " + b.getPublisher().getName() + "</a></li>");
        if (user != null && user.getRoleID() != 4) {
            html.append("                   <li>Product Code: <span class=\"list-value\"> " + b.getId() + "</span></li>");
        }
        html.append("                       <li>Availability:  ");
        if (b.getStock() > 0) {
            html.append("                       <span style=\"color:green\" class=\"list-value\">" + b.getStock() + " In Stock</span>");
        } else {
            html.append("                       <span style=\"color:tomato\" class=\"list-value\">Out Of Stock</span>");
        }
        html.append("                       </li>");
        html.append("                   </ul>");

        html.append("                   <div class=\"price-block\">");
        float finalCost = b.getFinalCost();
        html.append("                       <span class=\"price-new\">$");
        html.append(finalCost);
        html.append("                       </span>");
        if (b.getDiscount() != 0) {
            html.append("                   <del class=\"price-old\">");
            html.append(b.getCost());
            html.append("                   </del>");
            html.append("                   <span class=\"price-discount\">-");
            html.append(b.getDiscount());
            html.append("                   %</span>");
        }
        html.append("                   </div>");

        html.append("<div class=\"rating-widget\">\n"
                + "     <div class=\"rating-block\">\n"
                + "         <span class=\"fas fa-star star_on\"></span>\n"
                + "         <span class=\"fas fa-star star_on\"></span>\n"
                + "         <span class=\"fas fa-star star_on\"></span>\n"
                + "         <span class=\"fas fa-star star_on\"></span>\n"
                + "         <span class=\"fas fa-star \"></span>\n"
                + "     </div>\n"
                + "     <div class=\"review-widget\">\n"
                + "         <a href=\"#\">(1 Reviews)</a> <span>|</span>\n"
                + "         <a href=\"#\">Write a review</a>\n"
                + "     </div>\n"
                + " </div>\n");

        html.append("<article class=\"product-details-article\">");
        html.append("   <h4 class=\"sr-only\">Product Summery</h4>");
        html.append("   <p>");
        html.append(b.getDesc());
        html.append("   </p>");
        html.append("</article>");

//        html.append("<div class=\"add-to-cart-row\">");
//        html.append("   <div class=\"count-input-block\">");
//        html.append("       <span class=\"widget-label\">Qty</span>");
//        html.append("       <input type=\"number\" class=\"form-control text-center\" value=\"1\">");
//        html.append("   </div>");
//        html.append("   <div class=\"add-cart-btn\">");
//        html.append("       <a href=\"#\" class=\"btn btn-outlined--primary\"><span\n"
//                + "             class=\"plus-icon\">+</span>Add to Cart</a>");
//        html.append("   </div>");
//        html.append("</div>");
//        html.append("<div class=\"compare-wishlist-row\">");
//        html.append("   <a href=\"#\" class=\"add-link\"><i class=\"fas fa-heart\"></i>Add to Wish List</a>");
//       
        html.append("</div>");
        html.append("</div>");
        html.append("</div>");
        html.append("</div>");
        html.append("</div>");
        html.append("<div class=\"modal-footer\">");
        html.append("<div class=\"widget-social-share\">\n"
                + "                                <span class=\"widget-label\">Share:</span>\n"
                + "                                <div class=\"modal-social-share\">\n"
                + "                                    <a href=\"#\" class=\"single-icon\"><i class=\"fab fa-facebook-f\"></i></a>\n"
                + "                                    <a href=\"#\" class=\"single-icon\"><i class=\"fab fa-twitter\"></i></a>\n"
                + "                                    <a href=\"#\" class=\"single-icon\"><i class=\"fab fa-youtube\"></i></a>\n"
                + "                                    <a href=\"#\" class=\"single-icon\"><i class=\"fab fa-google-plus-g\"></i></a>\n"
                + "                                </div>\n"
                + "                            </div>");

        return html.toString();
    }

    public static String emailRefund(int status, User user) {
        String html = "";
        if (status == 1) {
            html = "    <div class=\"container\">\n"
                    + "        <div class=\"content\">\n"
                    + "            <h2>Great news, " + user.getFullName() + "!</h2>\n"
                    + "            <p>We're happy to inform you that your refund request has been approved. We always strive to ensure our customers are satisfied, and we appreciate your patience during this process.</p>\n"
                    + "            <p>You can expect the refund to reflect in your original payment method within the next 5-7 business days. If there's anything else you'd like to know, feel free to get in touch.</p>\n"
                    + "        </div>\n"
                    + "        <div class=\"footer\">\n"
                    + "            <p>&copy; 2023 Bookaholic. All rights reserved.</p>\n"
                    + "        </div>\n"
                    + "    </div>\n";
        } else if (status == -1) {
            html = "    <div class=\"container\">\n"
                    + "        <div class=\"content\">\n"
                    + "            <h2>We've reviewed your request, " + user.getFullName() + "</h2>\n"
                    + "            <p>We understand how important your concerns are, and we've taken the time to thoroughly review your refund request. Unfortunately, based on the details provided and our refund policy, we're unable to process a refund at this time.</p>\n"
                    + "            <p>If you have any questions or need further clarification on our decision, we're here to help. Please don't hesitate to contact our support team for any assistance or further information.</p>\n"
                    + "        </div>\n"
                    + "        <div class=\"footer\">\n"
                    + "            <p>&copy; 2023 Bookaholic. All rights reserved.</p>\n"
                    + "        </div>\n"
                    + "    </div>\n";
            return html;
        }
        return html;
    }
    
    
}
