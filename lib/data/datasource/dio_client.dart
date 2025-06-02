// ignore: unnecessary_import
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:public_parking_info_fe/providers/user_api_provider.dart';
import 'package:public_parking_info_fe/services/user_service.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  static DioClient get instance => _instance;
  static Dio get dio => _instance._dio;

  final Dio _dio = Dio(
    BaseOptions(
      // baseUrl: 'http://localhost:8080',
      baseUrl: 'https://port-0-public-parking-info-de-ma8tyvwu9ca7cc7b.sel4.cloudtype.app',
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
      extra: {"withCredentials": true},
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
              // access token 재발급
              final uri = Uri.parse("${_dio.options.baseUrl}/api/users/refresh-access-token");
              final cookies = await _cookieJar.loadForRequest(uri);
              print("Cookies: $cookies");

              final refreshResponse = await _dio.post(
                "/api/users/refresh-access-token",
                options: Options(responseType: ResponseType.plain),
              );

              final newAccessToken = refreshResponse.data.toString();
              await UserService.instance.saveAccessToken(newAccessToken);

              // 실패한 요청 재시도
              final retryRequest = error.requestOptions;
              retryRequest.headers["Authorization"] = "Bearer $newAccessToken";
              final response = await _dio.fetch(retryRequest);
              return handler.resolve(response);
            } catch (e) {
              // 재발급 실패
              print("Token refresh failed: $e");
              userService.logout();
              return handler.reject(error);
            }
          }
          return handler.next(error);
        },
      ),
    );

    _initialized = true;
  }
}
