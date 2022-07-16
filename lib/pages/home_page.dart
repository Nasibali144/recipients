import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipients/models/user_model.dart';
import 'package:recipients/pages/detail_page.dart';
import 'package:recipients/services/hive_service.dart';

class HomePage extends StatefulWidget {
  static const id = "/home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  List<User> items = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getAllData();
  }

  void getAllData() async {
    isLoading = true;
    setState(() {});

    items = HiveService.readUsers();

    isLoading = false;
    setState(() {});
  }

  void addNewUser() async {
    String? result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DetailPage()));

    if(result != null && result == "refresh") {
      print(result);
      getAllData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
            "Beneficiary",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.5,
            fontWeight: FontWeight.w500
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: TextField(
                  controller: searchController,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    fillColor: Color.fromRGBO(249, 249, 255, 1),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Color.fromRGBO(154, 159, 187, 1),),
                    prefixIcon: Icon(CupertinoIcons.search, color: Color.fromRGBO(154, 159, 187, 1),)
                  ),
                  cursorColor: const Color.fromRGBO(154, 159, 187, 1),
                ),
              ),
              Row(
                children: const [
                  SizedBox(width: 25,),
                  Text("Recipients", style: TextStyle(
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(138, 141, 156, 1),
                  ),),
                ],
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: 50,
                width: 50,
                color: Colors.amberAccent,
              ),
            ),
            title: Text(
              items[index].name,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              items[index].phone,
              style: const TextStyle(
                color: Color.fromRGBO(138, 141, 156, 1),
                fontSize: 15,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: const Color.fromRGBO(55, 105, 235, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )
              ),
              child: const Text(
                "Send",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewUser,
        backgroundColor: const Color.fromRGBO(55, 105, 235, 1),
        child: const Icon(Icons.add, size: 45,),
      ),
    );
  }
}
