// ignore_for_file: use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/functions.dart';
import '../models/wishlistmodel.dart';

class ProductWidget extends StatefulWidget {
  final List<dynamic> imagePath;
  final String id;
  final String text;
  final String subtext;
  final int price;
  final String description;

  const ProductWidget(
      {Key? key,
      required this.imagePath,
      required this.id,
      required this.text,
      required this.subtext,
      required this.price,
      required this.description})
      : super(key: key);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool isAddedTWishlist = false;
  //wishlist check
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
    String email = FirebaseAuth.instance.currentUser!.email!;
    return GestureDetector(
      // onTap: (){
      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_details(id: widget.id,
      //   description:widget.description,
      //   image: widget.imagePath,
      //   name: widget.text,
      //   subname: widget.subtext,
      //   rate: widget.price)));
      // },
      child: Container(
         height: 150,

        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
                left: 120,
                top: -4,
                child: IconButton(
                  icon: Icon(
                    isAddedTWishlist
                        ? CupertinoIcons.suit_heart_fill
                        : CupertinoIcons.heart,
                    color: Colors.black,
                    size: 24,
                  ),
                  onPressed: () async {
                    WishlistModel wishlist = WishlistModel(
                      email: email,
                      productId: widget.id,
                    );
                    if (isAddedTWishlist) {
                      removeWishlist(wishlist, context);
                    } else {
                      addWishlist(wishlist, context);
                    }
                    setState(() {
                      isAddedTWishlist = !isAddedTWishlist;
                    });
                  },
                )),
            Column(
              children: [
                SizedBox(
               height: 120,width: 110,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Image.network(
                        widget.imagePath[0],
                        fit: BoxFit.cover,
                      ),
                    )),
                Text(
                  widget.text,
                  style: GoogleFonts.jura(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
                Text(
                  widget.subtext,
                  style: GoogleFonts.jura(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
                Expanded(
                    child: Text('₹ ${widget.price}',
                        style: GoogleFonts.jura(
                          textStyle: const TextStyle(
                              color: Colors.black, fontSize: 12),
                        ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
