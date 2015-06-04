/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import business.Product;
import java.util.ArrayList;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import java.util.List;

/**
 *
 * @author K G
 *
 * Reference : Murach's Java Servlets and JSP (2nd Edition)
 */
public class ProductDB {

    //private ArrayList<Product> products =new ArrayList<Product>();
    public ProductDB() {

    }

    public static void addProduct(String productCode, String productName, int categoryCode, String catalogCategory, String description, float price, String imageUrl) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            Product product = new Product();
            product.setProductCode(productCode);
            product.setProductName(productName);
            product.setCategory(catalogCategory);
            product.setDescription(description);
            product.setPrice(price);
            product.setImageUrl(imageUrl);
            em.persist(product);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void addProduct(Product product) {

        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {

            em.persist(product);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }

    }

    public static List<Product> getAllProducts() {
        List<Product> allProducts = new ArrayList<Product>();
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT p FROM Product p ";
        TypedQuery<Product> q = em.createQuery(qString, Product.class);
        try {

            allProducts = q.getResultList();
            return allProducts;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static List<Product> getProducts(String category) {

        List<Product> products = new ArrayList<Product>();
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT p FROM Product p "
                + "WHERE p.category = :category";
        TypedQuery<Product> q = em.createQuery(qString, Product.class);
        q.setParameter("category", category);
        try {

            products = q.getResultList();
            return products;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }

    }

    public static Product getProduct(String productCode) {

        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        String qString = "SELECT p FROM Product p "
                + "WHERE p.productCode = :productCode";
        TypedQuery<Product> q = em.createQuery(qString, Product.class);
        q.setParameter("productCode", productCode);
        try {
            Product product = q.getSingleResult();
            return product;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

}
