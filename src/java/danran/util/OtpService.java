package danran.util;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

public class OtpService {

    private static final Map<String, OtpEntry> otpCache = new HashMap<>();
    private static final long OTP_VALID_DURATION = 5 * 60 * 1000;

    private static class OtpEntry {

        String otp;
        long timestamp;

        public OtpEntry(String otp, long timestamp) {
            this.otp = otp;
            this.timestamp = timestamp;
        }
    }

    public String generateAndStore(String email) {
        String otp = generateOtp();
        otpCache.put(email, new OtpEntry(otp, System.currentTimeMillis()));
        return otp;
    }

    public boolean verify(String email, String otpInput) {
        if (!otpCache.containsKey(email)) {
            return false;
        }
        OtpEntry entry = otpCache.get(email);
        long currentTime = System.currentTimeMillis();
        if (currentTime - entry.timestamp > OTP_VALID_DURATION) {
            otpCache.remove(email);
            return false;
        }
        if (entry.otp.equals(otpInput)) {
            otpCache.remove(email);
            return true;
        }
        return false;
    }

    public String generateOtp() {
        Random random = new Random();
        StringBuilder sb = new StringBuilder(6);
        for (int i = 0; i < 6; i++) {
            sb.append(random.nextInt(10));
        }
        return sb.toString();
    }

    // --- HÀM MAIN ĐỂ TEST GỬI MAIL ---
    public static void main(String[] args) {
        OtpService otpService = new OtpService();
        String myEmail = "hoangchanelqbvn@gmail.com";

        System.out.println("⏳ Đang tạo OTP...");
        String generatedOtp = otpService.generateAndStore(myEmail);

        System.out.println("⏳ Đang gửi mail tới: " + myEmail);

        
        boolean isSent = EmailUtils.sendEmail(myEmail, "Test OTP Java", "<h1>Mã OTP của bạn là: " + generatedOtp + "</h1>");

        if (isSent) {
            System.out.println("✅ Sent mail success! (Kiểm tra hộp thư đến)");
        } else {
            System.out.println("❌ Sent mail failed. (Kiểm tra lại password ứng dụng)");
        }
    }
}
