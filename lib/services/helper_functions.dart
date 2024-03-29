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

  static Future<int> getUserIdSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt(sharedPreferenceUserIdKey);
  }

  // Save image in local storage
  static Future<List<String>> getImage() async {
    List<String> imgList = [];
    final List<XFile> pickedFile =
        await ImagePicker().pickMultiImage(imageQuality: 50);
    if (pickedFile != null && pickedFile.isNotEmpty) {
      for (int i = 0; i < pickedFile.length; i++) {
        final Directory appDirectory = await getApplicationSupportDirectory();
        final String appPath = appDirectory.path;
        final filename = pickedFile[i].name;
        final filePath = '$appPath/$filename';
        await pickedFile[i].saveTo(filePath);
        imgList.add(filePath);
      }
      return imgList;
    }
    return <String>[];
  }
}
