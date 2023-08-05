import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressedButton1;
  final VoidCallback onPressedButton2;

  ButtonWidget({
    required this.onPressedButton1,
    required this.onPressedButton2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: onPressedButton1,
          child: Text('Button 1',style: GoogleFonts.junge(
                  textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              )),),
        ),
        ElevatedButton(
          onPressed: onPressedButton2,
          child: Text('Button 2',style: GoogleFonts.junge(
                  textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              )),)
          ,
        ),
      ],
    );
  }
}
