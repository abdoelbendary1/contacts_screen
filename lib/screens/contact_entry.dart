// ignore_for_file: prefer_const_constructors

import 'package:contacts_screen/contact_details_args.dart';

import 'package:contacts_screen/screens/contact_list_without_remove.dart';
import 'package:contacts_screen/screens/tabBar.dart';
import 'package:flutter/material.dart';

class ContactEntry extends StatefulWidget {
  ContactEntry({super.key});
  static String routeName = "/ContactEntry";

  @override
  State<ContactEntry> createState() => _ContactEntryState();
}

class _ContactEntryState extends State<ContactEntry> {
  final List<ContactDetails> contacts = [];
  GlobalKey<FormState> formKey = GlobalKey();
  late String name;
  late String phone;
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameController.addListener(updateName);
    phoneController.addListener(updatePhone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff161A30),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Contacts",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset("assets/contact.png"),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: formKey,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter a contact name !";
                            }
                            if (value.length > 10) {
                              return "contact name must be less than 10 characters";
                            }
                            if (contacts.asMap().containsValue(value)) {
                              return "this name is already defined";
                            }

                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            prefixIconColor: Colors.white,
                            prefixIcon: Icon(Icons.person),
                            labelText: "Name",
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: phoneController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter a phone number!";
                            }
                            if (value.length > 14) {
                              return "contact name must be less than 10 characters";
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            prefixIconColor: Colors.white,
                            prefixIcon: Icon(Icons.phone),
                            labelText: "Phone",
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                backgroundColor: Color(0xffF0ECE5),
                                foregroundColor: Color(0xff31304D)),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                addContact();
                                goToTabBar();
                              }
                            },
                            child: Text(
                              "Add contact",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ))),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                backgroundColor: Color(0xffF0ECE5),
                                foregroundColor: Color(0xff31304D)),
                            onPressed: () {
                              goToTabBar();
                              
                            },
                            child: Text(
                              " Contacts list",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ))),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateName() {
    setState(() {
      name = nameController.text;
    });
  }

  void updatePhone() {
    setState(() {
      phone = phoneController.text;
    });
  }

  void addContact() {
    setState(() {
    

      ContactDetails newContact = ContactDetails(
          name: nameController.text, phone: phoneController.text);
      contacts.add(newContact);
      nameController.clear();
      phoneController.clear();
      print(contacts);
    });
  }


  void goToContactList() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ContactsUnremovable(contacts: contacts)),
      );
    });
  }

// navigate to tab bar screen
  void goToTabBar() {
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TabBarContacts(contacts: contacts)));
    });
  }
}
