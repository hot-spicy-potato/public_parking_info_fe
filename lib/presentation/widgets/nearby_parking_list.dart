import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/data/models/parking_info.dart';

class NearbyParkingList extends ConsumerWidget {
  final List<ParkingInfo> parkingList;

  const NearbyParkingList({required this.parkingList, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("parkingList : $parkingList");
    return ListView.builder(
      shrinkWrap: true,
      itemCount: parkingList.length,
      itemBuilder: (context, index) {
        return Container(
          height: 200,
          child: Text(
            parkingList[index].parkingNm,
            style: CustomFonts.w600(fontSize: 16, color: Colors.black),
          ),
        );
      },
    );
  }
}
