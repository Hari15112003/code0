// ignore_for_file: file_names

import 'package:code0/pages/home/notifications/helper/Constants/Constants.dart';
import 'package:code0/pages/home/notifications/helper/Widgets/Widgets.dart';
import 'package:flutter/material.dart';

class ExpandileExamplePage extends StatefulWidget {
  final String date;
  final Map time;
  const ExpandileExamplePage(
      {super.key, required this.date, required this.time});

  @override
  State<ExpandileExamplePage> createState() => _ExpandileExamplePageState();
}

class _ExpandileExamplePageState extends State<ExpandileExamplePage> {
  ///Primary color for this tutorial
  static const primaryColor = Colorz.interlacedChatPurple;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expandile(
      primaryColor: primaryColor,
      leading: _leading(),
      title: 'Date: ${DateTime.now().toString()}',
      description: 'Case Alert',
      maxDescriptionLines: 1,
      footer: Column(
        children: [
          actionButtons(),
        ],
      ),
    );
  }

  Widget _leading() {
    return const CircleAvatar(
      backgroundColor: primaryColor,
      child: Icon(
        Icons.shopping_bag,
        color: Colors.white,
      ),
    );
  }

  Widget timeText() {
    int createdAt = DateTime.now().millisecondsSinceEpoch - 10000;
    return detailsCard(
        'Last time a purchase was made at ${Widgets.toDateTime(createdAt)}');
  }

  List availableText() {
    return widget.time.keys.map((key) {
      return detailsCard(
        '$key: ${widget.time[key]}',
      );
    }).toList();
  }

  Widget detailsCard(String text) {
    return Inkk(
      spalshColor: primaryColor,
      onTap: openDetailsFn,
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        padding: const EdgeInsets.all(8),
        child: Txt(
          text: text.replaceAll('\n', ' '),
          maxLines: 3,
          color: Widgets.subtitleColor(context),
        ),
      ),
    );
  }

  Widget actionButtons() {
    return Row(
      children: <Widget>[
        shareButton(),
        buyButton(totalOrders: widget.time.length.toString()),
      ],
    );
  }

  Widget shareButton() {
    return Expanded(
        child: Button(
      text: 'Clear',
      processingText: 'Clearing...',
      textColor: primaryColor,
      buttonColor: primaryColor.withOpacity(0.1),
      onPressed: shareFn,
    ));
  }

  Widget buyButton({required String totalOrders}) {
    return const Expanded(
      child: Button(
        text: 'Time 10:02 AM',
        buttonColor: primaryColor,
      ),
    );
  }

  void openDetailsFn() {
    ///To open the details page of the content
  }

  Future<void> shareFn() async {
    await Widgets.wait(3000);
  }

  Future<void> moreFn() async {
    debugPrint("More button is pressed!");
  }
}
