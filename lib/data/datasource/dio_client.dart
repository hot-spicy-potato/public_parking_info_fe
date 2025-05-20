import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:public_parking_info_fe/services/user_service.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  static Dio get dio => _instance._dio;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl:
          'https://port-0-public-parking-info-de-ma8tyvwu9ca7cc7b.sel4.cloudtype.app',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  DioClient._internal() {
    final cookieJar = CookieJar();
    _dio.interceptors.add(CookieManager(cookieJar));

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
          if (error.response?.statusCode == 401) {
            try {
              final refreshResponse = await _dio.post(
                "/api/users/refresh-access-token",
              );
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
  }
}
