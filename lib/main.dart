import 'package:flutter/material.dart';
import 'package:google_search_app/responsive_layout_screen/mobile_screen_layout.dart';
import 'package:google_search_app/responsive_layout_screen/responsive_layout_screen.dart';
import 'package:google_search_app/responsive_layout_screen/web_screen_layout.dart';
import 'package:google_search_app/screens/search_screen.dart';
import 'package:google_search_app/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: backgroundColor,
        )
      ),
      home: const SearchScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayoutScreen(
      mobileScreenLayout: MobileScreenLayout(),
      webScreenLayout: WebScreenLayout(),
    );
  }
}
