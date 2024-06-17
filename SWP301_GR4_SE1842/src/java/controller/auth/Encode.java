/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.auth;

/**
 *
 * @author ADMIN
 */

import java.security.MessageDigest;
import org.apache.tomcat.util.codec.binary.Base64;


public class Encode {
    
    public static String toSHA1 (String str) {
        String salt = "asjrlkmcoewj@tjle; oxqskjhdjksjfljurVn";    
        String result = null;
        str = str + salt;
        try{
            byte[] dataBytes = str.getBytes ("UTF-8");
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            result = Base64.encodeBase64String (md.digest(dataBytes));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }   
    
    public static void main(String[] args) {
        System.out.println(toSHA1("johnpass"));
    }// a89asl2F0cuiewYeSw4LZbgyFeY=
}
    

