import 'package:clubhouse_ui/screens/home_screen.dart';
import 'package:clubhouse_ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const IconThemeData iconThemeData = IconThemeData(color: kIconColor);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clubhouse UI',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: kBackgroundColor,iconTheme: iconThemeData ),
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        colorScheme: ColorScheme.fromSwatch(accentColor: kAccentColor),
        iconTheme: iconThemeData,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: const HomeScreen(),
    );
  }
}
