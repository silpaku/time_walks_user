import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final IconData? iconData; // The icon data you want to use

  const CustomElevatedButton({
    required this.onPressed,
    required this.buttonText,
    this.iconData, // Add the optional iconData parameter to the constructor
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            buttonText,
            style: GoogleFonts.junge(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          if (iconData != null) // Add the icon conditionally if iconData is provided
            Icon(
              iconData,
              size: 18,
              color: Colors.black,
            ),
        ],
      ),
    );
  }
}
