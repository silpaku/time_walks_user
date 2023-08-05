import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_walks/colors/colors.dart';
import 'package:time_walks/commomwidgets/cartmodel.dart';

import '../commomwidgets/wislist_widget.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({
    super.key,
  });

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final List<String> items = [
    'Adamo',
    'Curren',
    'Fossil',
    'Curren',
  ];

  final List<String> images = [
    'assets/p9.jpeg',
    'assets/p13.jpg',
    'assets/p15.jpg',
    'assets/p13.jpg',
  ];

  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    String email = FirebaseAuth.instance.currentUser!.email!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: black,
        title: Padding(
          padding: const EdgeInsets.only(left: 60.0),
          child: Text(
            'Wishlist',
            style: GoogleFonts.junge(
              textStyle: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('wishlist')
                  .where('email', isEqualTo: email)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final List<DocumentSnapshot> documents = snapshot.data!.docs;
                  if (documents.isNotEmpty) {
                    return ListView.builder(
                      itemCount: documents.length,
                      itemBuilder: (context, index) {
                        //log(documents[index].get('id'));
                        return MyListViewBuilder1(
                                id: documents[index].get('id'),
                                productId: documents[index].get('productid'),
                     
                          );
                      },
                      
                    );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 250.0),
                      child: Center(
                        child: Text('Wishlist is Empty'),
                      ),
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
