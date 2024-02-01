// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:contacts_screen/contact_details_args.dart';
import 'package:contacts_screen/screens/contact_list.dart';
import 'package:contacts_screen/screens/contact_list_without_remove.dart';
import 'package:flutter/material.dart';

class TabBarContacts extends StatefulWidget {
  TabBarContacts({required this.contacts});
  static String routeName = "/TabBarContacts";
  List<ContactDetails> contacts = [];

  @override
  State<TabBarContacts> createState() => _TabBarContactsState();
}

class _TabBarContactsState extends State<TabBarContacts> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: TextStyle(fontSize: 12),
              labelStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
              tabs: [
                Tab(
                  child: Text("Edit "),
                  icon: Icon(
                    Icons.person,
                    size: 30,
                  ),
                ),
                Tab(
                  child: Text("All "),
                  icon: Icon(
                    Icons.contacts,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            ContactListScreen(
              contacts: widget.contacts,
            ),
            ContactsUnremovable(
              contacts: widget.contacts,
            ),
          ]),
        ));
  }
}
