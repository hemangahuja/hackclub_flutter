import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_/app_bar.dart';
import 'package:test_/track_card.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: Colors.white, // status bar color
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> names = ['Hands To Myself', 'At My Worst', 'Sample', 'Music', 'Name'];
    return MaterialApp(
        title: 'Main',
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: const MusicAppBar(
                appBarIcon: Icons.arrow_upward_rounded,
                appBarTitle: 'Upload',
                userImageURL:
                'https://img.etimg.com/thumb/msid-81525531,width-650,imgsize-622277,,resizemode-4,quality-100/music_thinkstockphotos.jpg'),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          const SizedBox(height: 40,),
                          const Text(
                            'In Progress',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w900),
                          ),
                          for ( int i = 0; i < 5; i++ )
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical : 8.0),
                              child: Column(
                                children: [
                                  TrackCard(data: TrackInfo(
                                    name: names[i],
                                    imageURL: 'https://img.etimg.com/thumb/msid-81525531,width-650,imgsize-622277,,resizemode-4,quality-100/music_thinkstockphotos.jpg',
                                    releaseDate: DateTime(2002),
                                    length: const Duration(seconds: 10),
                                    price: 5,
                                  ) ),
                                  Divider(thickness: 2,)
                                ],
                              ),
                            )
                        ]),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Color(0xffF7F2EE),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'My Tracks (35)',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: const Text(
                                'See All',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: const Color(0xffF7F2EE),
                      child: Container(
                        height: 90,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30)),
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
                              offset: Offset(0,13),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: const [
                                  Text(
                                    "Upload",
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 15),
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
            )));
  }
}
