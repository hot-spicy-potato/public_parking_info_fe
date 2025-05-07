import 'package:freezed_annotation/freezed_annotation.dart';

part 'jwt_response.freezed.dart';
part 'jwt_response.g.dart';

@freezed
class JwtResponse with _$JwtResponse {
  factory JwtResponse({required String token}) = _JwtResponse;

  factory JwtResponse.fromJson(Map<String, dynamic> json) =>
      _$JwtResponseFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
