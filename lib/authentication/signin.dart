import 'package:code0/authentication/signup.dart';
import 'package:code0/utils/custom_button.dart';
import 'package:code0/utils/text_form.dart';
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
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomTextField(
                    labelText: "Password",
                    iconData: Icons.remove_red_eye,
                    hintText: "123...",
                    controller: passwordController),
              ),
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
              CustomButton(text: "Login", function: () {}),
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