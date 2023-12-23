import 'package:code0/authentication/otp_screen.dart';
import 'package:code0/utils/custom_button.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController phoneController = TextEditingController();
  Country selectedcountry = Country(
    phoneCode: '91',
    countryCode: 'IN',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'India',
    example: 'India',
    displayName: 'India',
    displayNameNoCountryCode: 'IN',
    e164Key: '',
  );

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/forget.png',
                width: 500,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  'Forgot \nPassword?',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Don\'t worry ! It happens. Please enter the phone number we will send the OTP in this phone number.',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0.0-9.9]')),
                  ],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  onChanged: (value) {
                    setState(
                      () {
                        phoneController.text = value;
                      },
                    );
                  },
                  cursorColor: Colors.purple,
                  controller: phoneController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey.shade600),
                      hintText: 'Enter phone number',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(13.0),
                        child: InkWell(
                          child: Text(
                            "${selectedcountry.flagEmoji} + ${selectedcountry.phoneCode}",
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
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
                                    selectedcountry = value;
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                      suffixIcon: phoneController.text.length > 9
                          ? Container(
                              height: 30,
                              width: 30,
                              margin: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.green),
                              child: const Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 20,
                              ),
                            )
                          : null),
                ),
              ),
              SizedBox(
                height: height * 0.08,
              ),
              Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                      text: 'Continue',
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtpScreen(
                                    verificationId: 'verificationId',
                                    startTimer: (){},
                                    phoneNumber: phoneController.text.trim(),
                                    )));
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
