import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:public_parking_info_fe/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServiceImpl implements UserService {
  UserServiceImpl._internal();
  static final UserServiceImpl _instance = UserServiceImpl._internal();
  static UserServiceImpl get instance => _instance;

  static const String _tokenKey = "accessToken";

  @override
  Future<OAuthToken?> kakaoLogin(WidgetRef ref) async {
    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
      User user = await UserApi.instance.me();

      saveToken(token.accessToken);
      saveKakaoId(user.id.toString());

      return token;
    } catch (error) {
      print("error: $error");
    }
    return null;
  }

  @override
  Future<void> saveKakaoId(String kakaoId) async {
    print("save kakao id: $kakaoId");
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("kakaoId", kakaoId);
  }

  @override
  Future<String?> getKakaoId() async {
    final prefs = await SharedPreferences.getInstance();
    final kakaoId = prefs.getString("kakaoId");
    if (kakaoId == null) return null;
    return kakaoId;
  }

  @override
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  @override
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final jwt = prefs.getString(_tokenKey);
    if (jwt == null) return null;
    return jwt;
  }

  @override
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
