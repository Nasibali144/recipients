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
    box.put(StorageKeys.users.name, json);
  }

  static List<User> readUsers() {
    var box = Hive.box(dbName);
    List json = box.get(StorageKeys.users.name, defaultValue: []);
    List<User> users = json.map((item) => User.fromJson(item)).toList();
    return users;
  }

  static deleteUsers() {
    var box = Hive.box(dbName);
    box.clear();
  }
}

