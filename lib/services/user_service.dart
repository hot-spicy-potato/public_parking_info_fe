import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';

abstract class UserService {
  Future<OAuthToken?> kakaoLogin(WidgetRef ref);
  Future<void> saveKakaoId(String kakaoId);
  Future<String?> getKakaoId();
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> logout();
}
