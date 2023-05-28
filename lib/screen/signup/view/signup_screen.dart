import 'package:firebase_app/utils/firebase_helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  TextEditingController txtUser = TextEditingController();
  TextEditingController txtPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue.shade50,
          elevation: 0,
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
                      borderSide: BorderSide(color: Colors.blue.shade900),),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.blue.shade900, width: 2),),),
                ),
                SizedBox(
                  height: 10,
                ),
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
                      borderSide: BorderSide(color: Colors.blue.shade900, width: 2),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue.shade900),),
                  onPressed: () {
                    FireBaseHelper.fireHelper.signUp(email: txtUser.text, password: txtPass.text);
                  },
                  child: Text(
                    "Sigh Up",
                    style: GoogleFonts.spaceGrotesk(color: Colors.white, fontSize: 15),
                  ),
                ),
                Spacer(),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
