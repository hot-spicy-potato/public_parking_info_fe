// import 'package:dio/dio.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:public_parking_info_fe/core/constants/keys.dart';
// import 'package:public_parking_info_fe/data/models/parking_response.dart';

// class PublicParkingAPI {
//   final Dio _dio = Dio();

//   Future<ParkingResponse> fetchPublicParking({
//     int page = 1,
//     int perPage = 10,
//     required String cond,
//   }) async {
//     final url =
//         'https://api.odcloud.kr/api/15050093/v1/uddi:d19c8e21-4445-43fe-b2a6-865dff832e08';

//     await dotenv.load(fileName: ".env");

//     try {
//       final response = await _dio.get(
//         url,
//         queryParameters: {
//           'page': page,
//           'perPage': perPage,
//           'serviceKey': decodedApiKey,
//           'cond': cond,
//         },
//         options: Options(headers: {'Authorization': encodedApiKey}),
//       );
//       return ParkingResponse.fromJson(response.data);
//     } catch (e) {
//       throw Exception("error: $e");
//     }
//   }
// }
