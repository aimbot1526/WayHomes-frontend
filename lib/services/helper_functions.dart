import 'dart:io';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String sharedPreferenceUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferenceUserNameKey = "USERNAMEKEY";
  static String sharedPreferenceUserEmailKey = "USEREMAILKEY";
  static String sharedPreferenceUserIdKey = "USERIDKEY";
  static String sharedPreferenceRoleKey = "USERROLEKEY";

  // Save all Data at once
  static Future<void> saveUserInfo(Map<String, dynamic> body) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String email = body['email'];
    String username = body['username'];
    String role;
    if (body['roles'] != null) {
      role = body['roles'][0];
    } else {
      role = body['role'];
    }
    int id = body['id'];
    await preferences.setString(sharedPreferenceUserNameKey, username);
    await preferences.setString(sharedPreferenceUserEmailKey, email);
    await preferences.setInt(sharedPreferenceUserIdKey, id);
    await preferences.setString(sharedPreferenceRoleKey, role);
  }

  /// saving data to sharedpreference
  static Future<bool> saveUserLoggedInSharedPreference(
      bool isUserLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(
        sharedPreferenceUserLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSharedPreference(String userName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserNameKey, userName);
  }

  static Future<bool> saveUserEmailSharedPreference(String userEmail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserEmailKey, userEmail);
  }

  /// fetching data from sharedpreference
  static Future<bool> getUserLoggedInSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(sharedPreferenceUserLoggedInKey);
  }

  static Future<String> getUserNameSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceUserNameKey);
  }

  static Future<String> getUserEmailSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceUserEmailKey);
  }

  static Future<String> getUserRoleSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(sharedPreferenceRoleKey);
  }

  // Save image in local storage
  static Future<List<String>> getImage() async {
    List<String> imgList = ['asklmdklasmdl'];
    // final List<XFile> pickedFile = await ImagePicker().pickMultiImage();
    // if (pickedFile != null) {
    //   for(int i = 0; i < pickedFile.length; i++) {
    //     SharedPreferences prefs = await SharedPreferences.getInstance();
    //     final Directory appDirectory = await getApplicationSupportDirectory();
    //     final String appPath = appDirectory.path;
    //     final filename = pickedFile[i].name;
    //     final filePath = '$appPath/$filename';
    //     await pickedFile[i].saveTo(filePath);
    //     prefs.setString(pickedFile[i].name, filePath);
    //     imgList.add(pickedFile[i].name);
    //   }
    // }
    return imgList;
  }
}
