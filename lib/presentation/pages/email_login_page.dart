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
              final LoginResponse? response = await loginProvider.login();
              if (response != null) {
                await userService.saveAccessToken(response.token.accessToken);
                context.pushReplacementNamed("main");
              }
            },
            child: CustomBottomButton(
              color: CustomColors.primary,
              text: "로그인",
              fontColor: Colors.white,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        title: "이메일",
                        hintText: "email@address.com",
                        validator: (value) {},
                        onChanged: (value) {
                          loginProvider.setEmail(value);
                        },
                      ),
                      CustomTextField(
                        title: "비밀번호",
                        hintText: "영문, 숫자, 특수문자 포함 8자리 이상",
                        obscureText: true,
                        validator: (value) {},
                        onChanged: (value) {
                          loginProvider.setPassword(value);
                        },
                      ),
                      GestureDetector(
                        onTap: () => context.pushReplacementNamed("signup"),
                        child: Text(
                          "회원가입",
                          style: CustomFonts.w600(fontSize: 16, color: CustomColors.darkGrey2),
                        ),
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
}
