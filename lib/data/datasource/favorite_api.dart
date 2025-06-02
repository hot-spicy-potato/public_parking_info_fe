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
        "/api/favorite",
        queryParameters: {"code": code},
        options: Options(responseType: ResponseType.plain),
      );
      String state = res.data;
      print("status: ${res.statusCode}, data: ${res.data}");
      if (state == "on") return true;
    } on DioException catch (e) {
      print("Dio error: ${e.response?.statusCode}, data: ${e.response?.data}");
    } catch (e) {
      print("Other error: $e");
    }

    return false;
  }

  // 즐겨찾기 목록 조회 API
  // /api/favorite/favorite/list
  Future<List<FavoriteListItem>> getFavoriteList() async {
    try {
      final res = await dio.post("/api/favorite/list");
      final List list = res.data;
      return list.map((item) => FavoriteListItem.fromJson(item)).toList();
    } catch (e) {
      print("fail get favorite list : $e");
    }
    return [];
  }
}
