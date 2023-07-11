import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_walks/colors/colors.dart';
import 'package:time_walks/commomwidgets/textfield.dart';

class ForGotte extends StatefulWidget {
  const ForGotte({super.key});

  @override
  State<ForGotte> createState() => _ForGotteState();
}

class _ForGotteState extends State<ForGotte> {
  TextEditingController _forgotte=TextEditingController();
  void forgot() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        title:Padding(
          padding: const EdgeInsets.only(left:40 ),
          child: const Text(
            'Forgot Password',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: black,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Container(color: Colors.white,height: 2,width: 620,),
            const Image(
                image: AssetImage('assets/f1.webp'),
                height: 250,
                width: 250,
              ),
              Text('Please Enter Your Email To Reset',style: GoogleFonts.jura(
                textStyle:const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 14)),),
               MyTextField(
                    controller: _forgotte,
                    hintText: 'Enter Email Address',
                      keyboardType: TextInputType.name,
                    prefixIcon: Icons.email),
                   const SizedBox(height: 30,),
                     ElevatedButton(
              onPressed: forgot,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(210, 40),
                fixedSize: const Size(140, 45),
                side: const BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Reset',
                style: GoogleFonts.junge(
                    textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                )),
              ),
              ),
      
            ],
          ),
        ),
      ),
    );
  }
}
