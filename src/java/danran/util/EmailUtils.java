package danran.util;

import java.util.Properties;
import java.util.Random;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class EmailUtils {

    private static final String EMAIL_FROM = "hoangchanelqbvn@gmail.com";
    // Mật khẩu bạn vừa cung cấp
    private static final String APP_PASSWORD = "hcml isdn ocew aeus";

    public static String getRandomOTP() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    public static boolean sendEmail(String toEmail, String subject, String body) {
        // Fix lỗi mạng Windows
        System.setProperty("java.net.preferIPv4Stack", "true");

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL_FROM, APP_PASSWORD);
            }
        };

        Session session = Session.getInstance(props, auth);

        try {
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(EMAIL_FROM, "Bep Cloud Admin"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            msg.setSubject(subject, "UTF-8");
            msg.setContent(body, "text/html; charset=UTF-8");

            Transport.send(msg);
            System.out.println("✅ GỬI MAIL THÀNH CÔNG TỚI: " + toEmail);
            return true;
        } catch (Exception e) {
            System.err.println("❌ LỖI GỬI MAIL: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
