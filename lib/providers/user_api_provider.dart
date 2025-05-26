import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/data/datasource/user_api.dart';
import 'package:public_parking_info_fe/data/models/response/user_info_response.dart';
import 'package:public_parking_info_fe/services/user_service.dart';

final UserService userService = UserService.instance;

final userApiProvider = StateNotifierProvider<UserNorifier, AsyncValue<void>>((ref) {
  return UserNorifier(AsyncData(null));
});

class UserNorifier extends StateNotifier<AsyncValue<void>> {
  final UserApi api = UserApi.instance;

  UserNorifier(super.state);

  Future<bool> postVerifyCode({required String email, required String verificationCode}) async {
    return await api.postVerifyCode(email, verificationCode);
  }

  Future<String?> postEmail({required String email}) async {
    return api.postEmail(email);
  }

  Future<void> deleteUser() async {
    await api.deleteUser();
  }
}

final userInfoProvider = FutureProvider<UserInfoResponse?>((ref) async {
  final UserApi api = UserApi.instance;
  final userInfo = await api.getUserInfo();
  return userInfo;
});
