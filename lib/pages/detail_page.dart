import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class DetailPage extends StatefulWidget {
  static const id = "/detail_page";

  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Add Recipients",
          style: TextStyle(
              color: Colors.black, fontSize: 22.5, fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.all(10),
          onPressed: () {
            Navigator.of(context).pop("cancel");
          },
          splashRadius: 25,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 25,
          ),
        ),
        leadingWidth: 25,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // #avatar
              const SizedBox(
                height: 20,
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.grey.withOpacity(0.5),
                            Colors.grey.withOpacity(0.3),
                            Colors.grey.withOpacity(0.2),
                            Colors.grey.withOpacity(0.05),
                          ],
                        )),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(116, 118, 135, 0.7),
                        borderRadius: BorderRadius.circular(50)),
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      size: 17.5,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              // #name
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Color.fromRGBO(138, 141, 156, 1), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Color.fromRGBO(138, 141, 156, 1), width: 1),
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      color: Colors.white,
                      child: const Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 17.5,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              // #Relationship
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Color.fromRGBO(138, 141, 156, 1), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Color.fromRGBO(138, 141, 156, 1), width: 1),
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      color: Colors.white,
                      child: const Text(
                        "Relationship",
                        style: TextStyle(
                          fontSize: 17.5,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              // #Phone
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                    child: IntlPhoneField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Color.fromRGBO(138, 141, 156, 1), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Color.fromRGBO(138, 141, 156, 1), width: 1),
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      color: Colors.white,
                      child: const Text(
                        "Phone Number",
                        style: TextStyle(
                          fontSize: 17.5,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),

          Container(
            padding: EdgeInsets.only(
              left: 25,
              right: 25,
              bottom: 70,
            ),
            child: MaterialButton(
              onPressed: () {},
              elevation: 0,
              height: 50,
              minWidth: double.infinity,
              shape: const StadiumBorder(),
              color: const Color.fromRGBO(55, 105, 235, 1),
              child: const Text(
                "Save",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
