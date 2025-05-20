import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/data/datasource/user_api.dart';
import 'package:public_parking_info_fe/data/models/request/login_request.dart';
import 'package:public_parking_info_fe/data/models/request/signup_request.dart';
import 'package:public_parking_info_fe/data/models/response/login_response.dart';
import 'package:public_parking_info_fe/services/user_service.dart';

final UserService userService = UserService.instance;

final userApiProvider = StateNotifierProvider<UserNorifier, AsyncValue<void>>((
  ref,
) {
  return UserNorifier(AsyncData(null));
});

class UserNorifier extends StateNotifier<AsyncValue<void>> {
  final UserApi api = UserApi.instance;

  UserNorifier(super.state);

  Future<bool> postVerifyCode({
    required String email,
    required String verificationCode,
  }) async {
    return await api.postVerifyCode(email, verificationCode);
  }

  Future<LoginResponse?> signup({required SignupRequest request}) async {
    final res = await api.signup(request);

    if (res != null) {
      await userService.saveAccessToken(res.token.accessToken);
    }

    return res;
  }

  Future<String?> postEmail({required String email}) async {
    return api.postEmail(email);
  }

  Future<LoginResponse?> login({required LoginRequest request}) async {
    final res = await api.login(request);

    if (res != null) {
      await userService.saveAccessToken(res.token.accessToken);
    }

    return res;
  }
}
