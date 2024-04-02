import 'package:code0/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../utils/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  final Map userData;
  const RegisterScreen({super.key, required this.userData});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneContoller = TextEditingController();

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
    //change the postion of text from l to r
    phoneContoller.selection = TextSelection.fromPosition(
        TextPosition(offset: phoneContoller.text.length));

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
              child: Container(
                width: 200,
                height: 200,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.purple.shade50),
                child: Image.asset('assets/images/image2.png'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Register",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: height * 0.012,
            ),
            const Text(
              "Add your phone number , we'll send you a verification code",
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(96, 24, 24, 24),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0.0-9.9]')),
                ],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                onChanged: (value) {
                  setState(
                    () {
                      phoneContoller.text = value;
                    },
                  );
                },
                cursorColor: Colors.purple,
                controller: phoneContoller,
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
                    suffixIcon: phoneContoller.text.length > 9
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
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                  text: "Send Otp",
                  function: () {
                    sendPhoneNumber();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneContoller.text.trim();

    ap.signInWithPhone(
        context: context,
        phoneNumber: "+${selectedcountry.phoneCode}$phoneNumber",
        userData: widget.userData);
  }
}
