import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          const Text(
            "Total Cases: 120",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SfCircularChart(
              legend: const Legend(
                  position: LegendPosition.bottom,
                  height: "50%",
                  iconHeight: 20,
                  iconWidth: 20,
                  textStyle: TextStyle(fontSize: 15),
                  orientation: LegendItemOrientation.auto,
                  isVisible: true,
                  isResponsive: true,
                  shouldAlwaysShowScrollbar: true),
              tooltipBehavior: _tooltipBehavior,
              series: <CircularSeries>[
                PieSeries<ChartData, String>(
                  radius: "80%",
                  enableTooltip: true,
                  dataSource: [
                    ChartData('Applied', 35),
                    ChartData('Accepted', 28),
                    ChartData('Verified', 34),
                    ChartData('Action', 32),
                    ChartData('Closed', 40)
                  ],
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  name: "Data",
                ),
              ]),
          const Text(
            "Touch Field to Compare",
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 500,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 238, 231, 239),
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.only(left: wid * 0.02),
              height: hei * 0.15,
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                    height: hei * 0.08,
                    child: Image.asset("assets/images/app_logo.jpg"),
                  ),
                  SizedBox(
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: wid * 0.4,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "John Doe",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: hei * 0.026),
                              ),
                              SizedBox(
                                width: wid * 0.05,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: wid * 0.01),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Text(
                                  "Inspector",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Sriperumpadur Police",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                            SizedBox(
                              width: wid * 0.03,
                            ),
                            const Text(
                              "T-17K",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: hei * 0.003,
                        ),
                        Container(
                          padding: EdgeInsets.all(hei * 0.005),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 22, 209, 100)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone,
                                size: hei * 0.02,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: wid * 0.01,
                              ),
                              const Text(
                                "+91 1234567890",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
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
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 500,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 238, 231, 239),
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.only(left: wid * 0.02),
              height: hei * 0.15,
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                    height: hei * 0.08,
                    child: Image.asset("assets/images/app_logo.jpg"),
                  ),
                  SizedBox(
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: wid * 0.4,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Harisha",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: hei * 0.026),
                              ),
                              SizedBox(
                                width: wid * 0.05,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: wid * 0.01),
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Text(
                                  "Dupty Inspector",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Sriperumpadur Police",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                            SizedBox(
                              width: wid * 0.03,
                            ),
                            const Text(
                              "T-19K",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: hei * 0.003,
                        ),
                        Container(
                          padding: EdgeInsets.all(hei * 0.005),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 22, 209, 100)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone,
                                size: hei * 0.02,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: wid * 0.01,
                              ),
                              const Text(
                                "+91 9773786323",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
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
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
