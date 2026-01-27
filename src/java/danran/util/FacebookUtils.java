package danran.util;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class FacebookUtils {

    // 👇 THAY APP ID VÀ SECRET CỦA BẠN VÀO ĐÂY 👇
    public static final String FACEBOOK_APP_ID = "DIEN_APP_ID_CUA_BAN";
    public static final String FACEBOOK_APP_SECRET = "DIEN_APP_SECRET_CUA_BAN";

    // Link này phải GIỐNG Y HỆT trong phần "Valid OAuth Redirect URIs" trên Facebook
    public static final String FACEBOOK_REDIRECT_URI = "http://localhost:8081/Restaurant_Management/login-facebook";

    public static final String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token";
    public static final String FACEBOOK_LINK_GET_USER_INFO = "https://graph.facebook.com/me?fields=id,name,email,picture&access_token=";

    public static String getToken(String code) throws IOException {
        String urlString = FACEBOOK_LINK_GET_TOKEN
                + "?client_id=" + FACEBOOK_APP_ID
                + "&client_secret=" + FACEBOOK_APP_SECRET
                + "&redirect_uri=" + FACEBOOK_REDIRECT_URI
                + "&code=" + code;

        URL url = new URL(urlString);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder response = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            response.append(line);
        }

        JsonObject jobj = new Gson().fromJson(response.toString(), JsonObject.class);
        return jobj.get("access_token").getAsString();
    }

    public static GoogleUser getUserInfo(String accessToken) throws IOException {
        // Tận dụng lại class GoogleUser để chứa thông tin (vì Facebook cũng trả về id, name, email)
        String urlString = FACEBOOK_LINK_GET_USER_INFO + accessToken;
        URL url = new URL(urlString);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder response = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            response.append(line);
        }

        // Facebook trả về JSON hơi khác Google xíu, ta map thủ công cho chắc
        JsonObject jobj = new Gson().fromJson(response.toString(), JsonObject.class);
        GoogleUser user = new GoogleUser();
        user.setId(jobj.get("id").getAsString());
        user.setName(jobj.get("name").getAsString());

        // Lưu ý: Facebook có thể không trả về email nếu user đăng ký bằng SĐT
        if (jobj.has("email")) {
            user.setEmail(jobj.get("email").getAsString());
        } else {
            user.setEmail(jobj.get("id").getAsString() + "@facebook.com"); // Email giả định
        }

        return user;
    }
}
