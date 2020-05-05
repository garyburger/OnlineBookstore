package Email;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailSender {

    String host = "smtp.mailtrap.io";
    final String user = "8c8dc88192c9f3";//change accordingly
    final String password = "8a78057eca8d5a";//change accordingly
    
    public EmailSender() {
        String to = null;
    }

    /**
     * Email confirming registration with a link to
     * activate the user account
     */
    public void sendRegistrationEmail(String to) {
        String link = "";
        String subject = "BookStore Registration";
        String message = "Thank you for registering. Please click link below to activate your account \n" + link;
        sendEmail(to, subject, message);
    }

    /**
     * Email notifying if user has been subscribed or unsubscribed to promos
     * @param subscribed
     * @return email message for subscription
     */
    public void sendPromotionSubscription(String to, boolean subscribed) {
        String message;
        String subject = "BookStore Promotions";
        if(subscribed == true) {
            message = "Thank you for subscribing to our promotions";
        }
        else {
            message = "You have been unsubscribed!";
        }

        sendEmail(to, subject, message);
    }

    /**
     * Email message notifying user has changed their info
     * @return
     */
    public void sendEditedProfile(String to) {
        String message = "Your profile has been changed";
        String subject = "BookStore: Profile Changed";
        sendEmail(to, subject, message);
    }

    /**
     * Sends an email to the email address
     * @param to
     * @param emailMessage
     * @param subject
     */
    public void sendEmail(String to, String subject, String emailMessage) {
        //Get the session object
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(user, password);
                    }
                });

        //Compose the message
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setText(emailMessage);

            //send the message
            Transport.send(message);

            System.out.println("message sent successfully...");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

}