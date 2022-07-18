import 'package:flutter/material.dart';
/// bu page faqat trim funksiyasi uchun
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TestPage(),);
  }
}

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int counter = 0;
  List<int> list = [];
  ScrollController controller = ScrollController();

  void addNewItem() {
    list.add(++counter);
    setState(() {});
    if(list.length >= 3) {
      controller.animateTo(controller.offset + 260, duration: const Duration(milliseconds: 500), curve: Curves.linear);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn Add Button in Bottom"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        controller: controller,
        padding: const EdgeInsets.all(20),
        itemCount: list.length + 1,
        itemBuilder: (context, index) {
          if(index == list.length) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.5)
              ),
              margin: const EdgeInsets.only(bottom: 10),
              child: Container(
                color: Colors.primaries[(list.length - index) % 18],
                height: 250,
                width: double.infinity,
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.add, size: 50,),
                    onPressed: addNewItem,
                  ),
                ),
              ),
            );
          }

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.5)
            ),
            margin: const EdgeInsets.only(bottom: 10),
            child: Container(
              color: Colors.primaries[index % 18],
              height: 250,
              width: double.infinity,
              child: Center(
                child: Text("Card: ${list[index]}", style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),),
              ),
            ),
          );
        },
      ),
    );
  }
}

