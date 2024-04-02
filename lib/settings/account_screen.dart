// ignore_for_file: unused_field, non_constant_identifier_names, unused_import, unused_local_variable

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code0/authentication/signin.dart';
import 'package:code0/settings/setting_item.dart';
import 'package:code0/utils/top_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({
    super.key,
  });

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            DocumentSnapshot data = snapshot.data!;
            String name = data.get("name");
            String password = data.get("password");
            String address = data.get("address");
            String gender = data.get("gender");
            String emailId = data.get("email");
            String dob = data.get("dob");
            String profileUrl = data.get("file");
            String nationality = data.get("nationality");
            String occupation = data.get("occupation");
            if (snapshot.hasData) {
              return SafeArea(
                child: Scaffold(
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text(
                              "Profile",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 55, 125, 210)
                                  .withOpacity(.7),
                            ),
                            width: wid,
                            padding: EdgeInsets.only(
                              top: hei * 0.03,
                              bottom: hei * 0.03,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: hei * 0.14,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                      profileUrl,
                                    ),
                                  ),
                                ),
                                Text(
                                  name,
                                  style: TextStyle(
                                      fontSize: hei * 0.03,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  // color: Colors.amber,
                                  width: wid * 0.32,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        dob,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "-",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "20 Yrs",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 100,
                                  padding: EdgeInsets.symmetric(
                                      vertical: hei * 0.01,
                                      horizontal: wid * 0.009),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.white),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: hei * 0.03,
                                      ),
                                      Text(
                                        "Edit",
                                        style: TextStyle(
                                            fontSize: hei * 0.02,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SettingItem(
                            title: name,
                            icon: Icons.person,
                            bgColor: Colors.red.shade100,
                            iconColor: Colors.red,
                          ),
                          SettingItem(
                            title: emailId,
                            icon: Icons.email,
                            bgColor: Colors.purple.shade100,
                            iconColor: Colors.purple,
                          ),
                          //             const SizedBox(height: 20),
                          SettingItem(
                            title: password,
                            icon: Icons.password_outlined,
                            bgColor: Colors.green.shade100,
                            iconColor: Colors.green,
                          ),
                          SettingItem(
                            title: gender,
                            icon: Icons.male,
                            bgColor: Colors.orange.shade100,
                            iconColor: Colors.orange,
                          ),
                          //             const SizedBox(height: 20),
                          SettingItem(
                            title: address.length >= 30
                                ? "${address.substring(1, 28)}.."
                                : address,
                            icon: Icons.home,
                            bgColor: Colors.blue.shade100,
                            iconColor: Colors.blue,
                          ),
                          SettingItem(
                            title: password,
                            icon: Icons.password,
                            bgColor: Colors.pink.shade100,
                            iconColor: Colors.pink,
                          ),

                          SettingItem(
                            title: nationality,
                            icon: Icons.check_circle_outline,
                            bgColor: Colors.indigo.shade100,
                            iconColor: Colors.indigo,
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: OutlinedButton(
                                child: const Text("Sign out"),
                                onPressed: () {
                                  FirebaseAuth.instance.signOut().whenComplete(
                                      () => Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const SignIn(),
                                          ),
                                          (route) => false));
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          } else {
            return const SizedBox();
          }
        });
  }
}
