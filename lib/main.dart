import 'package:code0/authentication/auth_wrapper.dart';
import 'package:code0/firebase_options.dart';
import 'package:code0/onboarding/on_boarding_screen.dart';
import 'package:code0/provider/auth_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFEFF2F9),
      statusBarIconBrightness: Brightness.dark));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 0);

  runApp(
    MyApp(initScreen: initScreen),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.initScreen});
  final int? initScreen;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: initScreen == 0 || initScreen == null
            ? const OnboardingScreen()
            : const AuthWrapper(),
      ),
    );
  }
}
