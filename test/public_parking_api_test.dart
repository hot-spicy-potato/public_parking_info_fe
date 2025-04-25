import 'package:flutter_test/flutter_test.dart';
import 'package:public_parking_info_fe/data/datasource/public_parking_api.dart';
import 'package:public_parking_info_fe/data/models/parking_response.dart';

void main() {
  group('PublicParkingAPI 테스트', () {
    final api = PublicParkingAPI();

    test('공영주차장 목록 불러오기 성공', () async {
      // when
      final ParkingResponse result = await api.fetchPublicParking();

      // then
      print(result);
    });
  });
}
