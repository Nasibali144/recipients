import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipients/models/user_model.dart';

enum StorageKeys {
  users
}

class HiveService {
  static const String dbName = "AppData";

  static Future<void> setUsers(List<User> users) async {
    var box = Hive.box(dbName);
    List<Map<String, dynamic>> json = users.map((user) => user.toJson()).toList();
    box.put(StorageKeys.users.name, jsonEncode(json));
  }

  static List<User> readUsers() {
    var box = Hive.box(dbName);
    String data = box.get(StorageKeys.users.name, defaultValue: '[]');
    List json = jsonDecode(data);
    List<User> users = json.map((item) => User.fromJson(item)).toList();
    return users;
  }

  static Future<void> deleteAllUsers() async {
    var box = Hive.box(dbName);
    await box.clear();
  }
}

