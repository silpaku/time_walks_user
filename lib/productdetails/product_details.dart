import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_walks/commomwidgets/slider.dart';
import 'package:time_walks/models/functions.dart';
import 'package:time_walks/productdetails/prduct_widget.dart';

class Product_details extends StatefulWidget {
    final String id;
    final String name;
  final String subname;
  final int rate;
  final List<dynamic> image;
  final String description;

  const Product_details({super.key, required this.id,    required this.name,
    required this.subname,
    required this.rate,
    required this.image,
    required this.description,});

  @override
  State<Product_details> createState() => _Product_detailsState();
}

class _Product_detailsState extends State<Product_details> {
  bool isAddedTWishlist=false;
  //wishlist check
  Future<void> checkIfProductInWishlist()async{
    String email=FirebaseAuth.instance.currentUser!.email!;
    bool exists =await checkIfProductExistsInWishlist(email,widget.id);
    setState(() {
      isAddedTWishlist=exists;
    });
  }
  @override
  void initState() {
    super.initState();
    checkIfProductInWishlist();
  }
  final List<Widget> myImages = [
    Image.asset('assets/watch1.jpeg'),
    Image.asset('assets/watch2.jpeg'),
    Image.asset('assets/watch3.jpeg'),
  ];
  @override
  Widget build(BuildContext context) {
    String email = FirebaseAuth.instance.currentUser!.email!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.only(left: 60.0),
          child: Text(
            'Product Details',
            style: GoogleFonts.junge(
              textStyle: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: CarouselSliderWidget(images: myImages),
          ),
          const SizedBox(
            height: 0,
          ),
          Column(
            children: [
              ProductContainer(
                productName:widget.name,
                subname: widget.subname,
                description:
                    widget.description,
                icon: Icons.favorite, price:'₹${widget.rate.toString()}',
                
              ),
              //  SizedBox(height: 8.0),
         
              Container(
                height: 50,
                width: 350,
                color: Colors.black,
                child: Row(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding:const EdgeInsets.symmetric(
                                  
                                  ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                         
                            },
                            child: Row(
                              children: [
                                const Icon(CupertinoIcons.bag),
                                
                                Text(
                                  'Buy Now',
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      letterSpacing: .5,
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        const Spacer(),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                 
                                  ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                          
                            },
                            child: Row(
                              children: [
                                const Icon(CupertinoIcons.cart),
                                
                                Text(
                                  'Add to cart',
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      letterSpacing: .5,
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            )),
        ],
        
      ),
              )
            ],
          ),
          
        ]
    )
    );
  }
}
