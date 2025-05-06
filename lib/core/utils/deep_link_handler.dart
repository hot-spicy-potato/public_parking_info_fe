import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_links/uni_links.dart';

class DeepLinkHandler {
  static void init(
    BuildContext context,
    GlobalKey<NavigatorState> navigatorKey,
  ) {
    // 앱이 실행 중일 때 딥링크 수신
    uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        _handleUri(context, uri, navigatorKey);
      }
    });

    // 앱이 종료 상태에서 시작될 때 딥링크 수신
    _initInitialUri(context, navigatorKey);
  }

  static Future<void> _initInitialUri(
    BuildContext context,
    GlobalKey<NavigatorState> navigatorKey,
  ) async {
    final uri = await getInitialUri();
    if (uri != null) {
      _handleUri(context, uri, navigatorKey);
    }
  }

  static void _handleUri(
    BuildContext context,
    Uri uri,
    GlobalKey<NavigatorState> navigatorKey,
  ) {
    if (uri.scheme.startsWith('kakao') && uri.host == 'oauth') {
      final code = uri.queryParameters['code'];
      if (code != null) {
        // 예: 로그인 처리 후 메인으로 이동
        // context.pushNamed('main'); // 또는
        navigatorKey.currentState?.context.goNamed("main");
      }
    }
  }
}
