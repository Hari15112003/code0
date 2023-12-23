import 'package:code0/pages/home/links/link_navigate.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'home/news/components/customListTile.dart';
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
    double width = MediaQuery.of(context).size.width;
    return Column(
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
        headText(text: "Complaint Status"),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: height * 0.16,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  child: SfRadialGauge(
                    enableLoadingAnimation: true,
                    axes: <RadialAxis>[
                      RadialAxis(
                        isInversed: true,
                        showTicks: false,
                        showFirstLabel: false,
                        startAngle: 0,
                        endAngle: 360,
                        maximumLabels: 0,
                        pointers: <GaugePointer>[
                          RangePointer(
                              value: complaintProgress,
                              cornerStyle: CornerStyle.bothCurve,
                              width: 0.2,
                              color: Colors.blue,
                              sizeUnit: GaugeSizeUnit.factor)
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                            horizontalAlignment: GaugeAlignment.center,
                            positionFactor: 0.1,
                            widget: Text(
                              complaintProgress.toInt().toString() + " %",
                              style: const TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        crimeType,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w800),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        status,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Updated on " + updatedOn,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        headText(text: "News"),
        SizedBox(
          height: 100,
          child: NavigateLink(),
        ),
        Expanded(
          flex: 2,
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
