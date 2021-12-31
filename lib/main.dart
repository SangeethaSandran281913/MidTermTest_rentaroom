import 'package:rentaroom/splash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.pacificoTextTheme(),
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey,
          backgroundColor: Colors.blueGrey,
        ),
      ),
      darkTheme: ThemeData.dark(),
      title: 'Rent A Room',
      home: const Scaffold(
        
        body: Splash(),
      ),
    );
  }
}
