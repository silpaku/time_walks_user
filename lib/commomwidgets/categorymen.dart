import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_walks/commomwidgets/category.dart';
import '../colors/colors.dart';

class men_category extends StatefulWidget {
  const men_category({super.key});

  @override
  State<men_category> createState() => _men_categoryState();
}

Stream getCategoryProducts() async* {
  final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('products')
      .where('category', isEqualTo: 'men')
      .get();

  final List<DocumentSnapshot> docs = querySnapshot.docs.toList();
  yield docs;
}

class _men_categoryState extends State<men_category> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3.5;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 20,
        ),
        backgroundColor: black,
        title: Padding(
          padding: const EdgeInsets.only(left: 60.0),
          child: Text(
            'Men',
            style: GoogleFonts.junge(
              textStyle: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
      body: StreamBuilder(
          stream: getCategoryProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              print('Data length: ${data.length}');
              return GridView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (itemWidth / itemHeight),
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0),
                itemBuilder: (context, index) {
                  return ImageWithText(
                    imagePath: data[index].get('image'),
                    text: data[index].get('name'),
                    id: data[index].get('id'),
                    // icon: Icons.abc,
                    subtext: data[index].get('subname'),
                    price: data[index].get('price'), 
                    description:data[index].get('description'),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
