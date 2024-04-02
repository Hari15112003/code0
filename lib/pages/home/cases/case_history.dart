import 'package:code0/pages/home/cases/case_status.dart';
import 'package:code0/utils/top_button.dart';
import 'package:flutter/material.dart';

class CaseHistory extends StatelessWidget {
  const CaseHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEFF2F9),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const TopButton(
                text: "Compliant History",
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CaseStatus(),
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
                    mainAxisAlignment: MainAxisAlignment.start,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            child: const Text(
                              "Harassment Case",
                              style: TextStyle(
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
                              title: "Posted Date", value: "31/03/2024"),
                          richTextHelper(
                              title: "Posted Time", value: "06:35 PM"),
                          richTextHelper(title: "Status", value: "Published"),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
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
