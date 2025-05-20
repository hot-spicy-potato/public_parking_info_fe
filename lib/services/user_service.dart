import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  UserService._internal();
  static final UserService _instance = UserService._internal();
  static UserService get instance => _instance;

  Future<void> saveAccessToken(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("accessToken", accessToken);
  }

  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("accessToken");
    if (accessToken == null) return null;
    return accessToken;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("accessToken");
  }
}
