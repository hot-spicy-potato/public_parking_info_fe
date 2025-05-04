import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:public_parking_info_fe/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServiceImpl implements UserService {
  UserServiceImpl._internal();
  static final UserServiceImpl _instance = UserServiceImpl._internal();
  static UserServiceImpl get instance => _instance;

  static const String _tokenKey = "accessToken";

  @override
  void kakaoLogin() async {
    try {
      final token = await UserApi.instance.loginWithKakaoTalk();
      print("token: $token");
      await saveToken(token.accessToken);
    } catch (error) {
      print("error: $error");
    }
    return null;
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  @override
  Future<OAuthToken?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString(_tokenKey);
    if (accessToken == null) return null;
    return OAuthToken(
      accessToken,
      DateTime.now().add(Duration(hours: 6)),
      null,
      null,
      null,
    );
  }

  @override
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
