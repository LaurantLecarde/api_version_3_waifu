
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model.dart';

class FeedPage extends StatefulWidget {
  FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  late AnimeViewModel _viewModel;
  bool _isFirstTime = false;

  @override
  void initState() {
    _isFirstTime = true;
    super.initState();
  }

  final TextStyle _style = TextStyle(color: Colors.white, fontSize: 20);

  @override
  Widget build(BuildContext context) {
    if (_isFirstTime) {
      _viewModel = Provider.of<AnimeViewModel>(context);
      _viewModel.getNeko();
      _viewModel.getWaifu();
      _isFirstTime = false;
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "WORKED",
            style: _style,
          )),
      body: _viewModel.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Neko',
                    style: _style,
                  ),
                ),
                _viewModel.animeNekoImgUrls.isNotEmpty
                    ? _buildNeko()
                    : const Center(child: Text("NO DATA !")),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Waifu',
                    style: _style,
                  ),
                ),
                _viewModel.animeWaifuImgUrls.isNotEmpty
                    ? _buildWaifu()
                    : const Center(child: Text("NO DATA !")),
                const SizedBox(height: 60)
              ],
            ),
    );
  }

  _buildNeko() {
    final anime = _viewModel.animeNekoImgUrls[0];
    return CarouselSlider.builder(
      options: CarouselOptions(
          height: 400, viewportFraction: 0.7, enlargeCenterPage: true),
      itemCount: 10,
      itemBuilder: (context, index, pageIndex) {
        final realA = anime[index];
        return Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network("$realA", fit: BoxFit.cover)));
      },
    );
  }

  _buildWaifu() {
    final anime = _viewModel.animeWaifuImgUrls[0];
    return CarouselSlider.builder(
      options: CarouselOptions(
          height: 400, viewportFraction: 0.7, enlargeCenterPage: true),
      itemCount: 10,
      itemBuilder: (context, index, pageIndex) {
        final realA = anime[index];
        return Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network("$realA", fit: BoxFit.cover)));
      },
    );
  }
}
