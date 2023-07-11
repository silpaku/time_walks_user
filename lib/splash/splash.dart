import 'package:flutter/material.dart';
import 'package:time_walks/colors/colors.dart';

import '../Authentication/entrypage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    home();
  }
  
  Widget build(BuildContext context) {
    return  Scaffold(
      
      backgroundColor: black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/logo1.JPG',height: 400,width: 400,),
          ),
        ],
      ),
    );
  }

  Future home() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const EntryPage(),
        ));
}

}