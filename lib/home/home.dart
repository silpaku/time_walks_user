// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_walks/colors/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_walks/commomwidgets/categorykids.dart';
import 'package:time_walks/commomwidgets/categorymen.dart';
import 'package:time_walks/commomwidgets/categorywomen.dart';
import 'package:time_walks/commomwidgets/product_widget.dart';
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
    final List<Widget> myImages = [
    Image.asset('assets/s1.jpeg'),
    Image.asset('assets/s2.jpeg'),
    Image.asset('assets/s3.jpeg'),

  ];

  final List<String> avatarNames = ['Men', 'Women', 'Kids'];
  final Stream<QuerySnapshot> _produtcsStream =
      FirebaseFirestore.instance.collection('products').snapshots();

      

  void _onAvatarTap(int index) {
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const men_category()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const Women_category()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const Kids_Category()));
        break;
      default:
        break;
    }
  }

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
        actions: [
    IconButton(
      onPressed: () {
        // Add your logic for the first icon's action here
      },
      icon: const Icon(Icons.search,color: Colors.white,), // Replace 'icon1' with the desired first icon
    ),
    IconButton(
      onPressed: () {
        // Add your logic for the second icon's action here
      },
      icon: const Icon(Icons.shopping_bag,color: Colors.white), // Replace 'icon2' with the desired second icon
    ),
  ],
),
      
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSliderWidget(images: myImages),
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
                  onTap: _onAvatarTap,
                ),
              ],
            ),
            Text(
              'Top Sellers',
              style: GoogleFonts.junge(
                  textStyle:
                      const TextStyle(color: Colors.black, fontSize: 18)),
            ),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: _produtcsStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return const Text('No data available');
                } else {
                  final List<DocumentSnapshot> documents = snapshot.data!.docs;
                  return GridView.builder(
                    shrinkWrap: true,
                    itemCount: documents.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                    ),
                    itemBuilder: (context, index) {
                      return ProductWidget(
                        id:documents[index].get('id') ,
                       imagePath:documents[index].get('image'),
                        text: documents[index].get('name'),
                        subtext: documents[index].get('subname'),
                        price: documents[index].get('price'),
                        description: documents[index].get('description'),
                      );
                    },
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
