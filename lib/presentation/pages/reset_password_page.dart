import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_bottom_button.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_text_field.dart';
import 'package:public_parking_info_fe/providers/user_api_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

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
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$').hasMatch(_email);

  @override
  Widget build(BuildContext context) {
    final userApi = ref.read(userApiProvider.notifier);

    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap:
                _isFormValid
                    ? () async {
                      try {
                        final isDuplicated = await userApi.checkEmail(
                          email: _email,
                        );
                        if (!isDuplicated) {
                          if (!mounted) return;
                          _showDialog(
                            title: '메일 전송에 실패했습니다',
                            message1: '가입한 이력이 없습니다.\n',
                            highlighted: '회원가입',
                            message2: '을 진행해주세요.',
                          );
                          return;
                        }

                        final result = await userApi.postEmail(email: _email);
                        if (result != null) {
                          if (!mounted) return;
                          _showDialog(
                            title: '메일 전송이되었습니다',
                            message1: '비밀번호 재설정 이메일을 전송했습니다\n',
                            highlighted: '새 비밀번호',
                            message2: '를\n입력해주세요.',
                            prefix: '인증코드 검증 후 ',
                            onConfirm: () {
                              context.pushReplacementNamed(
                                "verification",
                                extra: _email,
                              );
                            },
                          );
                        } else {
                          if (!mounted) return;
                          _showSnackBar('⚠️ 이메일 전송에 실패했습니다.');
                        }
                      } catch (e) {
                        if (!mounted) return;
                        _showSnackBar('오류가 발생했습니다: $e');
                      }
                    }
                    : null,
            child: CustomBottomButton(
              color:
                  _isFormValid ? CustomColors.primary : const Color(0xFFE9EBED),
              text: "이메일 보내기",
              fontColor: _isFormValid ? Colors.white : const Color(0xFF73787E),
              height: 60,
              radius: 12,
            ),
          ),
        ),
      ),
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
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 60),
                          Column(
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
                        ],
                      ),
                      // const SizedBox(height: 100),
                      // const SizedBox(height: 340),
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

  void _showDialog({
    required String title,
    required String message1,
    required String highlighted,
    required String message2,
    String prefix = '',
    String confirmText = '확인',
    VoidCallback? onConfirm,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          content: SizedBox(
            width: 300,
            height: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                    children: [
                      TextSpan(text: message1),
                      if (prefix.isNotEmpty) TextSpan(text: prefix),
                      TextSpan(
                        text: highlighted,
                        style: TextStyle(
                          color: CustomColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: message2),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF613EEA),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.of(dialogContext).pop(); // 다이얼로그 닫기
                  if (onConfirm != null) {
                    onConfirm(); // 이동 콜백 호출
                  }
                },
                child: Text(
                  confirmText,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }
}
