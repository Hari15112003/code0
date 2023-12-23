import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ReportProgress extends StatelessWidget {
  const ReportProgress({super.key});

  final bool isReceived = true;
  final bool isVerified = false;
  final bool isAction = false;
  final bool isClose = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: SfLinearGauge(
            ranges: [
              LinearGaugeRange(
                startValue: 0,
                endValue: 34,
                color: isVerified == true ? Colors.green : Colors.grey,
                position: LinearElementPosition.cross,
              ),
              LinearGaugeRange(
                startValue: 35,
                endValue: 69,
                color: isAction == true ? Colors.green : Colors.grey,
                position: LinearElementPosition.cross,
              ),
              LinearGaugeRange(
                startValue: 70,
                endValue: 100,
                color: isClose == true ? Colors.green : Colors.grey,
                position: LinearElementPosition.cross,
              ),
            ],
            markerPointers: [
              linearProgress(
                  value: 0,
                  color: isReceived == true ? Colors.green : Colors.grey,
                  text: "1"),
              linearText(text: "Received", value: 0),
              linearProgress(
                  value: 35,
                  color: isVerified == true ? Colors.green : Colors.grey,
                  text: "2"),
              linearText(text: "Verified", value: 35),
              linearProgress(
                  value: 70,
                  color: isAction == true ? Colors.green : Colors.grey,
                  text: "3"),
              linearText(text: "Action", value: 70),
              linearProgress(
                  value: 100,
                  color: isClose == true ? Colors.green : Colors.grey,
                  text: "4"),
              linearText(text: "Close", value: 100),
            ],
            orientation: LinearGaugeOrientation.vertical,
            showTicks: false,
            majorTickStyle: const LinearTickStyle(length: 20),
            isAxisInversed: true,
            axisLabelStyle: const TextStyle(color: Colors.transparent),
            axisTrackStyle: const LinearAxisTrackStyle(
                color: Colors.grey,
                edgeStyle: LinearEdgeStyle.bothFlat,
                thickness: 8.0,
                borderColor: Colors.grey),
          ),
        )
      ],
    );
  }

  LinearMarkerPointer linearProgress(
      {required double value, required Color color, required String text}) {
    return LinearWidgetPointer(
      value: value,
      offset: 25,
      position: LinearElementPosition.cross,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 36,
            width: 36,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          // Text("Delivered")
        ],
      ),
    );
  }

  LinearMarkerPointer linearText({
    required String text,
    required double value,
  }) {
    return LinearWidgetPointer(
      value: value,
      offset: 25,
      position: LinearElementPosition.inside,
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}
