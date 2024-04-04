// ignore_for_file: avoid_print

import 'package:code0/api/act_api.dart';
import 'package:code0/form_generator/form_pdf.dart';
import 'package:code0/pages/home/cases/custom_stepper.dart';
import 'package:code0/utils/top_button.dart';
import 'package:flutter/material.dart';

class CaseStatus extends StatelessWidget {
  final List<CustomStep> steps;
  final Map data;
  const CaseStatus({super.key, required this.steps, required this.data});

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
              CustomStepper(
                steps: steps,
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () async {
                  var response = await fetchPrediction(data['incident']);
                  String predictedSection = response['predicted_section'];
                  String des = response['description'];
                  print(predictedSection);
                  print(data);
                  print(des);
                  generatePdf(
                    act: des,
                    section: predictedSection,
                    dateFrom: "03/04/2023",
                    dateTo: "03/04/2023",
                    place: data['city'],
                    datePosted: data['datePosted'],
                    timeFrom: data['timeFrom'],
                    timePosted: data['timePosted'],
                    timeTo: data['timeTo'],
                    description: data['description'],
                    fatherName: 'M Ravi',
                  );
                },
                child: const Text("Generate report"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
