// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_declarations, prefer_const_constructors

import 'package:contacts_screen/contact_details_args.dart';
import 'package:contacts_screen/screens/contact_entry.dart';

import 'package:contacts_screen/screens/contact_list_without_remove.dart';
import 'package:contacts_screen/screens/tabBar.dart';
import 'package:flutter/material.dart';

class ContactListScreen extends StatefulWidget {
  ContactListScreen({required this.contacts});
  static final routeName = "/ContactListScreen";
  List<ContactDetails> contacts = [];

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
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
      floatingActionButton: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 40,
        child: IconButton(
          onPressed: () {
            Navigator.pop(context, ContactEntry.routeName);
          },
          icon: Icon(
            Icons.person_add,
          ),
          style:
              IconButton.styleFrom(foregroundColor: Colors.black, iconSize: 30),
        ),
      ),
      backgroundColor: Color(0xff161A30),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: widget.contacts.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {},
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.contacts.removeAt(index);
                    });
                  },
                  icon: Icon(Icons.delete)),
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
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ContactsUnremovable(contacts: widget.contacts)));
    });
  }

  void goToTabBar() {
    setState(() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => TabBarContacts(contacts: widget.contacts)));
    });
  }
}
