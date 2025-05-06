import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';

abstract class UserService {
  Future<OAuthToken?> kakaoLogin(WidgetRef ref);
  Future<OAuthToken?> getToken();
  Future<void> logout();
}
