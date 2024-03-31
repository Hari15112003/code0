import 'package:code0/utils/custom_button.dart';
import 'package:code0/utils/text_form.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
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
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: DropdownMenu<String>(
              width: width * 0.9,
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

              ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
              dropdownDecoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300, width: 1)),

              ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
              disabledDropdownDecoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey.shade300,
                  border: Border.all(color: Colors.grey.shade300, width: 1)),

              ///placeholders for dropdown search field
              countrySearchPlaceholder: "Country",
              stateSearchPlaceholder: "State",
              citySearchPlaceholder: "City",

              ///labels for dropdown
              countryDropdownLabel: "Country",
              stateDropdownLabel: "State",
              cityDropdownLabel: "City",

              ///selected item style [OPTIONAL PARAMETER]
              selectedItemStyle: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),

              ///DropdownDialog Heading style [OPTIONAL PARAMETER]
              dropdownHeadingStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),

              ///DropdownDialog Item style [OPTIONAL PARAMETER]
              dropdownItemStyle: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),

              ///Dialog box radius [OPTIONAL PARAMETER]
              dropdownDialogRadius: 10.0,

              ///Search bar radius [OPTIONAL PARAMETER]
              searchBarRadius: 10.0,

              ///triggers once country selected in dropdown
              onCountryChanged: (value) {
                setState(() {
                  ///store value in country variable
                  countryValue = value;
                });
              },

              ///triggers once state selected in dropdown
              onStateChanged: (value) {
                setState(() {
                  ///store value in state variable
                  stateValue = value;
                });
              },

              ///triggers once city selected in dropdown
              onCityChanged: (value) {
                setState(() {
                  ///store value in city variable
                  cityValue = value;
                });
              },

              ///Show only specific countries using country filter
              // countryFilter: ["United States", "Canada", "Mexico"],
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
                    dropdownValue = value!;
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
          CustomButton(text: 'Submit The Report', function: () {}),
        ],
      ),
    );
  }
}
