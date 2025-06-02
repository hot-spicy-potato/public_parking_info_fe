import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/data/datasource/user_api.dart';
import 'package:public_parking_info_fe/data/models/request/signup_request.dart';
import 'package:public_parking_info_fe/data/models/response/login_response.dart';
import 'package:public_parking_info_fe/services/user_service.dart';

final enableSignupProvider = Provider<bool>((ref) {
  final state = ref.watch(signupNotifierProvider);
  return SignupNotifier(state).enableSignup();
});

final signupNotifierProvider = StateNotifierProvider<SignupNotifier, SignupRequest>(
  (ref) => SignupNotifier(SignupRequest.defaultSignupRequest()),
);

class SignupNotifier extends StateNotifier<SignupRequest> {
  SignupNotifier(super.state);

  final UserApi api = UserApi.instance;

  String getPassword() {
    return state.password;
  }

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setRePassword(String rePassword) {
    state = state.copyWith(rePassword: rePassword);
  }

  bool checkName() {
    final name = state.name;
    if (name.length < 2 || name.length > 10) return false;
    return true;
  }

  bool checkEmail() {
    final email = state.email;
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) return false;
    return true;
  }

  bool checkPassword() {
    final password = state.password;
    final rePassword = state.rePassword;
    final regex = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[,\.\!\?\_\-\*])[A-Za-z\d,\.\!\?\_\-\*]{8,}$',
    );
    if (!regex.hasMatch(password) || password != rePassword) return false;
    return true;
  }

  bool enableSignup() {
    return state.email.isNotEmpty &&
        state.name.isNotEmpty &&
        state.password.isNotEmpty &&
        checkName() &&
        checkEmail() &&
        checkPassword();
  }

  Future<LoginResponse?> signup() async {
    if (enableSignup()) {
      final LoginResponse? res = await api.signup(state);
      final UserService userService = UserService.instance;

      if (res != null) {
        await userService.saveAccessToken(res.token.accessToken);
      }

      return res;
    }
    return null;
  }
}
