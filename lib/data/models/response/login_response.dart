import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:public_parking_info_fe/data/models/response/auth_tokens.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  factory LoginResponse({
    required int id,
    required String email,
    required String name,
    required AuthTokens token,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
