import 'package:code0/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5)).then((value) => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainPage(),
            ),
          )
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 210,
          ),
          Center(
            child: Image.asset(
              'assets/images/removed_logo.png',
            ),
          ),
          const Expanded(
            child: SpinKitFadingFour(
              color: Color.fromARGB(255, 23, 125, 153),
              size: 25,
            ),
          )
        ],
      ),
    );
  }
}
