// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_declarations, prefer_const_constructors

import 'package:contacts_screen/contact_details_args.dart';

import 'package:contacts_screen/screens/user_data.dart';
import 'package:flutter/material.dart';

class ContactsUnremovable extends StatefulWidget {
  ContactsUnremovable({required this.contacts});
  static final routeName = "/ContactsUnremovable";
  List<ContactDetails> contacts = [];

  @override
  State<ContactsUnremovable> createState() => _ContactsUnremovableState();
}

class _ContactsUnremovableState extends State<ContactsUnremovable> {
  // final List<String> names = [];
  // final List<String> phones = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var data = ModalRoute.of(context)!.settings.arguments as ContactDetails;

    return Scaffold(
      backgroundColor: Color(0xff161A30),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: widget.contacts.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserDataScreen(
                            contacts: widget.contacts, index: index)));
              },
              child: ListTile(
                iconColor: Colors.white,
                leading: CircleAvatar(
                    foregroundImage: AssetImage("assets/student.png"),
                    backgroundColor: Color(0xffF0ECE5),
                    radius: 25),
                title: Text(
                  widget.contacts[index].name,
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  widget.contacts[index].phone,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 5,
              thickness: 2,
            );
          },
        ),
      ),
    );
  }

  void goToContactList() {
    setState(() {
      Navigator.pushNamed(
        context,
        ContactsUnremovable.routeName,
      );
    });
  }
}
