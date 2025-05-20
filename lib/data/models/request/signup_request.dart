import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_request.freezed.dart';
part 'signup_request.g.dart';

@freezed
class SignupRequest with _$SignupRequest {
  factory SignupRequest({
    required String email,
    required String password,
    String? rePassword,
    required String name,
  }) = _SignupRequest;

  factory SignupRequest.fromJson(Map<String, dynamic> json) => _$SignupRequestFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  static SignupRequest defaultSignupRequest() {
    return SignupRequest(email: "", name: "", password: "", rePassword: "");
  }
}
