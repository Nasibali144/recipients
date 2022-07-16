import 'package:flutter/material.dart';
import 'package:recipients/pages/detail_page.dart';
import 'package:recipients/services/hive_service.dart';

import 'pages/home_page.dart';

void main() async {

  // WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // await Hive.openBox(HiveService.dbName);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Recipients",
      home: const HomePage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        DetailPage.id: (context) => const DetailPage(),
      },
    );
  }
}
