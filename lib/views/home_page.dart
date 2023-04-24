import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joox_clone_app/data/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color? bgColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: bgColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "Discover",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // height: 5,
                  fontSize: 28,
                ),
              ),
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: dataforalbumcard.length,
                  itemBuilder: (context, index) {
                    final item = dataforalbumcard[index];
                    return buildcard(index, item);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 38,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  iconwithtext(
                      Colors.green.shade300, Icons.music_note, "Playlists"),
                  iconwithtext(Colors.purple.shade300, Icons.mic, "Karaoke"),
                  iconwithtext(Colors.red.shade300,
                      Icons.multitrack_audio_outlined, "Live"),
                  iconwithtext(Colors.green.shade300, Icons.videocam, "Buzz"),
                  iconwithtext(Colors.orange.shade200,
                      Icons.radio_button_checked, "Radio"),
                ],
              ),
              coverpic(),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  maintitle("Thailand Top Charts [31.0...  "),
                  iconwithbg()
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return topchartcard();
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  maintitle("แนะนำโดย [ แปะหัวใจ (14... "),
                  const Icon(
                    Icons.refresh,
                    size: 22,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(4, 3, 6, 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white54)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(Icons.play_arrow,
                              size: 12, color: Colors.white54),
                          Text(
                            'Play all',
                            style: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                child: SizedBox(
                  height: 200,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: dataforsuggest.length,
                    itemBuilder: (context, index) {
                      final item = dataforsuggest[index];
                      return suggestcard(index, item);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 20,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  maintitle("Daily Playlist "),
                  iconwithbg(),
                  Expanded(child: SizedBox()),
                  Icon(Icons.do_not_touch)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: datafordaily.length,
                  itemBuilder: (context, index) {
                    final item = datafordaily[index];
                    return buildcard(index, item);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget topchartcard() {
    return Row(
      children: [
        Container(
          width: 300,
          color: const Color.fromRGBO(73, 73, 133, 1),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: const AssetImage('assets/pic/pai.jpg'),
                              colorFilter: ColorFilter.mode(
                                Colors.white.withOpacity(0.8),
                                BlendMode.modulate,
                              ))),
                    ),
                    Container(
                      width: 100,
                      height: 20,
                      color: Colors.yellow,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.crown,
                            size: 12,
                            color: Colors.brown,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Vote Now",
                            style: TextStyle(
                                color: Colors.brown,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Daily Popularity",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Text(
                      "Ranking",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: const [
                        Text(
                          "1 ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          "PaiPai ป๊ายปาย โอริโอ",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                              color: Colors.white54),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: const [
                        Text(
                          "2 ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          "Sunnee",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                              color: Colors.white54),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget maintitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    );
  }

  Stack iconwithbg() {
    return Stack(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: const Center(
            child: Icon(
              size: 10,
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget iconwithtext(Color bgcolor, IconData icon, String text) {
    return SizedBox(
      width: 78,
      height: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: bgcolor,
                ),
                child: Center(
                  child: Icon(
                    size: 27,
                    icon,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }

  Widget coverpic() {
    return Stack(
      children: [
        Image.asset(
          "assets/pic/covernew.jpg",
          fit: BoxFit.fitWidth,
          height: 70,
        ),
        Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 75,
                        height: 17,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white60,
                        ),
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 7,
                            ),
                            Icon(
                              Icons.headphones,
                              size: 12,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "ฟังเพลงเลย",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildcard(int index, final item) {
    Color? textColor = Colors.white60;
    return SizedBox(
      height: 150,
      width: 140,
      child: Stack(
        children: [
          Image.asset(
            item['image'],
            height: 150,
            width: 140,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              const Expanded(
                child: SizedBox(),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        item['description'],
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Column(
                    children: const [
                      SizedBox(
                        height: 7,
                      ),
                      Icon(
                        Icons.play_circle,
                        size: 30,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget suggestcard(int index, Map<String, dynamic> item) {
    return SizedBox(
      // height: 120,
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              suggestitem('image1', 'title1', 'artist1', item),
              SizedBox(
                height: 10,
              ),
              suggestitem('image2', 'title2', 'artist2', item),
              SizedBox(
                height: 10,
              ),
              suggestitem('image3', 'title3', 'artist3', item),
            ],
          ),
        ],
      ),
    );
  }

  Widget suggestitem(
      String image, String title, String artist, Map<String, dynamic> item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          item[image],
          height: 55,
          width: 55,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(item[title]), Text(item[artist])],
        ),
      ],
    );
  }
}
