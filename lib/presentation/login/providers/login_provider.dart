import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/data/datasource/user_api.dart';
import 'package:public_parking_info_fe/data/models/request/login_request.dart';
import 'package:public_parking_info_fe/data/models/response/login_response.dart';
import 'package:public_parking_info_fe/services/user_service.dart';

final loginNotifireProvider = StateNotifierProvider(
  (ref) => LoginNotifier(LoginRequest.defaultLoginRequest()),
);

class LoginNotifier extends StateNotifier<LoginRequest> {
  LoginNotifier(super.state);

  final UserApi api = UserApi.instance;

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  Future<LoginResponse?> login() async {
    final LoginResponse? res = await api.login(state);
    final UserService userService = UserService.instance;

    if (res != null) {
      userService.saveAccessToken(res.token.accessToken);
      return res;
    }

    return null;
  }
}
