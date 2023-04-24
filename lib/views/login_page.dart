import 'package:joox_clone_app/views/home_page.dart';
import 'package:joox_clone_app/views/start_page.dart';

import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/loginvid.mp4')
      ..initialize().then((_) {
        _controller.setVolume(0.0);
        _controller.play();
        _controller.setLooping(true);

        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              //fittedbox ทำให้ vdo ขนาดเข้ากับหน้าจอ รูปแบบ fit.cover
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          loginWidget()
        ],
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget loginWidget() {
    Color fbColor = const Color(0xff1778F2);
    Color textColor = Colors.white;
    String logolink = 'https://cdn.i-joox.com/static/di/joox-logo-white.png';
    // String fblink =
    //     "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/640px-Facebook_Logo_%282019%29.png";
    return Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const SizedBox(
              height: 75,
            ),

            Center(
                child: Image.network(
              logolink,
              height: 45,
            )),
            const Expanded(child: SizedBox()),

            //push HomePage
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const StartPage()));
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: fbColor,
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    ClipOval(
                        child: Image.asset(
                      'assets/pic/fblogof.jpg',
                      width: 20,
                    )),
                    const SizedBox(
                      width: 55,
                    ),
                    Text(
                      'Facebook ',
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '(Recent login)',
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 20, 70, 20),
              child: Row(
                children: [
                  iconwithtext(
                      textColor,
                      "https://cdn-icons-png.flaticon.com/512/10273/10273094.png",
                      "Mobile"),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  iconwithtext(
                      textColor,
                      "https://cdn.onlinewebfonts.com/svg/img_503976.png",
                      "Email"),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/3675/3675672.png',
                  width: 12,
                  color: Colors.white,
                ),
                Text(
                  " I agree to the ",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Terms of Service,",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 30,
                ),
                Text(
                  "JOOX User Terms",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Text(
                  " and ",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Privacy Policy",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ));
  }

  Widget iconwithtext(Color textColor, String iconimagelink, String text) {
    return Column(
      children: [
        Image.network(iconimagelink,
            width: 40,
            color: Colors.white,
            opacity: const AlwaysStoppedAnimation(.7)),
        const SizedBox(
          height: 3,
        ),
        Text(
          text,
          style: TextStyle(
            color: textColor.withOpacity(0.7),
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
