import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jsk_app/homepage.dart';
import 'package:jsk_app/onBoardingScreen.dart';
import 'firebase_options.dart';
import 'splashscreen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

var _firstTime = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  final prefs = await SharedPreferences.getInstance();
  final String? name = prefs.getString('username');
  if (name == null) {
    _firstTime = true;
  }
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _firstTime == true ? OnBoardingScreen() : HomePage(),
    );
  }
}
