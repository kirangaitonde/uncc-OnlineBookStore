/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author K G
 */
@Entity
public class Product implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String productCode;
    private String productName;
    private String category;
    private String description;
    private float price;
    private String imageUrl;

    public Product() {
        productCode = "";
        productName = "";
        category = "";
        description = null;
        price = 0;
        imageUrl = null;
    }

    public Product(String productCode, String productName, String category, String description, float price, String imageUrl) {
        this.productCode = productCode;
        this.productName = productName;
        this.category = category;
        this.description = description;
        this.price = price;
        this.imageUrl = imageUrl;
    }

    public String getImageURL() {
        return "images/" + productCode + ".jpg";
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

}
