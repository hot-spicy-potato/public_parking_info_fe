import 'package:dio/dio.dart';
import 'package:public_parking_info_fe/data/datasource/dio_client.dart';
import 'package:public_parking_info_fe/data/models/response/favorite_list_response.dart';

class FavoriteApi {
  FavoriteApi._internal();
  static final FavoriteApi _instance = FavoriteApi._internal();
  static FavoriteApi get instance => _instance;

  final Dio dio = DioClient.dio;

  // 즐겨찾기 토글 API
  // /api/favorite/favorite
  Future<bool> setFavorite(String code) async {
    try {
      final res = await dio.post(
        "/api/favorite/favorite",
        queryParameters: {"code": code},
      );
      String state = res.data;
      if (state == "on") return true;
    } catch (e) {
      print("fail set favorite : $e");
    }
    return false;
  }

  // 즐겨찾기 목록 조회 API
  // /api/favorite/favorite/list
  Future<List<FavoriteListItem>> getFavoriteList() async {
    try {
      final res = await dio.post("/api/favorite/favorite/list");
      return res.data;
    } catch (e) {
      print("fail get favorite list : $e");
    }
    return [];
  }
}
