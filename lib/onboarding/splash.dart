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
  // late final AnimationController _controller =
  //     AnimationController(duration: const Duration(seconds: 3), vsync: this)
  //       ..repeat(reverse: false);
  // late final Animation<double> _animation =
  //     CurvedAnimation(parent: _controller, curve: Curves.easeIn);

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
          )
        });
  }

  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Image.asset('assets/images/removed_logo.png'),
          ),
          SizedBox(
            height: hei * 0.36,
          ),
          const SpinKitFadingFour(
            color: Color.fromARGB(255, 23, 125, 153),
            size: 25,
          )
        ],
      ),
    );
  }
}
