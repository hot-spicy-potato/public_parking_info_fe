import 'package:dio/dio.dart';
import 'package:public_parking_info_fe/data/models/request/review_request.dart';
import 'package:public_parking_info_fe/services/user_service.dart';
import 'package:public_parking_info_fe/services/user_service_impl.dart';

class UserApi {
  final UserService userService = UserServiceImpl.instance;

  final dio = Dio(
    BaseOptions(
      baseUrl:
          'https://port-0-public-parking-info-de-ma8tyvwu9ca7cc7b.sel4.cloudtype.app',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  // /api/users/review/insert
  Future<void> postReviewAPI(ReviewRequest reviewRequest) async {
    final token = await userService.getToken();

    try {
      if (token != null) {
        await dio.post(
          "/api/users/review/insert",
          data: reviewRequest.toJson(),
          options: Options(
            headers: {"Authorization": "Bearer ${token.accessToken}"},
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  //   dio.interceptors.add(InterceptorsWrapper(
  //   onRequest: (options, handler) {
  //     options.headers['Authorization'] = 'Bearer your_token';
  //     print('요청: ${options.uri}');
  //     return handler.next(options);
  //   },
  //   onResponse: (response, handler) {
  //     print('응답: ${response.statusCode}');
  //     return handler.next(response);
  //   },
  //   onError: (e, handler) {
  //     print('에러 발생: $e');
  //     return handler.next(e);
  //   },
  // ));

  //   Future<void> sendReview(ReviewRequest review) async {
  //   final dio = Dio();

  //   try {
  //     final response = await dio.post(
  //       'https://your-server.com/api/users/review/insert',
  //       data: review.toJson(),
  //     );
  //     print('성공: ${response.data}');
  //   } catch (e) {
  //     print('에러 발생: $e');
  //   }
  // }
}
