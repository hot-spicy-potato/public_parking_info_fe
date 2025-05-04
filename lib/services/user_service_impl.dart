import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';
import 'package:public_parking_info_fe/services/user_service.dart';

class UserServiceImpl implements UserService {
  OAuthToken? token;

  UserServiceImpl._internal();
  static final UserServiceImpl _instance = UserServiceImpl._internal();
  static UserServiceImpl get instance => _instance;

  @override
  void kakaoLogin() async {
    try {
      token = await UserApi.instance.loginWithKakaoTalk();
      print("token: $token");
    } catch (error) {
      print("error: $error");
    }
    return null;
  }

  OAuthToken? getToken() {
    return token;
  }
}
