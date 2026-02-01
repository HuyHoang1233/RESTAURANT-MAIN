package danran.util;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import danran.util.GoogleUser; // Đảm bảo import đúng class GoogleUser của bạn

public class GoogleUtils {

    // Thay bằng Client ID và Secret bạn vừa lấy ở Bước 1
    public static final String GOOGLE_CLIENT_ID = "564583690749-82fah1b28gfo5v8mi91qs309uc9a2n5n.apps.googleusercontent.com";
    public static final String GOOGLE_CLIENT_SECRET = "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";

    // Link này phải khớp Y CHANG link bạn đăng ký trong Google Cloud Console
    // Lưu ý: Tôi đã sửa dấu cách trong "Restaurant Management" thành dấu gạch dưới "_" nếu project của bạn dùng "_"
    // Nếu project thật của bạn tên có dấu cách, hãy sửa lại chỗ này.
    public static final String GOOGLE_REDIRECT_URI = "http://localhost:8081/Restaurant_Management/login-google";

    public static final String GOOGLE_GRANT_TYPE = "authorization_code";
    public static final String GOOGLE_LINK_GET_TOKEN = "https://oauth2.googleapis.com/token";
    public static final String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    // 1. Lấy Access Token từ Code
    public static String getToken(String code) throws IOException {
        URL url = new URL(GOOGLE_LINK_GET_TOKEN);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);

        String params = "client_id=" + GOOGLE_CLIENT_ID
                + "&client_secret=" + GOOGLE_CLIENT_SECRET
                + "&code=" + code
                + "&redirect_uri=" + GOOGLE_REDIRECT_URI
                + "&grant_type=" + GOOGLE_GRANT_TYPE;

        try (OutputStream os = conn.getOutputStream()) {
            os.write(params.getBytes());
            os.flush();
        }

        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder response = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            response.append(line);
        }

        // Dùng Gson lấy access_token
        JsonObject jobj = new Gson().fromJson(response.toString(), JsonObject.class);
        return jobj.get("access_token").getAsString();
    }

    // 2. Lấy thông tin User từ Token
    public static GoogleUser getUserInfo(String accessToken) throws IOException {
        String link = GOOGLE_LINK_GET_USER_INFO + accessToken;
        URL url = new URL(link);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
        StringBuilder response = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            response.append(line);
        }

        // Map dữ liệu JSON về đối tượng Java
        return new Gson().fromJson(response.toString(), GoogleUser.class);
    }
}
