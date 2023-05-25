import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
            Center(
              child: Text(
                "WELCOME!!!\n\n\n\nTumblr welcomes you in the community.",
                textAlign: TextAlign.center,
                style: GoogleFonts.lora(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
