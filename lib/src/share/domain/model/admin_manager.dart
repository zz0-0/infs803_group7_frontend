import 'package:flutter/foundation.dart';
import 'package:infs803_group7_frontend/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminManager {
  Future<bool> getAdminStatus() async {
    bool? admin;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!kIsWeb) {
      admin = (await storage.read(key: "admin")) as bool?;
    } else {
      admin = prefs.getBool('admin');
    }
    return admin ?? false;
  }

  Future<void> saveAdminStatus(bool isAdmin) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!kIsWeb) {
      await storage.write(key: "admin", value: isAdmin.toString());
    } else {
      await prefs.setBool("admin", isAdmin);
    }
  }
}
