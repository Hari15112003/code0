import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code0/pages/case_filling/step2_casefile.dart';
import 'package:code0/utils/snackbar.dart';
import 'package:code0/utils/text_form.dart';
import 'package:code0/utils/top_button.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final String? restorationId;
  const StepperExample({super.key, this.restorationId});

  @override
  State<StepperExample> createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> with RestorationMixin {
  int _index = 0;
  String countryValue = "";

  String? stateValue;

  String? cityValue;

  final List<String> incident = <String>[
    "Murder",
    "Chain snatching",
    "Smuggling",
    "Kidnap",
    "Robbery",
    "Cybercrime",
    "Sexual assault",
    "Money laundering",
    "Wildlife trade"
  ];

  late String incidentValue;
  late String genderValue;

  @override
  void initState() {
    genderValue = gender.first;
    incidentValue = incident.first;
    super.initState();
  }

  String? get restorationId => widget.restorationId;
  String dateChoosen = "Pick date";
  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(1999, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );
  final List<String> gender = <String>[
    'Male',
    'Female',
    'Others',
  ];

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          // initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(
            DateTime.now().year - 50,
          ),
          lastDate: DateTime.now(),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        dateChoosen =
            '${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}';
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

  String fromDate = "Pick Date";

  String toDate = "Pick Date";

  DateTime timeFrom = DateTime.now();

  DateTime timeTo = DateTime.now();

  Future<void> pickTime({required String forWhatTime}) async {
    final res = await showTimePicker(
      initialTime:
          TimeOfDay.fromDateTime(forWhatTime == "from" ? timeFrom : timeTo),
      context: context,
    );

    if (res != null) {
      if (forWhatTime == "from") {
        setState(() {
          final DateTime now = DateTime.now();
          timeFrom = now.copyWith(
              hour: res.hour,
              minute: res.minute,
              second: 0,
              millisecond: 0,
              microsecond: 0);
          if (timeFrom.isBefore(now)) {
            timeFrom = timeFrom.add(const Duration(days: 1));
          }
        });
      } else {
        setState(() {
          final DateTime now = DateTime.now();
          timeTo = now.copyWith(
              hour: res.hour,
              minute: res.minute,
              second: 0,
              millisecond: 0,
              microsecond: 0);
          if (timeTo.isBefore(now)) {
            timeTo = timeTo.add(const Duration(days: 1));
          }
        });
      }
    }
  }

  TextEditingController weaponController = TextEditingController();

  TextEditingController dressCodeController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
        if (_index == 1) {
          fileCaseRegister();
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: <Step>[
        Step(
            title: Text('Step 1: Important Details'),
            content: Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: DropdownMenu<String>(
                          width: width * 0.6,
                          label: const Text("Select the type of Incident"),
                          inputDecorationTheme: const InputDecorationTheme(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              border: OutlineInputBorder()),
                          onSelected: (String? value) {
                            setState(() {
                              incidentValue = value!;
                            });
                          },
                          dropdownMenuEntries: incident
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                              value: value,
                              label: value,
                            );
                          }).toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CSCPicker(
                          showStates: true,
                          showCities: true,
                          flagState: CountryFlag.DISABLE,
                          dropdownDecoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 1)),
                          disabledDropdownDecoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: Colors.grey.shade300,
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 1)),
                          countrySearchPlaceholder: "Country",
                          stateSearchPlaceholder: "State",
                          citySearchPlaceholder: "City",
                          countryDropdownLabel: "Country",
                          stateDropdownLabel: "State",
                          cityDropdownLabel: "City",
                          selectedItemStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          dropdownHeadingStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                          dropdownItemStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          dropdownDialogRadius: 10.0,
                          searchBarRadius: 10.0,
                          onCountryChanged: (value) {
                            setState(() {
                              countryValue = value;
                            });
                          },
                          onStateChanged: (value) {
                            setState(() {
                              stateValue = value;
                            });
                          },
                          onCityChanged: (value) {
                            setState(() {
                              cityValue = value;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CustomTextField(
                            iconData: null,
                            hintText: "Blue shirt blank pant",
                            controller: dressCodeController,
                            labelText: "Dress Code"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CustomTextField(
                            iconData: null,
                            hintText: 'Stick, Blade',
                            controller: weaponController,
                            labelText: 'Weapon'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CustomTextField(
                          iconData: null,
                          hintText: 'T-Nagar',
                          controller: areaController,
                          labelText: 'Area',
                        ),
                      ),
                    ],
                  ),
                ))),
        Step(
            title: Text('Step 2: General Details'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Offence Day :",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('From Date:'),
                    ElevatedButton(
                        onPressed: () {
                          _restorableDatePickerRouteFuture.present();
                          setState(() {});
                        },
                        child: Text(dateChoosen))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('To Date:'),
                    ElevatedButton(
                        onPressed: () {
                          _restorableDatePickerRouteFuture.present();
                          setState(() {});
                        },
                        child: Text(toDate))
                  ],
                ),
                const Text(
                  "Time Period :",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Time From:'),
                    ElevatedButton(
                        onPressed: () {
                          pickTime(forWhatTime: "from");
                        },
                        child: Text("${timeFrom.hour}:${timeFrom.minute}"))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Time To:'),
                    ElevatedButton(
                        onPressed: () {
                          pickTime(forWhatTime: "to");
                        },
                        child: Text("${timeTo.hour}:${timeTo.minute}"))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomTextField(
                      iconData: null,
                      hintText: "Blue shirt blank pant",
                      controller: descriptionController,
                      labelText: "Description"),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: DropdownMenu<String>(
                      inputDecorationTheme: const InputDecorationTheme(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          border: OutlineInputBorder()),
                      initialSelection: gender.first,
                      label: const Text('Gender'),
                      onSelected: (String? value) {
                        setState(() {
                          genderValue = value!;
                        });
                      },
                      dropdownMenuEntries:
                          gender.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                          value: value,
                          label: value,
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                      "Note :  The report will be verified and then it will be proceeded by nearby police station from your location."),
                ),
              ],
            )),
      ],
    );
  }

  void fileCaseRegister() async {
    
    String date =
        ("${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}");
    if (incidentValue.isNotEmpty &&
        countryValue.isNotEmpty &&
        stateValue!.isNotEmpty &&
        cityValue!.isNotEmpty &&
        areaController.text.trim().isNotEmpty &&
        dressCodeController.text.trim().isNotEmpty &&
        weaponController.text.trim().isNotEmpty &&
        genderValue.isNotEmpty &&
        descriptionController.text.trim().isNotEmpty) {
      String time = "${DateTime.now().hour}:${DateTime.now().minute}";

      FirebaseFirestore.instance
          .collection("cases")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection(date)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        time: {
          "incident": incidentValue,
          "country": countryValue,
          "state": stateValue,
          "city": cityValue,
          "area": areaController.text.trim(),
          "dressCode": dressCodeController.text.trim(),
          "weapon": weaponController.text.trim(),
          "timeFrom": "${timeFrom.hour}:${timeTo.minute}",
          "timeTo": "${timeTo.hour}:${timeTo.minute}",
          "dateFrom": fromDate,
          "dateTo": toDate,
          "gender": genderValue,
          "description": descriptionController.text.trim(),
        },
      }).onError((error, stackTrace) => print(error));
    } else {
      showSnackBar(context: context, content: "Enter all Fields");
    }
  }
}
