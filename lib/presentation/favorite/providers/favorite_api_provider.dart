import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:public_parking_info_fe/data/datasource/favorite_api.dart';
import 'package:public_parking_info_fe/data/models/response/favorite_list_response.dart';

final favoriteApiProvider =
    StateNotifierProvider<FavoriteNotifier, AsyncValue<void>>((ref) {
      return FavoriteNotifier(AsyncData(null));
    });

class FavoriteNotifier extends StateNotifier<AsyncValue<void>> {
  final FavoriteApi api = FavoriteApi.instance;

  FavoriteNotifier(super.state);

  Future<bool> setFavorite({required String code}) async {
    return api.setFavorite(code);
  }

  Future<List<FavoriteListItem>> getFavoriteList() async {
    return api.getFavoriteList();
  }
}
