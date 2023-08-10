import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_walks/productdetails/quantity.dart';

Widget ProductContainer({
  required String productName,
  required String subname,
  required String description,
  required String price,
  required IconData icon,
}) {
  return Container(
    height: 250,
    width: 352,
   
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 219, 216, 216),
      border: Border.all(color: const Color.fromARGB(255, 219, 216, 216)),
      borderRadius:const BorderRadius.only(        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              productName,
              style: GoogleFonts.junge(
                textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ),
            Icon(icon),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          subname,
          style: GoogleFonts.junge(
                textStyle: const TextStyle(color: Color.fromARGB(255, 146, 143, 143), fontSize: 18),
          )
        ),
        
        const SizedBox(height: 8),
        Text(
          description,
          style: GoogleFonts.junge(
                textStyle: const TextStyle(color: Colors.black, fontSize: 18),
        ),
        ),
        const SizedBox(height: 5,),
         Text(
          price,
          style: GoogleFonts.junge(
                textStyle: const TextStyle(color: Colors.black, fontSize: 18),
          )
        ),
        const SizedBox(height: 4,),
         const Align(
          alignment: Alignment.bottomRight,
          child: QuantityCartWidget()), 
      ],
    ),
  );
}
