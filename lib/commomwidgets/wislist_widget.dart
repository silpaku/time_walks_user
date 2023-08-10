import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/functions.dart';

class MyListViewBuilder1 extends StatefulWidget {
  const MyListViewBuilder1({
    super.key,
    required this.id,
    required this.productId,
  });

  final String id;
  final String productId;

  @override
  State<MyListViewBuilder1> createState() => _MyListViewBuilder1State();
}

class _MyListViewBuilder1State extends State<MyListViewBuilder1> {
    String? name;
  String? subName;
  List<String>? imageList;
  int price = 0;
  String? id;

 @override
  void initState() {
     getProductData(widget.productId).listen((DocumentSnapshot productData){
      log(widget.productId);
      if(productData.exists){
        setState(() {
          id=productData.get('id');
          name=productData.get('name');
          subName=productData.get('subname');
          price = productData.get('price') ?? 199;
          imageList=List<String>.from(productData.get('image')??
              [
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfOibKCmQ1BzQ-QSNFLWlcp8BziFRksHSBrw&usqp=CAU'
              ]);
        });
      }
    },onError: (error){
      log('error when retriving product');
    });
    super.initState();
  }
   
    
  
  @override
  Widget build(BuildContext context) {
   // log(name.toString());
    return Container(
      height: 130,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 72, 70, 70).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.network(
            imageList!=null && imageList!.isNotEmpty
            ?imageList![0]
            :'https://imagescdn.thecollective.in/img/app/product/7/761497-8714623.jpg',
            width: 110,
            height: 100,
          ),
          const SizedBox(width: 16),
           Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                SizedBox(height: 15,),
                Text(
                  name??'Product Name',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subName ??'Data Unavailable',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Text(
                '₹ $price',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){
                deleteWishlist(widget.id, context);
              }, icon: const Icon(CupertinoIcons.heart_slash_circle,size: 40,color: Color.fromARGB(255, 26, 26, 25),))
            ],
          ),
        ],
      ),
    );
  }
}