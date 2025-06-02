import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_colors.dart';
import 'package:public_parking_info_fe/core/constants/ui/custom_fonts.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_bottom_button.dart';
import 'package:public_parking_info_fe/presentation/widgets/custom_text_field.dart';
import 'package:public_parking_info_fe/providers/user_api_provider.dart';

class NewPwdPage extends ConsumerStatefulWidget {
  final String? email;
  const NewPwdPage({super.key, this.email});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewPwdPageState();
}

class _NewPwdPageState extends ConsumerState<NewPwdPage> {
  final _formKey = GlobalKey<FormState>();
  String _password = '';
  String _confirmPassword = '';
  String? _passwordError;
  String? _confirmPasswordError;

  bool get _isFormValid =>
      _password.isNotEmpty &&
      _confirmPassword.isNotEmpty &&
      _password == _confirmPassword &&
      RegExp(
        r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#\$%^&*(),.?":{}|<>]).{8,}$',
      ).hasMatch(_password);

  @override
  Widget build(BuildContext context) {
    final userApi = ref.read(userApiProvider.notifier);
    final email = widget.email ?? '';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("비밀번호 재설정"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 40),
                Text(
                  "새 비밀번호를 입력해주세요",
                  style: CustomFonts.w700(fontSize: 18, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),
                CustomTextField(
                  title: "비밀번호",
                  hintText: "새 비밀번호를 입력해주세요.",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '비밀번호를 입력해주세요.';
                    }
                    if (!RegExp(
                      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#\$%^&*(),.?":{}|<>]).{8,}$',
                    ).hasMatch(value)) {
                      return '영문, 숫자, 특수문자를 포함하여 8자리 이상 입력해 주세요.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                      _passwordError = null;
                      if (!_isFormValid) {
                        _passwordError = '영문, 숫자, 특수문자를 포함하여 8자리 이상 입력해 주세요.';
                      }
                    });
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  title: "비밀번호 재입력",
                  hintText: "비밀번호를 다시 입력해주세요.",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '비밀번호를 다시 입력해주세요.';
                    }
                    if (value != _password) {
                      return '비밀번호가 일치하지 않습니다.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _confirmPassword = value;
                      _confirmPasswordError = null;
                      if (_password != value) {
                        _confirmPasswordError = '비밀번호가 일치하지 않습니다.';
                      }
                    });
                  },
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 20),
        child: GestureDetector(
          onTap:
              _isFormValid
                  ? () async {
                    final result = await userApi.updatePassword(
                      email: email,
                      password: _password,
                    );
                    if (!mounted) return;
                    if (result) {
                      _showDialog(
                        title: "비밀번호가 변경 되었습니다.",
                        message1: '비밀번호가 변경되었습니다.\n',
                        highlighted: "로그인",
                        message2: "을 진행해 주세요.",
                        onConfirm: () {
                          context.goNamed("login");
                        },
                      );
                    } else {
                      _showSnackBar("비밀번호 변경에 실패했습니다.");
                    }
                  }
                  : null,
          child: CustomBottomButton(
            text: "확인",
            color:
                _isFormValid ? CustomColors.primary : const Color(0xFFE9EBED),
            fontColor: _isFormValid ? Colors.white : const Color(0xFF73787E),
            height: 60,
            radius: 12,
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
