// ignore_for_file: unused_local_variable

import 'package:android_path_provider/android_path_provider.dart';
import 'package:code0/utils/custom_button.dart';
import 'package:code0/utils/top_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import '../../../utils/sos.dart';

class EmergencyAlert extends StatelessWidget {
  const EmergencyAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TopButton(text: "Emergency Alert"),
              const SizedBox(
                height: 160,
              ),
              const Text(
                "Emergency help \n Needed?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(400),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    splashColor: Colors.black54,
                    onTap: () async {
                      var downloadsPath =
                          await AndroidPathProvider.downloadsPath;

                      SOS().sharePhotoToWhatsApp("9790867582",
                          "http://file:/$downloadsPath/digambar.jpeg");
                    },
                    child: Ink.image(
                      image: const AssetImage('assets/images/sos_button.png'),
                      height: 205,
                      width: 205,
                      fit: BoxFit.cover,
                      child: const Center(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Press the button to send SOS",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 150,
                    child: CustomButton(
                        text: "Police",
                        function: () {
                          _callNumber("9790867582");
                        }),
                  ),
                  SizedBox(
                    width: 150,
                    child: CustomButton(
                      function: () {
                        _callNumber("9790867582");
                      },
                      text: 'Emergency',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  _callNumber(String number) async {
//set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}
