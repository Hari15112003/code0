import 'package:code0/api/act_api.dart';
import 'package:code0/pages/home/cases/case_history.dart';
import 'package:code0/pages/home/emergency/emergency_alert.dart';
import 'package:code0/pages/home/news/news_page.dart';
import 'package:code0/pages/home/volunteer/volunteer_availabity.dart';
import 'package:code0/pages/report/file_case.dart';
import 'package:flutter/material.dart';

import 'news/services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double complaintProgress = 20;
  late ApiService client;

  @override
  void initState() {
    client = ApiService();
    super.initState();
  }

  String status = "In Progress";
  String updatedOn = "22/11/2023";
  String crimeType = "Theft";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.notifications_rounded),
                onPressed: () {},
              ),
            ),
            headText(text: "Safe Zone"),
            const SizedBox(
              height: 200,
            ),
            ElevatedButton(
              onPressed: () {
                call(incident: 'Theft');
              },
              child: const Text("Call Api"),
            ),
            headText(text: "Complaint Status"),
            Container(
              width: double.infinity,
              height: 350,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 52, 181, 233),
                      ),
                      child: const Text(
                        "Easy Navigators",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            helperLinks(
                              icon: Icons.sos,
                              color: Colors.red,
                              text: "Emergency\n     Alert",
                              navigatorWidget: const EmergencyAlert(),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            helperLinks(
                                icon: Icons.newspaper,
                                color: Colors.orange,
                                text: "     News \n Information",
                                navigatorWidget: const NewsScreen()),
                          ],
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              helperLinks(
                                  icon: Icons.sos,
                                  color:
                                      const Color.fromARGB(255, 122, 211, 27),
                                  text: "Prevention \n     Tips",
                                  navigatorWidget: const SizedBox()),
                              const SizedBox(
                                height: 20,
                              ),
                              helperLinks(
                                  icon: Icons.contact_emergency_rounded,
                                  color: const Color.fromARGB(255, 180, 8, 160),
                                  text: "Emergency\n  Contacts",
                                  navigatorWidget: const SizedBox()),
                            ]),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            helperLinks(
                                icon: Icons.history,
                                color: const Color.fromARGB(255, 15, 172, 229),
                                text: "  Volunteers",
                                navigatorWidget: const VolunteerAvailability()),
                            const SizedBox(
                              height: 35,
                            ),
                            helperLinks(
                              icon: Icons.report,
                              color: Colors.green,
                              text: "  File\n Case",
                              navigatorWidget: const FileCase(),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            helperLinks(
                              icon: Icons.history,
                              color: Colors.purple,
                              text: "  Case\nHistory",
                              navigatorWidget: const CaseHistory(),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            helperLinks(
                              icon: Icons.notification_important,
                              color: const Color.fromARGB(255, 62, 7, 245),
                              text: "  Emergency\n Notification",
                              navigatorWidget: const SizedBox(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: Container(
            //     height: height * 0.16,
            //     padding: const EdgeInsets.all(20),
            //     decoration: BoxDecoration(
            //         color: Colors.blue.withOpacity(0.2),
            //         borderRadius: BorderRadius.circular(20)),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         SizedBox(
            //           width: 100,
            //           child: SfRadialGauge(
            //             enableLoadingAnimation: true,
            //             axes: <RadialAxis>[
            //               RadialAxis(
            //                 isInversed: true,
            //                 showTicks: false,
            //                 showFirstLabel: false,
            //                 startAngle: 0,
            //                 endAngle: 360,
            //                 maximumLabels: 0,
            //                 pointers: <GaugePointer>[
            //                   RangePointer(
            //                       value: complaintProgress,
            //                       cornerStyle: CornerStyle.bothCurve,
            //                       width: 0.2,
            //                       color: Colors.blue,
            //                       sizeUnit: GaugeSizeUnit.factor)
            //                 ],
            //                 annotations: <GaugeAnnotation>[
            //                   GaugeAnnotation(
            //                     horizontalAlignment: GaugeAlignment.center,
            //                     positionFactor: 0.1,
            //                     widget: Text(
            //                       "${complaintProgress.toInt()} %",
            //                       style: const TextStyle(
            //                           fontSize: 20.0,
            //                           fontWeight: FontWeight.bold),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ),
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           mainAxisAlignment: MainAxisAlignment.spaceAround,
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.symmetric(horizontal: 10),
            //               child: Text(
            //                 crimeType,
            //                 style: const TextStyle(
            //                     fontSize: 22, fontWeight: FontWeight.w800),
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.symmetric(horizontal: 10),
            //               child: Text(
            //                 status,
            //                 style: const TextStyle(
            //                     fontSize: 16, fontWeight: FontWeight.w600),
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.symmetric(horizontal: 10),
            //               child: Text(
            //                 "Updated on $updatedOn",
            //                 style: const TextStyle(fontWeight: FontWeight.w500),
            //               ),
            //             ),
            //           ],
            //         )
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget helperLinks(
      {required IconData icon,
      required Color color,
      required String text,
      required Widget navigatorWidget}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => navigatorWidget));
      },
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: 30,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(text)
        ],
      ),
    );
  }

  Widget headText({required String text}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
