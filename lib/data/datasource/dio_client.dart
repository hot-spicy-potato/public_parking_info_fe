import 'dart:io'; // Cookie import 위해 추가
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:public_parking_info_fe/services/user_service.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  static DioClient get instance => _instance;
  static Dio get dio => _instance._dio;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://port-0-public-parking-info-de-ma8tyvwu9ca7cc7b.sel4.cloudtype.app',
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
    ),
  );

  late PersistCookieJar _cookieJar;
  bool _initialized = false;

  DioClient._internal();

  Future<void> init() async {
    if (_initialized) return;

    final appDocDir = await getApplicationDocumentsDirectory();
    _cookieJar = PersistCookieJar(storage: FileStorage('${appDocDir.path}/.cookies'));
    _dio.interceptors.add(CookieManager(_cookieJar));

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final accessToken = await UserService.instance.getAccessToken();
          if (accessToken != null) {
            options.headers["Authorization"] = "Bearer $accessToken";
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401 || error.response?.statusCode == 403) {
            try {
              final uri = Uri.parse(_dio.options.baseUrl + "/api/users/refresh-access-token");
              final cookies = await _cookieJar.loadForRequest(uri);
              print("Cookies before refresh request: $cookies");

              final refreshResponse = await _dio.post("/api/users/refresh-access-token");
              final newAccessToken = refreshResponse.data;

              await UserService.instance.saveAccessToken(newAccessToken);

              final retryRequest = error.requestOptions;
              retryRequest.headers["Authorization"] = "Bearer $newAccessToken";

              final response = await _dio.fetch(retryRequest);
              return handler.resolve(response);
            } catch (e) {
              print("Token refresh failed: $e");
              return handler.reject(error);
            }
          }
          return handler.next(error);
        },
      ),
    );

    _initialized = true;
  }

  void saveRefreshTokenCookie(String refreshToken, Uri uri) {
    final cookie =
        Cookie('refreshToken', refreshToken)
          ..domain = uri.host
          ..path = '/'
          ..httpOnly = true;

    _cookieJar.saveFromResponse(uri, [cookie]);
  }
}
