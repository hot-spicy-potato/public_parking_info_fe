import 'package:dio/dio.dart';
import 'package:public_parking_info_fe/data/datasource/dio_client.dart';
import 'package:public_parking_info_fe/data/models/request/login_request.dart';
import 'package:public_parking_info_fe/data/models/request/signup_request.dart';
import 'package:public_parking_info_fe/data/models/response/login_response.dart';
import 'package:public_parking_info_fe/data/models/response/user_info_response.dart';
import 'package:public_parking_info_fe/services/user_service.dart';

class UserApi {
  UserApi._internal();
  static final UserApi _instance = UserApi._internal();
  static UserApi get instance => _instance;

  final UserService userService = UserService.instance;

  final Dio dio = DioClient.dio;

  // 인증번호 검증 API
  // /api/users/verify-code
  Future<bool> postVerifyCode(String email, String verificationCode) async {
    try {
      final res = await dio.post(
        "/api/users/verify-code",
        queryParameters: {"email": email, "verificationCode": verificationCode},
      );
      if (res.statusCode == 200) return true;
    } catch (e) {
      print("fail code verification : $e");
    }
    return false;
  }

  // 회원가입 API
  // /api/users/signup
  Future<LoginResponse?> signup(SignupRequest request) async {
    try {
      final res = await dio.post("/api/users/signup", data: request);
      return LoginResponse.fromJson(res.data);
    } catch (e) {
      print("fail signup : $e");
    }
    return null;
  }

  // 인증번호 전송 API
  // /api/users/send-email
  Future<String?> postEmail(String email) async {
    try {
      final res = await dio.post(
        "/api/users/send-email",
        queryParameters: {"email": email},
        options: Options(
          headers: {"accept": "*/*"},
          validateStatus: (status) => status! < 500,
        ),
      );
      if (res.statusCode == 200) return res.data;
    } catch (e) {
      print("fail post email : $e");
    }
    return null;
  }

  // 로그인 API
  // /api/users/login
  Future<LoginResponse?> login(LoginRequest request) async {
    try {
      final res = await dio.post("/api/users/login", data: request);
      return LoginResponse.fromJson(res.data);
    } catch (e) {
      print("fail login : $e");
    }
    return null;
  }

  // 회원탈퇴 API
  // POST /api/users/delete
  Future<void> deleteUser() async {
    try {
      await dio.post("/api/users/delete");
    } catch (e) {
      print("fail delete user : $e");
    }
  }

  // 내 정보 조회 API
  // GET /api/users/info
  Future<UserInfoResponse?> getUserInfo() async {
    try {
      final res = await dio.get("/api/users/info");
      return UserInfoResponse.fromJson(res.data);
    } catch (e) {
      print("fail get user info : $e");
    }
    return null;
  }
}
