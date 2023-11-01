class AuthManager {

  static  String? token;
  
  static bool get isAuthenticated => token != null;
  
  static void setToken(String newToken) {
    token = newToken;
  }
  static void logout() {
  token = null;
  
}
}