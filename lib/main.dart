import 'package:flutter/material.dart';
import 'package:test_/app_bar.dart';
import 'package:test_/track_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Main',
        home: Scaffold(
            appBar: const MusicAppBar(appBarIcon: Icons.arrow_upward_rounded , appBarTitle: 'appBarTitle', userImageURL: 'https://img.etimg.com/thumb/msid-81525531,width-650,imgsize-622277,,resizemode-4,quality-100/music_thinkstockphotos.jpg'),
            body: ListView(
              children: List.filled(
                  10,
                  TrackCard(
                      data: TrackInfo(
                    name: 'name',
                    imageURL: 'https://img.etimg.com/thumb/msid-81525531,width-650,imgsize-622277,,resizemode-4,quality-100/music_thinkstockphotos.jpg',
                    releaseDate: DateTime(2002),
                    length: const Duration(seconds: 10),
                    price: 5,
                  ))),
            )));
  }
}
