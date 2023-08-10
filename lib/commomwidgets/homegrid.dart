import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_walks/models/functions.dart';

class ImageWithText1 extends StatefulWidget {
  final List<dynamic> imagePath;
  final String id;
  final String text;
  final String subtext;
  final int price;

  const ImageWithText1({super.key, 
    required this.imagePath,
    required this.id,
    required this.text,
    required this.subtext,
    required this.price,
  });

  @override
  State<ImageWithText1> createState() => _ImageWithText1State();
}

class _ImageWithText1State extends State<ImageWithText1> {
  bool isAddedTWishlist = false;
//checking funciton
  Future<void> checkIfProductInWishlist() async {
    String email = FirebaseAuth.instance.currentUser!.email!;
    bool exists = await checkIfProductExistsInWishlist(email, widget.id);
    setState(() {
      isAddedTWishlist = exists;
    });
  }

  @override
  void initState() {
    super.initState();
    checkIfProductInWishlist();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 58,
            width: 100,
            child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Image.network(
                  widget.imagePath[0],
                  fit: BoxFit.cover,
                )),
          ),
          Text(
            widget.text,
            style: GoogleFonts.jura(
              textStyle: const TextStyle(color: Colors.black, fontSize: 12),
            ),
          ),
          Text(
            widget.subtext,
            style: GoogleFonts.jura(
              textStyle: const TextStyle(color: Colors.black, fontSize: 12),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                '₹ ${widget.price}',
                style: GoogleFonts.jura(
                  textStyle: const TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
