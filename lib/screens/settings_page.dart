// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:code0/utils/top_button.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class SettingsPage extends StatefulWidget {
//   const SettingsPage({super.key});

//   @override
//   State<SettingsPage> createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
//   @override
//   Widget build(BuildContext context) {
//     var hei = MediaQuery.of(context).size.height;
//     var wid = MediaQuery.of(context).size.width;

//     return Scaffold(
//         body: SingleChildScrollView(
//       child: StreamBuilder(
//           stream: FirebaseFirestore.instance
//               .collection("users")
//               .doc(FirebaseAuth.instance.currentUser!.uid)
//               .snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               DocumentSnapshot data = snapshot.data!;
//               String name = data.get("name");
//               String phoneNumber = data.get("phoneNumber");
//               String address = data.get("address");
//               String gender = data.get("gender");
//               String emailId = data.get("email");
//               String password = data.get("password");
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const TopButton(
//                     text: "Settings",
//                   ),
//                   Container(
//                     width: wid,
//                     // alignment: Alignment.center,
//                     color: Color.fromARGB(255, 86, 148, 160),
//                     padding: EdgeInsets.only(
//                       top: hei * 0.07,
//                       bottom: hei * 0.03,
//                     ),
//                     child: Column(
//                       // mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                             height: hei * 0.15,
//                             child: Image.asset("images/profile.png")),
//                         Text(
//                           "John Doe",
//                           style: TextStyle(
//                               fontSize: hei * 0.03,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white),
//                         ),
//                         Container(
//                           // color: Colors.amber,
//                           width: wid * 0.32,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "25/3/2004",
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 "-",
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 "20 Yrs",
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               )
//                             ],
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.symmetric(
//                               vertical: hei * 0.01, horizontal: wid * 0.03),
//                           margin: EdgeInsets.only(
//                               top: hei * 0.02,
//                               left: wid * 0.4,
//                               right: wid * 0.4),
//                           // color: Colors.amber,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               border: Border.all(color: Colors.white)),
//                           // width: wid * 0.16,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Icon(
//                                 Icons.edit,
//                                 color: Colors.white,
//                                 size: hei * 0.03,
//                               ),
//                               Text(
//                                 "Edit",
//                                 style: TextStyle(
//                                     fontSize: hei * 0.02,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 147, 198, 239),
//                         borderRadius: BorderRadius.circular(20)),
//                     margin: EdgeInsets.only(
//                       left: wid * 0.03,
//                       right: wid * 0.03,
//                     ),
//                     padding: EdgeInsets.only(
//                         bottom: hei * 0.03,
//                         left: wid * 0.01,
//                         right: wid * 0.01,
//                         top: hei * 0.02),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(
//                               left: wid * 0.03, top: hei * 0.02),
//                           height: hei * 0.12,
//                           child: Image.asset(
//                             'assets/images/app_logo.jpg',
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(
//                               left: wid * 0.27, top: hei * 0.01),
//                           child: Column(
//                             // mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               Text(
//                                 "John Doe",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: hei * 0.04,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 "Indian",
//                                 style: TextStyle(
//                                     fontSize: hei * 0.02,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     "Age : ",
//                                     style: TextStyle(
//                                         fontSize: hei * 0.02,
//                                         color: Colors.white60,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Text("20",
//                                       style: TextStyle(
//                                           fontSize: hei * 0.02,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white))
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   //component 2
//                   Container(
//                     margin: EdgeInsets.only(left: wid * 0.05, top: hei * 0.03),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Gender",
//                                 style: TextStyle(
//                                     fontSize: hei * 0.02,
//                                     color: const Color.fromARGB(
//                                         255, 140, 221, 175),
//                                     fontWeight: FontWeight.bold)),
//                             Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color:
//                                       const Color.fromARGB(255, 140, 221, 175)),
//                               padding: EdgeInsets.symmetric(
//                                   vertical: hei * 0.01, horizontal: wid * 0.05),
//                               margin: EdgeInsets.only(
//                                   left: wid * 0.03, right: wid * 0.06),
//                               child: const Text(
//                                 "Male",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                             Text("Date of birth",
//                                 style: TextStyle(
//                                     fontSize: hei * 0.02,
//                                     color: const Color.fromARGB(
//                                         255, 140, 221, 175),
//                                     fontWeight: FontWeight.bold)),
//                             Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color:
//                                       const Color.fromARGB(255, 140, 221, 175)),
//                               padding: EdgeInsets.symmetric(
//                                   vertical: hei * 0.01, horizontal: wid * 0.03),
//                               margin: EdgeInsets.only(left: wid * 0.03),
//                               child: const Text(
//                                 "25/03/2004",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             )
//                           ],
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(top: hei * 0.02),
//                           child: Text("Aadhar No ",
//                               style: TextStyle(
//                                   fontSize: hei * 0.02,
//                                   color:
//                                       const Color.fromARGB(255, 140, 221, 175),
//                                   fontWeight: FontWeight.bold)),
//                         ),
//                         cards(text: "Aadhar"),
//                         Text("Phone",
//                             style: TextStyle(
//                                 fontSize: hei * 0.02,
//                                 color: const Color.fromARGB(255, 140, 221, 175),
//                                 fontWeight: FontWeight.bold)),
//                         cards(text: "phone"),
//                         Text("Address",
//                             style: TextStyle(
//                                 fontSize: hei * 0.02,
//                                 color: const Color.fromARGB(255, 140, 221, 175),
//                                 fontWeight: FontWeight.bold)),
//                         cards(text: "address"),
//                         Text("Email",
//                             style: TextStyle(
//                                 fontSize: hei * 0.02,
//                                 color: const Color.fromARGB(255, 140, 221, 175),
//                                 fontWeight: FontWeight.bold)),
//                         cards(text: "email")
//                       ],
//                     ),
//                   ),
//                   Center(
//                     child: Container(
//                       margin: EdgeInsets.only(top: hei * 0.01),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.black),
//                       padding: EdgeInsets.symmetric(
//                           vertical: hei * 0.015, horizontal: wid * 0.2),
//                       // margin: EdgeInsets.only(left: wid * 0.03, right: wid * 0.06),
//                       child: const Text(
//                         "EDIT",
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                 ],
//               );
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           }),
//     ));
//   }

//   Widget cards({required String text}) {
//     var hei = MediaQuery.of(context).size.height;
//     var wid = MediaQuery.of(context).size.width;
//     return Container(
//       padding:
//           EdgeInsets.symmetric(horizontal: wid * 0.02, vertical: hei * 0.01),
//       margin: EdgeInsets.symmetric(vertical: hei * 0.015),
//       width: wid * 0.9,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           border: Border.all(color: const Color.fromARGB(255, 140, 221, 175))),
//       child: Text(
//         text,
//         style: TextStyle(fontSize: hei * 0.02),
//       ),
//     );
//   }
// }
