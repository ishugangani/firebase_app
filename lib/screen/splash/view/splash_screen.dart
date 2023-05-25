import 'dart:async';

import 'package:firebase_app/utils/firebase_helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogin=false;

  @override
  void initState() {
    super.initState();

    isLogin = FireBaseHelper.fireHelper.checkUser();
  }
  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 3), () => Get.offAndToNamed('/signin'));

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset("asset/images/bg.jpg"),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(0.5),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 80,),
                    Text(
                      "tumblr",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lora(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 40,),
                    Text(
                      " Welcome to your corner of \n the internet.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.spaceGrotesk(color: Colors.white,fontSize: 20),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      "You'll never be bored again.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.spaceGrotesk(color: Colors.white,fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
