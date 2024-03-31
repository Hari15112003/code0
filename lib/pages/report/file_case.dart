import 'package:code0/pages/report/step2_casefile.dart';
import 'package:code0/utils/top_button.dart';
import 'package:flutter/material.dart';

import 'step1_casefile.dart';

class FileCase extends StatefulWidget {
  const FileCase({super.key});

  @override
  State<FileCase> createState() => _FileCaseState();
}

class _FileCaseState extends State<FileCase> {
  String countryValue = "";

  String? stateValue;

  String? cityValue;

  final List<String> incident = <String>[
    "murder",
    "chain_snatching",
    "smuggling",
    "kidnap",
    "robbery",
    "Cybercrime",
    "sexual_assault",
    "money_laundering",
    "wildlife_trade"
  ];

  final List<String> gender = <String>[
    'Male',
    'Female',
    'Others',
  ];
  late String dropdownValue;
  @override
  void initState() {
    dropdownValue = gender.first;
    super.initState();
  }

  TextEditingController weaponController = TextEditingController();
  TextEditingController dressCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            TopButton(
              text: "File Case",
            ),
            StepperExample(),
          ],
        ),
      )),
    );
  }
}

class StepperExample extends StatefulWidget {
  const StepperExample({super.key});

  @override
  State<StepperExample> createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      type: StepperType.vertical,
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index <= 0) {
          setState(() {
            _index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: const <Step>[
        Step(
          title: Text('Step 1: Important Details'),
          content: StepOne(),
        ),
        Step(
          title: Text('Step 2: General Details'),
          content: StepTwo(),
        ),
      ],
    );
  }
}
