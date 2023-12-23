import 'package:code0/authentication/forget_pass.dart';
import 'package:code0/utils/custom_button.dart';
import 'package:code0/utils/text_form.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController aadharNumberController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isChecked = false;

  final List<String> list = <String>[
    'Male',
    'Female',
    'Others',
  ];
  late String dropdownValue;
  @override
  void initState() {
    dropdownValue = list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.06,
              ),
              const Text(
                "Register To Continue",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: height * 0.001,
              ),
              const Text('Join the community to create a better society'),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: width * 0.5,
                    child: CustomTextField(
                        labelText: "FirstName",
                        iconData: null,
                        hintText: "abc",
                        controller: firstNameController),
                  ),
                  SizedBox(
                    width: width * 0.3,
                    child: CustomTextField(
                        labelText: "LastName",
                        iconData: null,
                        hintText: "def",
                        controller: lastNameController),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomTextField(
                    labelText: "Aadhar Number",
                    iconData: null,
                    hintText: "5874-4365-9415",
                    controller: aadharNumberController),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomTextField(
                    labelText: "Phone Number",
                    iconData: null,
                    hintText: "9876543...",
                    controller: phoneNumberController),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomTextField(
                    labelText: "Address",
                    iconData: null,
                    hintText: "Flat no, Area, Locality,State, Pincode",
                    controller: addressController),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomTextField(
                    labelText: "Email",
                    iconData: null,
                    hintText: "abc@gmail.com",
                    controller: emailController),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: DropdownMenu<String>(
                    inputDecorationTheme: const InputDecorationTheme(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        border: OutlineInputBorder()),
                    initialSelection: list.first,
                    label: const Text('Gender'),
                    onSelected: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    dropdownMenuEntries:
                        list.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                        value: value,
                        label: value,
                      );
                    }).toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    const Text(
                        "You agree to receive updates and offers from ...")
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                    "By creating an account you agree to our updated Terms of Services and Privacy policy"),
              ),
              CustomButton(
                text: 'Register',
                function: () {},
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                    'We’ll send you the email with the link that’ll log you in right away.'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: width * 0.2,
                    child: const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                  const Text("Have an account ?"),
                  SizedBox(
                    width: width * 0.2,
                    child: const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomButton(
                text: 'Signin',
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgetPassword()));
                },
              ),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
