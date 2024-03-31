// ignore_for_file: use_build_context_synchronously

import 'package:code0/authentication/email/email_otp_page.dart';
import 'package:code0/authentication/signup.dart';
import 'package:code0/utils/custom_button.dart';
import 'package:code0/utils/snackbar.dart';
import 'package:code0/utils/text_form.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isChecked = false;
  EmailOTP myauth = EmailOTP();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/signin.png'),
              const Text(
                "Good to See you again",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
              ),
              const Text(
                "Login to Continue",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomTextField(
                    labelText: "Email Address",
                    iconData: Icons.email_outlined,
                    hintText: "123@gmail.com",
                    controller: emailController),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(20),
              //   child: CustomTextField(
              //       labelText: "Otp",
              //       iconData: Icons.remove_red_eye,
              //       hintText: "123...",
              //       controller: passwordController),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
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
                        "Remember me",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Forget password?',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              CustomButton(
                text: "Send Otp",
                function: () async {
                  myauth.setConfig(
                      appEmail: "sit21cs123@sairamtap.edu.in",
                      appName: "Code0",
                      userEmail: emailController.text.trim(),
                      otpLength: 4,
                      otpType: OTPType.digitsOnly);
                  if (await myauth.sendOTP() == true) {
                    showSnackBar(context, "OTP has been sent");
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmailOtpPage(
                          email: emailController.text.trim(),
                        ),
                      ),
                    );
                  } else {
                    showSnackBar(context, 'Oops, OTP send failed');
                  }
                },
              ),
              SizedBox(
                height: height * 0.03,
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
                  const Text("Don’t have an account?"),
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
                height: height * 0.03,
              ),
              CustomButton(
                text: "Create account",
                function: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
