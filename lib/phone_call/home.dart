// ignore_for_file: unused_local_variable

import 'package:android_path_provider/android_path_provider.dart';
import 'package:code0/phone_call/sos.dart';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/avtar.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          const Text("Hello Madhura",
                              style: TextStyle(
                                fontSize: 14,
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: () {
                            },
                            child: const Text("Complete Profile",
                                style: TextStyle(
                                  fontSize: 14,
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                  const Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text("Alan zone...",
                                  style: TextStyle(
                                    fontSize: 14,
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Safe Location",
                                  style: TextStyle(
                                    fontSize: 14,
                                  )),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 64,
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

                      SOS().sharePhotoToWhatsApp("7620464305",
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      _callNumber("7395902949");
                    },
                    child: const Text("Police"),
                  ),
                  InkWell(
                    onTap: () {
                      _callNumber("9791340230");
                    },
                    child: const Text('Emergency'),
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
