import 'package:api_version_3_waifu/manager/api_service.dart';

class AnimeRepository {
  final _api = ApiService(buildDioClient("https://api.waifu.pics/"));

  List imgNekoUrls = [];

  Future<Object> getNeko() async {
    try {
      for (int i = 0; i <= 10; i++) {
        final response = await _api.getNeko();
        imgNekoUrls.add(response.url);
      }
      return imgNekoUrls;
    } catch (e) {
      return [];
    }
  }

  List imgWaifuUrls = [];

  Future<Object> getWaifu() async {
    try {
      for (int i = 0; i <= 10; i++) {
        final response = await _api.getWaifu();
        imgWaifuUrls.add(response.url);
      }
      return imgWaifuUrls;
    } catch (e) {
      return [];
    }
  }
}

// https://api.waifu.pics/type/category
