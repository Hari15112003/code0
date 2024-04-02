import 'package:code0/pages/home/notifications/helper/ExpandileExample.dart';
import 'package:code0/utils/top_button.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TopButton(
                  text: "Notifications",
                ),
                ExpandileExamplePage(date: 'date', time: {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
