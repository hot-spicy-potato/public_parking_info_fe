import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_links/uni_links.dart';

class LoginRedirector extends StatefulWidget {
  const LoginRedirector({Key? key}) : super(key: key);

  @override
  State<LoginRedirector> createState() => _LoginRedirectorState();
}

class _LoginRedirectorState extends State<LoginRedirector> {
  @override
  void initState() {
    super.initState();
    _handleInitialUri();
  }

  Future<void> _handleInitialUri() async {
    try {
      final uri = await getInitialUri();
      if (uri != null && uri.scheme.startsWith('kakao')) {
        context.go('/main');
      }
    } catch (e) {
      print('딥링크 오류: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
