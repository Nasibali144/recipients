import 'package:flutter/material.dart';
/// bu page faqat trim funksiyasi uchun
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TestPage(),);
  }
}

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  TextEditingController controller = TextEditingController();

  void onPressed() {
    String textWithoutTrim = controller.text;
    String textWithTrim = controller.text.trim();
    print("textWithoutTrim: $textWithoutTrim");
    print("textWithTrim: $textWithTrim");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter data",
              ),
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: onPressed,
              child: Text("Press Me"),
            ),
          ],
        ),
      ),
    );
  }
}

