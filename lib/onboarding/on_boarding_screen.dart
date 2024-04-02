// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:code0/authentication/auth_wrapper.dart';
import 'package:code0/authentication/signin.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreen createState() => _OnboardingScreen();
}

class _OnboardingScreen extends State<OnboardingScreen> {
  int page = 0;
  late LiquidController liquidController;

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return SizedBox(
      width: 25.0,
      child: Center(
        child: Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: SizedBox(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> splashData = [
      {
        "title": "Ensuring Safety,\nFostering Unity",
        "subtitle":
            "Welcome to JusticeX, where fairness and equity thrive. Join us in ensuring justice for all.",
        "image": "assets/images/boarding1.jpg"
      },
      {
        "title": "Building Trust Through Action",
        "subtitle":
            "Enter JusticeX, where fairness prevails. Together, let's ensure equity in every case.",
        "image": "assets/images/boarding2.jpg"
      },
      {
        "title": "Application\nMedia",
        "subtitle":
            "Step into JusticeX, where equity is our priority. Join us in promoting fairness.",
        "image": "assets/images/boarding3.jpg",
      },
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          LiquidSwipe.builder(
            initialPage: 0,
            itemCount: splashData.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: double.infinity - 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Visibility(
                          visible: index == page,
                          child: Text(
                            splashData[index]['title']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: "Sofia",
                              fontSize: 27,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF424242),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Visibility(
                          visible: index == page,
                          child: SizedBox(
                            width: 380,
                            child: Text(
                              splashData[index]['subtitle']!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Sofia",
                                fontSize: 15,
                                color: Colors.grey[600],
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Visibility(
                      visible: index == page,
                      child: Image.asset(
                        splashData[index]['image']!,
                        height: 300,
                        fit: BoxFit.contain,
                      ),
                    ),
                    index == 4
                        ? const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 70.0),
                            child: SignIn())
                        : const SizedBox.shrink(),
                  ],
                ),
              );
            },
            positionSlideIcon: 0.8,
            onPageChangeCallback: pageChangeCallback,
            waveType: WaveType.liquidReveal,
            liquidController: liquidController,
            fullTransitionValue: 880,
            enableSideReveal: true,
            preferDragFromRevealedArea: true,
            ignoreUserGestureWhileAnimating: true,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                const Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(splashData.length, _buildDot),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextButton(
                onPressed: () {
                  liquidController.animateToPage(
                      page: splashData.length - 1, duration: 700);
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.01),
                    foregroundColor: Colors.black),
                child: const Text("Skip to End"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextButton(
                onPressed: () {
                  if (liquidController.currentPage < splashData.length - 1) {
                    liquidController.jumpToPage(
                        page: liquidController.currentPage + 1);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthWrapper(),
                      ),
                    );
                  }
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.01),
                    foregroundColor: Colors.black),
                child: const Text("Next"),
              ),
            ),
          )
        ],
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
