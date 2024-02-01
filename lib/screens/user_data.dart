import 'package:contacts_screen/contact_details_args.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatelessWidget {
  UserDataScreen({required this.contacts, required this.index});
  static String routeName = "/UserDataScreen";

  List<ContactDetails> contacts = [];
  int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Details"),
      ),
      backgroundColor: const Color(0xff161A30),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 250,
                width: 200,
                child: Image.asset("assets/student.png"),
              ),
              Text(
                contacts[index].name,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Text(
                contacts[index].phone,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
