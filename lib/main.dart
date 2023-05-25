import 'package:firebase_app/screen/home/view/home_screen.dart';
import 'package:firebase_app/screen/signin/view/signin_screen.dart';
import 'package:firebase_app/screen/signup/view/signup_screen.dart';
import 'package:firebase_app/screen/splash/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: '/', page: () => SplashScreen()),
          GetPage(name: '/signin', page: () => SigninScreen()),
          GetPage(name: '/signup', page: () => SignupScreen()),
          GetPage(name: '/home', page: () => HomeScreen()),
        ],
      ),
    ),
  );
}
