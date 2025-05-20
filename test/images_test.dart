import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.text).existsSync(), isTrue);
    expect(File(Images.alarmIcon).existsSync(), isTrue);
    expect(File(Images.arrowLeft).existsSync(), isTrue);
    expect(File(Images.arrowRight).existsSync(), isTrue);
    expect(File(Images.carIcon).existsSync(), isTrue);
    expect(File(Images.completedSignupIcon).existsSync(), isTrue);
    expect(File(Images.currentLocationIcon).existsSync(), isTrue);
    expect(File(Images.dotMenuIcon).existsSync(), isTrue);
    expect(File(Images.emptyDataIcon).existsSync(), isTrue);
    expect(File(Images.enableParkingCountIcon).existsSync(), isTrue);
    expect(File(Images.favoriteIcon).existsSync(), isTrue);
    expect(File(Images.helperTextIcon).existsSync(), isTrue);
    expect(File(Images.historyIcon).existsSync(), isTrue);
    expect(File(Images.kakaoIcon).existsSync(), isTrue);
    expect(File(Images.kakaoLoginIcon).existsSync(), isTrue);
    expect(File(Images.logo).existsSync(), isTrue);
    expect(File(Images.logoIcon).existsSync(), isTrue);
    expect(File(Images.markerIcon).existsSync(), isTrue);
    expect(File(Images.noDataIcon).existsSync(), isTrue);
    expect(File(Images.operationTimeIcon).existsSync(), isTrue);
    expect(File(Images.parkingFeeIcon).existsSync(), isTrue);
    expect(File(Images.roadViewIcon).existsSync(), isTrue);
    expect(File(Images.searchIcon).existsSync(), isTrue);
    expect(File(Images.selectDateIcon).existsSync(), isTrue);
    expect(File(Images.selectTimeIcon).existsSync(), isTrue);
    expect(File(Images.selectedMarkerIcon).existsSync(), isTrue);
    expect(File(Images.selectedStarIcon).existsSync(), isTrue);
    expect(File(Images.selectedTabbarFavoriteIcon).existsSync(), isTrue);
    expect(File(Images.selectedTabbarHistoryIcon).existsSync(), isTrue);
    expect(File(Images.selectedTabbarHomeIcon).existsSync(), isTrue);
    expect(File(Images.selectedTabbarMypageIcon).existsSync(), isTrue);
    expect(File(Images.splash03Icon).existsSync(), isTrue);
    expect(File(Images.splashMapIcon).existsSync(), isTrue);
    expect(File(Images.starIcon).existsSync(), isTrue);
    expect(File(Images.tabbarFavoriteIcon).existsSync(), isTrue);
    expect(File(Images.tabbarHistoryIcon).existsSync(), isTrue);
    expect(File(Images.tabbarHomeIcon).existsSync(), isTrue);
    expect(File(Images.tabbarMypageIcon).existsSync(), isTrue);
    expect(File(Images.updatedDateIcon).existsSync(), isTrue);
  });
}
