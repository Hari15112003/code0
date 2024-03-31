import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigateLink extends StatelessWidget {
  NavigateLink({super.key});

  final List<String> image = [
    'daily_thanthi.png',
    'dinamalar.png',
    'dinamani.png',
    'economic_times.png',
    'the_hindu_tamil.png',
    'the_hindu.png',
    'the_indian_express.png',
    'times_of_india.png'
  ];
  final List<String> navigatelink = [
    'https://www.dailythanthi.com/',
    'https://www.dinamalar.com/',
    'https://www.dinamani.com/latest-news',
    'https://economictimes.indiatimes.com/',
    'https://www.hindutamil.in/',
    'https://www.thehindu.com/',
    'https://indianexpress.com/',
    'https://timesofindia.indiatimes.com/'
  ];

  Future<void> _launchWebLink(Uri url) async {
    await launchUrl(url, mode: LaunchMode.inAppBrowserView);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: image.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                _launchWebLink(Uri.parse(navigatelink[index]));
              },
              child: Container(
                width: 70,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/link/${image[index]}")),
                    shape: BoxShape.circle,
                    color: Colors.white),
                // child: Image.asset(
                //   "assets/link/${image[index]}",
                //   fit: BoxFit.fill,
                // ),
              ),
            ),
          );
        });
  }
}
