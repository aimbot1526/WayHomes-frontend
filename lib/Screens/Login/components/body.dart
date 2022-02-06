import 'dart:convert';

import 'package:dumper/Screens/Home/landing_page.dart';
import 'package:dumper/Screens/Signup/signup_screen.dart';
import 'package:dumper/Screens/Welcome/components/Background.dart';
import 'package:dumper/blocs/user_login_bloc.dart';
import 'package:dumper/components/text_field_container.dart';
import 'package:dumper/constants/constants.dart';
import 'package:dumper/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

void displayDialog(context, title, text) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(text),
      ),
    );


class _BodyState extends State<Body> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  bool _isHidden = true;
  bool login = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.04),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextFieldContainer(
                child: TextField(
                  controller: usernameController,
                  cursorColor: kPrimaryColor,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                    hintText: "Username",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextFieldContainer(
                child: TextField(
                  controller: passwordController,
                  obscureText: _isHidden,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: kPrimaryColor,
                    ),
                    hintText: "Password",
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          _isHidden = !_isHidden;
                        });
                      },
                      child: Icon(
                        _isHidden ? Icons.visibility : Icons.visibility_off,
                        color: kPrimaryColor,
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: size.width * 0.6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: ElevatedButton(
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () async {
                    var username = usernameController.text;
                    var password = passwordController.text;
                    Map<String, String> data = {"username": username, "password": password};
                    var body = UserLoginBloc(data);
                    if (body != null) {
                      final SharedPreferences storage =
                          await SharedPreferences.getInstance();
                      storage.setString('email', username);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LandingPage(),
                        ),
                      );
                    } else {
                      displayDialog(context, "An Error Occured",
                          "No account was found matching that username and password");
                    }
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  login
                      ? "Don't have an Account ? "
                      : "Already have and Account ? ",
                  style: const TextStyle(color: kPrimaryColor),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SignUpScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    login ? "Sign Up" : "Sign In",
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
