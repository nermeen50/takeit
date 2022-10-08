import 'package:flutter/material.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/auth/login.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.appBackground,
      body: Center(
        child: Image.asset(
          S.current.logoImage,
          scale: 4,
        ),
      ),
    );
  }
}
