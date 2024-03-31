import 'package:code0/pages/home/cases/custom_stepper.dart';
import 'package:code0/utils/top_button.dart';
import 'package:flutter/material.dart';

class CaseStatus extends StatelessWidget {
  const CaseStatus({super.key});

  static List<CustomStep> steps = [
    CustomStep(DateTime(2021, 8, 9, 9, 30).millisecondsSinceEpoch, "Applied",
        "Your case has been filed successfully"),
    CustomStep(DateTime(2021, 8, 9, 9, 35).millisecondsSinceEpoch, "Accepted",
        "Your case has been accepted at this Police station"),
    CustomStep(DateTime(2021, 8, 9, 9, 55).millisecondsSinceEpoch, "Verified",
        "Your case details is Verified Successfully and Fir No: is generated"),
    const CustomStep(0, "Action", "Action is taken Successfully for your Case"),
    const CustomStep(0, "Closed", "Case with Fir No: Closed Sucessfully"),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEFF2F9),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const TopButton(text: "Case Status"),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Harrassment Case",
                style: TextStyle(
                  letterSpacing: 0.6,
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomStepper(steps: steps),
            ],
          ),
        ),
      ),
    );
  }
}
