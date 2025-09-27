import 'package:flutter/material.dart';
import 'package:google_clone/responsive/colors.dart';
import 'package:google_clone/responsive/mobile_screen_layout.dart';
import 'package:google_clone/responsive/responsive_layout_screen.dart';
import 'package:google_clone/responsive/web_screen_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,

      ),
      debugShowCheckedModeBanner: false,
      home: const ResponsiveLayoutScreen(mobileScreenLayout: MobileScreenLayout(), webScreenLayout: WebScreenLayout()),
    );
  }
}
