import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_walks/address/newaddress.dart';

import '../colors/colors.dart';

class Select_Address extends StatefulWidget {
  const Select_Address({super.key});

  @override
  State<Select_Address> createState() => _Select_AddressState();
}
class _Select_AddressState extends State<Select_Address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        title: Padding(
          padding: const EdgeInsets.only(left: 60.0),
          child: Text(
            'Address',
            style: GoogleFonts.junge(
              textStyle: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Address',
                  style: GoogleFonts.junge(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  color: black,
                  width: 140,
                  height: 40,
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewAddress()));
                    },
                    child: Text(
                      'Add New Address',
                      style: GoogleFonts.junge(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
