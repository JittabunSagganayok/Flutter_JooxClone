import 'package:flutter/material.dart';

import 'package:joox_clone_app/views/home_page.dart';
import 'package:joox_clone_app/views/login_page.dart';
import 'package:joox_clone_app/views/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
        // bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //   backgroundColor: Colors.white10,
        //   type: BottomNavigationBarType.fixed,
        //   selectedLabelStyle: TextStyle(
        //     fontSize: 12,
        //   ),
        //   unselectedLabelStyle: TextStyle(
        //     fontSize: 12,
        //   ),
        //   selectedItemColor: Colors.white,
        //   unselectedItemColor: Colors.white38,
        // ),
      ),
      home: LoginPage(),
    );
  }
}
