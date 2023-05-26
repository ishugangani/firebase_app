import 'package:firebase_app/utils/firebase_helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController txtUser = TextEditingController();
  TextEditingController txtPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.lightBlue.shade50,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.lightBlue.shade50,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                TextField(
                  controller: txtUser,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    label: Text("Email"),
                    labelStyle: TextStyle(color: Colors.blue.shade900),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue.shade900),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue.shade900, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: txtPass,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    label: Text("Password"),
                    labelStyle: TextStyle(color: Colors.blue.shade900),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue.shade900),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue.shade900, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    FireBaseHelper.fireHelper
                        .signIn(email: txtUser.text, password: txtPass.text);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue.shade900),
                  ),
                  child: Text("Sign In"),
                ),
                Spacer(),
                Spacer(),
                Center(
                  child: Text("Don't have an account? Sign up"),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        String? msg= await FireBaseHelper.fireHelper.googleSignIn();
                        if (msg=="success")
                          {
                            Get.toNamed('/home');
                          }
                      },
                      child: Text("GOOGLE",style: TextStyle(color: Colors.lightBlue.shade200),),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/signup');
                      },
                      child: Text("EMAIL",style: TextStyle(color: Colors.lightBlue.shade200),),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
