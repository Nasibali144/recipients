import 'dart:convert';

import 'package:recipients/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum StorageKey {
  users
}

class PrefService {

  static Future<void> setUsers(List<User> users) async {
    var pref = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> json = users.map((user) => user.toJson()).toList();
    String data = jsonEncode(json);
    pref.setString(StorageKey.users.name, data);
  }

  static Future<List<User>> readUsers() async {
    var pref = await SharedPreferences.getInstance();
    String data = pref.getString((StorageKey.users.name)) ?? '[]';
    List json = jsonDecode(data);
    List<User> users = json.map((item) => User.fromJson(item)).toList();
    // List<User> users = json.map(User.fromJson).toList();
    return users;
  }

  static Future<void> deleteAllUsers() async {
    var pref = await SharedPreferences.getInstance();
    pref.clear();
  }

}