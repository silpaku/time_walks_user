import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_walks/colors/colors.dart';
import '../commomwidgets/slider.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  final List<String> avatarImages = [
    'assets/p6.jpg',
    'assets/p5.jpg',
    'assets/p7.jpg',
  ];

  final List<String> avatarNames = ['Men', 'Women', 'Kids'];

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Text(
            'TIME WALKS ',
            style: GoogleFonts.junge(
                textStyle: const TextStyle(color: Colors.white, fontSize: 18)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: CarouselSliderWidget(),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Text(
                  'Shop for',
                  style: GoogleFonts.junge(
                      textStyle:
                          const TextStyle(color: Colors.black, fontSize: 18)),
                ),
              ),
            ),
            Row(
              children: [
                CircleAvatarsWidget(
                  avatarImages: avatarImages,
                  avatarNames: avatarNames,
                ),
              ],
            ),
            Text(
              'Top Sellers',
              style: GoogleFonts.junge(
                  textStyle:
                      const TextStyle(color: Colors.black, fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
