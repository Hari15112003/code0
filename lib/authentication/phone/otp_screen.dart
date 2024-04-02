import 'dart:async';

import 'package:code0/utils/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../../utils/snackbar.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;
  final Map userData;

  const OtpScreen({
    Key? key,
    required this.verificationId,
    required this.phoneNumber,
    required this.userData,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;
  late bool _timerActive;
  late int _timerDuration;
  Timer? _resendTimer;

  @override
  void initState() {
    super.initState();
    _timerActive = true; // Set the timer as active
    _timerDuration = 120; // Set the initial timer duration
    startTimer();
  }

  void startTimer() {
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timerDuration > 0) {
          _timerDuration--;
        } else {
          stopTimer();
        }
      });
    });
  }

  void stopTimer() {
    setState(() {
      _timerActive = false; // Set the timer as inactive
    });
    _resendTimer?.cancel();
  }

  @override
  void dispose() {
    // if (_resendTimer != null && _timerActive) {
    stopTimer(); // Stop the timer only if it's active
    // }
    super.dispose();
  }

  void handleButtonClick() {
    if (_timerActive) {
      stopTimer(); // Stop the timer if it's active
      // Dispose the timer if needed
    } else {
      // ignore: avoid_print
      print("Timer problem");
    }
    // Handle the button click event
  }

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
                Image.asset(
                  "assets/images/otp.png",
                ),
                const SizedBox(height: 20),
                const Text(
                  "Verification",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Enter the OTP send to your phone number",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Pinput(
                  length: 6,
                  showCursor: true,
                  defaultPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.purple.shade200,
                      ),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onCompleted: (value) {
                    setState(() {
                      otpCode = value;
                    });
                  },
                ),
                const SizedBox(height: 25),
                Text("Seconds Remaining $_timerDuration"),
                const SizedBox(
                  height: 6,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Didn't receive any code?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  child: const Text(
                    "Resend New Code",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  onTap: () {
                    _timerDuration == 0
                        ? ap.resendVerificationCode(
                            phoneNumber: widget.phoneNumber,
                            verificationId: widget.verificationId,
                            context: context,
                            userData: widget.userData)
                        : showSnackBar(
                            context: context,
                            content:
                                'Wait for sometime until the time is over');
                    // ignore: avoid_print
                    print("Otp resended");
                  },
                ),
                CustomButton(
                    text: 'Submit',
                    function: () {
                      if (otpCode != null) {
                        verifyOtp(context, otpCode!);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    ap.saveUserDataToFirebase(
        context: context,
        userData: widget.userData,
        onSuccess: () {
          ap.saveUserDataToSP().then(
            (value) {
              ap.setSignIn();
            },
          );
        });
  }
}
