import 'package:dio/dio.dart';
import 'package:public_parking_info_fe/data/models/request/review_filter_request.dart';
import 'package:public_parking_info_fe/data/models/request/review_request.dart';
import 'package:public_parking_info_fe/data/models/response/favorite_list_response.dart';
import 'package:public_parking_info_fe/data/models/response/favorite_response.dart';
import 'package:public_parking_info_fe/data/models/response/jwt_response.dart';
import 'package:public_parking_info_fe/data/models/response/review_info_response.dart';
import 'package:public_parking_info_fe/data/models/response/review_list_response.dart';
import 'package:public_parking_info_fe/services/user_service.dart';
import 'package:public_parking_info_fe/services/user_service_impl.dart';

class UserApi {
  final UserService userService = UserServiceImpl.instance;

  final dio = Dio(
    BaseOptions(
      baseUrl:
          'https://port-0-public-parking-info-de-ma8tyvwu9ca7cc7b.sel4.cloudtype.app',
      // 'http://192.168.0.14:8080/',
      headers: {
        'Content-Type': 'application/json',
        'Accept': "application/json",
      },
    ),
  );

  // 리뷰 건수, 별점 조회 API
  // GET /api/users/review
  Future<ReviewInfoResponse?> getReview(String mngNo, String kakaoId) async {
    try {
      final res = await dio.post(
        "/api/users/review",
        data: {"mngNo": mngNo, "kakaoId": kakaoId},
      );
      print("res: $res");
      return ReviewInfoResponse.fromJson(res.data);
    } catch (e) {
      print(e);
    }
    return null;
  }

  // 리뷰 삭제 API
  // DELETE /api/users/review/delete/{id}
  Future<int?> deleteReview(int reviewId) async {
    final token = await userService.getToken();

    try {
      if (token != null) {
        final res = await dio.delete(
          "/api/users/review/delete/$reviewId",
          options: Options(headers: {"Authorization": "Bearer $token"}),
        );
        return res.statusCode;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  // 리뷰 신고 API
  // GET /api/users/review/report
  Future<int?> reviewReport(int reviewId, String userId) async {
    final token = await userService.getToken();

    try {
      if (token != null) {
        final res = await dio.get(
          "/api/users/review/report",
          data: {"id": reviewId, "reporter": userId},
          options: Options(headers: {"Authorization": "Bearer $token"}),
        );
        return res.statusCode;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  // 리뷰 등록 API
  // POST /api/users/review/insert
  Future<int?> postReviewAPI(ReviewRequest reviewRequest) async {
    final token = await userService.getToken();

    try {
      if (token != null) {
        final res = await dio.post(
          "/api/users/review/insert",
          data: reviewRequest.toJson(),
          options: Options(headers: {"Authorization": "Bearer $token"}),
        );
        return res.statusCode;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  // 즐겨찾기 토글 API
  // POST /api/users/favorite
  Future<FavoriteResponse?> postFavorite(String mngNo, String kakaoId) async {
    final token = await userService.getToken();

    print("jwt : $token");

    try {
      if (token != null) {
        final res = await dio.post(
          "/api/users/favorite",
          data: {"mngNo": mngNo, "kakaoId": kakaoId},
          options: Options(headers: {"Authorization": "Bearer $token"}),
        );
        return FavoriteResponse.fromJson(res.data);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  // 즐겨찾기 목록 조회 API
  // GET /api/users/favorite/list
  Future<List<FavoriteListItem>?> getFavoriteList(String kakaoId) async {
    final token = await userService.getToken();

    try {
      if (token != null) {
        final res = await dio.post(
          "/api/users/favorite/list",
          data: {"kakaoId": kakaoId},
          options: Options(headers: {"Authorization": "Bearer $token"}),
        );

        final List<dynamic> rawList = res.data;
        return rawList.map((e) => FavoriteListItem.fromJson(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  // 리뷰 목록 조회 API
  // GET /api/users/review/list
  Future<ReviewListResponse?> getReviewList(
    ReviewFilterRequest reviewFilterRequest,
  ) async {
    try {
      final res = await dio.post(
        "/api/users/review/list",
        data: reviewFilterRequest.toJson(),
      );
      return ReviewListResponse.fromJson(res.data);
    } catch (e) {
      print(e);
    }
    return null;
  }

  // 로그인
  // POST /api/users/login
  Future<String?> login(String accessToken) async {
    try {
      final res = await dio.post(
        "/api/users/login",
        options: Options(headers: {"Authorization": accessToken}),
      );

      print(JwtResponse.fromJson(res.data).token);
      return JwtResponse.fromJson(res.data).token;
    } catch (e) {
      print(e);
    }
    return null;
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
