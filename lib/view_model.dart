import 'package:api_version_3_waifu/repos.dart';
import 'package:flutter/cupertino.dart';

class AnimeViewModel extends ChangeNotifier {
  final _repo = AnimeRepository();
  bool loading = false;
  final List animeNekoImgUrls = [];

  final List animeWaifuImgUrls = [];

  getNeko() async {
    loading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    loading = false;
    animeNekoImgUrls.add(await _repo.getNeko());
    notifyListeners();
  }

  getWaifu() async {
    loading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    loading = false;
    animeWaifuImgUrls.add(await _repo.getWaifu());
    notifyListeners();
  }
}
