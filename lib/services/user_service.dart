import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';

abstract class UserService {
  Future<OAuthToken?> kakaoLogin();
  Future<OAuthToken?> getToken();
  Future<void> logout();
}
