package Services;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

/*
*THIS CLASS IS NOT OUR OWN WORK. Credit for this code goes to HowToDoInJava and Lokesh Gupta
* The code can be found at https://howtodoinjava.com/security/java-aes-encryption-example/
* AES stands for Advanced Encryption Standard, which is a symmetric encryption algorithm. According to HowToDoInJava,
* "AES encryption is used by U.S. for securing sensitive but unclassified material, so we can say it is enough secure."
* This code was accessed on July 28th, 2019.
* Author of Article and/or Code: Lokesh Gupta
 */

    public class AES {

        private static SecretKeySpec secretKey;
        private static byte[] key;
        

        public static void setKey(String myKey)
        {
            MessageDigest sha = null;
            try {
                key = myKey.getBytes("UTF-8");
                sha = MessageDigest.getInstance("SHA-1");
                key = sha.digest(key);
                key = Arrays.copyOf(key, 16);
                secretKey = new SecretKeySpec(key, "AES");
            }
            catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            }
            catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }

        public static String encrypt(String strToEncrypt, String secret)
        {
            try
            {
                setKey(secret);
                Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
                cipher.init(Cipher.ENCRYPT_MODE, secretKey);
                return Base64.getEncoder().encodeToString(cipher.doFinal(strToEncrypt.getBytes("UTF-8")));
            }
            catch (Exception e)
            {
                System.out.println("Error while encrypting: " + e.toString());
            }
            return null;
        }

        public static String decrypt(String strToDecrypt, String secret)
        {
            try
            {
                setKey(secret);
                Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
                cipher.init(Cipher.DECRYPT_MODE, secretKey);
                return new String(cipher.doFinal(Base64.getDecoder().decode(strToDecrypt)));
            }
            catch (Exception e)
            {
                System.out.println("Error while decrypting: " + e.toString());
            }
            return null;
        }
    }

