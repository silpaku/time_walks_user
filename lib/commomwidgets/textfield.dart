import 'package:flutter/material.dart';


class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator; 

  const MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    required this.keyboardType, this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        validator:validator,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.grey,
          ),
          hintText: hintText,
          hintStyle:const TextStyle(color: Colors.grey),
          hintMaxLines: 1,
          enabledBorder:const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder:const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        style: const TextStyle(color: Colors.white),
         keyboardType: keyboardType,

      ),
    );
  }
}