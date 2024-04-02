import 'package:carousel_slider/carousel_slider.dart';
import 'package:code0/api/act_api.dart';
import 'package:code0/pages/home/cases/case_history.dart';
import 'package:code0/pages/home/emergency/emergency_alert.dart';
import 'package:code0/pages/home/news/news_page.dart';
import 'package:code0/pages/home/notifications/notification.dart';
import 'package:code0/pages/home/volunteer/volunteer_availabity.dart';
import 'package:code0/pages/case_filling/file_case.dart';
import 'package:code0/static/know_your_laws.dart';
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
  int current = 0;
  final CarouselController controller = CarouselController();
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
                icon: const Icon(
                  Icons.notifications_rounded,
                  size: 28,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationScreen()));
                },
              ),
            ),
            headText(text: "Safe Zone"),
            SizedBox(
              height: 200,
              child: CarouselSlider(
                  carouselController: controller,
                  options: CarouselOptions(
                    height: 400,
                    // aspectRatio: 16 / 9,
                    onPageChanged: (index, reason) {
                      setState(() {
                        current = index;
                      });
                    },
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    // autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: const LinearGradient(
                          colors: [Color(0xff92A3FD), Color(0xff9DCEFF)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ]),
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
                                  text: "Know Your \n     Laws",
                                  navigatorWidget: const KnowYourLaws()),
                              const SizedBox(
                                height: 16,
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
