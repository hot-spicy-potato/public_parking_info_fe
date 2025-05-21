import 'package:dio/dio.dart';
import 'package:public_parking_info_fe/data/datasource/dio_client.dart';
import 'package:public_parking_info_fe/data/models/request/review_request.dart';
import 'package:public_parking_info_fe/data/models/request/review_sort_request.dart';
import 'package:public_parking_info_fe/data/models/response/review_info_response.dart';
import 'package:public_parking_info_fe/data/models/response/review_list_response.dart';

class ReviewApi {
  ReviewApi._internal();
  static final ReviewApi _instance = ReviewApi._internal();
  static ReviewApi get instance => _instance;

  final Dio dio = DioClient.dio;

  // todo. get으로 api method 전환 필요.
  // 리뷰 건수, 별점, 즐겨찾기 유무 조회 API
  // /api/review
  Future<ReviewInfoResponse?> getReviewInfo(String code) async {
    try {
      final res = await dio.post("/api/review", queryParameters: {"code": code});
      return ReviewInfoResponse.fromJson(res.data);
    } catch (e) {
      print("fail get review info");
    }
    return null;
  }

  // 리뷰 신고 API
  // /api/review/review/report/{id}
  Future<bool> reportReview(int id) async {
    try {
      final res = await dio.post("/api/review/report/$id");
      if (res.statusCode == 200) return true;
    } catch (e) {
      print("fail report review");
    }
    return false;
  }

  // 리뷰 목록 조회 API
  // /api/review/review/list
  Future<List<ReviewListItemResponse>> getReviewList(ReviewSortRequest request) async {
    try {
      final res = await dio.post("/api/review/list", data: request);
      final List list = res.data;
      return list.map((item) => ReviewListItemResponse.fromJson(item)).toList();
    } catch (e) {
      print("fail get review list");
    }
    return [];
  }

  // 리뷰 등록 API
  // /api/review/review/insert
  Future<int?> postReview(ReviewRequest request) async {
    try {
      final res = await dio.post("/api/review/insert", data: request);
      return res.data;
    } catch (e) {
      print("fail post review");
    }
    return null;
  }

  // 리뷰 삭제 API
  // /api/review/review/delete/{id}
  Future<bool> deleteReview(int id) async {
    try {
      final res = await dio.delete("/api/review/delete/$id");
      if (res.statusCode == 200) return true;
    } catch (e) {
      print("fail delete review");
    }
    return false;
  }
}
