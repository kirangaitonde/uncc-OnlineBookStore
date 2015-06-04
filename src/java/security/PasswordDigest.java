package security;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.Random;

public class PasswordDigest {

    public static String doMD5Digest(String pwd) {

        String original = pwd;
        StringBuffer sb = new StringBuffer();
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(original.getBytes());
            byte[] digest = md.digest();
            for (byte b : digest) {
                sb.append(String.format("%02x", b & 0xff));
            }

            //System.out.println("original:" + original);
            //System.out.println("digested(hex):" + sb.toString());
        } catch (Exception e) {

        }
        return sb.toString();
    }

    public static String doSHA256(String password) {
        StringBuilder sb = new StringBuilder();
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.reset();
            md.update(password.getBytes());
            byte[] mdArray = md.digest();
            sb = new StringBuilder(mdArray.length * 2);
            for (byte b : mdArray) {
                int v = b & 0xff;
                if (v < 16) {
                    sb.append('0');
                }
                sb.append(Integer.toHexString(v));
            }
        } catch (Exception e) {

        }

        return sb.toString();
    }

    public static String doSHA128(String password) {
        StringBuilder sb = new StringBuilder();
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-128");
            md.reset();
            md.update(password.getBytes());
            byte[] mdArray = md.digest();
            sb = new StringBuilder(mdArray.length * 2);
            for (byte b : mdArray) {
                int v = b & 0xff;
                if (v < 16) {
                    sb.append('0');
                }
                sb.append(Integer.toHexString(v));
            }
        } catch (Exception e) {

        }

        return sb.toString();
    }

    public static String getSalt() {
        Random r = new SecureRandom();
        byte[] saltBytes = new byte[32];
        r.nextBytes(saltBytes);
        return Base64.getEncoder().encodeToString(saltBytes);
    }

    public static void main(String[] args) {

        String s = PasswordDigest.doSHA256("secret");
        System.out.println("digested(hex)123:" + s);
    }

}
