import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/data/models/response/login_response.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_bottom_button.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_text_field.dart';
import 'package:public_parking_info_fe/providers/login_provider.dart';
import 'package:public_parking_info_fe/resources/resources.dart';
import 'package:public_parking_info_fe/services/user_service.dart';

class EmailLoginPage extends ConsumerStatefulWidget {
  const EmailLoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends ConsumerState<EmailLoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _showInfoBox = true;
  String _email = '';
  String _password = '';

  bool get _isFormValid => _email.isNotEmpty && _password.isNotEmpty;
  @override
  Widget build(BuildContext context) {
    final loginProvider = ref.watch(loginNotifireProvider.notifier);
    final UserService userService = UserService.instance;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "로그인",
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
                      SizedBox(
                        height: _showInfoBox ? 50 : 50,
                        child:
                            _showInfoBox
                                ? Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: CustomColors.primary.withAlpha(77),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "프로필 정보를 등록하고 편하게 이용해 보세요",
                                          style: CustomFonts.w500(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _showInfoBox = false;
                                          });
                                        },
                                        child: const Icon(
                                          Icons.close,
                                          size: 20,
                                          color: CustomColors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                : null,
                      ),

                      const SizedBox(height: 140),
                      CustomTextField(
                        title: "이메일",
                        hintText: "email@address.com",
                        validator: (value) {},
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                          loginProvider.setEmail(value);
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        title: "비밀번호",
                        hintText: "영문, 숫자, 특수문자 포함 8자리 이상",
                        obscureText: true,
                        validator: (value) {},
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                          loginProvider.setPassword(value);
                        },
                      ),
                      const SizedBox(height: 24),
                      GestureDetector(
                        onTap:
                            _isFormValid
                                ? () async {
                                  final LoginResponse? response =
                                      await loginProvider.login();
                                  if (response != null) {
                                    await userService.saveAccessToken(
                                      response.token.accessToken,
                                    );
                                    context.pushReplacementNamed("main");
                                  }
                                }
                                : null,
                        child: CustomBottomButton(
                          color:
                              _isFormValid
                                  ? CustomColors.primary
                                  : const Color(0xFFE9EBED),
                          text: "로그인",
                          fontColor:
                              _isFormValid
                                  ? Colors.white
                                  : const Color(0xFF73787E),
                          height: 60,
                          radius: 12,
                        ),
                      ),
                      const SizedBox(height: 200),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap:
                                () => context.pushReplacementNamed("resetPwd"),
                            child: Text(
                              "비밀번호 재설정",
                              style: CustomFonts.w600(
                                fontSize: 16,
                                color: CustomColors.darkGrey2,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          GestureDetector(
                            onTap: () => context.pushReplacementNamed("signup"),
                            child: Text(
                              "회원가입",
                              style: CustomFonts.w600(
                                fontSize: 16,
                                color: CustomColors.darkGrey2,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
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
