import 'package:code0/api/act_api.dart';
import 'package:code0/pages/home/links/link_navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'home/news/components/custom_list_tile.dart';
import 'home/news/model/article_model.dart';
import 'home/news/services/api_service.dart';

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
    double height = MediaQuery.of(context).size.height;
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
              height: 330,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 185, 184, 184).withOpacity(.2),
              ),
              child: Column(children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 113, 213, 252),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          helperLinks(
                              icon: Icons.sos,
                              color: Colors.red,
                              text: "Emergency\n     Alert",
                              function: () {}),
                          SizedBox(
                            height: 15,
                          ),
                          helperLinks(
                              icon: Icons.contact_emergency_rounded,
                              color: Colors.orange,
                              text: "Emergency\n  Contacts",
                              function: () {}),
                        ],
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            helperLinks(
                                icon: Icons.sos,
                                color: Color.fromARGB(255, 122, 211, 27),
                                text: "Emergency",
                                function: () {}),
                            SizedBox(
                              height: 35,
                            ),
                            helperLinks(
                                icon: Icons.contact_emergency_rounded,
                                color: Color.fromARGB(255, 180, 8, 160),
                                text: "Emergency\n  Contacts",
                                function: () {}),
                          ]),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          helperLinks(
                              icon: Icons.history,
                              color: Color.fromARGB(255, 15, 172, 229),
                              text: "  Volunteers",
                              function: () {}),
                          SizedBox(
                            height: 35,
                          ),
                          helperLinks(
                              icon: Icons.report,
                              color: Colors.green,
                              text: "  File\n Case",
                              function: () {}),
                        ],
                      ),
                      Column(
                        children: [
                          helperLinks(
                              icon: Icons.history,
                              color: Colors.purple,
                              text: "  Case\nHistory",
                              function: () {}),
                          SizedBox(
                            height: 15,
                          ),
                          helperLinks(
                              icon: Icons.notification_important,
                              color: Color.fromARGB(255, 62, 7, 245),
                              text: "  Emergency\n Notification",
                              function: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
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
            headText(text: "News"),
            SizedBox(
              height: 100,
              child: NavigateLink(),
            ),
            SizedBox(
              height: 500,
              child: FutureBuilder(
                future: client.getArticle(),
                builder: (BuildContext context, snapshot) {
                  //let's check if we got a response or not

                  if (snapshot.hasData) {
                    //Now let's make a list of articles
                    List<Article> articles = snapshot.data!;
                    return ListView.builder(
                      //Now let's create our custom List tile
                      itemCount: articles.length,
                      itemBuilder: (context, index) =>
                          customListTile(articles[index], context),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                },
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
      required VoidCallback function}) {
    return GestureDetector(
      onTap: function,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
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
          SizedBox(
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
