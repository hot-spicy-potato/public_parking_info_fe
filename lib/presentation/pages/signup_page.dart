import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/data/models/response/login_response.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_bottom_button.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_text_field.dart';
import 'package:public_parking_info_fe/providers/signup_provider.dart';
import 'package:public_parking_info_fe/providers/user_api_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // 상태 초기화
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(signupNotifierProvider.notifier).reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    final signupProvider = ref.watch(signupNotifierProvider.notifier);
    bool enableSignup = ref.watch(enableSignupProvider);
    final userApi = ref.read(userApiProvider.notifier);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "회원가입",
          style: CustomFonts.w600(fontSize: 20, color: CustomColors.darkGrey),
          textAlign: TextAlign.center,
        ),
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Image.asset(Images.arrowLeft),
          ),
        ),
        leadingWidth: 30,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: GestureDetector(
            onTap: () async {
              final email = signupProvider.getEmail();
              final exists = await userApi.checkEmail(email: email);
              if (exists) {
                if (context.mounted) {
                  _showDialog(
                    title: '중복된 이메일입니다',
                    message1: '',
                    highlighted: '중복된 이메일',
                    message2: '입니다.\n다른 이메일을 사용해주세요.',
                  );
                }
                return;
              }
              if (enableSignup) {
                final LoginResponse? response = await signupProvider.signup();
                if (response != null) {
                  await userService.saveAccessToken(response.token.accessToken);
                  context.pushReplacementNamed("completedSignup");
                }
              }
            },
            child: CustomBottomButton(
              color:
                  enableSignup ? CustomColors.primary : CustomColors.whiteGrey,
              text: "회원가입",
              fontColor: enableSignup ? Colors.white : CustomColors.grey,
              height: 60,
              radius: 12,
            ),
          ),
        ),
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
                    children: [
                      CustomTextField(
                        title: "이름",
                        hintText: "홍길동",
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 2 ||
                              value.length > 10) {
                            return "최소 2자 이상 최대 10자 이하를 입력해 주세요.";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          signupProvider.setName(value);
                        },
                      ),
                      CustomTextField(
                        title: "이메일",
                        hintText: "email@address.com",
                        validator: (value) {
                          final emailRegex = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          );
                          if (value == null ||
                              value.isEmpty ||
                              !emailRegex.hasMatch(value)) {
                            return "올바른 이메일 형식을 입력해 주세요.";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          signupProvider.setEmail(value);
                        },
                      ),
                      CustomTextField(
                        title: "비밀번호",
                        hintText: "영문, 숫자, 특수문자 포함 8자리 이상",
                        obscureText: true,
                        validator: (value) {
                          final regex = RegExp(
                            r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#\$%^&*(),.?":{}|<>]).{8,}$',
                          );
                          if (value == null ||
                              value.isEmpty ||
                              !regex.hasMatch(value)) {
                            return "영문, 숫자, 특수문자를 포함하여 8자리 이상 입력해 주세요.";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          signupProvider.setPassword(value);
                        },
                      ),
                      CustomTextField(
                        title: "비밀번호 재입력",
                        hintText: "비밀번호를 재입력해 주세요.",
                        obscureText: true,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              signupProvider.getPassword() != value) {
                            return "비밀번호가 일치하지 않습니다.";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          signupProvider.setRePassword(value);
                        },
                      ),
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
}
