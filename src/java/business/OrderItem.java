/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

import data.ProductDB;
import java.io.Serializable;
import javax.persistence.Entity;

import javax.persistence.Id;

/**
 * Order Item represents a line from a cart/invoice
 *
 * @author K G
 */
@Entity
public class OrderItem implements Serializable {

    private int orderNumber;
    @Id
    private String productCode;
    @Id
    private int quantity;

    public OrderItem() {
        orderNumber = 0;
        productCode = "";
        quantity = 0;
    }

    public OrderItem(String productCode, int quantity) {
        this.orderNumber = 0;
        this.productCode = productCode;
        this.quantity = quantity;
    }

    public double getTotal() {

        int price = (int) ProductDB.getProduct(productCode).getPrice();
        return price * quantity;
    }

    public Product getOrderItemProductCode() {
        return ProductDB.getProduct(productCode);
    }

    public int getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(int orderNumber) {
        this.orderNumber = orderNumber;
    }

    public Product getProduct() {
        return ProductDB.getProduct(productCode);
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
