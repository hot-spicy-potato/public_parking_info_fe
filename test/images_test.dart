import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.markerIcon).existsSync(), isTrue);
  });
}
