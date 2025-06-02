import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';
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
    // remove access token
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("accessToken");

    // remove refresh token
    final appDocDir = await getApplicationDocumentsDirectory();
    PersistCookieJar cookieJar = PersistCookieJar(
      storage: FileStorage('${appDocDir.path}/.cookies'),
    );
    await cookieJar.deleteAll();
  }
}
