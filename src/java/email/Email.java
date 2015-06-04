package email;

import business.Cart;
import business.OrderItem;
import business.Orders;
import business.User;
import data.UserDB;
import java.util.List;

public class Email {

    /**
     * @param args
     *
     *
     */
    public static void sendMail(String mail, Cart cart, Orders order) {
        // TODO Auto-generated method stub
        String from = "mail2kgg@gmail.com";
        String sub = "Order Confirmation: Your order has been placed!!";
        String id = "mail2kgg@gmail.com";
        String pass = "brahmansamaj";
        String to = mail;
        GMailSender sender = new GMailSender(id, pass);
        User user = UserDB.getUser(mail);
        String body = "Dear " + user.getFirstName() + "<br><br>";
        body += "Thank you for shopping at KG's Bookstore." + "<br>";
        body += "Please find you order details below." + "<br>";

        body += "<div>";
        body += "<h3>Invoice</h3>";
        body += "<p>Date:" + order.getOrderDate() + "<br>";
        body += "<u>Ship To/Bill To:</u><br>";
        body += "  " + user.getFirstName() + " " + user.getLastName() + "<br>";
        body += " " + user.getAddressLine1() + "<br>";
        body += " " + user.getAddressLine2() + "<br>";
        body += " " + user.getCity() + "<br>";
        body += " " + user.getPostCode() + "<br>";
        body += "</p>";
        body += "</div>";

        body += "<div>";
        body += "<table>";
        body += "<tr>";
        body += "<th>Books</th>" + "     ";
        body += " <th>Price</th>" + "     ";
        body += "<th>Quantity</th>" + "     ";
        body += "<th>Total</th>" + "     ";
        body += "</tr>";

        List<OrderItem> items = cart.getItems();

        for (OrderItem item : items) {
            body += "<tr>";
            body += "<td>" + item.getProduct().getProductName() + "</td>" + "     ";
            body += "<td>$" + item.getProduct().getPrice() + "</td>" + "     ";
            body += "<td>" + item.getQuantity() + "</td>" + "     ";
            body += "<td>" + item.getTotal() + "</td>" + "     ";
            body += "</tr>";
        }

        body += "<tr>";
        body += "<td></td>";
        body += "<td></td>";
        body += "<td><b>Subtotal</b></td>" + "     ";
        body += "<td>" + cart.getSubTotal() + "</td>" + "     ";
        body += "</tr>";
        body += "<tr>";
        body += "<td></td>";
        body += "<td></td>";
        body += "<td><b>Tax</b></td>" + "     ";
        body += "<td>" + order.getTax(cart.getSubTotal()) + "</td>" + "     ";
        body += "</tr>";

        body += "<tr>";
        body += "<td></td>";
        body += "<td></td>";
        body += "<td><b>Total</b></td>";
        body += "<td>" + order.getTotal(cart.getSubTotal()) + "</td>";
        body += "</tr>";
        body += "</table>";
        body += " </div>";
        body += "</section>" + "<br><br>";

        body += "Your order will be processed in 3 to 5 Business Days " + "<br>";
        body += "Have a great day!! " + "<br><br>";
        body += "Cheers " + "<br>";
        body += "KG's Bookstore team" + "<br>";

        try {
            sender.sendMail(sub, body, from, to, true);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
}
