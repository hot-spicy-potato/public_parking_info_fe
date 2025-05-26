import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_bottom_button.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_text_field.dart';
import 'package:public_parking_info_fe/providers/user_api_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';
import 'package:public_parking_info_fe/services/user_service.dart';

class ResetPwdPage extends ConsumerStatefulWidget {
  const ResetPwdPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ResetPwdPageState();
}

class _ResetPwdPageState extends ConsumerState<ResetPwdPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String? _emailError;

  bool get _isFormValid =>
      _email.isNotEmpty &&
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(_email);

  @override
  Widget build(BuildContext context) {
    final userApi = ref.read(userApiProvider.notifier);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "비밀번호 재설정",
          style: CustomFonts.w600(fontSize: 20, color: CustomColors.darkGrey),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Image.asset(Images.arrowLeft),
          ),
        ),
        leadingWidth: 30,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 60,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "비밀번호 재설정을 위해",
                              style: CustomFonts.w700(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "가입한 이메일 주소를 입력해주세요",
                              style: CustomFonts.w700(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 140),

                      CustomTextField(
                        title: "이메일",
                        hintText: "email@address.com",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '이메일을 입력해주세요.';
                          }
                          if (!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(value)) {
                            return '올바른 이메일 형식을 입력해주세요.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                            _emailError = null;
                            if (!_isFormValid) {
                              _emailError = '올바른 이메일 형식을 입력해주세요.';
                            }
                          });
                        },
                      ),

                      const SizedBox(height: 100),

                      GestureDetector(
                        onTap:
                            _isFormValid
                                ? () async {
                                  try {
                                    final result = await userApi.postEmail(
                                      email: _email,
                                    );

                                    if (result != null) {
                                      if (!mounted) return;
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('메일 전송이되었습니다'),
                                            content: SizedBox(
                                              width: 300,
                                              height: 200,
                                              child: RichText(
                                                text: TextSpan(
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Colors.grey,
                                                  ),
                                                  children: [
                                                    const TextSpan(
                                                      text:
                                                          '비밀번호 재설정 이메일을 전송했습니다\n',
                                                    ),
                                                    const TextSpan(
                                                      text: '인증코드 검증 후 ',
                                                    ),
                                                    TextSpan(
                                                      text: '새 비밀번호',
                                                      style: TextStyle(
                                                        color:
                                                            CustomColors
                                                                .primary,
                                                      ),
                                                    ),
                                                    const TextSpan(
                                                      text: '를\n입력해주세요.',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            actions: [
                                              SizedBox(
                                                width: double.infinity,
                                                child: TextButton(
                                                  style: TextButton.styleFrom(
                                                    backgroundColor: Color(
                                                      0xFF613EEA,
                                                    ),
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          vertical: 12,
                                                        ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text(
                                                    '완료',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else {
                                      if (!mounted) return;
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text('⚠️ 이메일 전송에 실패했습니다.'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  } catch (e) {
                                    if (!mounted) return;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('오류가 발생했습니다: $e'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                }
                                : null,
                        child: CustomBottomButton(
                          color:
                              _isFormValid
                                  ? CustomColors.primary
                                  : const Color(0xFFE9EBED),
                          text: "이메일 보내기",
                          fontColor:
                              _isFormValid
                                  ? Colors.white
                                  : const Color(0xFF73787E),
                          height: 60,
                          radius: 12,
                        ),
                      ),

                      const SizedBox(height: 340),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
