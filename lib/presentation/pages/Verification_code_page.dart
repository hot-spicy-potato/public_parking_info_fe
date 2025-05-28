import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_bottom_button.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_text_field.dart';
import 'package:public_parking_info_fe/providers/user_api_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

class VerificationCodePage extends ConsumerStatefulWidget {
  final String? email;
  const VerificationCodePage({super.key, this.email});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerificationCodePageState();
}

class _VerificationCodePageState extends ConsumerState<VerificationCodePage> {
  final _formKey = GlobalKey<FormState>();
  String? _codeError;
  String _verificationCode = '';

  bool get _isFormValid =>
      _verificationCode.isNotEmpty &&
      RegExp(r'^\d{6}$').hasMatch(_verificationCode);

  @override
  Widget build(BuildContext context) {
    final userApi = ref.read(userApiProvider.notifier);

    return Scaffold(
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
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 60),
                    Text(
                      "비밀번호 재설정을 위해",
                      textAlign: TextAlign.center,
                      style: CustomFonts.w700(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "인증번호를 입력해주세요",
                      textAlign: TextAlign.center,
                      style: CustomFonts.w700(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 80),
                    CustomTextField(
                      title: "인증번호",
                      hintText: "인증번호를 입력해주세요",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '코드를 입력해주세요.';
                        }
                        if (!RegExp(r'^\d{6}$').hasMatch(value)) {
                          return '6자리 숫자만 입력해주세요.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _verificationCode = value;
                          _codeError =
                              !_isFormValid ? '올바른 인증번호 형식을 입력해주세요.' : null;
                        });
                      },
                    ),
                    if (_codeError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          _codeError!,
                          style: CustomFonts.w400(
                            fontSize: 13,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap:
                          _isFormValid
                              ? () async {
                                try {
                                  final isVerified = await userApi
                                      .postVerifyCode(
                                        email: widget.email!,
                                        verificationCode: _verificationCode,
                                      );
                                  if (isVerified) {
                                    if (!mounted) return;
                                    _showSnackBar(
                                      "📩 인증번호가 맞습니다.",
                                      backgroundColor: Colors.green,
                                    );
                                    // context.pushReplacementNamed(
                                    //   "newPassword",
                                    //   extra: widget.email,
                                    // );
                                  } else {
                                    _showSnackBar(
                                      "⚠️ 인증번호가 올바르지 않습니다.",
                                      backgroundColor: Colors.red,
                                    );
                                  }
                                } catch (e) {
                                  _showSnackBar(
                                    "에러 발생.",
                                    backgroundColor: Colors.red,
                                  );
                                  // _showSnackBar("오류 발생: $e");
                                }
                              }
                              : null,
                      child: CustomBottomButton(
                        text: "확인",
                        color:
                            _isFormValid
                                ? CustomColors.primary
                                : const Color(0xFFE9EBED),
                        fontColor:
                            _isFormValid
                                ? Colors.white
                                : const Color(0xFF73787E),
                        height: 60,
                        radius: 12,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: TextButton(
                        onPressed: () async {
                          try {
                            final result = await userApi.postEmail(
                              email: widget.email!,
                            );
                            if (result != null) {
                              // _showSnackBar("📩 인증번호가 재전송되었습니다.");
                            } else {
                              // _showSnackBar("⚠️ 이메일 전송에 실패했습니다.");
                            }
                          } catch (e) {
                            // _showSnackBar("오류 발생: $e");
                          }
                        },
                        child: Text(
                          "인증번호 재전송",
                          style: CustomFonts.w500(
                            fontSize: 15,
                            color: CustomColors.primary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(
    String message, {
    Color backgroundColor = CustomColors.primary,
  }) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: CustomFonts.w500(fontSize: 14, color: Colors.white),
        ),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 6,
      ),
    );
  }
}
