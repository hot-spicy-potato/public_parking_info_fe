import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.carIcon).existsSync(), isTrue);
    expect(File(Images.currentLocationIcon).existsSync(), isTrue);
    expect(File(Images.favoriteIcon).existsSync(), isTrue);
    expect(File(Images.historyIcon).existsSync(), isTrue);
    expect(File(Images.kakaoIcon).existsSync(), isTrue);
    expect(File(Images.kakaoLoginIcon).existsSync(), isTrue);
    expect(File(Images.logo).existsSync(), isTrue);
    expect(File(Images.logoIcon).existsSync(), isTrue);
    expect(File(Images.markerIcon).existsSync(), isTrue);
    expect(File(Images.roadViewIcon).existsSync(), isTrue);
    expect(File(Images.selectedMarkerIcon).existsSync(), isTrue);
    expect(File(Images.splashMapIcon).existsSync(), isTrue);
  });
}
