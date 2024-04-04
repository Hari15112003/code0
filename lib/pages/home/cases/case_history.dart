import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code0/pages/home/cases/case_status.dart';
import 'package:code0/pages/home/cases/custom_stepper.dart';
import 'package:code0/utils/top_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CaseHistory extends StatelessWidget {
  const CaseHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEFF2F9),
        body: Column(
          children: [
            const TopButton(
              text: "Compliant History",
            ),
            Expanded(
              child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('cases')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('3.4.2024')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;

                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          String key = data.keys.elementAt(index);

                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    List<CustomStep> steps = [
                                      CustomStep(
                                          DateTime(2024, 8, 9, 9, 30)
                                              .millisecondsSinceEpoch,
                                          "Applied",
                                          "Your case has  been filed successfully"),
                                      const CustomStep(0, "Accepted",
                                          "Your case has not been accepted at this Police station"),
                                      const CustomStep(0, "Verified",
                                          "Your case details is not Verified Successfully and Fir No: is generated"),
                                      const CustomStep(0, "Action",
                                          "Action is not take for your Case"),
                                      const CustomStep(
                                          0, "Closed", "Fir No not generated"),
                                    ];
                                    if (data[key]['status'] == "Applied") {
                                      steps = <CustomStep>[
                                        CustomStep(
                                            DateTime(2024, 8, 9, 9, 30)
                                                .millisecondsSinceEpoch,
                                            "Applied",
                                            "Your case has  been filed successfully"),
                                        const CustomStep(0, "Accepted",
                                            "Your case has not been accepted at this Police station"),
                                        const CustomStep(0, "Verified",
                                            "Your case details is not Verified Successfully and Fir No: is generated"),
                                        const CustomStep(0, "Action",
                                            "Action is not take for your Case"),
                                        const CustomStep(0, "Closed",
                                            "Fir No not generated"),
                                      ];
                                    } else if (data[key]['status'] ==
                                        "Accepted") {
                                      steps = <CustomStep>[
                                        CustomStep(
                                            DateTime(2024, 8, 9, 9, 30)
                                                .millisecondsSinceEpoch,
                                            "Applied",
                                            "Your case has  been filed successfully"),
                                        CustomStep(
                                            DateTime(2024, 8, 9, 9, 30).day,
                                            "Accepted",
                                            "Your case has  been accepted at this Police station"),
                                        const CustomStep(0, "Verified",
                                            "Your case details is not Verified Successfully and Fir No: is generated"),
                                        const CustomStep(0, "Action",
                                            "Action is not taken  for your Case"),
                                        const CustomStep(0, "Closed",
                                            "Fir No not generated"),
                                      ];
                                    } else if (data[key]['status'] ==
                                        "Verified") {
                                      steps = <CustomStep>[
                                        CustomStep(
                                            DateTime(2024, 8, 9, 9, 30)
                                                .millisecondsSinceEpoch,
                                            "Applied",
                                            "Your case has  been filed successfully"),
                                        const CustomStep(1, "Accepted",
                                            "Your case has  been accepted at this Police station"),
                                        const CustomStep(1, "Verified",
                                            "Your case details is  Verified Successfully and Fir No: is generated"),
                                        const CustomStep(0, "Action",
                                            "Action is not taken  for your Case"),
                                        const CustomStep(0, "Closed",
                                            "Fir No is not closed"),
                                      ];
                                    } else if (data[key]['status'] ==
                                        "Action") {
                                      steps = <CustomStep>[
                                        CustomStep(
                                            DateTime(2024, 8, 9, 9, 30)
                                                .millisecondsSinceEpoch,
                                            "Applied",
                                            "Your case has  been filed successfully"),
                                        const CustomStep(1, "Accepted",
                                            "Your case has  been accepted at this Police station"),
                                        const CustomStep(1, "Verified",
                                            "Your case details is not Verified Successfully and Fir No: is generated"),
                                        const CustomStep(1, "Action",
                                            "Action is taken Successfully for your Case"),
                                        const CustomStep(1, "Closed",
                                            "Fir No is not closed"),
                                      ];
                                    } else {
                                      steps = <CustomStep>[
                                        CustomStep(
                                            DateTime(2024, 8, 9, 9, 30)
                                                .millisecondsSinceEpoch,
                                            "Applied",
                                            "Your case has  been filed successfully"),
                                        const CustomStep(0, "Accepted",
                                            "Your case has  been accepted at this Police station"),
                                        const CustomStep(0, "Verified",
                                            "Your case details is  Verified Successfully and Fir No: is generated"),
                                        const CustomStep(0, "Action",
                                            "Action is taken Successfully for your Case"),
                                        const CustomStep(0, "Closed",
                                            "Case with Fir No: Closed Sucessfully"),
                                      ];
                                    }
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CaseStatus(
                                          data: Map<String, dynamic>.from(
                                              data[key]),
                                          steps: steps,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 150,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const VerticalDivider(
                                          indent: 2,
                                          endIndent: 2,
                                          thickness: 12,
                                          color: Colors.amber,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 13,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                bottom: 4,
                                                // Space between underline and text
                                              ),
                                              decoration: const BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                color: Colors.amber,
                                                width: 3.0,
                                              ))),
                                              child: Text(
                                                data[key]['incident']
                                                    .toString(),
                                                style: const TextStyle(
                                                  letterSpacing: 0.6,
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            richTextHelper(
                                                title: "Posted Date",
                                                value: data[key]['datePosted']),
                                            richTextHelper(
                                                title: "Posted Time",
                                                value: data[key]['timePosted']),
                                            richTextHelper(
                                              title: "Status",
                                              value: data[key]['status'],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  } else {
                    return const Center(
                      child: Text(
                        'No History Found',
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget richTextHelper({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: "$title : ",
            style: const TextStyle(color: Colors.blueGrey, fontSize: 15),
          ),
          TextSpan(
              text: value,
              style: const TextStyle(
                color: Colors.black,
              ))
        ]),
      ),
    );
  }
}
