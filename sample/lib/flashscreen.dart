import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sample/Scr/Screens/puppylogin.dart';

import 'Scr/Screens/LoginScreen.dart';
import 'colors.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      // Navigate to the LoginScreen after the delay
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => puppylogin(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:white,
      body: Center(
        child: SvgPicture.asset("assets/svg/flashscreen.svg"),// Replace with the correct path to your splash image
      ),
    );
  }
}