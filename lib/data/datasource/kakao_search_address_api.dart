import 'package:dio/dio.dart';
import 'package:public_parking_info_fe/core/constants/keys.dart';

Future<dynamic> searchAddressAPI(String keyword) async {
  final Dio _dio = Dio();
  final url = "https://dapi.kakao.com/v2/local/search/keyword";

  try {
    final response = await _dio.get(
      url,
      queryParameters: {"query": keyword},
      options: Options(headers: {"Authorization": "KakaoAK $kakaoRestApiKey"}),
    );

    return response.data;
  } catch (e) {
    print("api error: $e");
  }
}
