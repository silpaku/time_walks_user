import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_walks/colors/colors.dart';
import '../address/address1.dart';
import '../commomwidgets/cartmodel.dart';

class My_cart extends StatefulWidget {
  const My_cart({Key? key}) : super(key: key);

  @override
  State<My_cart> createState() => _My_cartState();
}

class _My_cartState extends State<My_cart> {
  final List<String> items = [
    'Adamo',
    'Curren',
    'Fossil',
  ];

  final List<String> images = [
    'assets/p9.jpeg',
    'assets/p13.jpg',
    'assets/p15.jpg',
  ];

  final IconData icon = Icons.delete;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(
        //   Icons.arrow_back,
        //   color: Colors.white,
        // ),
        backgroundColor: black,
        title: Padding(
          padding: const EdgeInsets.only(left: 60.0),
          child: Text(
            'My Cart',
            style: GoogleFonts.junge(
              textStyle: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: MyListViewBuilder(
              items: items,
              images: images,
              icon: icon,
            ),
          ),

          // Container(
          //   color: black,
          //   width: 50,
          //   height: 50,
          // ),
          // Icon(Icons.access_alarm,color: Colors.black,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 130,
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 230, 156, 9),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Total price:₹1420',
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) => Select_Address()));
                },
                style: ElevatedButton.styleFrom(
                    // primary: Colors.blue,
                    backgroundColor: Color.fromARGB(255, 230, 156, 9)),
                label: Text(
                  'CheckOut',
                  style: GoogleFonts.junge(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 16)),
                ),
                icon: const Icon(
                  Icons.payment,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
