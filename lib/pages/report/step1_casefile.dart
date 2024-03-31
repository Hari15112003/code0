import 'package:code0/utils/text_form.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

class StepOne extends StatefulWidget {
  const StepOne({super.key});

  @override
  State<StepOne> createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
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

  late String dropdownValue;

  @override
  void initState() {
    dropdownValue = incident.first;
    super.initState();
  }

  TextEditingController weaponController = TextEditingController();

  TextEditingController dressCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
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
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    border: OutlineInputBorder()),
                onSelected: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                dropdownMenuEntries:
                    incident.map<DropdownMenuEntry<String>>((String value) {
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
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300, width: 1)),

                disabledDropdownDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.shade300,
                    border: Border.all(color: Colors.grey.shade300, width: 1)),

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
          ],
        ),
      ),
    );
  }
}
