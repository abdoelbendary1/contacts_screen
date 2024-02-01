import 'package:contacts_screen/screens/contact_entry.dart';
import 'package:contacts_screen/screens/contact_list.dart';
import 'package:contacts_screen/screens/contact_list_without_remove.dart';
import 'package:contacts_screen/screens/tabBar.dart';
import 'package:contacts_screen/screens/user_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Lexend",
      ),
      initialRoute: ContactEntry.routeName,
      routes: {
        ContactEntry.routeName: (context) => ContactEntry(),
        ContactListScreen.routeName: (context) =>
            ContactListScreen(contacts: []),
        ContactsUnremovable.routeName: (context) =>
            ContactsUnremovable(contacts: []),
        TabBarContacts.routeName: (context) => TabBarContacts(contacts: []),
        UserDataScreen.routeName: (context) =>
            UserDataScreen(contacts: [], index: 0),
      },
    );
  }
}
