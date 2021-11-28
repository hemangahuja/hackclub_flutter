import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:test_/app_bar.dart';
import 'package:test_/track_card.dart';

import 'Modals/WallpaperClass.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<WallPaper> imageList = [];
  List<CachedNetworkImage> featured = [];
  bool loading = true;

  Future getWallpaper(String url) async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var decodeddata = json.decode(response.body);
      return decodeddata;
    } else {
      print(response.statusCode);
      return Null;
    }
  }

  void getCollectionData() async {
    var imagedata = await getWallpaper('https://api.unsplash.com/search/photos?per_page=9&query=music&page=1&client_id=Hl8nP0CKgfQztU1Y8Wb62YgydLAQSOQCnbnfZ2ueSHI');
    appenddatainList(imagedata);
    imageList.forEach((element) {
      featured.add(CachedNetworkImage(
        imageUrl: element.regular,
        fit: BoxFit.fitWidth,
        placeholder: (_, __) {
          return AspectRatio(
            aspectRatio: 1.6,
            child: BlurHash(
              hash: element.blur,
            ),
          );
        },
      ));
    });

    setState(() {
      loading = false;
    });
  }

  void appenddatainList(var decodeddata) {
    for (var x in decodeddata['results']) {
      setState(() {
        imageList.add(
          WallPaper(
            blur: x['blur_hash'],
            regular: x['urls']['regular'],
            full: x['urls']['full'],
          ),
        );
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCollectionData();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> names = ['Hands To Myself', 'At My Worst', 'Sample', 'Music', 'Name'];
    return MaterialApp(
        title: 'Main',
        home: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: const MusicAppBar(
                  appBarIcon: Icons.arrow_upward_rounded,
                  appBarTitle: 'Upload',
                  userImageURL: 'https://img.etimg.com/thumb/msid-81525531,width-650,imgsize-622277,,resizemode-4,quality-100/music_thinkstockphotos.jpg'),
              body: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: SingleChildScrollView(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Container(
                            padding: EdgeInsets.all(30),
                            decoration: const BoxDecoration(
                              color: Color(0xffF7F2EE),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                children: [
                                Expanded(
                                  flex :3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text(
                                      'New Album / Song',
                                      style: TextStyle(
                                          fontSize: 18, fontWeight: FontWeight.w900),
                                    ),
                                    const Text(
                                      'Upload any song on cloud and share on social',
                                      maxLines: 3,
                                      style: TextStyle(
                                        fontSize: 15,),
                                    ),
                                    Container(
                                      width: 80,
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                        color: Color(0xffFF7849),
                                        borderRadius: BorderRadius.all(Radius.circular(3)),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: const [
                                          Icon(Icons.upload,color: Colors.white,size: 13,),
                                          Text( 'Upload', style: TextStyle(fontSize: 13, color: Colors.white,
                                      ),), ],
                                      ),
                                    ),
                                      ],
                                    ),
                                ),
                                  Expanded(flex: 2,child: Image.asset('images/img.png'))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 40,),
                          !loading
                              ? Container(
                                  margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.01),
                                  decoration: BoxDecoration(
                                    border: Border.symmetric(horizontal: BorderSide(color: Colors.white, width: 1.5)),
                                  ),
                                  child: ImageSlideshow(
                                    height: MediaQuery.of(context).size.height * 0.4,
                                    autoPlayInterval: 3000,
                                    children: featured,
                                    isLoop: true,
                                  ),
                                )
                              : Container(),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            'In Progress',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                          ),
                          for (int i = 0; i < names.length; i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                children: [
                                  TrackCard(
                                      data: TrackInfo(
                                    name: names[i],
                                    imageURL: 'https://img.etimg.com/thumb/msid-81525531,width-650,imgsize-622277,,resizemode-4,quality-100/music_thinkstockphotos.jpg',
                                    releaseDate: DateTime(2002),
                                    length: const Duration(seconds: 10),
                                    price: 5,
                                  )),
                                  Divider(
                                    thickness: 2,
                                  )
                                ],
                              ),
                            )
                        ]),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Color(0xffF7F2EE),
                          borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'My Tracks (35)',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: const Text(
                                'See All',
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: const Color(0xffF7F2EE),
                        child: Container(
                          height: 90,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                Icons.home_outlined,
                                color: Colors.grey,
                                size: 32,
                              ),
                              const Icon(
                                Icons.search,
                                color: Colors.grey,
                                size: 32,
                              ),
                              Container(
                                width: 65,
                                //padding: const EdgeInsets.all(10.0),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(255, 212, 91, 1), // Colors(0xffRRGGBB)
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 25,
                                ),
                              ),
                              const Icon(
                                Icons.library_music_outlined,
                                color: Colors.grey,
                                size: 32,
                              ),
                              Transform.translate(
                                offset: Offset(0, 13),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text(
                                      "Upload",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                    ),
                                    Icon(
                                      Icons.horizontal_rule_outlined,
                                      color: Colors.deepOrange,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ));
  }
}
