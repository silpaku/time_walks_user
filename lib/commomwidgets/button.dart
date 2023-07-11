import 'package:flutter/material.dart';

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
          child:const Text('Button 1'),
        ),
        ElevatedButton(
          onPressed: onPressedButton2,
          child:const Text('Button 2'),
        ),
      ],
    );
  }
}
