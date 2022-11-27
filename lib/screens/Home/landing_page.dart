import 'package:dumper/Screens/Home/components/body.dart';
import 'package:dumper/components/loading_circle.dart';
import 'package:dumper/model/property_model.dart';
import 'package:dumper/services/helper_functions.dart';
import 'package:dumper/services/property_service.dart';
import 'package:dumper/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool _loading = true;
  User user = FirebaseAuth.instance.currentUser;
  List<Content> propertyList = [];
  @override
  void initState() {
    if (user != null) {
      HelperFunctions.saveUserEmailSharedPreference(user.email);
      HelperFunctions.saveUserNameSharedPreference(user.displayName);
      UserService()
          .signUp(user.displayName, user.email, "no-password", "google");
    }
    PropertyService().getProperties().then((value) {
      propertyList = value.content;
    });
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? const LoadingCircle(size: 800)
          : Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Body(propertyList: propertyList),
              ],
            ),
    );
  }
}
