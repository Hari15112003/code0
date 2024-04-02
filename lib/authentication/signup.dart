// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code0/utils/custom_button.dart';
import 'package:code0/utils/image_picker.dart';
import 'package:code0/utils/snackbar.dart';
import 'package:code0/utils/text_form.dart';
import 'package:country_picker/country_picker.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final String? restorationId;
  const SignUp({super.key, this.restorationId});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  String dobChoosen = "Pick date";
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
            DateTime.now().year - 100,
          ),
          lastDate: DateTime(
            DateTime.now().year - 10,
          ),
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
      setState(
        () {
          _selectedDate.value = newSelectedDate;
          dobChoosen =
              '${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
            ),
          );
        },
      );
    }
  }

  TextEditingController nameController = TextEditingController();

  TextEditingController aadharNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController relationsController = TextEditingController();
  bool allowNotifications = false;

  final List<String> list = <String>[
    'Male',
    'Female',
    'Others',
  ];
  EmailOTP myauth = EmailOTP();
  File? image;
  String? selectedCountry;
  late String genderChoosen;
  @override
  void initState() {
    genderChoosen = list.first;
    super.initState();
  }

  void selectedImage() async {
    image = await pickImage(context);
    setState(() {});
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
              GestureDetector(
                onTap: () {
                  selectedImage();
                },
                child: image == null
                    ? CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 173, 221, 185),
                        maxRadius: 60,
                        child: Center(
                          child: Image.asset('assets/images/avatar_image.png'),
                        ),
                      )
                    : CircleAvatar(
                        backgroundImage: FileImage(
                          image!,
                        ),
                        radius: 50,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomTextField(
                  labelText: "Name",
                  iconData: null,
                  hintText: "abc",
                  controller: nameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomTextField(
                  labelText: "Aadhar Number",
                  iconData: null,
                  hintText: "5874-4365-9415",
                  controller: aadharNumberController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomTextField(
                  labelText: "Password",
                  iconData: null,
                  hintText: "9876543...",
                  controller: passwordController,
                ),
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
                  labelText: "Email Id",
                  iconData: null,
                  hintText: "abc@gmail.com",
                  controller: emailController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomTextField(
                  labelText: "Occupation",
                  iconData: null,
                  hintText: "Teacher ...",
                  controller: occupationController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: DropdownMenu<String>(
                          inputDecorationTheme: const InputDecorationTheme(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            border: OutlineInputBorder(),
                          ),
                          initialSelection: list.first,
                          label: const Text('Gender'),
                          onSelected: (String? value) {
                            setState(() {
                              genderChoosen = value!;
                            });
                          },
                          dropdownMenuEntries:
                              list.map<DropdownMenuEntry<String>>(
                            (String value) {
                              return DropdownMenuEntry<String>(
                                value: value,
                                label: value,
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: CustomTextField(
                        labelText: "Father/Husband Name",
                        iconData: null,
                        hintText: "abc x",
                        controller: relationsController,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: const Size(200, 50),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                            color: Colors.grey.shade600,
                          )),
                        ),
                        onPressed: () {
                          _restorableDatePickerRouteFuture.present();
                          setState(() {});
                        },
                        child: Text(
                          "DOB : $dobChoosen",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: const Size(200, 50),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                            color: Colors.grey.shade600,
                          )),
                        ),
                        onPressed: () {
                          showCountryPicker(
                            countryListTheme: CountryListThemeData(
                              inputDecoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.purple,
                                ),
                                hintText: 'Search',
                                helperStyle:
                                    const TextStyle(color: Colors.black38),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.purple,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.purple,
                                  ),
                                ),
                              ),
                              bottomSheetHeight: height - 350,
                            ),
                            context: context,
                            onSelect: (value) {
                              setState(
                                () {
                                  selectedCountry = value.name;
                                },
                              );
                            },
                          );
                        },
                        child: Text("Country : $selectedCountry"),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      value: allowNotifications,
                      onChanged: (bool? value) {
                        setState(() {
                          allowNotifications = value!;
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
                function: () async {
                  if (image != null) {
                    if (nameController.text.trim().isNotEmpty &&
                        aadharNumberController.text.trim().isNotEmpty &&
                        passwordController.text.trim().isNotEmpty &&
                        addressController.text.trim().isNotEmpty &&
                        emailController.text.trim().isNotEmpty &&
                        genderChoosen.isNotEmpty &&
                        dobChoosen.isNotEmpty &&
                        occupationController.text.trim().isNotEmpty) {
                      signUp();
                      // myauth.setConfig(
                      //     appEmail: "sit21cs123@sairamtap.edu.in",
                      //     appName: "Code0",
                      //     userEmail: emailController.text.trim().toLowerCase(),
                      //     otpLength: 4,
                      //     otpType: OTPType.digitsOnly);
                      // if (await myauth.sendOTP() == true) {
                      //   showSnackBar(
                      //     context: context,
                      //     content: "OTP has been sent",
                      //   );

                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => EmailOtpPage(
                      //       userData: {
                      //         'aadharNo': aadharNumberController.text.trim(),
                      //         'address': addressController.text.trim(),
                      //         'dob': dobChoosen,
                      //         'email':
                      //             emailController.text.trim().toLowerCase(),
                      //         'gender': genderChoosen,
                      //         'name': nameController.text.trim().toLowerCase(),
                      //         'nationality': selectedCountry,
                      //         'notifications': allowNotifications,
                      //         'occupation': occupationController.text.trim(),
                      //         'password': passwordController.text.trim(),
                      //         'file': image!,
                      //       },
                      //     ),
                      //   ),
                      // );
                    } else {
                      showSnackBar(
                          context: context, content: "Enter all fields");
                    }
                  } else {
                    showSnackBar(
                      context: context,
                      content: "Pick your Profile Photo",
                    );
                  }
                },
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
                  Navigator.pop(context);
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

  Future<void> signUp() async {
    try {
      var firebaseAuth = FirebaseAuth.instance;
      firebaseAuth
          .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .whenComplete(() async {
        await storeFileToStorage(
                "profilePic/${firebaseAuth.currentUser!.uid}", image!)
            .then(
          (value) {
            FirebaseFirestore.instance
                .collection('users')
                .doc(firebaseAuth.currentUser!.uid)
                .set({
              'aadharNo': aadharNumberController.text.trim(),
              'address': addressController.text.trim(),
              'dob': dobChoosen,
              'email': emailController.text.trim().toLowerCase(),
              'gender': genderChoosen,
              'name': nameController.text.trim().toLowerCase(),
              'nationality': selectedCountry,
              'notifications': allowNotifications,
              'occupation': occupationController.text.trim(),
              'password': passwordController.text.trim(),
              'file': value,
              'uid': firebaseAuth.currentUser!.uid
            });
          },
        );
      });
    } catch (e) {
      showSnackBar(context: context, content: e.toString());

      // Handle error, e.g., display an error message
    }
  }

  Future<String> storeFileToStorage(String ref, File file) async {
    UploadTask uploadTask =
        FirebaseStorage.instance.ref().child(ref).putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
