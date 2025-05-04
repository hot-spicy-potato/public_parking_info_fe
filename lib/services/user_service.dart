import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';

abstract class UserService {
  void kakaoLogin();
  Future<OAuthToken?> getToken();
  Future<void> logout();
}
