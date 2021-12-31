import 'dart:async';
import 'dart:convert';
import 'package:rentaroom/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double screenHeight = 0.0, screenWidth = 0.0;
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Get.off(() => const MainPage())
        );
    
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/sp.jpg'),
                    scale: 1,
                    fit: BoxFit.cover))),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
               Divider(
                          height: 5,
                        ),
              CircularProgressIndicator(),
              Text(
                " Version 1.0",
                style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    ),
              )
            ],
          ),
        )
      ],
    );
  }
}
