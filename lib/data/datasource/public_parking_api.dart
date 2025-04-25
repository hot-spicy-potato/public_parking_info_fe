import 'package:dio/dio.dart';
import 'package:public_parking_info_fe/data/models/parking_response.dart';

class PublicParkingAPI {
  final Dio _dio = Dio();

  static const _encodedApiKey =
      'AsxkZ%2BjmsE2FU43mIw2om0asxQOF0lNuCO2oR%2BZcjSifvw8FHY2gGeXsk552VkAGAb5OHYilWBOoThxvaSqi%2Fg%3D%3D';
  static const _decodedApiKey =
      'AsxkZ+jmsE2FU43mIw2om0asxQOF0lNuCO2oR+ZcjSifvw8FHY2gGeXsk552VkAGAb5OHYilWBOoThxvaSqi/g==';

  Future<ParkingResponse> fetchPublicParking({
    int page = 1,
    int perPage = 10,
  }) async {
    final url =
        'https://api.odcloud.kr/api/15050093/v1/uddi:d19c8e21-4445-43fe-b2a6-865dff832e08';

    try {
      final response = await _dio.get(
        url,
        queryParameters: {
          'page': page,
          'perPage': perPage,
          'serviceKey': _decodedApiKey,
        },
        options: Options(headers: {'Authorization': _encodedApiKey}),
      );
      return ParkingResponse.fromJson(response.data);
    } catch (e) {
      throw Exception("error: $e");
    }
  }
}
