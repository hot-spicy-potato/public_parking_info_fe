import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_dialog.dart';
import 'package:public_parking_info_fe/presentation/widgets/review_text_field.dart';
import 'package:public_parking_info_fe/presentation/widgets/select_review_button.dart';
import 'package:public_parking_info_fe/resources/resources.dart';
import 'package:scroll_datetime_picker/scroll_datetime_picker.dart';
import 'package:scroll_time_picker/scroll_time_picker.dart';
import 'package:simple_animated_rating_bar/simple_animated_rating_bar.dart';
import 'package:simple_animated_rating_bar/utils/arb_type.dart';
import 'package:intl/intl.dart';

class WriteReviewPage extends ConsumerWidget {
  const WriteReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget button() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: CustomColors.primary, width: 1),
        ),
        child: Text(
          "선택완료",
          style: CustomFonts.w600(fontSize: 16, color: CustomColors.primary),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(
            Icons.arrow_back_ios,
            color: CustomColors.darkGrey,
            size: 15,
          ),
        ),
        title: Text(
          "주차장",
          style: CustomFonts.w700(fontSize: 18, color: CustomColors.darkGrey),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 60,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        margin: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: CustomColors.primary,
        ),
        child: Text(
          "작성 완료",
          style: CustomFonts.w600(fontSize: 16, color: Colors.white),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "방문 후기를 남겨주세요!",
                  style: CustomFonts.w700(
                    fontSize: 20,
                    color: CustomColors.primary,
                  ),
                ),
              ),
              SizedBox(
                width: 140,
                child: AnimatedRatingBar(
                  initialValue: 5,
                  animationType: ARBAnimationType.none,
                  cascadeAnimation: false,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  emptyWidget: Image.asset(Images.starIcon, width: 26),
                  fullWidget: Image.asset(Images.selectedStarIcon, width: 26),
                ),
              ),
              Divider(color: CustomColors.divider, thickness: 6, height: 80),
              Text(
                "후기를 작성해 보세요!",
                style: CustomFonts.w700(
                  fontSize: 20,
                  color: CustomColors.primary,
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectReviewButton(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialog(
                            child: Container(
                              height: 280,
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ScrollDateTimePicker(
                                    itemExtent: 36,
                                    visibleItem: 5,
                                    style: DateTimePickerStyle(
                                      activeStyle: CustomFonts.w600(
                                        fontSize: 16,
                                        color: CustomColors.primary,
                                      ),
                                      inactiveStyle: CustomFonts.w400(
                                        fontSize: 16,
                                        color: CustomColors.lightGrey,
                                      ),
                                    ),
                                    dateOption: DateTimePickerOption(
                                      minDate: DateTime(2015, 1),
                                      maxDate: DateTime(2025, 12),
                                      dateFormat: DateFormat("yyyy/MM/dd"),
                                    ),
                                    onChange: (datetime) {
                                      //
                                    },
                                  ),
                                  button(),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    iconSrc: Images.selectDateIcon,
                    text: "날짜 선택",
                  ),
                  SizedBox(width: 30),
                  SelectReviewButton(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialog(
                            child: SizedBox(
                              height: 280,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ScrollTimePicker(
                                      is12hFormat: true,
                                      selectedTime: DateTime.now(),
                                      onDateTimeChanged: (value) {
                                        //
                                      },
                                    ),
                                  ),
                                  button(),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    iconSrc: Images.selectTimeIcon,
                    text: "시간 선택",
                  ),
                ],
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ReviewTextField(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
